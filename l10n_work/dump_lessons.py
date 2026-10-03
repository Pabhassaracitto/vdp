#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Print the Vietnamese source + English scaffolding for one study module,
so the English lesson prose can be authored against it.

Usage:  python3 l10n_work/dump_lessons.py M4_AKUSALA [M6_NGHIEP ...]
"""
from __future__ import annotations

import json
import os
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))


def load(name):
    with open(os.path.join(ROOT, "assets", "content", name), encoding="utf-8") as fh:
        return json.load(fh)


def main(argv):
    en, vi = load("content_en.json"), load("content_vi.json")
    for mid in argv:
        em, vm = en["studyModules"][mid], vi["studyModules"][mid]
        print(f"===== {mid} :: {em['title']}")
        vs = {s["id"]: s for s in vm["lessonSections"]}
        for sec in em["lessonSections"]:
            v = vs[sec["id"]]
            print(f"\n--- {sec['id']} | EN title: {sec['title']}")
            print(f"VI summary: {v['summary']}")
            ph = ("This paragraph explains",
                  "This section presents the Abhidhamma teaching")
            for i, b in enumerate(v["body"]):
                cur = sec["body"][i]
                flag = "" if cur.startswith(ph) else "  <<KEEP EN: " + cur + ">>"
                print(f"  [{i}] {b}{flag}")
            terms = "; ".join(
                f"{t['term']} ({t['pali']})" for t in sec.get("keyTerms", []))
            print(f"EN terms: {terms}")
            refs = "; ".join(
                f"{r['file']} p{r.get('page')}" for r in sec.get("sourceRefs", []))
            print(f"refs: {refs}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
