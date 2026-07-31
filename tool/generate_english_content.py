#!/usr/bin/env python3
"""Build the reviewed English study overlay without touching doctrinal IDs.

The structural JSON under assets/data remains the single source of truth for
relationships and validation. This overlay contains display text only.
"""
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "assets" / "data"
OUT = ROOT / "assets" / "content" / "content_en.json"

CETASIKA_NAMES = {
    "CS_PHASSA": "Contact", "CS_VEDANA": "Feeling", "CS_SANNA": "Perception",
    "CS_CETANA": "Volition", "CS_EKAGGATA": "One-pointedness",
    "CS_JIVITINDRIYA": "Mental life faculty", "CS_MANASIKARA": "Attention",
    "CS_VITAKKA": "Initial application", "CS_VICARA": "Sustained application",
    "CS_ADHIMOKKHA": "Decision", "CS_VIRIYA": "Energy", "CS_PITI": "Rapture",
    "CS_CHANDA": "Desire-to-act", "CS_MOHA": "Delusion",
    "CS_AHIRIKA": "Shamelessness", "CS_ANOTTAPPA": "Fearlessness of wrongdoing",
    "CS_UDDHACCA": "Restlessness", "CS_LOBHA": "Greed", "CS_DITTHI": "Wrong view",
    "CS_MANA": "Conceit", "CS_DOSA": "Hatred", "CS_ISSA": "Envy",
    "CS_MACCHARIYA": "Avarice", "CS_KUKKUCCA": "Worry", "CS_THINA": "Sloth",
    "CS_MIDDHA": "Torpor", "CS_VICIKICCHA": "Doubt", "CS_SADDHA": "Faith",
    "CS_SATI": "Mindfulness", "CS_HIRI": "Moral shame",
    "CS_OTTAPPA": "Moral dread", "CS_ALOBHA": "Non-greed",
    "CS_ADOSA": "Non-hatred", "CS_TATRAMAJJHATTATA": "Equanimity",
    "CS_KAYAPASSADDHI": "Tranquillity of mental factors",
    "CS_CITTAPASSADDHI": "Tranquillity of consciousness",
    "CS_KAYALAHUTA": "Lightness of mental factors",
    "CS_CITTALAHUTA": "Lightness of consciousness",
    "CS_KAYAMUDUTA": "Malleability of mental factors",
    "CS_CITTAMUDUTA": "Malleability of consciousness",
    "CS_KAYAKAMMANNATA": "Wieldiness of mental factors",
    "CS_CITTAKAMMANNATA": "Wieldiness of consciousness",
    "CS_KAYAPAGUNNATA": "Proficiency of mental factors",
    "CS_CITTAPAGUNNATA": "Proficiency of consciousness",
    "CS_KAYUJUKATA": "Rectitude of mental factors",
    "CS_CITTUJUKATA": "Rectitude of consciousness",
    "CS_SAMMAVACA": "Right speech", "CS_SAMMAKAMMANTA": "Right action",
    "CS_SAMMAAJIVA": "Right livelihood", "CS_KARUNA": "Compassion",
    "CS_MUDITA": "Appreciative joy", "CS_PANNA": "Wisdom faculty",
}

RUPA_NAMES = [
    "Earth element", "Water element", "Fire element", "Air element",
    "Eye sensitivity", "Ear sensitivity", "Nose sensitivity", "Tongue sensitivity",
    "Body sensitivity", "Visible form", "Sound", "Odour", "Taste",
    "Femininity faculty", "Masculinity faculty", "Heart-base", "Material life faculty",
    "Nutritive essence", "Space element", "Bodily intimation", "Verbal intimation",
    "Lightness of matter", "Malleability of matter", "Wieldiness of matter",
    "Production of matter", "Continuity of matter", "Ageing of matter",
    "Impermanence of matter",
]

