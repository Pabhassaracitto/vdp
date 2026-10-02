# -*- coding: utf-8 -*-
"""Merge a directory of per-module translation files into content_<locale>.json.

Each file in the directory must be named `<MODULE_ID>.json` and contain:
    {"zh": {...module...}, "zh_TW": {...module...}, "ja": {...module...}}
(any subset of locales is fine). Each `{...module...}` has only the
translatable fields — see merge_module_translation.py for the exact shape.

Usage:
    python3 tool/content/merge_batch.py l10n_work/gen
"""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)

from tool.content.merge_module_translation import load, save, merge_module, CONTENT


def main():
    if len(sys.argv) != 2:
        print(__doc__)
        return 1
    src_dir = sys.argv[1]

    vi = load(os.path.join(CONTENT, "content_vi.json"))
    targets = {}  # locale -> data
    touched = {}  # locale -> [module_id]

    for fname in sorted(os.listdir(src_dir)):
        if not fname.endswith(".json"):
            continue
        module_id = fname[:-5]
        if module_id not in vi["studyModules"]:
            print(f"SKIP {fname}: unknown module id {module_id}")
            continue
        vi_module = vi["studyModules"][module_id]
        with open(os.path.join(src_dir, fname), encoding="utf-8") as f:
            per_locale = json.load(f)
        for locale, tr_module in per_locale.items():
            if locale not in targets:
                target_path = os.path.join(CONTENT, f"content_{locale}.json")
                targets[locale] = (target_path, load(target_path))
                touched[locale] = []
            target_path, target = targets[locale]
            try:
                merged = merge_module(vi_module, tr_module)
            except ValueError as e:
                print(f"ERROR {fname} [{locale}]: {e}")
                return 1
            target["studyModules"][module_id] = merged
            touched[locale].append(module_id)

    for locale, (target_path, target) in targets.items():
        save(target_path, target)
        print(f"{locale}: merged {len(touched[locale])} module(s) -> {target_path}")
        print("   " + ", ".join(touched[locale]))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
