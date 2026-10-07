# -*- coding: utf-8 -*-
"""Full Catalog Builder for Priority Languages:
zh (Simplified Chinese), zh_TW (Traditional Chinese), hi (Hindi),
th (Thai), si (Sinhala), my (Myanmar), ja (Japanese).
"""

import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
CONTENT = os.path.join(ROOT, "assets", "content")
DATA = os.path.join(ROOT, "assets", "data")

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

LOCALES = ["hi", "ja", "my", "si", "th", "zh", "zh_TW"]

# Reference datasets
en_content = json.load(open(os.path.join(CONTENT, "content_en.json"), encoding="utf-8"))
vi_content = json.load(open(os.path.join(CONTENT, "content_vi.json"), encoding="utf-8"))

paccayas_raw = json.load(open(os.path.join(DATA, "paccayas.json"), encoding="utf-8"))["paccayas"]
vithis_raw = json.load(open(os.path.join(DATA, "vithis.json"), encoding="utf-8"))["vithis"]
cetasikas_raw = json.load(open(os.path.join(DATA, "cetasikas.json"), encoding="utf-8"))["cetasikas"]
paticcas_raw = json.load(open(os.path.join(DATA, "paticca.json"), encoding="utf-8"))["paticcas"]
cittas_raw = json.load(open(os.path.join(DATA, "cittas.json"), encoding="utf-8"))["cittas"]
rupas_raw = json.load(open(os.path.join(DATA, "rupas.json"), encoding="utf-8"))["rupas"]
kammas_raw = json.load(open(os.path.join(DATA, "kammas.json"), encoding="utf-8"))["kammas"]

# The vithi-step translation source file referenced by an older version of this
# builder is no longer in the repository. Preserve translations already authored
# in the locale catalogs, but treat exact English copies as missing. This makes
# regeneration reproducible while preventing old fallback values being written
# back out.
_existing_locale_content = {}
for _locale in LOCALES:
    _path = os.path.join(CONTENT, f"content_{_locale}.json")
    try:
        with open(_path, encoding="utf-8") as _handle:
            _existing_locale_content[_locale] = json.load(_handle)
    except (OSError, json.JSONDecodeError):
        _existing_locale_content[_locale] = {}


def existing_vithi_step_translation(locale, vithi_id, step_number):
    localized = (
        _existing_locale_content.get(locale, {})
        .get("vithis", {})
        .get(vithi_id, {})
        .get("steps", {})
        .get(str(step_number), {})
    )
    english = (
        en_content.get("vithis", {})
        .get(vithi_id, {})
        .get("steps", {})
        .get(str(step_number), {})
    )
    if not isinstance(localized, dict):
        return None
    translated = {
        field: value
        for field, value in localized.items()
        if field in {"name", "description", "doctrinalNote"}
        and isinstance(value, str)
        and value.strip()
        and value != english.get(field)
    }
    return translated or None


def existing_citta_examples(locale, citta_id):
    localized = (
        _existing_locale_content.get(locale, {})
        .get("cittas", {})
        .get(citta_id, {})
        .get("examples", [])
    )
    english = (
        en_content.get("cittas", {}).get(citta_id, {}).get("examples", [])
    )
    if not isinstance(localized, list):
        return []
    # Preserve locale-authored examples while dropping English copies and the
    # generic Chinese placeholder emitted by a legacy builder. The placeholder
    # merely restated the Pāḷi name and was not a citta-specific example.
    return [
        value
        for value in localized
        if isinstance(value, str)
        and value.strip()
        and value not in english
        and not value.startswith("生起于相应境遇中（")
        and not value.startswith("生起于相应境遇中(")
    ]


