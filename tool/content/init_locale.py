#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Scaffold a translation worksheet for a new study-content locale.

WHAT THIS DOES
--------------
Emits `l10n_work/content_<locale>.worksheet.json` with the exact structure the
app expects, where every translatable string is the placeholder ``TODO`` and every
entry carries the Vietnamese source plus the English reference inline, so a
translator can work straight in the file without cross-referencing two others.

WHAT THIS DOES *NOT* DO
-----------------------
It never invents doctrine. No machine translation happens here: the output is a
worksheet, not a translation. Until a human fills it in, the runtime fallback
chain (`<locale> -> en -> vi`) keeps serving the reviewed English/Vietnamese
text, so an unfinished locale is always a no-op for learners.

STRUCTURE
---------
The worksheet mirrors the shipping schema exactly::

    {
      "locale": "hi",
      "schemaVersion": 2,
      "translationStatus": "draft",
      "cittas":     { "CI_001": {"name": "TODO", ...}, ... },   # 121
      "cetasikas":  { ... },                                    # 52
      "rupas":      { ... },                                    # 28
      "kammas":     { ... },                                    # 16
      "paticcas":   { ... },                                    # 12
      "vithis":     { ... },                                    # 4
      "studyModules": { "M1_BASICS": {...}, ... }               # 10
    }

Each translatable field is accompanied by a sibling ``_src`` block holding the
Vietnamese and English reference text. ``build_content.py``-style consumers and
the Dart ``ContentCatalog`` both ignore unknown keys, but ``strip`` mode removes
them for shipping.

USAGE
-----
    # create / refresh a worksheet, keeping any translations already done
    python3 tool/content/init_locale.py hi

    # all five priority locales at once
    python3 tool/content/init_locale.py hi zh zh_TW si my ja

    # Tier A only (entity strings; skip the 50/150/135 lesson items)
    python3 tool/content/init_locale.py my --tier a

    # promote to the shippable bundle (drops _src helpers and untouched TODOs)
    python3 tool/content/init_locale.py hi --strip

    # how far along is each locale?
    python3 tool/content/init_locale.py --report

Re-running is safe and idempotent: existing non-``TODO`` values are preserved,
so the worksheet can be regenerated after the Vietnamese source changes without
losing completed work.
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from typing import Any

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
DATA = os.path.join(ROOT, "assets", "data")
CONTENT = os.path.join(ROOT, "assets", "content")
# Worksheets deliberately live OUTSIDE assets/: pubspec.yaml bundles
# `assets/content/` wholesale, so a TODO-filled worksheet dropped there would
# ship to end users. Only `--strip` output belongs in assets/content/.
WORKSHEETS = os.path.join(ROOT, "l10n_work")

SCHEMA_VERSION = 2
TODO = "TODO"

# Locales this project has committed to. Keep in sync with
# lib/core/localization/content_languages.dart.
PRIORITY_LOCALES = ["hi", "zh", "zh_TW", "si", "my", "ja"]

# section -> (data file, json key, {target field: source field})
# Only display text is listed. IDs, groups, numeric orders and relationship
# arrays are structural and must never be translated.
ENTITY_SPECS = {
    "cittas": ("cittas.json", "cittas", {
        "name": "nameVietnamese",
        "doctrinalNote": "doctrinalNote",
    }),
    "cetasikas": ("cetasikas.json", "cetasikas", {
        "name": "nameVietnamese",
        "shortName": "nameShort",
        "description": "descriptionVi",
        "characteristic": "trangThai",
        "function": "phanSu",
        "manifestation": "thanhTuu",
        "proximateCause": "nhanGan",
    }),
    "rupas": ("rupas.json", "rupas", {
        "name": "nameVietnamese",
        "shortName": "nameShort",
        "description": "descriptionVi",
        "characteristic": "trangThai",
        "function": "phanSu",
        "manifestation": "thanhTuu",
        "proximateCause": "nhanGan",
        "doctrinalNote": "doctrinalNote",
    }),
    "kammas": ("kammas.json", "kammas", {
        "name": "nameVietnamese",
        "shortName": "nameShort",
        "description": "descriptionVi",
        "doctrinalNote": "doctrinalNote",
    }),
    "paticcas": ("paticca.json", "paticcas", {
        "name": "nameVietnamese",
        "shortName": "nameShort",
        "description": "descriptionVi",
        "characteristic": "trangThai",
        "function": "phanSu",
        "manifestation": "thanhTuu",
        "proximateCause": "nhanGan",
        "doctrinalNote": "doctrinalNote",
    }),
    "vithis": ("vithis.json", "vithis", {
        "name": "nameVietnamese",
        "shortName": "nameShort",
        "description": "descriptionVi",
    }),
}