KAMMA_NAMES = {
    "KM_T_01": "Immediately effective kamma", "KM_T_02": "Subsequently effective kamma",
    "KM_T_03": "Indefinitely effective kamma", "KM_T_04": "Defunct kamma",
    "KM_P_01": "Reproductive kamma", "KM_P_02": "Supportive kamma",
    "KM_P_03": "Obstructive kamma", "KM_P_04": "Destructive kamma",
    "KM_U_01": "Weighty kamma", "KM_U_02": "Death-proximate kamma",
    "KM_U_03": "Habitual kamma", "KM_U_04": "Cumulative kamma",
}
KAMMA_DESCRIPTIONS = {
    "KM_T_01": "Kamma that produces its result in the same life; if it cannot mature, it becomes defunct.",
    "KM_T_02": "Kamma that produces its result in the immediately following life.",
    "KM_T_03": "Kamma capable of producing results from the third life onward until final liberation.",
    "KM_T_04": "Kamma whose opportunity to produce a result has passed.",
    "KM_P_01": "Kamma that generates rebirth and the resultant aggregates of a new life.",
    "KM_P_02": "Kamma that supports and sustains the result of another kamma.",
    "KM_P_03": "Kamma that obstructs or weakens the result of another kamma.",
    "KM_P_04": "Kamma that cuts off the result of another kamma and replaces it with its own result.",
    "KM_U_01": "A very powerful wholesome or unwholesome kamma that takes priority in producing rebirth.",
    "KM_U_02": "Kamma remembered or performed close to death, influencing the next rebirth.",
    "KM_U_03": "Kamma repeatedly performed until it becomes a strong habit.",
    "KM_U_04": "Accumulated kamma that produces a result when no stronger kamma takes priority.",
}

PATICCA_NAMES = {
    "PD_01": "Ignorance", "PD_02": "Volitional formations", "PD_03": "Consciousness",
    "PD_04": "Mind and matter", "PD_05": "Six sense bases", "PD_06": "Contact",
    "PD_07": "Feeling", "PD_08": "Craving", "PD_09": "Clinging",
    "PD_10": "Becoming", "PD_11": "Birth", "PD_12": "Ageing and death",
}
PATICCA_DESCRIPTIONS = {
    "PD_01": "Not knowing the Four Noble Truths and the true nature of conditioned phenomena.",
    "PD_02": "Kammically active volitions conditioned by ignorance.",
    "PD_03": "Rebirth-linking and resultant consciousness conditioned by formations.",
    "PD_04": "Mental and material phenomena that arise supported by consciousness.",
    "PD_05": "The eye, ear, nose, tongue, body, and mind bases.",
    "PD_06": "The meeting of a sense base, its object, and the corresponding consciousness.",
    "PD_07": "The pleasant, painful, or neutral experience born of contact.",
    "PD_08": "Craving for sense pleasure, existence, or non-existence.",
    "PD_09": "The intensified appropriation of objects, views, practices, or a doctrine of self.",
    "PD_10": "The active kammic process and the resultant process of existence.",
    "PD_11": "The arising of the aggregates in a new existence.",
    "PD_12": "The ageing, dissolution, sorrow, and suffering that follow birth.",
}

MODULES = {
    "M1_BASICS": ("Seven universal cetasikas", "The seven mental factors present in every citta; the foundation for all later modules."),
    "M2_SI_PHAN": ("The delusion group", "Delusion, shamelessness, fearlessness of wrongdoing, and restlessness accompany every unwholesome citta."),
    "M3_TINH_HAO_BIEN_HANH": ("Beautiful universals", "The nineteen beautiful universal cetasikas present in every beautiful citta."),
    "M4_AKUSALA": ("Twelve unwholesome cittas", "Eight rooted in greed, two rooted in hatred, and two rooted in delusion."),
    "M5_SOBHANA": ("Sense-sphere beautiful cittas", "Twenty-four great wholesome, resultant, and functional cittas."),
    "M6_NGHIEP": ("Kamma classifications", "How kamma is classified and connected with cittas."),
    "M7_SIEU_THE": ("Supramundane cittas", "Path and fruition cittas leading beyond suffering."),
    "M8_NHAN_DUYEN": ("Twelve links of dependent origination", "The conditioned cycle and the way its links can cease."),
    "M9_SAC_PHAP": ("Material phenomena", "The twenty-eight kinds of matter and their relationship to citta and kamma."),
    "M10_LO_TRINH": ("The cognitive series", "The arising and ceasing of cittas in a cognitive process."),
}

