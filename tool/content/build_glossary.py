#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Build the Pāḷi term glossary that every translation must be keyed to.

WHY THIS EXISTS
---------------
Abhidhamma terminology is not ordinary vocabulary. Each of the 52 cetasikas,
121 cittas and 28 rūpas is a technical term with a fixed doctrinal meaning, and
every receiving language already has a centuries-old rendering tradition:

* Chinese  — 摂阿毘達磨義論, the classical rendering (触/受/想/思/一境性…).
* Sinhala  — the Sri Lankan Abhidhamma teaching tradition; the Sangaha has been
             printed in Sinhala script continuously.
* Myanmar  — Myanmar has been the international centre of Abhidhamma study
             since the 15th century; the "let-than" manuals fix the vocabulary.
* Hindi    — Ven. Rewata Dhamma's Hindi translation and commentary
             (Abhidharma Prakāśinī, Varanasi 1967).
* Japanese — 南伝大蔵経 vol. 65, 摂阿毘達磨義論, tr. Mizuno Kōgen. Japanese
             Buddhist vocabulary is overwhelmingly Mahāyāna/Sanskrit-derived,
             so this is the language where an unglossed translator is most
             likely to import a subtly wrong sense. Treat with extra care.

Translating these terms ad hoc — or worse, letting a machine translate them —
produces text that reads fluently and teaches wrong Dhamma. So the glossary is
a hard prerequisite: it is agreed and reviewed *before* any prose is written,
and the content validator then holds translations to it.

OUTPUT
------
`l10n_work/glossary.csv`   — one row per Pāḷi headword, one column per locale,
                             ready to hand to a translator or open in a sheet.
`l10n_work/glossary.json`  — the same data, machine-readable, used by
                             check_content_locale.py --glossary to verify that
                             an agreed term was actually used.

Existing translations are preserved on re-run, so this can be regenerated as
the dataset grows without losing agreed terminology.

USAGE
-----
    python3 tool/content/build_glossary.py
    python3 tool/content/build_glossary.py --locales hi zh si my ja
    python3 tool/content/build_glossary.py --report