# Lesson-content fields, by collection.
LESSON_SPECS = {
    "lessonSections": ["title", "summary", "body", "keyTerms"],
    "reviewCards": ["front", "back", "hint"],
    "quizSeeds": ["question", "correctAnswer", "distractors", "explanation"],
}


def worksheet_path(locale: str) -> str:
    return os.path.join(WORKSHEETS, f"content_{locale}.worksheet.json")


def read_json(path: str) -> Any:
    with open(path, encoding="utf-8") as handle:
        return json.load(handle)


def load_entities(spec_key: str) -> list[dict]:
    filename, json_key, _ = ENTITY_SPECS[spec_key]
    return read_json(os.path.join(DATA, filename))[json_key]


# ── Merge helpers ─────────────────────────────────────────────────────────────


def keep(existing: Any, fallback: Any = TODO) -> Any:
    """Preserve translated text; reset anything still untranslated."""
    if isinstance(existing, str) and existing.strip() and existing.strip() != TODO:
        return existing
    if isinstance(existing, list) and existing and any(
        isinstance(v, str) and v.strip() and v.strip() != TODO for v in existing
    ):
        return existing
    return fallback


def src_block(vi: Any, en: Any) -> dict:
    """Reference text shown to the translator. Stripped before shipping."""
    block: dict[str, Any] = {}
    if vi not in (None, "", []):
        block["vi"] = vi
    if en not in (None, "", []):
        block["en"] = en
    return block


# ── Worksheet builders ────────────────────────────────────────────────────────


def build_entities(locale: str, prev: dict, en: dict, with_src: bool) -> dict:
    out: dict[str, dict] = {}
    for section, (_, _, fields) in ENTITY_SPECS.items():
        section_out: dict[str, dict] = {}
        prev_section = prev.get(section, {}) or {}
        en_section = en.get(section, {}) or {}
        for item in load_entities(section):
            item_id = item["id"]
            prev_item = prev_section.get(item_id, {}) or {}
            en_item = en_section.get(item_id, {}) or {}
            entry: dict[str, Any] = {}
            for target, source in fields.items():
                vi_value = item.get(source)
                en_value = en_item.get(target)
                # Nothing to translate if neither reference has the field.
                if vi_value in (None, "") and en_value in (None, ""):
                    continue
                entry[target] = keep(prev_item.get(target))
                if with_src:
                    entry[f"_src_{target}"] = src_block(vi_value, en_value)

            # `examples` is a free-form list; translators add as many as the
            # source has, so seed the list length from the source.
            vi_examples = item.get("examples") or []
            en_examples = en_item.get("examples") or []
            if vi_examples or en_examples:
                entry["examples"] = keep(
                    prev_item.get("examples"),
                    [TODO] * max(len(vi_examples), len(en_examples)),
                )
                if with_src:
                    entry["_src_examples"] = src_block(vi_examples, en_examples)

            # Vīthi steps are nested one level deeper.
            if section == "vithis" and item.get("steps"):
                prev_steps = (prev_item.get("steps") or {})
                en_steps = (en_item.get("steps") or {})
                steps: dict[str, dict] = {}
                for step in item["steps"]:
                    key = str(step["stepNumber"])
                    prev_step = prev_steps.get(key, {}) or {}
                    en_step = en_steps.get(key, {}) or {}
                    step_entry = {
                        "name": keep(prev_step.get("name")),
                        "description": keep(prev_step.get("description")),
                    }
                    if with_src:
                        step_entry["_src_name"] = src_block(
                            step.get("nameVietnamese"), en_step.get("name"))
                        step_entry["_src_description"] = src_block(
                            step.get("description"), en_step.get("description"))
                    steps[key] = step_entry
                entry["steps"] = steps

            section_out[item_id] = entry
        out[section] = section_out
    return out


