#!/usr/bin/env python3
"""Create small offline Noto subsets from the text shipped by AbhiDhamma.

Requirements (development only): fonttools and an authenticated GitHub CLI.
The generated fonts are committed; end users never need a network connection.
"""
from __future__ import annotations

import base64
import json
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ARB = ROOT / "lib" / "l10n"
OUT = ROOT / "assets" / "fonts" / "subsets"
CACHE = Path("/tmp/abhidhamma_noto_sources")

# family -> (Google Fonts directory, source filename, locale files)
FONTS = {
    "NotoSansApp": ("notosans", "NotoSans[wdth,wght].ttf", ["en", "vi", "de", "es", "fr", "id", "it", "mn", "pt", "ru"]),
    "NotoSansArabicApp": ("notosansarabic", "NotoSansArabic[wdth,wght].ttf", ["ar"]),
    "NotoSansBengaliApp": ("notosansbengali", "NotoSansBengali[wdth,wght].ttf", ["bn"]),
    "NotoSerifTibetanApp": ("notoseriftibetan", "NotoSerifTibetan[wght].ttf", ["bo"]),
    "NotoSansDevanagariApp": ("notosansdevanagari", "NotoSansDevanagari[wdth,wght].ttf", ["hi", "mr"]),
    "NotoSansMyanmarApp": ("notosansmyanmar", "NotoSansMyanmar[wdth,wght].ttf", ["my"]),
    "NotoSansSinhalaApp": ("notosanssinhala", "NotoSansSinhala[wdth,wght].ttf", ["si"]),
    "NotoSansKhmerApp": ("notosanskhmer", "NotoSansKhmer[wdth,wght].ttf", ["km"]),
    "NotoSansLaoApp": ("notosanslao", "NotoSansLao[wdth,wght].ttf", ["lo"]),
    "NotoSansTamilApp": ("notosanstamil", "NotoSansTamil[wdth,wght].ttf", ["ta"]),
    "NotoSansTeluguApp": ("notosanstelugu", "NotoSansTelugu[wdth,wght].ttf", ["te"]),
    "NotoSansThaiApp": ("notosansthai", "NotoSansThai[wdth,wght].ttf", ["th"]),
    "NotoSansSCApp": ("notosanssc", "NotoSansSC[wght].ttf", ["zh"]),
    "NotoSansTCApp": ("notosanstc", "NotoSansTC[wght].ttf", ["zh_TW"]),
    "NotoSansJPApp": ("notosansjp", "NotoSansJP[wght].ttf", ["ja"]),
    "NotoSansKRApp": ("notosanskr", "NotoSansKR[wght].ttf", ["ko"]),
}


def github_file(directory: str, filename: str) -> Path:
    CACHE.mkdir(parents=True, exist_ok=True)
    destination = CACHE / filename.replace("/", "_")
    if destination.exists():
        return destination
    api_path = f"repos/google/fonts/contents/ofl/{directory}/{filename}"
    metadata = json.loads(subprocess.check_output(["gh", "api", api_path]))
    blob = json.loads(subprocess.check_output([
        "gh", "api", f"repos/google/fonts/git/blobs/{metadata['sha']}"
    ]))
    destination.write_bytes(base64.b64decode(blob["content"]))
    return destination


def text_for(locales: list[str]) -> str:
    values: list[str] = []
    for locale in locales:
        data = json.loads((ARB / f"app_{locale}.arb").read_text(encoding="utf-8"))
        values.extend(
            value for key, value in data.items()
            if not key.startswith("@") and isinstance(value, str)
        )
    # Native language names and Pāḷi diacritics are shared across every
    # picker. Supplying them to every source is harmless: pyftsubset retains
    # only glyphs that actually exist in that source font.
    values.append(
        "AbhiDhamma Pāḷi āīūṃṁṅñṭḍṇḷĀĪŪṂṀṄÑṬḌṆḶ ☸✦◎✕→ "
        "Tiếng Việt English 简体中文 繁體中文 हिन्दी မြန်မာ සිංහල العربية "
        "বাংলা བོད་ཡིག Deutsch Español Français Bahasa Indonesia Italiano "
        "日本語 ភាសាខ្មែរ 한국어 ລາວ Монгол मराठी Português Русский தமிழ் తెలుగు ไทย"
    )
    return "\n".join(values)


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    for family, (directory, filename, locales) in FONTS.items():
        source = github_file(directory, filename)
        text_file = CACHE / f"{family}.txt"
        text_file.write_text(text_for(locales), encoding="utf-8")
        destination = OUT / f"{family}.ttf"
        subprocess.run([
            "pyftsubset", str(source), f"--text-file={text_file}",
            f"--output-file={destination}", "--layout-features=*",
            "--glyph-names", "--symbol-cmap", "--legacy-cmap",
            "--notdef-glyph", "--notdef-outline", "--recommended-glyphs",
            "--name-IDs=*", "--name-legacy", "--name-languages=*",
            "--drop-tables+=DSIG",
        ], check=True)
        print(f"{family}: {destination.stat().st_size / 1024:.0f} KiB")

    # One OFL license applies to all Google Noto font files in this directory.
    license_meta = json.loads(subprocess.check_output([
        "gh", "api", "repos/google/fonts/contents/ofl/notosans/OFL.txt"
    ]))
    license_blob = json.loads(subprocess.check_output([
        "gh", "api", f"repos/google/fonts/git/blobs/{license_meta['sha']}"
    ]))
    (OUT / "OFL.txt").write_bytes(base64.b64decode(license_blob["content"]))


if __name__ == "__main__":
    main()