def build_catalog(loc):
    # 1. CITTAS
    # Only write text authored for this locale. The old builder copied English
    # examples into every language file (and used Vietnamese as a final source
    # fallback), which made partial translations look complete while leaking
    # prose into the learner-facing study tab.
    cittas = {}
    for c in cittas_raw:
        cid = c["id"]
        translated = dcit.CITTAS.get(cid, {}).get(loc)
        entry = {}
        if translated:
            name, doc = translated
            if name:
                entry["name"] = name
            if doc:
                entry["doctrinalNote"] = doc
        examples = existing_citta_examples(loc, cid)
        if examples:
            entry["examples"] = examples
        cittas[cid] = entry

    # 2. CETASIKAS
    cetasikas = {}
    for cs in cetasikas_raw:
        cid = cs["id"]
        base = dcet.CETASIKAS.get(cid, {}).get(loc)
        if not base:
            cetasikas[cid] = {}
            continue
        name, short_name, desc = base
        # Four-aspect prose is intentionally omitted until translated and
        # doctrinally reviewed. The locale chain supplies its English value.
        cetasikas[cid] = {
            "name": name,
            "shortName": short_name,
            "description": desc,
        }

    # 3. RUPAS
    rupas = {}
    for r in rupas_raw:
        rid = r["id"]
        base = drup.RUPAS.get(rid, {}).get(loc)
        if not base:
            rupas[rid] = {}
            continue
        name, short_name, desc = base
        # Only these three fields are translated. Do not manufacture English/Pāḷi
        # labels for the four-aspect fields and present them as localized prose.
        rupas[rid] = {
            "name": name,
            "shortName": short_name,
            "description": desc,
        }

    # 4. PACCAYAS
    # Names and definitions are localized. The remaining prose/subdivision
    # fields have not been translated yet, so omit them instead of copying the
    # English reference strings into each priority catalog.
    paccayas = {}
    for p in paccayas_raw:
        pid = p["id"]
        base = dcond.PACCAYAS.get(pid, {}).get(loc)
        if not base:
            paccayas[pid] = {}
            continue
        name, short_name, definition = base
        paccayas[pid] = {
            "name": name,
            "shortName": short_name,
            "definition": definition,
        }

    # 5. PATICCAS
    # The Tứ Nghĩa labels, notes and examples below used to be English
    # templates embedded in every locale. Until those fields are translated,
    # publish only the localized name/description.
    paticcas = {}
    for pd in paticcas_raw:
        pid = pd["id"]
        base = dcond.PATICCAS.get(pid, {}).get(loc)
        if not base:
            paticcas[pid] = {}
            continue
        name, short_name, desc = base
        paticcas[pid] = {
            "name": name,
            "shortName": short_name,
            "description": desc,
        }

    # 6. KAMMAS
    kammas = {}
    for k in kammas_raw:
        kid = k["id"]
        base = dcond.KAMMAS.get(kid, {}).get(loc)
        if not base:
            kammas[kid] = {}
            continue
        name, short_name, desc = base
        kammas[kid] = {
            "name": name,
            "shortName": short_name,
            "description": desc,
        }

    # 7. VITHIS
    vithis = {}
    for v in vithis_raw:
        vid = v["id"]
        base = dcond.VITHIS.get(vid, {}).get(loc)
        if not base:
            vithis[vid] = {}
            continue
        name, short_name, desc = base

        steps_map = {}
        for step in v.get("steps", []):
            snum = str(step["stepNumber"])
            # Missing step translations stay missing: do not copy the English
            # reference or Vietnamese source into the selected locale.
            step_entry = existing_vithi_step_translation(loc, vid, snum)
            if step_entry:
                steps_map[snum] = step_entry
            
        # Process context has not yet been translated per vithi. Keep it out
        # of the locale asset so the safe chain can provide the English text.
        vithis[vid] = {
            "name": name,
            "shortName": short_name,
            "description": desc,
            "steps": steps_map,
        }

    # 8. STUDY MODULES
    study_modules = {}
    for mid, m_data in dm.MODULE_TITLES.items():
        title, desc = m_data[loc]
        study_modules[mid] = {
            "title": title,
            "description": desc,
            "translationStatus": "draft",
            "needsReview": True,
        }
    vi_mods = vi_content["studyModules"]

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
        "lessonTranslationStatus": "partial",
        "lessonTranslationNote": (
            "Only authored priority-language fields are included. Missing "
            "translations are intentionally omitted rather than copied from "
            "English or Vietnamese."
        ),
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

def build_all():
    for loc in LOCALES:
        data = build_catalog(loc)
        target = os.path.join(CONTENT, f"content_{loc}.json")
        with open(target, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
            f.write("\n")
        print(f"Wrote {target} (cittas: {len(data['cittas'])}, cetasikas: {len(data['cetasikas'])}, paccayas: {len(data['paccayas'])}, vithis: {len(data['vithis'])})")

if __name__ == "__main__":
    build_all()