def read(name: str, key: str):
    return json.loads((DATA / name).read_text(encoding="utf-8"))[key]

def citta_name(item):
    vi = item["nameVietnamese"]
    replacements = [
        ("Tâm Đại Duy Tác", "Great functional consciousness"),
        ("Tâm Đại Thiện", "Great wholesome consciousness"),
        ("Tâm Đại Quả", "Great resultant consciousness"),
        ("Tâm Thiện Sắc Giới", "Form-sphere wholesome consciousness"),
        ("Tâm Quả Thiện Sắc Giới", "Form-sphere resultant consciousness"),
        ("Tâm Duy Tác Sắc Giới", "Form-sphere functional consciousness"),
        ("Tâm Thiện", "Wholesome consciousness"), ("Tâm Quả Thiện", "Resultant consciousness"),
        ("Tâm Duy Tác", "Functional consciousness"), ("Tâm Tham", "Greed-rooted consciousness"),
        ("Tâm Sân", "Hatred-rooted consciousness"), ("Tâm Si", "Delusion-rooted consciousness"),
        ("Nhãn Thức", "Eye-consciousness"), ("Nhĩ Thức", "Ear-consciousness"),
        ("Tỷ Thức", "Nose-consciousness"), ("Thiệt Thức", "Tongue-consciousness"),
        ("Thân Thức", "Body-consciousness"), ("Tiếp Thâu", "Receiving consciousness"),
        ("Quan Sát", "Investigating consciousness"), ("Khán Ngũ Môn", "Five-sense-door adverting consciousness"),
        ("Khán Ý Môn", "Mind-door adverting consciousness"),
        ("Ưng Cúng Vi Tiếu", "Smile-producing consciousness of an arahant"),
        ("Tâm Nhập Lưu", "Stream-entry"), ("Tâm Nhứt Lai", "Once-returning"),
        ("Tâm Bất Lai", "Non-returning"), ("Tâm A-la-hán", "Arahantship"),
        ("Đạo", "path consciousness"), ("Quả", "fruition consciousness"),
        ("Thọ Hỷ", "with joy"), ("Thọ Xả", "with equanimity"),
        ("Thọ Ưu", "with displeasure"), ("Thọ Khổ", "with pain"), ("Thọ Lạc", "with pleasure"),
        ("Hợp Tà", "associated with wrong view"), ("Ly Tà", "dissociated from wrong view"),
        ("Hợp Trí", "associated with knowledge"), ("Ly Trí", "dissociated from knowledge"),
        ("Hợp Phẫn", "associated with aversion"), ("Hợp Hoài Nghi", "associated with doubt"),
        ("Hợp Phóng Dật", "associated with restlessness"),
        ("Vô Trợ", "unprompted"), ("Hữu Trợ", "prompted"),
        ("Quả Bất Thiện", "unwholesome resultant"), ("Vô Nhân", "rootless"),
        ("Không Vô Biên Xứ", "base of infinite space"),
        ("Thức Vô Biên Xứ", "base of infinite consciousness"),
        ("Vô Sở Hữu Xứ", "base of nothingness"),
        ("Phi Tưởng Phi Phi Tưởng Xứ", "base of neither-perception-nor-non-perception"),
        ("Sơ Thiền", "first jhāna"), ("Nhị Thiền", "second jhāna"),
        ("Tam Thiền", "third jhāna"), ("Tứ Thiền", "fourth jhāna"), ("Ngũ Thiền", "fifth jhāna"),
        ("Sắc Giới", "form sphere"),
    ]
    result = vi
    for source, target in replacements:
        result = result.replace(source, target)
    if any("À" <= ch <= "ỹ" or ch in "Đđ" for ch in result):
        # Pāḷi is preferable to leaking Vietnamese into international content.
        return item["namePali"]
    return " ".join(result.split()).replace(" consciousness consciousness", " consciousness")

