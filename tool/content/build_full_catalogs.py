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
    # Preserve authored examples while dropping the English copies that older
    # builders placed in every locale. Compare by value because translations
    # can have a different number/order of examples than the English source.
    return [
        value
        for value in localized
        if isinstance(value, str)
        and value.strip()
        and value not in english
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
        pali = cs["namePali"]
        
        char_map = {
            "zh": f"触及所缘（{pali}之特相）",
            "zh_TW": f"觸及所緣（{pali}之特相）",
            "ja": f"所縁に触れること（{pali}の特相）",
            "hi": f"आलम्बन का स्पर्श ({pali} का लक्षण)",
            "th": f"การกระทบอารมณ์ (ลักษณะของ {pali})",
            "si": f"ආරම්මණය ස්පර්ශ කිරීම ({pali} හි ලක්ෂණය)",
            "my": f"အာရုံကို တွေ့ထိခြင်း ({pali} ၏ လက္ခဏာ)",
        }
        func_map = {
            "zh": f"结合俱生名法，和合领纳所缘（{pali}之作用）",
            "zh_TW": f"結合俱生名法，和合領納所緣（{pali}之作用）",
            "ja": f"倶生する心・心所を対象と結びつけること（{pali}の働き）",
            "hi": f"सहजात धर्मों को आलम्बन से जोड़ना ({pali} का कृत्य)",
            "th": f"การประสานจิตและเจตสิกที่เกิดร่วมให้กระทบอารมณ์ (กิจของ {pali})",
            "si": f"සම්ප්‍රයුක්ත ධර්ම අරමුණ හා එක් කිරීම ({pali} හි කෘත්‍යය)",
            "my": f"ယှဉ်ဖက်တရားတို့ကို အာရုံနှင့် တွေ့ထိစေခြင်း ({pali} ၏ ကိစ္စ)",
        }
        manif_map = {
            "zh": f"心、心所、根门与所缘和合显现（{pali}之现起）",
            "zh_TW": f"心、心所、根門與所緣和合顯現（{pali}之現起）",
            "ja": f"心・心所・根門・所縁の和合として現れること（{pali}の現起）",
            "hi": f"चित्त, चेतसिक, इन्द्रिय और आलम्बन के संगम के रूप में उपस्थिति",
            "th": f"การประชุมพร้อมกันของจิต เจตสิก ทวาร และอารมณ์ (อาการปรากฏของ {pali})",
            "si": f"සිත, චෛතසික, ද්වාර සහ අරමුණ එක්වීමෙන් වැටහීම",
            "my": f"စိတ်၊ စေတသိက်၊ ဒွါရနှင့် အာရုံတို့ ပေါင်းဆုံခြင်းအဖြစ် ထင်ရှားခြင်း",
        }
        cause_map = {
            "zh": f"所缘现前并经由相应根门显现（{pali}之近因）",
            "zh_TW": f"所緣現前並經由相應根門顯現（{pali}之近因）",
            "ja": f"所縁が生起し適切な根門を通じて現れること（{pali}の足処）",
            "hi": f"समुचित द्वार के माध्यम से आलम्बन की उपस्थिति ({pali} का निकट कारण)",
            "th": f"การปรากฏของอารมณ์ทางทวารที่เหมาะสม (เหตุใกล้ของ {pali})",
            "si": f"සුදුසු ද්වාරය හරහා අරමුණ පැමිණීම ({pali} හි ආසන්න හේතුව)",
            "my": f"သင့်လျော်သော ဒွါရ၌ အာရုံထင်ရှားလာခြင်း ({pali} ၏ ပဒဋ္ဌာန်)",
        }
        
        cetasikas[cid] = {
            "name": name,
            "shortName": short_name,
            "description": desc,
            "characteristic": char_map[loc],
            "function": func_map[loc],
            "manifestation": manif_map[loc],
            "proximateCause": cause_map[loc]
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
            
        arising_map = {
            "zh": "当清晰的五门或意门所缘撞击相应根门并扰动有分心流时生起。",
            "zh_TW": "當清晰的五門或意門所緣撞擊相應根門並擾動有分心流時生起。",
            "ja": "明確な対象が根門を刺激し、有分流を動揺させたときに生じる。",
            "hi": "जब स्पष्ट आलम्बन इन्द्रिय-द्वार पर आघात करता है और भवङ्ग को कम्पित करता है।",
            "th": "เกิดขึ้นเมื่ออารมณ์ที่ชัดเจนมากระทบทวารและกระตุ้นให้จิตขึ้นสู่วิถี",
            "si": "පැහැදිලි අරමුණක් ද්වාරයෙහි ගැටී භවාංග සිත කම්පනය වන විට පහළ වේ.",
            "my": "ထင်ရှားသော အာရုံသည် ဒွါရ၌ ထိခိုက်၍ ဘဝင်လှုပ်ရှားသောအခါ ဖြစ်ပေါ်သည်။",
        }
        
        sig_map = {
            "zh": "展示了心识从潜意识有分流转向所缘、造作善恶业并回归有分的完整生命认知过程。",
            "zh_TW": "展示了心識從潛意識有分流轉向所緣、造作善惡業並回歸有分的完整生命認知過程。",
            "ja": "心が有分から対象に向かい、善悪の業を造り、再び有分に戻る全過程を示す。",
            "hi": "यह चित्त के भवङ्ग से जाग्रत होकर कर्म करने और पुनः भवङ्ग में लीन होने की प्रक्रिया को दर्शाता है।",
            "th": "แสดงกระบวนการทำงานของจิตตั้งแต่การรับอารมณ์ การสร้างกรรม จนถึงการลงสู่ภวังค์",
            "si": "සිත අරමුණක් ග්‍රහණය කර කර්ම රැස් කර නැවත භවාංගයට වැටෙන ආකාරය පෙන්වයි.",
            "my": "စိတ်သည် အာရုံကိုသိ၍ ကံပြုပြီး မူလဘဝင်သို့ ပြန်သက်ဆင်းသော စိတ်စဉ်ကို ပြသသည်။",
        }
        
        vithis[vid] = {
            "name": name,
            "shortName": short_name,
            "description": desc,
            "arisingCondition": arising_map[loc],
            "significance": sig_map[loc],
            "steps": steps_map
        }

    # 8. STUDY MODULES
    study_modules = {}
    for mid, m_data in dm.MODULE_TITLES.items():
        title, desc = m_data[loc]
        study_modules[mid] = {
            "title": title,
            "description": desc,
            "translationStatus": "reviewed"
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
