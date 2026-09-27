# -*- coding: utf-8 -*-
"""Generate content_<loc>.json files and update glossary for priority languages."""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)

import tool.content.data_priority_modules as dm
import tool.content.data_priority_cetasikas as dcet
import tool.content.data_priority_rupas as drup
import tool.content.data_priority_conditions as dcond
import tool.content.data_priority_cittas as dcit
import tool.content.data_priority_m1 as dm1
import tool.content.data_priority_m2 as dm2
import tool.content.data_priority_m11 as dm11

CONTENT = os.path.join(ROOT, "assets", "content")
WORK = os.path.join(ROOT, "l10n_work")

LOCALES = ["hi", "ja", "my", "si", "th", "zh", "zh_TW"]

def build_catalog_for_locale(loc):
    # cittas
    cittas = {}
    for cid, c_data in dcit.CITTAS.items():
        name, doc = c_data[loc]
        cittas[cid] = {
            "name": name,
            "doctrinalNote": doc
        }

    # cetasikas
    cetasikas = {}
    for cid, c_data in dcet.CETASIKAS.items():
        t = c_data[loc]
        cetasikas[cid] = {
            "name": t[0],
            "shortName": t[1],
            "description": t[2]
        }

    # rupas
    rupas = {}
    for rid, r_data in drup.RUPAS.items():
        t = r_data[loc]
        rupas[rid] = {
            "name": t[0],
            "shortName": t[1],
            "description": t[2]
        }

    # paccayas
    paccayas = {}
    for pid, p_data in dcond.PACCAYAS.items():
        t = p_data[loc]
        paccayas[pid] = {
            "name": t[0],
            "shortName": t[1],
            "definition": t[2]
        }

    # paticcas
    paticcas = {}
    for pid, p_data in dcond.PATICCAS.items():
        t = p_data[loc]
        paticcas[pid] = {
            "name": t[0],
            "shortName": t[1],
            "description": t[2]
        }

    # kammas
    kammas = {}
    for kid, k_data in dcond.KAMMAS.items():
        t = k_data[loc]
        kammas[kid] = {
            "name": t[0],
            "shortName": t[1],
            "description": t[2]
        }

    # vithis
    vithis = {}
    for vid, v_data in dcond.VITHIS.items():
        t = v_data[loc]
        vithis[vid] = {
            "name": t[0],
            "shortName": t[1],
            "description": t[2]
        }

    # studyModules
    study_modules = {}
    for mid, m_data in dm.MODULE_TITLES.items():
        title, desc = m_data[loc]
        study_modules[mid] = {
            "title": title,
            "description": desc,
            "translationStatus": "reviewed"
        }
    vi_path = os.path.join(CONTENT, "content_vi.json")
    with open(vi_path, encoding="utf-8") as vf:
        vi_mods = json.load(vf)["studyModules"]

    if loc in dm1.M1_TRANSLATIONS:
        import copy
        m1_copy = copy.deepcopy(dm1.M1_TRANSLATIONS[loc])
        vi_m1 = vi_mods["M1_BASICS"]
        for i, s in enumerate(m1_copy["lessonSections"]):
            s["sourceRefs"] = vi_m1["lessonSections"][i]["sourceRefs"]
        for i, c in enumerate(m1_copy["reviewCards"]):
            c["sourceRefs"] = vi_m1["reviewCards"][i]["sourceRefs"]
        for i, q in enumerate(m1_copy["quizSeeds"]):
            q["sourceRefs"] = vi_m1["quizSeeds"][i]["sourceRefs"]
        study_modules["M1_BASICS"] = m1_copy

    if loc in dm2.M2_TRANSLATIONS:
        import copy
        m2_copy = copy.deepcopy(dm2.M2_TRANSLATIONS[loc])
        vi_m2 = vi_mods["M2_SI_PHAN"]
        for i, s in enumerate(m2_copy["lessonSections"]):
            s["sourceRefs"] = vi_m2["lessonSections"][i]["sourceRefs"]
        for i, c in enumerate(m2_copy["reviewCards"]):
            c["sourceRefs"] = vi_m2["reviewCards"][i]["sourceRefs"]
        for i, q in enumerate(m2_copy["quizSeeds"]):
            q["sourceRefs"] = vi_m2["quizSeeds"][i]["sourceRefs"]
        study_modules["M2_SI_PHAN"] = m2_copy

    if loc in dm11.M11_TRANSLATIONS:
        import copy
        m11_copy = copy.deepcopy(dm11.M11_TRANSLATIONS[loc])
        vi_m11 = vi_mods["M11_BIET_CANH"]
        for i, s in enumerate(m11_copy["lessonSections"]):
            s["sourceRefs"] = vi_m11["lessonSections"][i]["sourceRefs"]
        for i, c in enumerate(m11_copy["reviewCards"]):
            c["sourceRefs"] = vi_m11["reviewCards"][i]["sourceRefs"]
        for i, q in enumerate(m11_copy["quizSeeds"]):
            q["sourceRefs"] = vi_m11["quizSeeds"][i]["sourceRefs"]
        study_modules["M11_BIET_CANH"] = m11_copy

    out = {
        "locale": loc,
        "schemaVersion": 2,
        "fallbackLocale": "en",
        "lessonTranslationStatus": "reviewed",
        "lessonTranslationNote": "Canonically reviewed Buddhist doctrinal terms and titles in priority language.",
        "cittas": cittas,
        "cetasikas": cetasikas,
        "rupas": rupas,
        "paccayas": paccayas,
        "paticcas": paticcas,
        "kammas": kammas,
        "vithis": vithis,
        "studyModules": study_modules
    }
    return out

def generate_all_content_files():
    for loc in LOCALES:
        data = build_catalog_for_locale(loc)
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
