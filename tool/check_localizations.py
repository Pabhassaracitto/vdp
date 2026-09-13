#!/usr/bin/env python3
"""Fast localization integrity checks that do not require the Flutter SDK."""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
L10N = ROOT / "lib" / "l10n"
EXPECTED_LOCALES = {
    "vi", "en", "zh", "zh_TW", "hi", "my", "si", "ar", "bn", "bo",
    "de", "es", "fr", "id", "it", "ja", "km", "ko", "lo", "mn", "mr",
    "pt", "ru", "ta", "te", "th",
}
PLACEHOLDER = re.compile(r"(?<!\{)\{([A-Za-z][A-Za-z0-9_]*)\}(?!\})")


def messages(data: dict[str, object]) -> dict[str, str]:
    return {
        key: value for key, value in data.items()
        if not key.startswith("@") and key != "@@locale" and isinstance(value, str)
    }


def main() -> int:
    errors: list[str] = []
    files = sorted(L10N.glob("app_*.arb"))
    found = {json.loads(path.read_text(encoding="utf-8"))["@@locale"] for path in files}
    if found != EXPECTED_LOCALES:
        errors.append(
            f"locale set differs: missing={sorted(EXPECTED_LOCALES-found)}, "
            f"extra={sorted(found-EXPECTED_LOCALES)}"
        )

    template = json.loads((L10N / "app_en.arb").read_text(encoding="utf-8"))
    template_messages = messages(template)
    for path in files:
        data = json.loads(path.read_text(encoding="utf-8"))
        locale = data.get("@@locale", path.stem)
        localized = messages(data)
        if localized.keys() != template_messages.keys():
            errors.append(f"{locale}: ARB key set differs from app_en.arb")
        for key, source in template_messages.items():
            target = localized.get(key, "")
            if set(PLACEHOLDER.findall(source)) != set(PLACEHOLDER.findall(target)):
                errors.append(f"{locale}.{key}: placeholder mismatch")
            if not target.strip():
                errors.append(f"{locale}.{key}: empty translation")

    content = json.loads(
        (ROOT / "assets" / "content" / "content_en.json").read_text(encoding="utf-8")
    )
    # Counts are derived from assets/data rather than hardcoded, so this never
    # drifts when the dataset grows (kammas went 12 -> 16 when the fourth
    # Kammacatukka group was added, and this check silently broke).
    data_dir = ROOT / "assets" / "data"
    expected_counts = {
        section: len(json.loads((data_dir / filename).read_text(encoding="utf-8"))[key])
        for section, (filename, key) in {
            "cittas": ("cittas.json", "cittas"),
            "cetasikas": ("cetasikas.json", "cetasikas"),
            "rupas": ("rupas.json", "rupas"),
            "kammas": ("kammas.json", "kammas"),
            "paticcas": ("paticca.json", "paticcas"),
            "vithis": ("vithis.json", "vithis"),
        }.items()
    }
    # Derive the study-module count from kStudyModules so this never drifts
    # when a module is added (it silently broke at 10 when M11–M14 landed).
    study_module_dart = (ROOT / "lib" / "data" / "models" / "study_module.dart").read_text(
        encoding="utf-8"
    )
    expected_counts["studyModules"] = len(
        re.findall(r"^\s*'id': '(M\d+_([A-Z_]+))',$", study_module_dart, re.MULTILINE)
    )
    for section, expected in expected_counts.items():
        actual = len(content.get(section, {}))
        if actual != expected:
            errors.append(f"English content {section}: expected {expected}, got {actual}")

    errors.extend(check_content_locales())

    if errors:
        print("Localization integrity check failed:", file=sys.stderr)
        print("\n".join(f"- {error}" for error in errors), file=sys.stderr)
        return 1
    shipped = sorted(
        path.stem.removeprefix("content_")
        for path in (ROOT / "assets" / "content").glob("content_*.json")
    )
    print(
        f"OK: {len(files)} locales, {len(template_messages)} UI keys, "
        f"content [{', '.join(shipped)}]"
    )
    return 0


def check_content_locales() -> list[str]:
    """Run the translation validator over every shipped content_*.json.

    Keeps this script the single command a contributor has to remember: it now
    covers UI resources *and* study-content translations. Only hard failures
    are surfaced here; soft warnings are a reviewer concern, available via
    `python3 tool/content/check_content_locale.py --all`.
    """
    sys.path.insert(0, str(ROOT / "tool" / "content"))
    try:
        import check_content_locale as validator
    except Exception as error:  # pragma: no cover - defensive
        return [f"could not load the content validator: {error}"]

    content_dir = ROOT / "assets" / "content"
    try:
        source = json.loads(
            (content_dir / "content_vi.json").read_text(encoding="utf-8")
        )
        entities = validator.load_vi_entities()
    except Exception as error:  # pragma: no cover - defensive
        return [f"could not load the Vietnamese source: {error}"]

    errors: list[str] = []
    for path in sorted(content_dir.glob("content_*.json")):
        locale = path.stem.removeprefix("content_")
        if locale == "vi":
            continue  # the source of truth is not a translation of anything
        report = validator.check_locale(
            locale, str(path), source, entities, min_coverage=0.0
        )
        errors.extend(f"content {locale}: {message}" for message in report.hard)
    return errors


if __name__ == "__main__":
    raise SystemExit(main())
