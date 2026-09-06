#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Generate assets/content/content_vi.json and update content_en.json.

Vietnamese is the source of truth (all lesson content is authored from the
VDP PDFs in `reference/`). This script serialises the authored Python dicts to
JSON so we never hand-escape Vietnamese diacritics, and it merges the study
module metadata into the existing English catalog *without* touching the
already-reviewed English entity translations (cittas / cetasikas / rupas /
kammas / paticcas / vithis).

Usage:
    python3 tool/content/build_content.py
"""

from __future__ import annotations

import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
sys.path.insert(0, HERE)

import m1_m5_m7  # noqa: E402
import m6_m8  # noqa: E402
import m9_m10  # noqa: E402

SCHEMA_VERSION = 2

# Module id -> authored Vietnamese content. Order matches the app's module list.
MODULES = [
    ("M1_BASICS", m1_m5_m7.M1_VI),
    ("M2_SI_PHAN", m1_m5_m7.M2_VI),
    ("M3_TINH_HAO_BIEN_HANH", m1_m5_m7.M3_VI),
    ("M4_AKUSALA", m1_m5_m7.M4_VI),
    ("M5_SOBHANA", m1_m5_m7.M5_VI),
    ("M6_NGHIEP", m6_m8.M6_VI),
    ("M7_SIEU_THE", m1_m5_m7.M7_VI),
    ("M8_NHAN_DUYEN", m6_m8.M8_VI),
    ("M9_SAC_PHAP", m9_m10.M9_VI),
    ("M10_LO_TRINH", m9_m10.M10_VI),
]

VI_PATH = os.path.join(ROOT, "assets", "content", "content_vi.json")
EN_PATH = os.path.join(ROOT, "assets", "content", "content_en.json")

# ── Validation ────────────────────────────────────────────────────────────────

SECTION_KEYS = {"id", "title", "summary", "body", "keyTerms", "sourceRefs"}
CARD_KEYS = {"id", "front", "back", "hint", "sourceRefs"}
SEED_KEYS = {"id", "type", "question", "correctAnswer", "distractors",
             "explanation", "sourceRefs"}


def _fail(msg: str) -> None:
    raise SystemExit(f"content build failed: {msg}")


def validate(module_id: str, module: dict) -> None:
    for field in ("title", "description"):
        if not module.get(field):
            _fail(f"{module_id} missing {field}")

    seen: set[str] = set()

    def check(items, allowed, required, label):
        for item in items:
            iid = item.get("id")
            if not iid:
                _fail(f"{module_id} has a {label} without an id")
            if iid in seen:
                _fail(f"{module_id} duplicate id {iid}")
            seen.add(iid)
            if not iid.startswith(module_id.split("_")[0] + "_"):
                _fail(f"{module_id}: id {iid} does not use the module prefix")
            unknown = set(item) - allowed
            if unknown:
                _fail(f"{module_id}/{iid} unknown keys {sorted(unknown)}")
            for key in required:
                if not item.get(key):
                    _fail(f"{module_id}/{iid} missing {key}")
            for sref in item.get("sourceRefs", []):
                if not sref.get("file") or not sref.get("page"):
                    _fail(f"{module_id}/{iid} has an incomplete sourceRef")

    sections = module.get("lessonSections", [])
    cards = module.get("reviewCards", [])
    seeds = module.get("quizSeeds", [])

    check(sections, SECTION_KEYS, ("title", "body", "sourceRefs"), "lessonSection")
    check(cards, CARD_KEYS, ("front", "back"), "reviewCard")
    check(seeds, SEED_KEYS,
          ("type", "question", "correctAnswer", "distractors"), "quizSeed")

    for seed in seeds:
        if seed["type"] != "mcq":
            _fail(f"{module_id}/{seed['id']} unsupported quiz type {seed['type']}")
        if seed["correctAnswer"] in seed["distractors"]:
            _fail(f"{module_id}/{seed['id']} distractor duplicates the answer")
        if len(set(seed["distractors"])) != len(seed["distractors"]):
            _fail(f"{module_id}/{seed['id']} has duplicate distractors")

    # Targets agreed with the task: 3-8 sections, 8-20 cards, 8-20 seeds.
    if not 3 <= len(sections) <= 8:
        _fail(f"{module_id} has {len(sections)} lesson sections (want 3-8)")
    if not 8 <= len(cards) <= 20:
        _fail(f"{module_id} has {len(cards)} review cards (want 8-20)")
    if not 8 <= len(seeds) <= 20:
        _fail(f"{module_id} has {len(seeds)} quiz seeds (want 8-20)")


# ── Build ─────────────────────────────────────────────────────────────────────


def build_vi() -> dict:
    study_modules = {}
    for module_id, module in MODULES:
        validate(module_id, module)
        study_modules[module_id] = {
            "title": module["title"],
            "description": module["description"],
            "translationStatus": module.get("translationStatus", "reviewed"),
            "lessonSections": module.get("lessonSections", []),
            "reviewCards": module.get("reviewCards", []),
            "quizSeeds": module.get("quizSeeds", []),
        }
    return {
        "locale": "vi",
        "schemaVersion": SCHEMA_VERSION,
        "fallbackLocale": "en",
        "translationStatus": "source",
        "note": (
            "Vietnamese is the source of truth for lesson content. Entity "
            "strings (cittas/cetasikas/rupas/...) stay in assets/data/*.json "
            "and are intentionally not duplicated here."
        ),
        "studyModules": study_modules,
    }


def update_en(existing: dict) -> dict:
    """Keep every reviewed English entity translation, refresh study modules.

    English lesson prose has NOT been translated yet. Rather than shipping
    machine translation as if it were reviewed, each module is marked
    `source_only` and the runtime locale chain (en -> vi) serves the
    Vietnamese lesson content until a human translation lands.
    """
    out = dict(existing)
    out["locale"] = "en"
    out["schemaVersion"] = SCHEMA_VERSION
    out["fallbackLocale"] = "vi"
    out["lessonTranslationStatus"] = "source_only"
    out["lessonTranslationNote"] = (
        "Study module titles/descriptions are English. lessonSections, "
        "reviewCards and quizSeeds are not translated yet and resolve to the "
        "Vietnamese source through the en -> vi content fallback chain."
    )

    modules = dict(out.get("studyModules") or {})
    for module_id, _module in MODULES:
        entry = dict(modules.get(module_id) or {})
        if not entry.get("title"):
            _fail(f"content_en.json is missing a title for {module_id}")
        entry["translationStatus"] = "source_only"
        entry["needsReview"] = True
        modules[module_id] = entry
    out["studyModules"] = modules
    return out


def write_json(path: str, payload: dict) -> None:
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as handle:
        json.dump(payload, handle, ensure_ascii=False, indent=2)
        handle.write("\n")


def main() -> None:
    vi = build_vi()
    with open(EN_PATH, encoding="utf-8") as handle:
        en = update_en(json.load(handle))

    write_json(VI_PATH, vi)
    write_json(EN_PATH, en)

    total_sections = sum(len(m["lessonSections"]) for m in vi["studyModules"].values())
    total_cards = sum(len(m["reviewCards"]) for m in vi["studyModules"].values())
    total_seeds = sum(len(m["quizSeeds"]) for m in vi["studyModules"].values())
    print(f"wrote {VI_PATH}")
    print(f"wrote {EN_PATH}")
    print(
        f"{len(vi['studyModules'])} modules · {total_sections} sections · "
        f"{total_cards} review cards · {total_seeds} quiz seeds"
    )
    for module_id, module in vi["studyModules"].items():
        print(
            f"  {module_id:<24} "
            f"{len(module['lessonSections']):>2} sec  "
            f"{len(module['reviewCards']):>2} cards  "
            f"{len(module['quizSeeds']):>2} seeds"
        )


if __name__ == "__main__":
    main()
