# -*- coding: utf-8 -*-
"""Merge one translated study module into a content_<locale>.json bundle.

Usage:
    python3 tool/content/merge_module_translation.py <locale> <module_id> <translation.json>

`translation.json` holds only the *translatable* fields for the module
(title, description, lessonSections[].title/summary/body/keyTerms[].term&meaning,
reviewCards[].front/back, quizSeeds[].question/correctAnswer/distractors/explanation).

Structural fields (`id`, `pali`, `type`, `sourceRefs`) are always copied from
`assets/content/content_vi.json` (the source of truth) so translators never
touch them and so the tool can verify id alignment (hard rule H1/H2).
"""
import copy
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
CONTENT = os.path.join(ROOT, "assets", "content")


def load(path):
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def save(path, data):
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
        f.write("\n")


def merge_lesson_sections(vi_sections, tr_sections):
    if len(vi_sections) != len(tr_sections):
        raise ValueError(
            f"lessonSections count mismatch: vi={len(vi_sections)} tr={len(tr_sections)}"
        )
    out = []
    for vi_s, tr_s in zip(vi_sections, tr_sections):
        if vi_s["id"] != tr_s["id"]:
            raise ValueError(f"section id mismatch: {vi_s['id']} != {tr_s['id']}")
        vi_terms = vi_s.get("keyTerms", [])
        tr_terms = tr_s.get("keyTerms", [])
        if len(vi_terms) != len(tr_terms):
            raise ValueError(
                f"keyTerms count mismatch in {vi_s['id']}: "
                f"vi={len(vi_terms)} tr={len(tr_terms)}"
            )
        terms = []
        for vt, tt in zip(vi_terms, tr_terms):
            if vt["id"] != tt["id"]:
                raise ValueError(f"keyTerm id mismatch: {vt['id']} != {tt['id']}")
            terms.append({
                "id": vt["id"],
                "term": tt["term"],
                "pali": vt["pali"],
                "meaning": tt["meaning"],
            })
        section = {
            "id": vi_s["id"],
            "title": tr_s["title"],
            "summary": tr_s["summary"],
            "body": tr_s["body"],
            "keyTerms": terms,
            "sourceRefs": copy.deepcopy(vi_s.get("sourceRefs", [])),
        }
        out.append(section)
    return out


def merge_review_cards(vi_cards, tr_cards):
    if len(vi_cards) != len(tr_cards):
        raise ValueError(
            f"reviewCards count mismatch: vi={len(vi_cards)} tr={len(tr_cards)}"
        )
    out = []
    for vi_c, tr_c in zip(vi_cards, tr_cards):
        if vi_c["id"] != tr_c["id"]:
            raise ValueError(f"reviewCard id mismatch: {vi_c['id']} != {tr_c['id']}")
        out.append({
            "id": vi_c["id"],
            "front": tr_c["front"],
            "back": tr_c["back"],
            "sourceRefs": copy.deepcopy(vi_c.get("sourceRefs", [])),
        })
    return out


def merge_quiz_seeds(vi_seeds, tr_seeds):
    if len(vi_seeds) != len(tr_seeds):
        raise ValueError(
            f"quizSeeds count mismatch: vi={len(vi_seeds)} tr={len(tr_seeds)}"
        )
    out = []
    for vi_q, tr_q in zip(vi_seeds, tr_seeds):
        if vi_q["id"] != tr_q["id"]:
            raise ValueError(f"quizSeed id mismatch: {vi_q['id']} != {tr_q['id']}")
        if len(vi_q.get("distractors", [])) != len(tr_q.get("distractors", [])):
            raise ValueError(f"distractors count mismatch in {vi_q['id']}")
        out.append({
            "id": vi_q["id"],
            "type": vi_q["type"],
            "question": tr_q["question"],
            "correctAnswer": tr_q["correctAnswer"],
            "distractors": tr_q["distractors"],
            "explanation": tr_q.get("explanation", ""),
            "sourceRefs": copy.deepcopy(vi_q.get("sourceRefs", [])),
        })
    return out


def merge_module(vi_module, tr_module):
    return {
        "title": tr_module["title"],
        "description": tr_module["description"],
        "translationStatus": tr_module.get("translationStatus", "draft"),
        "lessonSections": merge_lesson_sections(
            vi_module["lessonSections"], tr_module["lessonSections"]
        ),
        "reviewCards": merge_review_cards(
            vi_module["reviewCards"], tr_module["reviewCards"]
        ),
        "quizSeeds": merge_quiz_seeds(
            vi_module["quizSeeds"], tr_module["quizSeeds"]
        ),
    }


def main():
    if len(sys.argv) != 4:
        print(__doc__)
        return 1
    locale, module_id, tr_path = sys.argv[1:4]

    vi = load(os.path.join(CONTENT, "content_vi.json"))
    if module_id not in vi["studyModules"]:
        print(f"Unknown module id: {module_id}")
        return 1
    vi_module = vi["studyModules"][module_id]

    tr_module = load(tr_path)

    target_path = os.path.join(CONTENT, f"content_{locale}.json")
    target = load(target_path)

    merged = merge_module(vi_module, tr_module)
    target["studyModules"][module_id] = merged
    save(target_path, target)
    print(f"Merged {module_id} into {target_path} "
          f"({len(merged['lessonSections'])} sections, "
          f"{len(merged['reviewCards'])} cards, "
          f"{len(merged['quizSeeds'])} seeds)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
