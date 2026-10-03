#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Apply authored English lesson prose to assets/content/content_en.json.

Input: a patch JSON of the shape

    {"<MODULE_ID>": {"<SECTION_ID>": {"summary": "...", "body": ["...", ...]}}}

Only `summary` and `body` are written; every other field is left untouched.
Body paragraph counts must match the Vietnamese source (soft rule S4), so the
script refuses a patch whose body length differs from content_vi.json.

Usage:  python3 l10n_work/apply_en_lessons.py l10n_work/gen_lessons/M4.json
"""
from __future__ import annotations

import json
import os
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
EN = os.path.join(ROOT, "assets", "content", "content_en.json")
VI = os.path.join(ROOT, "assets", "content", "content_vi.json")


def load(path):
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


def main(argv):
    if not argv:
        print(__doc__)
        return 2
    en = load(EN)
    vi = load(VI)
    changed = 0
    for patch_path in argv:
        patch = load(patch_path)
        for mid, sections in patch.items():
            if mid not in en["studyModules"]:
                raise SystemExit(f"unknown module {mid}")
            en_secs = {s["id"]: s for s in en["studyModules"][mid]["lessonSections"]}
            vi_secs = {s["id"]: s for s in vi["studyModules"][mid]["lessonSections"]}
            for sid, fields in sections.items():
                if sid not in en_secs:
                    raise SystemExit(f"unknown section {mid}/{sid}")
                sec = en_secs[sid]
                if "body" in fields:
                    want = len(vi_secs[sid]["body"])
                    got = len(fields["body"])
                    if want != got:
                        raise SystemExit(
                            f"{mid}/{sid}: body has {got} paragraphs, source has {want}")
                    merged = []
                    for idx, para in enumerate(fields["body"]):
                        if para is None:  # keep the paragraph already shipped
                            merged.append(sec["body"][idx])
                            continue
                        if not isinstance(para, str) or not para.strip():
                            raise SystemExit(f"{mid}/{sid}: empty body paragraph")
                        merged.append(para)
                    sec["body"] = merged
                if "summary" in fields:
                    if not fields["summary"].strip():
                        raise SystemExit(f"{mid}/{sid}: empty summary")
                    sec["summary"] = fields["summary"]
                changed += 1
    with open(EN, "w", encoding="utf-8") as fh:
        fh.write(json.dumps(en, ensure_ascii=False, indent=2) + "\n")
    print(f"updated {changed} section(s) in {os.path.relpath(EN, ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
