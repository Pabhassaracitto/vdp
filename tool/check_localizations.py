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
    expected_counts = {
        "cittas": 121, "cetasikas": 52, "rupas": 28, "kammas": 12,
        "paticcas": 12, "vithis": 4, "studyModules": 10,
    }
    for section, expected in expected_counts.items():
        actual = len(content.get(section, {}))
        if actual != expected:
            errors.append(f"English content {section}: expected {expected}, got {actual}")

    if errors:
        print("Localization integrity check failed:", file=sys.stderr)
        print("\n".join(f"- {error}" for error in errors), file=sys.stderr)
        return 1
    print(f"OK: {len(files)} locales, {len(template_messages)} UI keys, vi/en content")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
