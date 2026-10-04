# -*- coding: utf-8 -*-
"""Generate content_<loc>.json files and update glossary for priority languages."""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)

from tool.content.build_full_catalogs import build_catalog, LOCALES

CONTENT = os.path.join(ROOT, "assets", "content")
WORK = os.path.join(ROOT, "l10n_work")

def generate_all_content_files():
    for loc in LOCALES:
        data = build_catalog(loc)
        target_path = os.path.join(CONTENT, f"content_{loc}.json")
        with open(target_path, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
            f.write("\n")
        print(f"Wrote {target_path} (cittas: {len(data['cittas'])}, cetasikas: {len(data['cetasikas'])}, rupas: {len(data['rupas'])}, paccayas: {len(data['paccayas'])}, paticcas: {len(data['paticcas'])}, kammas: {len(data['kammas'])}, vithis: {len(data['vithis'])}, modules: {len(data['studyModules'])})")

def update_glossary():
    DATA = os.path.join(ROOT, "assets", "data")
    specs = [
        ("cetasikas", "cetasikas.json"),
        ("rupas", "rupas.json"),
        ("paticcas", "paticca.json"),
        ("kammas", "kammas.json"),
        ("vithis", "vithis.json"),
        ("cittas", "cittas.json"),
    ]

    term_map = {}
    for loc in LOCALES:
        with open(os.path.join(CONTENT, f"content_{loc}.json"), encoding="utf-8") as f:
            cdata = json.load(f)
        for sec, fn in specs:
            with open(os.path.join(DATA, fn), encoding="utf-8") as f:
                items = json.load(f)[sec]
            for it in items:
                pali = it.get("namePali", "").strip()
                if not pali:
                    continue
                if pali not in term_map:
                    term_map[pali] = {}
                e = cdata[sec].get(it["id"], {})
                term_map[pali][loc] = e.get("name", "")

    gjson_path = os.path.join(WORK, "glossary.json")
    if os.path.exists(gjson_path):
        with open(gjson_path, encoding="utf-8") as f:
            gdata = json.load(f)
        loc_set = set(gdata.get("locales", []))
        for loc in LOCALES:
            if loc not in loc_set:
                gdata["locales"].append(loc)
        for term in gdata.get("terms", []):
            pali = term.get("pali", "").strip()
            if pali in term_map:
                for loc in LOCALES:
                    term[loc] = term_map[pali].get(loc, "")

        with open(gjson_path, "w", encoding="utf-8") as f:
            json.dump(gdata, f, ensure_ascii=False, indent=2)
            f.write("\n")
        print("Updated glossary.json with exact entity names")

if __name__ == "__main__":
    generate_all_content_files()
    update_glossary()