"""

from __future__ import annotations

import argparse
import csv
import json
import os
from typing import Any

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
DATA = os.path.join(ROOT, "assets", "data")
CONTENT = os.path.join(ROOT, "assets", "content")
WORK = os.path.join(ROOT, "l10n_work")

DEFAULT_LOCALES = ["hi", "zh", "zh_TW", "si", "my", "ja"]

# Reference works a reviewer should key each language to. Surfaced in the CSV
# header so the translator knows which tradition to follow rather than
# inventing a rendering.
AUTHORITIES = {
    "hi": "Rewata Dhamma, Abhidharma Prakasini (Hindi, Varanasi 1967)",
    "zh": "摂阿毘達磨義論 (classical Chinese Abhidhamma rendering)",
    "zh_TW": "摂阿毘達磨義論 (traditional-script Chinese rendering)",
    "si": "Sri Lankan Abhidhamma teaching tradition (Sangaha, Sinhala script)",
    "my": "Myanmar let-than manual tradition (Abhidhammattha Sangaha)",
    "ja": "南伝大蔵経 65: 摂阿毘達磨義論 (tr. Mizuno Kogen) — avoid Mahayana senses",
}

# section -> (file, json key, English gloss source in content_en.json)
ENTITY_SOURCES = [
    ("cetasikas", "cetasikas.json", "cetasikas"),
    ("rupas", "rupas.json", "rupas"),
    ("paticcas", "paticca.json", "paticcas"),
    ("kammas", "kammas.json", "kammas"),
    ("vithis", "vithis.json", "vithis"),
    ("cittas", "cittas.json", "cittas"),
]


def read_json(path: str) -> Any:
    with open(path, encoding="utf-8") as handle:
        return json.load(handle)


def collect_headwords() -> list[dict]:
    """Every Pāḷi term that needs an agreed rendering, with vi/en references."""
    english = read_json(os.path.join(CONTENT, "content_en.json"))
    vietnamese = read_json(os.path.join(CONTENT, "content_vi.json"))

    rows: dict[str, dict] = {}

    def add(pali: str, category: str, vi: str, en: str, ref: str) -> None:
        key = (pali or "").strip()
        if not key:
            return
        if key in rows:
            # Keep the first (more specific) category but record extra refs.
            existing = rows[key]
            if ref and ref not in existing["refs"]:
                existing["refs"].append(ref)
            return
        rows[key] = {
            "pali": key,
            "category": category,
            "vi": (vi or "").strip(),
            "en": (en or "").strip(),
            "refs": [ref] if ref else [],
        }

    for section, filename, en_key in ENTITY_SOURCES:
        items = read_json(os.path.join(DATA, filename))[section]
        en_section = english.get(en_key, {})
        for item in items:
            add(
                item.get("namePali", ""),
                section,
                item.get("nameVietnamese", ""),
                (en_section.get(item["id"], {}) or {}).get("name", ""),
                item["id"],
            )

    # Lesson key terms carry the pedagogically important vocabulary.
    for module_id, module in vietnamese.get("studyModules", {}).items():
        for section in module.get("lessonSections", []):
            for term in section.get("keyTerms", []):
                add(
                    term.get("pali", ""),
                    "keyTerm",
                    term.get("term", ""),
                    "",
                    f"{module_id}/{section['id']}",
                )

    ordered = sorted(
        rows.values(),
        # Cetasikas and key terms first: they are the highest-frequency,
        # highest-risk vocabulary and unblock the most content.
        key=lambda row: (
            {"cetasikas": 0, "keyTerm": 1, "rupas": 2, "paticcas": 3,
             "kammas": 4, "vithis": 5, "cittas": 6}.get(row["category"], 9),
            row["pali"].lower(),
        ),
    )
    return ordered


def load_existing(locales: list[str]) -> dict[str, dict[str, str]]:
    """Previously agreed renderings, so a rebuild never discards work."""
    path = os.path.join(WORK, "glossary.json")
    if not os.path.exists(path):
        return {}
    try:
        data = read_json(path)
    except Exception:
        return {}
    out: dict[str, dict[str, str]] = {}
    for entry in data.get("terms", []):
        pali = entry.get("pali")
        if not pali:
            continue
        out[pali] = {
            locale: entry.get(locale, "")
            for locale in locales
            if isinstance(entry.get(locale), str) and entry[locale].strip()
        }
    return out


def write_outputs(rows: list[dict], locales: list[str]) -> tuple[str, str]:
    os.makedirs(WORK, exist_ok=True)
    existing = load_existing(locales)

    for row in rows:
        for locale in locales:
            row[locale] = existing.get(row["pali"], {}).get(locale, "")

    csv_path = os.path.join(WORK, "glossary.csv")
    with open(csv_path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["# Pāḷi glossary — agree these BEFORE translating prose."])
        writer.writerow(["# Keep Pāḷi unchanged. One agreed rendering per term, "
                         "used consistently everywhere."])
        for locale in locales:
            writer.writerow([f"# {locale}: {AUTHORITIES.get(locale, '')}"])
        writer.writerow([])
        writer.writerow(["pali", "category", "vietnamese", "english",
                         *locales, "refs"])
        for row in rows:
            writer.writerow([
                row["pali"], row["category"], row["vi"], row["en"],
                *[row.get(locale, "") for locale in locales],
                " ".join(row["refs"][:4]),
            ])

    json_path = os.path.join(WORK, "glossary.json")
    payload = {
        "note": ("Agreed Pāḷi renderings per locale. Generated by "
                 "tool/content/build_glossary.py; edit the translation columns "
                 "in glossary.csv or here, then re-run to normalise."),
        "authorities": {k: v for k, v in AUTHORITIES.items() if k in locales},
        "locales": locales,
        "terms": [
            {"pali": row["pali"], "category": row["category"],
             "vi": row["vi"], "en": row["en"],
             **{locale: row.get(locale, "") for locale in locales}}
            for row in rows
        ],
    }
    with open(json_path, "w", encoding="utf-8") as handle:
        json.dump(payload, handle, ensure_ascii=False, indent=2)
        handle.write("\n")
    return csv_path, json_path


def report(locales: list[str]) -> int:
    path = os.path.join(WORK, "glossary.json")
    if not os.path.exists(path):
        print("no glossary yet — run: python3 tool/content/build_glossary.py")
        return 1
    data = read_json(path)
    terms = data.get("terms", [])
    by_category: dict[str, int] = {}
    for term in terms:
        by_category[term["category"]] = by_category.get(term["category"], 0) + 1

    print(f"{len(terms)} headwords")
    for category, count in sorted(by_category.items(), key=lambda kv: -kv[1]):
        print(f"  {category:12} {count:5}")
    print()
    print(f"{'locale':8} {'agreed':>8} {'missing':>8} {'coverage':>9}")
    for locale in locales:
        agreed = sum(1 for term in terms
                     if isinstance(term.get(locale), str) and term[locale].strip())
        total = len(terms)
        pct = (100.0 * agreed / total) if total else 0.0
        print(f"{locale:8} {agreed:>8} {total - agreed:>8} {pct:>8.1f}%")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Build the Pāḷi glossary.")
    parser.add_argument("--locales", nargs="+", default=DEFAULT_LOCALES)
    parser.add_argument("--report", action="store_true")
    args = parser.parse_args()

    if args.report:
        return report(args.locales)

    rows = collect_headwords()
    csv_path, json_path = write_outputs(rows, args.locales)
    print(f"{len(rows)} headwords -> {os.path.relpath(csv_path, ROOT)}")
    print(f"{len(rows)} headwords -> {os.path.relpath(json_path, ROOT)}")
    filled = {
        locale: sum(1 for row in rows if row.get(locale, "").strip())
        for locale in args.locales
    }
    print("agreed so far: " + ", ".join(
        f"{locale} {count}/{len(rows)}" for locale, count in filled.items()))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
