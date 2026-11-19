# -*- coding: utf-8 -*-
"""Sinhala (si) draft translations of vithi steps for the three vithis that
have no si steps yet (VT_NGU_MON_RATLON already has si steps in content_si.json).

Step names follow the committed VT_NGU_MON_RATLON wording (for example,
භවාංග චලනය, පංචද්වාරාවජ්ජනය, සම්පටිච්ඡනය, සන්තීරණය, වොට්ඨපනය, ජවන).
Pāḷi keys ("1".."9") are unchanged.

VT_Y_MON step 3 doctrinalNote (CI_029, 11 cetasikas) checked against Chandrikava 5-9
and the Abhidhamma tradition (Aggañāṇī booklet, Nārada *Manual of Abhidhamma*) and translated.
Not translated (English kept, see docs §8): the doctrinalNote on VT_Y_MON step 4,
and on VT_VITHIMUTTA step 1. They make kamma-location and citta-group claims that
are not verified against a source.

Status: DRAFT. Not reviewed. Not read by build_full_catalogs.py.
Source of meaning: English steps in content_en.json.
"""

SI_VITHI_STEPS = {
    "VT_NGU_MON_LON": {
        "1": {
            "name": "භවාංග චලනය",
            "description": "අරමුණ ඉන්ද්‍රිය-ආයතනයට ගැටෙන විට භවංග සිත කම්පනය වේ.",
        },
        "2": {
            "name": "භවංගුපච්ඡේදය",
            "description": "භවංග ප්‍රවාහය සිඳී යයි — ක්‍රියාවලිය ආරම්භ වේ.",
        },
        "3": {
            "name": "පංචද්වාරාවජ්ජනය",
            "description": "පස් දොරින් අරමුණ වෙත සිත යොමු කරයි.",
        },
        "4": {
            "name": "ද්විපංචවිඥානය",
            "description": "අනුරූප ඉන්ද්‍රිය මගින් අරමුණ දනී.",
        },
        "5": {
            "name": "සම්පටිච්ඡනය",
            "description": "අරමුණ භාරගනී.",
        },
        "6": {
            "name": "සන්තීරණය",
            "description": "අරමුණ විමසයි.",
        },
        "7": {
            "name": "වොට්ඨපනය",
            "description": "අරමුණ තීරණය කරයි; ජවනයන්ට මග විවර කරයි.",
        },
        "8": {
            "name": "ජවන (Javana)",
            "description": "ජවන් ක්ෂණ හතක් කර්ම උපදවයි. ඉන් පසු තදාරම්මණ නොමැත.",
            "doctrinalNote": "ජවන් හතකින් පසු සිත කෙලින්ම භවාංග ප්‍රවාහයට වැටේ.",
        },
        "9": {
            "name": "පසු භවාංගය",
            "description": "ක්‍රියාවලිය අවසන් වූ පසු භවාංග ප්‍රවාහය නැවත ආරම්භ වේ.",
        },
    },
    "VT_Y_MON": {
        "1": {
            "name": "භවාංග චලනය",
            "description": "මනෝ අරමුණ ගැටෙන විට භවාංග ප්‍රවාහය කම්පනය වේ.",
        },
        "2": {
            "name": "භවංගුපච්ඡේදය",
            "description": "භවාංග ප්‍රවාහය නිරුද්ධ වේ — මනෝද්වාර ක්‍රියාවලිය ආරම්භ වේ.",
        },
        "3": {
            "name": "මනෝද්වාරාවජ්ජනය",
            "description": "මනෝද්වාරය විවර කර, සිත මනෝ අරමුණ වෙත යොමු කරයි; ඒ සමඟම එය තීරණය කරයි (මෙම ක්‍රියාවලියේ තීරණය ලෙස ක්‍රියා කරයි).",
            "doctrinalNote": "CI_029 මනෝද්වාරාවජ්ජනය ලෙසත්, තීරණය (voṭṭhapana) ලෙසත් ක්‍රියා කරයි. චෛතසික 11ක් සමඟ.",
        },
        "4": {
            "name": "ජවන (Javana)",
            "description": "ජවන් ක්ෂණ හතක් — මනෝ කර්ම උපදවයි. සියලු අභිසංස්කාරික චින්තනය, වචනය හා ක්‍රියාව මෙහි උපදී.",
        },
        "5": {
            "name": "තදාරම්මණය (විකල්ප)",
            "description": "මනෝද්වාර ක්‍රියාවලියේ තදාරම්මණය — මනෝ අරමුණේ ශක්තිය මත රඳා පවතී.",
        },
        "6": {
            "name": "පසු භවාංගය",
            "description": "ක්‍රියාවලිය අවසන් වූ පසු භවාංග ප්‍රවාහය නැවත පවතී.",
        },
    },
    "VT_VITHIMUTTA": {
        "1": {
            "name": "ප්‍රතිසන්ධි විඥානය",
            "description": "නව ජීවිතයේ පළමු විඥානය — පෙර ජීවිතයේ චුති සිතින් සෘජුව ඉදිරියට ගෙන, කර්මයේ බීජය රැගෙන යයි.",
        },
        "2": {
            "name": "භවංග සිත",
            "description": "ක්‍රියාවලි අතර ජීවිතය පවත්වන චිත්ත-ප්‍රවාහය. එය අසංඛ්‍යාත වාර උපදී නිරුද්ධ වේ; සියලු මානසික ක්‍රියාකාරිත්වයේ පදනම වේ.",
            "doctrinalNote": "භවංග = ප්‍රවාහයේ ජීවිතය පවත්වන කොටස. ගැඹුරු නින්දේදී සහ ක්‍රියාවලි අතර ධාවනය වේ.",
        },
        "3": {
            "name": "චුති සිත",
            "description": "අවසාන චිත්ත-ක්ෂණය — ජීවිතින්ද්‍රිය රූපය නැති වේ, චුති සිත වැටේ, ජීවිතය අවසන් වේ. වහාම පසු, ඊළඟ ජීවිතයේ ප්‍රතිසන්ධි විඥානය උපදී.",
            "doctrinalNote": "චුති = ඉදිරියට යාම, පිටවීම. චුති සිතේ අරමුණ මරණාසන්න (āsanna) අරමුණයි.",
        },
    },
}