def main():
    out = {"locale": "en", "schemaVersion": 1, "cittas": {}, "cetasikas": {},
           "rupas": {}, "kammas": {}, "paticcas": {}, "vithis": {}, "studyModules": {}}

    sphere = {"akusala": "the unwholesome group", "ahetuka": "the rootless group",
              "sobhana_kamavacara": "the sense-sphere beautiful group", "rupavacara": "the form sphere",
              "arupavacara": "the formless sphere", "lokuttara": "the supramundane group"}
    feeling = {"pleasant": "pleasant bodily feeling", "unpleasant": "painful bodily feeling",
               "neutral": "equanimity", "joy": "joy"}
    for item in read("cittas.json", "cittas"):
        name = citta_name(item)
        out["cittas"][item["id"]] = {
            "name": name,
            "doctrinalNote": f"{name} is classified in {sphere[item['bhumiGroup']]} and is accompanied by {feeling[item['vedana']]}. Its canonical Pāḷi designation is {item['namePali']}.",
            "examples": [f"Study this citta through its defining factors and its associations with cetasikas."],
        }

    groups = {"sabbacittasadharana": "a universal mental factor", "pakinnaka": "an occasional mental factor",
              "akusala": "an unwholesome mental factor", "sobhana": "a beautiful mental factor"}
    for item in read("cetasikas.json", "cetasikas"):
        name = CETASIKA_NAMES[item["id"]]
        pali = item["namePali"]
        out["cetasikas"][item["id"]] = {
            "name": name, "shortName": name,
            "description": f"{name} ({pali}) is {groups[item['group']]} in the Abhidhamma analysis of mind.",
            "characteristic": f"The characteristic specific to {name.lower()}.",
            "function": f"Performs the mental function of {name.lower()} within the associated citta.",
            "manifestation": f"Manifests as {name.lower()} when the supporting conditions are present.",
            "proximateCause": "Its associated citta, mental factors, object, and supporting conditions.",
        }

    for item, name in zip(read("rupas.json", "rupas"), RUPA_NAMES):
        out["rupas"][item["id"]] = {
            "name": name, "shortName": name,
            "description": f"{name} ({item['namePali']}) is one of the twenty-eight kinds of material phenomena analysed in Abhidhamma.",
            "characteristic": f"The defining material characteristic of {name.lower()}.",
            "function": f"Performs the material function associated with {item['namePali']}.",
            "manifestation": f"Manifests according to the conditions that produce {name.lower()}.",
            "proximateCause": "The material phenomena and producing conditions associated with it.",
            "doctrinalNote": "Study this material phenomenon together with its causes, group, and sphere of occurrence.",
        }

    for item in read("kammas.json", "kammas"):
        name = KAMMA_NAMES[item["id"]]
        out["kammas"][item["id"]] = {"name": name, "shortName": name,
            "description": KAMMA_DESCRIPTIONS[item["id"]],
            "doctrinalNote": KAMMA_DESCRIPTIONS[item["id"]], "examples": []}

    for item in read("paticca.json", "paticcas"):
        name = PATICCA_NAMES[item["id"]]
        out["paticcas"][item["id"]] = {"name": name, "shortName": name,
            "description": PATICCA_DESCRIPTIONS[item["id"]],
            "characteristic": f"The characteristic of {name.lower()} in dependent origination.",
            "function": f"Its conditioning function within the twelve-linked process.",
            "manifestation": f"Manifests as {name.lower()} when its conditions are present.",
            "proximateCause": "The preceding and supporting conditions described in dependent origination.",
            "doctrinalNote": PATICCA_DESCRIPTIONS[item["id"]], "examples": []}

    for item in read("vithis.json", "vithis"):
        steps = {}
        for step in item.get("steps", []):
            step_key = str(step["stepNumber"])
            steps[step_key] = {"name": step["namePali"],
                "description": f"The {step['namePali']} stage in this cognitive process."}
        out["vithis"][item["id"]] = {"name": item["namePali"], "shortName": item["namePali"],
            "description": f"A cognitive series classified as {item['namePali']}.", "steps": steps}

    for module_id, (title, description) in MODULES.items():
        out["studyModules"][module_id] = {"title": title, "description": description}

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(out, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")

if __name__ == "__main__":
    main()
