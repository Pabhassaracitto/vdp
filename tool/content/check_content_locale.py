#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Validate a translated study-content file before it is allowed to ship.

This is Content Governance Layer 2 for *translations*, the counterpart to
`lib/core/validators/data_validator.dart` (which guards the structural
dataset). The dataset validator asks "is this doctrine internally consistent?";
this one asks "is this translation safe to put in front of a learner?".

CHECKS
------
Hard (exit 1 — must never ship):
  H1  Unknown id: an id that is not in the Vietnamese source. Usually a typo
      that would silently never display.
  H2  Structural drift: `pali`, `type` or `sourceRefs` altered from the source.
      Pāḷi is the cross-language anchor; changing it breaks the audit trail.
  H3  Leaked placeholder: literal "TODO" left in a shipping file.
  H4  Quiz integrity: a distractor equal to the correct answer (two right
      answers), or duplicate distractors.
  H5  Mixed-language quiz: the answer is translated but its distractors are
      still Vietnamese (or vice versa). This makes the correct option
      trivially guessable and is the most common half-finished-translation bug.
  H6  Schema violations that would make the Dart parser silently drop an entry
      (empty front/back on a card, missing question/answer on a seed).

Soft (exit 0, reported — reviewer's judgement):
  S1  Untranslated: the value is byte-identical to the Vietnamese source.
  S2  Vietnamese diacritics present in a non-Vietnamese locale.
  S3  Coverage below the tier threshold.
  S4  A section that lost all its body paragraphs.
  S5  Glossary drift: an entity whose agreed Pāḷi rendering (from
      l10n_work/glossary.json) does not appear in its translated name.

USAGE
-----
    python3 tool/content/check_content_locale.py hi
    python3 tool/content/check_content_locale.py --all
    python3 tool/content/check_content_locale.py hi --file l10n_work/content_hi.worksheet.json
    python3 tool/content/check_content_locale.py --all --strict   # soft -> hard
    python3 tool/content/check_content_locale.py hi --glossary    # check S5 too
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
from typing import Any

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
CONTENT = os.path.join(ROOT, "assets", "content")
WORKSHEETS = os.path.join(ROOT, "l10n_work")

TODO = "TODO"

# Vietnamese-specific letters. Pāḷi diacritics (ā ī ū ṃ ṅ ñ ṭ ḍ ṇ ḷ) are
# deliberately excluded: those are expected in every language.
VIETNAMESE_CHARS = re.compile(
    r"[ăâđêôơư"
    r"àáảãạằắẳẵặầấẩẫậèéẻẽẹềếểễệìíỉĩị"
    r"òóỏõọồốổỗộờớởỡợùúủũụừứửữựỳýỷỹỵ"
    r"ĂÂĐÊÔƠƯÀÁẢÃẠẰẮẲẴẶẦẤẨẪẬÈÉẺẼẸỀẾỂỄỆÌÍỈĨỊ"
    r"ÒÓỎÕỌỒỐỔỖỘỜỚỞỠỢÙÚỦŨỤỪỨỬỮỰỲÝỶỸỴ]"
)

ENTITY_SECTIONS = ["cittas", "cetasikas", "rupas", "kammas", "paticcas",
                   "paccayas", "vithis"]


class Report:
    def __init__(self, locale: str) -> None:
        self.locale = locale
        self.hard: list[str] = []
        self.soft: list[str] = []
        self.stats: dict[str, int] = {}

    def fail(self, code: str, message: str) -> None:
        self.hard.append(f"[{code}] {message}")

    def warn(self, code: str, message: str) -> None:
        self.soft.append(f"[{code}] {message}")


def read_json(path: str) -> Any:
    with open(path, encoding="utf-8") as handle:
        return json.load(handle)


def is_todo(value: Any) -> bool:
    return isinstance(value, str) and value.strip() == TODO


def has_todo(node: Any) -> bool:
    if isinstance(node, str):
        return node.strip() == TODO
    if isinstance(node, dict):
        return any(has_todo(v) for k, v in node.items()
                   if k != "_src" and not k.startswith("_src_"))
    if isinstance(node, list):
        return any(has_todo(v) for v in node)
    return False


def vietnamese_ratio(text: str) -> float:
    """Fraction of letters that are Vietnamese-specific."""
    if not text:
        return 0.0
    hits = len(VIETNAMESE_CHARS.findall(text))
    return hits / max(len(text), 1)


def looks_vietnamese(text: str) -> bool:
    # Two independent signals so a single loanword or a proper noun does not
    # trip the check: absolute count AND density.
    hits = len(VIETNAMESE_CHARS.findall(text))
    return hits >= 2 and vietnamese_ratio(text) > 0.02


# ── Entity checks ─────────────────────────────────────────────────────────────


def load_glossary(locale: str) -> dict[str, str]:
    """Agreed Pāḷi -> local rendering, keyed by the entity id that uses it."""
    path = os.path.join(WORKSHEETS, "glossary.json")
    if not os.path.exists(path):
        return {}
    try:
        data = read_json(path)
    except Exception:
        return {}
    return {
        term["pali"]: term[locale]
        for term in data.get("terms", [])
        if isinstance(term.get(locale), str) and term[locale].strip()
    }


def check_glossary(data: dict, locale: str, report: Report) -> None:
    """Warn when an entity name ignores its agreed glossary rendering.

    Consistency is the whole point of the glossary: if `Phassa` was agreed as
    触, a lesson that renders it 接触 elsewhere teaches the learner two names
    for one dhamma.
    """
    agreed = load_glossary(locale)
    if not agreed:
        report.warn("S5", "no glossary entries for this locale — run "
                          "tool/content/build_glossary.py and agree terms first")
        return

    data_dir = os.path.join(ROOT, "assets", "data")
    specs = [("cetasikas", "cetasikas.json"), ("rupas", "rupas.json"),
             ("paticcas", "paticca.json"), ("paccayas", "paccayas.json"),
             ("kammas", "kammas.json"), ("vithis", "vithis.json")]
    for section, filename in specs:
        translated = data.get(section) or {}
        if not isinstance(translated, dict) or not translated:
            continue
        for item in read_json(os.path.join(data_dir, filename))[section]:
            entry = translated.get(item["id"])
            if not isinstance(entry, dict):
                continue
            name = entry.get("name")
            if not isinstance(name, str) or not name.strip() or is_todo(name):
                continue
            expected = agreed.get(item.get("namePali", ""))
            if expected and expected not in name:
                report.warn(
                    "S5",
                    f"{section}.{item['id']}.name: {name!r} does not use the "
                    f"agreed rendering {expected!r} for "
                    f"{item.get('namePali')!r}")


def check_entities(data: dict, vi_entities: dict, report: Report) -> None:
    for section in ENTITY_SECTIONS:
        translated = data.get(section) or {}
        if not isinstance(translated, dict):
            report.fail("H6", f"{section}: expected an object, got "
                              f"{type(translated).__name__}")
            continue
        known = vi_entities.get(section, {})
        for item_id, entry in translated.items():
            if item_id not in known:
                report.fail("H1", f"{section}.{item_id}: unknown id "
                                  f"(not in assets/data)")
                continue
            if not isinstance(entry, dict):
                report.fail("H6", f"{section}.{item_id}: expected an object")
                continue
            source = known[item_id]
            for field, value in entry.items():
                if field.startswith("_src") or field == "steps":
                    continue
                if is_todo(value):
                    report.fail("H3", f"{section}.{item_id}.{field}: "
                                      f"placeholder TODO left in")
                    continue
                for text in iter_strings(value):
                    check_text(f"{section}.{item_id}.{field}", text,
                               source.get(field), report)


def iter_strings(value: Any):
    if isinstance(value, str):
        yield value
    elif isinstance(value, list):
        for item in value:
            yield from iter_strings(item)
    elif isinstance(value, dict):
        for key, item in value.items():
            if key.startswith("_src"):
                continue
            yield from iter_strings(item)


def check_text(path: str, text: str, vi_source: Any, report: Report) -> None:
    if not text.strip():
        return
    if isinstance(vi_source, str) and text.strip() == vi_source.strip():
        report.warn("S1", f"{path}: identical to the Vietnamese source")
        return
    if looks_vietnamese(text):
        report.warn("S2", f"{path}: contains Vietnamese diacritics — "
                          f"{text[:60]!r}")


# ── Lesson checks ─────────────────────────────────────────────────────────────


def check_modules(data: dict, vi: dict, report: Report) -> None:
    vi_modules = vi.get("studyModules", {})
    modules = data.get("studyModules") or {}
    if not isinstance(modules, dict):
        report.fail("H6", "studyModules: expected an object")
        return

    for module_id, module in modules.items():
        if module_id not in vi_modules:
            report.fail("H1", f"studyModules.{module_id}: unknown module id")
            continue
        vi_module = vi_modules[module_id]

        for field in ("title", "description"):
            value = module.get(field)
            if value is None:
                continue
            if is_todo(value):
                report.fail("H3", f"{module_id}.{field}: placeholder TODO")
            elif isinstance(value, str):
                check_text(f"{module_id}.{field}", value,
                           vi_module.get(field), report)

        check_sections(module_id, module, vi_module, report)
        check_cards(module_id, module, vi_module, report)
        check_seeds(module_id, module, vi_module, report)


def index_by_id(items: Any) -> dict[str, dict]:
    if not isinstance(items, list):
        return {}
    return {item["id"]: item for item in items
            if isinstance(item, dict) and isinstance(item.get("id"), str)}


def check_sections(module_id: str, module: dict, vi_module: dict,
                   report: Report) -> None:
    vi_sections = index_by_id(vi_module.get("lessonSections"))
    for section in module.get("lessonSections") or []:
        if not isinstance(section, dict):
            report.fail("H6", f"{module_id}.lessonSections: non-object entry")
            continue
        sid = section.get("id")
        if sid not in vi_sections:
            report.fail("H1", f"{module_id}.lessonSections.{sid}: unknown id")
            continue
        vi_section = vi_sections[sid]

        if has_todo(section):
            report.fail("H3", f"{sid}: placeholder TODO left in")

        # sourceRefs are the audit trail: they must survive translation intact.
        if "sourceRefs" in section and section["sourceRefs"] != vi_section.get("sourceRefs"):
            report.fail("H2", f"{sid}.sourceRefs: altered from the source")

        for field in ("title", "summary"):
            value = section.get(field)
            if isinstance(value, str):
                check_text(f"{sid}.{field}", value, vi_section.get(field), report)

        body = section.get("body")
        if isinstance(body, list):
            vi_body = vi_section.get("body") or []
            if body and len(body) != len(vi_body):
                report.warn("S4", f"{sid}.body: {len(body)} paragraphs vs "
                                  f"{len(vi_body)} in the source")
            for index, paragraph in enumerate(body):
                if isinstance(paragraph, str):
                    vi_paragraph = vi_body[index] if index < len(vi_body) else None
                    check_text(f"{sid}.body[{index}]", paragraph,
                               vi_paragraph, report)
        elif "body" in section and body:
            report.fail("H6", f"{sid}.body: expected a list")

        check_key_terms(sid, section, vi_section, report)


def check_key_terms(sid: str, section: dict, vi_section: dict,
                    report: Report) -> None:
    vi_terms = {t.get("id"): t for t in (vi_section.get("keyTerms") or [])}
    for term in section.get("keyTerms") or []:
        if not isinstance(term, dict):
            continue
        tid = term.get("id")
        vi_term = vi_terms.get(tid)
        if vi_term is None:
            report.fail("H1", f"{sid}.keyTerms.{tid}: unknown term id")
            continue
        # Pāḷi is the invariant across all languages.
        if term.get("pali") and term["pali"] != vi_term.get("pali"):
            report.fail(
                "H2",
                f"{sid}.keyTerms.{tid}.pali: {term['pali']!r} != "
                f"source {vi_term.get('pali')!r} — Pāḷi must not be translated")
        for field in ("term", "meaning"):
            value = term.get(field)
            if isinstance(value, str):
                check_text(f"{sid}.keyTerms.{tid}.{field}", value,
                           vi_term.get(field), report)


def check_cards(module_id: str, module: dict, vi_module: dict,
                report: Report) -> None:
    vi_cards = index_by_id(vi_module.get("reviewCards"))
    for card in module.get("reviewCards") or []:
        if not isinstance(card, dict):
            continue
        cid = card.get("id")
        if cid not in vi_cards:
            report.fail("H1", f"{module_id}.reviewCards.{cid}: unknown id")
            continue
        if has_todo(card):
            report.fail("H3", f"{cid}: placeholder TODO left in")
        # The Dart parser drops a card with an empty side; catch it here
        # instead of silently losing review material at runtime.
        for field in ("front", "back"):
            value = card.get(field)
            if field in card and (not isinstance(value, str) or not value.strip()):
                report.fail("H6", f"{cid}.{field}: empty — the app would drop "
                                  f"this card")
            elif isinstance(value, str):
                check_text(f"{cid}.{field}", value,
                           vi_cards[cid].get(field), report)


def check_seeds(module_id: str, module: dict, vi_module: dict,
                report: Report) -> None:
    vi_seeds = index_by_id(vi_module.get("quizSeeds"))
    for seed in module.get("quizSeeds") or []:
        if not isinstance(seed, dict):
            continue
        qid = seed.get("id")
        if qid not in vi_seeds:
            report.fail("H1", f"{module_id}.quizSeeds.{qid}: unknown id")
            continue
        vi_seed = vi_seeds[qid]

        if has_todo(seed):
            report.fail("H3", f"{qid}: placeholder TODO left in")
        if seed.get("type") and seed["type"] != vi_seed.get("type"):
            report.fail("H2", f"{qid}.type: altered from the source")

        answer = seed.get("correctAnswer")
        distractors = seed.get("distractors")

        if "correctAnswer" in seed and (not isinstance(answer, str) or not answer.strip()):
            report.fail("H6", f"{qid}.correctAnswer: empty")
        if "distractors" in seed:
            if not isinstance(distractors, list) or not distractors:
                report.fail("H6", f"{qid}.distractors: empty — the app would "
                                  f"drop this question")
                distractors = []

        if isinstance(answer, str) and isinstance(distractors, list):
            # H4: an option that equals the answer means two correct choices.
            if answer in distractors:
                report.fail("H4", f"{qid}: a distractor equals the correct "
                                  f"answer ({answer!r})")
            seen = [d for d in distractors if isinstance(d, str)]
            if len(set(seen)) != len(seen):
                report.fail("H4", f"{qid}: duplicate distractors")

            # H5: the highest-value check. If the answer was translated but the
            # options were not, the right answer is the odd one out and the
            # question tests nothing.
            answer_vi = looks_vietnamese(answer)
            option_flags = [looks_vietnamese(d) for d in seen if d.strip()]
            if option_flags and answer_vi != all(option_flags) and \
                    answer_vi != any(option_flags):
                pass  # mixed within options; covered below
            if seen and answer.strip():
                translated_answer = not answer_vi
                untranslated_options = [d for d, flag in zip(seen, option_flags)
                                        if flag]
                if translated_answer and untranslated_options:
                    report.fail(
                        "H5",
                        f"{qid}: correct answer is translated but "
                        f"{len(untranslated_options)} distractor(s) are still "
                        f"Vietnamese — the answer is guessable")
                if not translated_answer and len(untranslated_options) < len(seen):
                    report.fail(
                        "H5",
                        f"{qid}: distractors are translated but the correct "
                        f"answer is still Vietnamese — the answer is guessable")

        for field in ("question", "explanation"):
            value = seed.get(field)
            if isinstance(value, str):
                check_text(f"{qid}.{field}", value, vi_seed.get(field), report)


# ── Coverage ──────────────────────────────────────────────────────────────────

STRUCTURAL_KEYS = {"id", "pali", "type", "sourceRefs", "translationStatus",
                   "locale", "schemaVersion", "fallbackLocale", "note",
                   "lessonTranslationStatus", "lessonTranslationNote",
                   "needsReview"}


def count_slots(node: Any) -> tuple[int, int]:
    done = total = 0
    if isinstance(node, dict):
        for key, value in node.items():
            if key in STRUCTURAL_KEYS or key == "_src" or key.startswith("_src_"):
                continue
            d, t = count_slots(value)
            done, total = done + d, total + t
    elif isinstance(node, list):
        for value in node:
            d, t = count_slots(value)
            done, total = done + d, total + t
    elif isinstance(node, str):
        total = 1
        done = 1 if node.strip() and node.strip() != TODO else 0
    return done, total


def expected_slots(vi: dict, vi_entities: dict) -> int:
    """Total translatable slots, derived from the source of truth."""
    from_modules = count_slots({"studyModules": vi.get("studyModules", {})})[1]
    from_entities = sum(
        count_slots(entry)[1]
        for section in vi_entities.values()
        for entry in section.values()
    )
    return from_modules + from_entities


# ── Vietnamese source index ───────────────────────────────────────────────────


def load_vi_entities() -> dict[str, dict]:
    """Vietnamese entity text, keyed the same way a content file is."""
    specs = {
        "cittas": ("cittas.json", "cittas",
                   {"name": "nameVietnamese", "doctrinalNote": "doctrinalNote",
                    "examples": "examples"}),
        "cetasikas": ("cetasikas.json", "cetasikas",
                      {"name": "nameVietnamese", "shortName": "nameShort",
                       "description": "descriptionVi", "characteristic": "trangThai",
                       "function": "phanSu", "manifestation": "thanhTuu",
                       "proximateCause": "nhanGan"}),
        "rupas": ("rupas.json", "rupas",
                  {"name": "nameVietnamese", "shortName": "nameShort",
                   "description": "descriptionVi", "characteristic": "trangThai",
                   "function": "phanSu", "manifestation": "thanhTuu",
                   "proximateCause": "nhanGan", "doctrinalNote": "doctrinalNote"}),
        "kammas": ("kammas.json", "kammas",
                   {"name": "nameVietnamese", "shortName": "nameShort",
                    "description": "descriptionVi", "doctrinalNote": "doctrinalNote",
                    "examples": "examples"}),
        "paticcas": ("paticca.json", "paticcas",
                     {"name": "nameVietnamese", "shortName": "nameShort",
                      "description": "descriptionVi", "characteristic": "trangThai",
                      "function": "phanSu", "manifestation": "thanhTuu",
                      "proximateCause": "nhanGan", "doctrinalNote": "doctrinalNote",
                      "examples": "examples"}),
        "paccayas": ("paccayas.json", "paccayas",
                     {"name": "nameVietnamese", "shortName": "nameShort",
                      "definition": "definitionVi", "paccayaDhamma": "paccayaDhamma",
                      "paccayuppanna": "paccayuppanna",
                      "doctrinalNote": "doctrinalNote", "examples": "examples"}),
        "vithis": ("vithis.json", "vithis",
                   {"name": "nameVietnamese", "shortName": "nameShort",
                    "description": "descriptionVi"}),
    }
    data_dir = os.path.join(ROOT, "assets", "data")
    out: dict[str, dict] = {}
    for section, (filename, json_key, fields) in specs.items():
        items = read_json(os.path.join(data_dir, filename))[json_key]
        out[section] = {
            item["id"]: {target: item.get(source)
                         for target, source in fields.items()
                         if item.get(source) not in (None, "", [])}
            for item in items
        }
    return out


# ── Driver ────────────────────────────────────────────────────────────────────


def resolve_path(locale: str, override: str | None) -> str | None:
    if override:
        return override if os.path.exists(override) else None
    for candidate in (
        os.path.join(CONTENT, f"content_{locale}.json"),
        os.path.join(WORKSHEETS, f"content_{locale}.worksheet.json"),
    ):
        if os.path.exists(candidate):
            return candidate
    return None


def check_locale(locale: str, path: str, vi: dict, vi_entities: dict,
                 min_coverage: float, with_glossary: bool = False) -> Report:
    report = Report(locale)
    data = read_json(path)

    declared = data.get("locale")
    if declared and declared != locale:
        report.fail("H6", f"locale field is {declared!r} but the file is for "
                          f"{locale!r}")

    check_entities(data, vi_entities, report)
    check_modules(data, vi, report)
    if with_glossary:
        check_glossary(data, locale, report)

    done, _ = count_slots(data)
    total = expected_slots(vi, vi_entities)
    pct = (100.0 * done / total) if total else 0.0
    report.stats = {"translated": done, "expected": total, "pct": round(pct, 1)}
    if pct < min_coverage:
        report.warn("S3", f"coverage {pct:.1f}% is below the "
                          f"{min_coverage:.0f}% threshold")
    return report


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Validate translated study content.")
    parser.add_argument("locales", nargs="*", help="locale tags to check")
    parser.add_argument("--all", action="store_true",
                        help="check every content_*.json in assets/content")
    parser.add_argument("--file", help="explicit path (single locale only)")
    parser.add_argument("--min-coverage", type=float, default=0.0,
                        help="warn below this %% translated (default 0)")
    parser.add_argument("--strict", action="store_true",
                        help="treat soft warnings as failures")
    parser.add_argument("--glossary", action="store_true",
                        help="also check agreed Pāḷi renderings (S5)")
    parser.add_argument("--quiet", action="store_true",
                        help="only print failures")
    args = parser.parse_args()

    vi = read_json(os.path.join(CONTENT, "content_vi.json"))
    vi_entities = load_vi_entities()

    locales = list(args.locales)
    if args.all:
        for name in sorted(os.listdir(CONTENT)):
            match = re.fullmatch(r"content_(.+)\.json", name)
            if match and match.group(1) not in ("vi",):
                locales.append(match.group(1))
        locales = sorted(set(locales))
    if not locales:
        parser.error("give at least one locale, or --all")

    exit_code = 0
    for locale in locales:
        path = resolve_path(locale, args.file if len(locales) == 1 else None)
        if path is None:
            print(f"✗ {locale}: no content file found", file=sys.stderr)
            exit_code = 1
            continue

        report = check_locale(locale, path, vi, vi_entities,
                              args.min_coverage, with_glossary=args.glossary)
        stats = report.stats
        header = (f"{locale}  ({stats['translated']}/{stats['expected']} slots, "
                  f"{stats['pct']}%)  {os.path.relpath(path, ROOT)}")

        if report.hard:
            print(f"✗ {header}")
            for message in report.hard:
                print(f"    {message}")
            exit_code = 1
        elif report.soft and args.strict:
            print(f"✗ {header}")
            exit_code = 1
        elif not args.quiet:
            print(f"✓ {header}")

        if report.soft and not args.quiet:
            shown = report.soft if args.strict else report.soft[:15]
            for message in shown:
                print(f"    warn {message}")
            if len(report.soft) > len(shown):
                print(f"    warn ... and {len(report.soft) - len(shown)} more")

    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
