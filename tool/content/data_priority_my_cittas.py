# -*- coding: utf-8 -*-
"""Myanmar (`my`) examples for the 12 akusala cittas.

`CittaModel.localizedExamples` (`lib/core/localization/localized_content.dart`)
reads `cittas.<id>.examples`, so these are learner-facing. Only the 12 akusala
cittas carry `examples` in `assets/data/cittas.json`; the remaining 109 cittas
have none to translate.

Kept in a parallel `my`-only dict because `data_priority_cittas.py` stores a
two-element `(name, doctrinalNote)` tuple per locale and
`build_full_catalogs.py` currently sources citta examples by re-reading the
shipped catalog (see `existing_citta_examples`) rather than from a table.
"""

CITTA_EXAMPLES_MY = {
    "CI_001": [
        "သူတစ်ပါး၏ ပစ္စည်းကို ယူရာ၌ 'မဖြစ်ပါဘူး' ဟု ထင်ပြီး ပျော်ရွှင်ခြင်း။",
        "ဥစ္စာသည် အမြဲတည်သည်ဟူသော မိစ္ဆာဒိဋ္ဌိနှင့်အတူ တပ်မက်ခြင်း။",
    ],
    "CI_002": [
        "သူတစ်ပါး တိုက်တွန်းမှသာ သူတစ်ပါး၏ ပစ္စည်းကို ယူခြင်း။",
        "ဆွဲဆောင်ခံရပြီး ဆင်ခြင်စဉ်းစားပြီးမှ ဆုံးဖြတ်သော လောဘ။",
    ],
    "CI_003": [
        "အရာတစ်ခုကို ရရှိ၍ ဂုဏ်ယူဝမ်းမြောက်ခြင်း။",
        "မာန်မာနကြီး၍ သူတစ်ပါးနှင့် ချိန်ထိုးလိုချင်ခြင်း။",
    ],
    "CI_004": [
        "သူတစ်ပါး နှိုးဆော်မှသာ ဖြစ်ပေါ်လာသော မာန်မာနရောနှောသည့် လောဘ။"
    ],
    "CI_005": [
        "မိစ္ဆာဒိဋ္ဌိကြောင့် ဖြစ်ပေါ်သော ဥပေက္ခာဆန်သည့် ပေါ့ပေါ့တန်တန် လောဘ။"
    ],
    "CI_006": [
        "နှိုးဆော်ခံရပြီး မိစ္ဆာဒိဋ္ဌိနှင့်အတူ ဖြစ်ပေါ်သော ဥပေက္ခာဆန်သည့် ကာမတပ်မက်မှု။"
    ],
    "CI_007": [
        "အရာတစ်ခုကို ရရှိ၍ ဥပေက္ခာဆန်စွာ ကျေနပ်နေခြင်း။"
    ],
    "CI_008": [
        "မိစ္ဆာဒိဋ္ဌိ မပါဘဲ တိုက်တွန်းခံရပြီးမှ ဖြစ်ပေါ်သော ဥပေက္ခာဆန်သည့် လောဘ။"
    ],
    "CI_009": [
        "ထိပါးခံရသောအခါ အမျက်ထွက်ခြင်း။",
        "ဘယ်သူကမျှ မနှိုးဆော်ဘဲ သူတစ်ပါးကို အလိုလို မနှစ်သက်ခြင်း။",
    ],
    "CI_010": [
        "သူတစ်ပါးက လှုံ့ဆော်၍ သို့မဟုတ် ရန်ငြိုးဟောင်းကို ပြန်သတိရ၍ ဖြစ်ပေါ်သော အမျက်။"
    ],
    "CI_011": [
        "ဗုဒ္ဓံ၊ ဓမ္မံ၊ သံဃံ၌ သံသယ ဖြစ်ခြင်း။",
        "ကုသိုလ်၊ အကုသိုလ် ဘာဖြစ်သည်ကို ဝေခွဲမရ ဖြစ်ခြင်း။",
    ],
    "CI_012": [
        "ရည်ရွယ်ချက်မရှိ လွင့်ပါးနေသော ပျံ့လွင့်သည့် စိတ်။",
        "မစုစည်းဘဲ ပြန့်ကျဲနေသော အတွေးအခေါ်။",
    ],
}