def build_modules(vi: dict, en: dict, prev: dict, with_src: bool,
                  include_lessons: bool) -> dict:
    out: dict[str, dict] = {}
    vi_modules = vi.get("studyModules", {})
    en_modules = en.get("studyModules", {})
    prev_modules = prev.get("studyModules", {}) or {}

    for module_id, vi_module in vi_modules.items():
        en_module = en_modules.get(module_id, {}) or {}
        prev_module = prev_modules.get(module_id, {}) or {}

        module: dict[str, Any] = {
            "title": keep(prev_module.get("title")),
            "description": keep(prev_module.get("description")),
            "translationStatus": prev_module.get("translationStatus", "draft"),
        }
        if with_src:
            module["_src_title"] = src_block(
                vi_module.get("title"), en_module.get("title"))
            module["_src_description"] = src_block(
                vi_module.get("description"), en_module.get("description"))

        if not include_lessons:
            out[module_id] = module
            continue

        for collection, fields in LESSON_SPECS.items():
            vi_items = vi_module.get(collection, []) or []
            if not vi_items:
                continue
            prev_by_id = {
                item.get("id"): item
                for item in (prev_module.get(collection) or [])
                if isinstance(item, dict)
            }
            items_out = []
            for vi_item in vi_items:
                item_id = vi_item["id"]
                prev_item = prev_by_id.get(item_id, {}) or {}
                # The id is structural: it links the translation back to the
                # Vietnamese source and to `sourceRefs`. Never translated.
                item: dict[str, Any] = {"id": item_id}

                for field in fields:
                    vi_value = vi_item.get(field)
                    if vi_value in (None, "", []):
                        continue
                    if field == "keyTerms":
                        item["keyTerms"] = build_key_terms(
                            vi_value, prev_item.get("keyTerms"), with_src)
                        continue
                    if isinstance(vi_value, list):
                        item[field] = keep(
                            prev_item.get(field), [TODO] * len(vi_value))
                    else:
                        item[field] = keep(prev_item.get(field))
                    if with_src:
                        item[f"_src_{field}"] = {"vi": vi_value}

                if vi_item.get("type"):
                    # Structural: tells the UI which widget to render.
                    item["type"] = vi_item["type"]
                if vi_item.get("sourceRefs"):
                    # Audit trail travels with the translation unchanged so
                    # every claim stays traceable to a PDF page.
                    item["sourceRefs"] = vi_item["sourceRefs"]
                items_out.append(item)
            module[collection] = items_out

        out[module_id] = module
    return out


def build_key_terms(vi_terms: list, prev_terms: Any, with_src: bool) -> list:
    prev_by_id = {
        term.get("id"): term
        for term in (prev_terms or [])
        if isinstance(term, dict)
    }
    out = []
    for vi_term in vi_terms:
        prev_term = prev_by_id.get(vi_term.get("id"), {}) or {}
        term = {
            "id": vi_term.get("id", ""),
            "term": keep(prev_term.get("term")),
            # Pāḷi is the invariant anchor across every language: copied
            # verbatim, never translated, never transliterated here.
            "pali": vi_term.get("pali", ""),
            "meaning": keep(prev_term.get("meaning")),
        }
        if with_src:
            term["_src"] = {"term_vi": vi_term.get("term"),
                            "meaning_vi": vi_term.get("meaning")}
        out.append(term)
    return out


# ── Strip mode ────────────────────────────────────────────────────────────────


def strip_worksheet(node: Any) -> Any:
    """Drop `_src*` helpers and untranslated TODO values, recursively.

    Removing TODOs rather than shipping them is what makes an unfinished
    translation degrade *field by field* onto English/Vietnamese instead of
    showing the learner the literal word "TODO".
    """
    if isinstance(node, dict):
        out = {}
        for key, value in node.items():
            if key == "_src" or key.startswith("_src_"):
                continue
            cleaned = strip_worksheet(value)
            if cleaned is None:
                continue
            out[key] = cleaned
        # An entry reduced to nothing but its id carries no translation.
        if set(out.keys()) <= {"id", "pali", "type", "sourceRefs",
                               "translationStatus"}:
            return None
        return out
    if isinstance(node, list):
        out = [strip_worksheet(v) for v in node]
        out = [v for v in out if v is not None]
        return out or None
    if isinstance(node, str):
        return None if node.strip() in ("", TODO) else node
    return node


# ── Coverage ──────────────────────────────────────────────────────────────────


def coverage(node: Any) -> tuple[int, int]:
    """(translated, total) translatable string slots in a worksheet."""
    done = total = 0
    if isinstance(node, dict):
        for key, value in node.items():
            if key == "_src" or key.startswith("_src_"):
                continue
            if key in ("id", "pali", "type", "sourceRefs", "translationStatus",
                       "locale", "schemaVersion", "fallbackLocale", "note"):
                continue
            d, t = coverage(value)
            done += d
            total += t
    elif isinstance(node, list):
        for value in node:
            d, t = coverage(value)
            done += d
            total += t
    elif isinstance(node, str):
        total = 1
        done = 1 if node.strip() and node.strip() != TODO else 0
    return done, total


