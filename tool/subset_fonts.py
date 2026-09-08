#!/usr/bin/env python3
"""Create small offline Noto subsets from the text shipped by AbhiDhamma.

Requirements (development only): fonttools and an authenticated GitHub CLI.
The generated fonts are committed; end users never need a network connection.
"""
from __future__ import annotations

import base64
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ARB = ROOT / "lib" / "l10n"
CONTENT = ROOT / "assets" / "content"
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
    # Dual Encoding shapes (✦ ✕ ✗ …) are Dingbats and exist in none of the
    # language fonts above. Without this family they render as tofu in every
    # locale, which silently removes the non-colour half of the WCAG contract.
    # Tiny: it only ever carries the handful of symbols listed in VdpSymbols.
    "NotoSansSymbolsApp": (
        "notosanssymbols2", "NotoSansSymbols2-Regular.ttf", [],
    ),
    # Symbols 1 carries the Miscellaneous Symbols block: ☸ (the wheel used on
    # the splash, home and settings screens), ⚖ and ⚙.
    "NotoSansSymbols1App": (
        "notosanssymbols", "NotoSansSymbols[wght].ttf", [],
    ),
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


def collect_strings(node) -> list[str]:
    """Every string anywhere in a decoded JSON document."""
    if isinstance(node, str):
        return [node]
    if isinstance(node, list):
        return [s for item in node for s in collect_strings(item)]
    if isinstance(node, dict):
        return [
            s
            for key, value in node.items()
            # `_src_*` blocks are translator scaffolding, never rendered.
            if not str(key).startswith("_src")
            for s in collect_strings(value)
        ]
    return []


def text_for(locales: list[str]) -> str:
    values: list[str] = []
    for locale in locales:
        data = json.loads((ARB / f"app_{locale}.arb").read_text(encoding="utf-8"))
        values.extend(
            value for key, value in data.items()
            if not key.startswith("@") and isinstance(value, str)
        )

        # Study content is far larger than the UI and introduces glyphs the ARB
        # never used — a Japanese lesson needs hundreds of kanji that no button
        # label contains. Subsetting from the ARB alone renders that content as
        # tofu boxes, so every shipped content_<locale>.json feeds the subset
        # for its script.
        content_file = CONTENT / f"content_{locale}.json"
        if content_file.exists():
            values.extend(
                collect_strings(json.loads(content_file.read_text(encoding="utf-8")))
            )
    # Native language names and Pāḷi diacritics are shared across every
    # picker. Supplying them to every source is harmless: pyftsubset retains
    # only glyphs that actually exist in that source font.
    values.append(
        "AbhiDhamma Pāḷi āīūṃṁṅñṭḍṇḷĀĪŪṂṀṄÑṬḌṆḶ "
        "Tiếng Việt English 简体中文 繁體中文 हिन्दी မြန်မာ සිංහල العربية "
        "বাংলা བོད་ཡིག Deutsch Español Français Bahasa Indonesia Italiano "
        "日本語 ភាសាខ្មែរ 한국어 ລາວ Монгол मराठी Português Русский தமிழ் తెలుగు ไทย"
    )
    # Dual Encoding symbols must be in EVERY subset, not just the ones whose
    # language happens to use them: they are the non-colour half of the WCAG
    # accessibility contract and are rendered next to text in all 26 locales.
    values.append(ui_symbols())
    return "\n".join(values)


# Symbols are declared once in Dart; read them from there so the two can never
# drift apart. A symbol that exists in `VdpSymbols` but not in the fonts is a
# tofu box in the Matrix, which is exactly the failure Dual Encoding exists to
# prevent.
_SYMBOL_FIELD = re.compile(r"static const String \w+ = '([^']+)';")
# Any non-ASCII character inside a single-quoted Dart string literal.
_DART_LITERAL = re.compile(r"'((?:\\.|[^'\\\n])*)'")


def ui_symbols() -> str:
    """Every non-ASCII character the Dart sources render as a literal.

    Scanning all of `lib/` rather than just `VdpSymbols` matters: the wheel
    glyph on the splash, home and settings screens is written inline as
    `const Text('\u2638')` and belongs to no symbol class. Reading only the
    class would silently drop it from every subset.
    """
    symbols: set[str] = set()
    for dart in sorted((ROOT / "lib").rglob("*.dart")):
        if dart.name.startswith("app_localizations"):
            continue  # ARB text is already collected by text_for()
        for literal in _DART_LITERAL.findall(dart.read_text(encoding="utf-8")):
            symbols.update(ch for ch in literal if ord(ch) > 0x7F)
    # Punctuation the app composes at runtime (separators, arrows, bullets)
    # rather than storing in an ARB value.
    symbols.update(" \u00b7\u2014\u2013\u2192\u2190\u2026\u2022\u25cb\u25cf\u25c6\u25b2\u25bc\u2713\u2717\u00ab\u00bb\u201c\u201d\u2018\u2019")
    return "".join(sorted(symbols))


# Characters the platform renders from its own colour emoji font. Bundling a
# monochrome outline for these would make the app *look worse*, so they are
# excluded from the tofu check and left to the OS.
_COLOUR_EMOJI = set(
    "🌟⚡✨🔴⬜🟢🔵🟣⭐✅"
    "\ufe0f"  # VS16: forces emoji presentation, never has a glyph of its own
)
# Arrow-block glyphs used as decoration (↶ undo, ⟳ refresh, ↗ …). Noto's
# language fonts carry the common arrows; these rarer ones live only in fonts
# too large to justify, and every use site pairs them with a text label.
_DECORATIVE = set("↶⟳")


def is_colour_emoji(ch: str) -> bool:
    return ch in _COLOUR_EMOJI or ch in _DECORATIVE or ord(ch) >= 0x1F300


def missing_glyphs(destination: Path, text: str) -> set[str]:
    """Characters from [text] that [destination] cannot render."""
    from fontTools.ttLib import TTFont

    with TTFont(destination) as font:
        cmap = set(font.getBestCmap())
    return {ch for ch in set(text) if ch.strip() and ord(ch) not in cmap}


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    symbols = ui_symbols()
    symbol_coverage: dict[str, list[str]] = {ch: [] for ch in symbols if ch.strip()}

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

        # pyftsubset silently keeps only the glyphs a source font actually
        # has, so report what each subset ended up covering.
        absent = missing_glyphs(destination, symbols)
        for ch in symbol_coverage:
            if ch not in absent:
                symbol_coverage[ch].append(family)
        print(f"{family}: {destination.stat().st_size / 1024:.0f} KiB")

    # Every monochrome UI symbol must live in at least one bundled family,
    # otherwise it renders as a tofu box; `fontFamilyFallback` in VdpTheme then
    # finds it wherever it landed. Colour emoji are deliberately exempt: they
    # are supplied by the platform emoji font, which no Noto subset replaces.
    orphans = [
        ch
        for ch, families in symbol_coverage.items()
        if not families and not is_colour_emoji(ch)
    ]
    if orphans:
        raise SystemExit(
            "These UI symbols are in NO bundled font and would render as tofu: "
            + " ".join(f"{ch!r} (U+{ord(ch):04X})" for ch in orphans)
        )
    emoji = [ch for ch in symbol_coverage if is_colour_emoji(ch)]
    print(
        f"symbol coverage: {len(symbol_coverage) - len(emoji)} monochrome "
        f"symbols bundled, {len(emoji)} colour emoji left to the platform"
    )

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