# ── Main ──────────────────────────────────────────────────────────────────────


def build(locale: str, tier: str, with_src: bool) -> dict:
    vi = read_json(os.path.join(CONTENT, "content_vi.json"))
    en = read_json(os.path.join(CONTENT, "content_en.json"))
    # Resume from the worksheet if one exists, otherwise from anything already
    # shipping for this locale, so no completed work is ever lost.
    prev = {}
    for candidate in (worksheet_path(locale),
                      os.path.join(CONTENT, f"content_{locale}.json")):
        if os.path.exists(candidate):
            prev = read_json(candidate)
            break

    out: dict[str, Any] = {
        "locale": locale,
        "schemaVersion": SCHEMA_VERSION,
        # Runtime chain is computed by resolveContentLocaleChain(); this field
        # documents intent for human readers and review tooling.
        "fallbackLocale": "en",
        "translationStatus": prev.get("translationStatus", "draft"),
        "note": (
            "Worksheet generated by tool/content/init_locale.py. "
            "'TODO' marks an untranslated field. Pāḷi terms and all ids are "
            "structural and must not be changed. Run with --strip to produce "
            "the shippable file."
        ),
    }

    if tier in ("a", "ab"):
        out.update(build_entities(locale, prev, en, with_src))
    out["studyModules"] = build_modules(
        vi, en, prev, with_src, include_lessons=(tier in ("b", "ab")))
    return out


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Scaffold a study-content translation worksheet.")
    parser.add_argument(
        "locales", nargs="*", default=[],
        help=f"locale tags, e.g. hi zh my (default: {' '.join(PRIORITY_LOCALES)})")
    parser.add_argument(
        "--tier", choices=["a", "b", "ab"], default="ab",
        help="a=entity strings only, b=lesson content only, ab=both (default)")
    parser.add_argument(
        "--strip", action="store_true",
        help="emit the shippable file: drop _src helpers and TODO values")
    parser.add_argument(
        "--no-src", action="store_true",
        help="omit the inline vi/en reference blocks")
    parser.add_argument(
        "-o", "--output",
        help="override the output path (default: l10n_work/ for worksheets, "
             "assets/content/ with --strip)")
    parser.add_argument(
        "--report", action="store_true",
        help="print coverage for existing worksheets and exit")
    args = parser.parse_args()

    locales = args.locales or PRIORITY_LOCALES

    if args.report:
        print(f"{'locale':8} {'translated':>10} {'total':>8} {'coverage':>9}")
        for locale in locales:
            path = worksheet_path(locale)
            if not os.path.exists(path):
                path = os.path.join(CONTENT, f"content_{locale}.json")
            if not os.path.exists(path):
                print(f"{locale:8} {'-':>10} {'-':>8} {'not started':>9}")
                continue
            done, total = coverage(read_json(path))
            pct = (100.0 * done / total) if total else 0.0
            print(f"{locale:8} {done:>10} {total:>8} {pct:>8.1f}%")
        return 0

    for locale in locales:
        worksheet = build(locale, args.tier, with_src=not args.no_src)
        if args.strip:
            status = worksheet.get("translationStatus", "draft")
            worksheet = strip_worksheet(worksheet) or {}
            # Rebuild the header: the worksheet's own note describes TODO
            # markers and would be misleading (and would trip a naive grep for
            # "TODO") in a shipping file.
            worksheet["locale"] = locale
            worksheet["schemaVersion"] = SCHEMA_VERSION
            worksheet["fallbackLocale"] = "en"
            worksheet["translationStatus"] = status
            worksheet["note"] = (
                "Generated from the translation worksheet by "
                "tool/content/init_locale.py --strip. Untranslated fields are "
                "omitted on purpose: they resolve through the runtime fallback "
                "chain to English, then to the Vietnamese source."
            )
        # Stripped output is shippable -> assets/content/.
        # Worksheets are not -> l10n_work/.
        default_path = (os.path.join(CONTENT, f"content_{locale}.json")
                        if args.strip else worksheet_path(locale))
        path = args.output or default_path
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w", encoding="utf-8") as handle:
            json.dump(worksheet, handle, ensure_ascii=False, indent=2)
            handle.write("\n")
        done, total = coverage(worksheet)
        pct = (100.0 * done / total) if total else 0.0
        print(f"{locale:8} -> {path}  ({done}/{total} translated, {pct:.1f}%)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
