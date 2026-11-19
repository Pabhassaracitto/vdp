# -*- coding: utf-8 -*-
"""
Japanese translation proposal for M13_SAC_GIOI (15 Rūpāvacara Cittas).

Module: 15 Tâm Sắc Giới (Rūpāvacara Citta)
Sections: 3
Review Cards: 10
Quiz Seeds: 10

Sources:
- Glossary ja column (l10n_work/glossary.csv)
- Vietnamese source: assets/content/content_vi.json
- Theravāda Abhidhamma convention

Confidence: draft (unverified - awaiting Mizuno vol.65 source verification)
"""

M13_TRANSLATION = {
    "title": "十五色界心",
    "description": "色界の善心・果心・唯作心、五禅那を通じて — 色界に流転する心。",
    
    "lessonSections": [
        {
            "id": "M13_S01",
            "title": "到大心と色界心の位置",
            "summary": "マハッガタ：広大なる安穏に至る心 — 27心（色界15＋無色界12）。",
            "body": [
                "到大心（Mahaggata citta）は二十七種類あります。これらは広大なる安穏に至る心であり、色界心十五と無色界心十二から成ります。",
                "色界心（Rūpāvacara citta）は十五種類あります。これらは色界に流転する心であり、禅那（Jhāna）によって生じます。",
                "禅那は心の集中状態であり、五禅那（初禅・二禅・三禅・四禅・五禅）に分けられます。各禅那には特定の禅支（Jhānaṅga）が伴います。",
                "色界心は三善根（無貪・無瞋・無痴）を具足し、禅定によって生じます。これらは欲界の煩悩から離れ、静寂と安穏をもたらします。",
                "色界心は十五種類に分けられます：善心五、果心五、唯作心五です。",
                "善心は禅那を修習するときに生じます。果心は過去の禅那善業の異熟として生じます。唯作心は阿羅漢が禅那に入る際に生じます。"
            ],
            "keyTerms": [
                {
                    "id": "TERM_MAHAGGATA",
                    "term": "到大心",
                    "pali": "Mahaggata",
                    "meaning": "広大なる安穏に至る心。27種類（色界15＋無色界12）。"
                },
                {
                    "id": "TERM_RUPAVACARA",
                    "term": "色界心",
                    "pali": "Rūpāvacara",
                    "meaning": "色界に流転する心。15種類。禅那によって生じる。"
                }
            ]
        },
        {
            "id": "M13_S02",
            "title": "三群×五禅那",
            "summary": "善5＋果5＋唯作5＝15心、禅支の違いによる。",
            "body": [
                "十五色界心は三群に分けられます：善心五、果心五、唯作心五です。各群は五禅那に基づきます。",
                "第一禅那（初禅）は五禅支を具足します：尋（Vitakka）、伺（Vicāra）、喜（Pīti）、楽（Sukha）、一境性（Ekaggatā）です。",
                "第二禅那は三禅支を具足します：伺（Vicāra）、喜（Pīti）、楽（Sukha）、一境性（Ekaggatā）です。尋（Vitakka）は除かれます。",
                "第三禅那は二禅支を具足します：喜（Pīti）、楽（Sukha）、一境性（Ekaggatā）です。伺（Vicāra）は除かれます。",
                "第四禅那は二禅支を具足します：楽（Sukha）、一境性（Ekaggatā）です。喜（Pīti）は除かれます。",
                "第五禅那は二禅支を具足します：捨（Upekkhā）、一境性（Ekaggatā）です。楽（Sukha）は除かれ、捨に置き換えられます。",
                "禅支は禅那の構成要素です。禅支が除かれるにつれて、心はより微細になり、より静かになります。",
                "一境性（Ekaggatā）はすべての禅那に存在する禅支です。これは心が一つの対象に集中することを意味します。"
            ],
            "keyTerms": [
                {
                    "id": "TERM_JHANA_M13",
                    "term": "禅那",
                    "pali": "Jhāna",
                    "meaning": "心の集中状態。五禅那（初禅・二禅・三禅・四禅・五禅）。"
                },
                {
                    "id": "TERM_EKAGGATA_M13",
                    "term": "一境性",
                    "pali": "Ekaggatā",
                    "meaning": "心が一つの対象に集中すること。すべての禅那に存在する禅支。"
                }
            ]
        },
        {
            "id": "M13_S03",
            "title": "禅那修習の利益",
            "summary": "現在楽住、観禅の基礎、勝智神通、梵天に生ずる、滅受想定に入る。",
            "body": [
                "禅那の修習には多くの利益があります。これらの利益は現在と未来の両方に及きます。",
                "第一の利益は現在楽住（Diṭṭhadhammasukhavihāra）です。禅那に入る者は、現在において静寂と安穏を体験します。これは禅那の直接の利益です。",
                "第二の利益は観禅（Vipassanā）の基礎です。禅那は心の集中をもたらし、観禅のための基盤となります。禅那によって心が静まると、諸法の真実性（無常・苦・無我）を観察しやすくなります。",
                "第三の利益は勝智（Abhiññā）と神通（Iddhi）です。禅那を極めた者は、超自然的な能力を得ることができます。勝智には六種があります：神変智・天耳智・他心智・宿住智・天眼智・漏尽智です。",
                "第四の利益は梵天に生ずることです。禅那善業の異熟として、色界の梵天界に生まれます。梵天界は十六の梵天界に分けられます。",
                "第五の利益は滅受想定（Nirodha-samāpatti）に入ることです。滅受想定は阿羅漢と三果の聖者のみが入ることのできる定です。この定においては、すべての心と心所が一時的に停止します。",
                "禅那の修習は解脱への重要な道です。禅那によって心を静め、観禅によって真実を観察し、最終的に解脱に到達します。"
            ],
            "keyTerms": [
                {
                    "id": "TERM_ABHINNA",
                    "term": "勝智",
                    "pali": "Abhiññā",
                    "meaning": "超自然的な能力。六種：神変智・天耳智・他心智・宿住智・天眼智・漏尽智。"
                },
                {
                    "id": "TERM_NIRODHA",
                    "term": "滅受想定",
                    "pali": "Nirodha-samāpatti",
                    "meaning": "すべての心と心所が一時的に停止する定。阿羅漢と三果の聖者のみが入る。"
                }
            ]
        }
    ],
    
    "reviewCards": [
        {
            "id": "M13_R01",
            "front": "到大心（Mahaggata）とは何ですか？",
            "back": "広大なる安穏に至る心です。二十七種類（色界心十五＋無色界心十二）から成ります。"
        },
        {
            "id": "M13_R02",
            "front": "色界心（Rūpāvacara）とは何ですか？",
            "back": "色界に流転する心です。十五種類あり、禅那によって生じます。"
        },
        {
            "id": "M13_R03",
            "front": "十五色界心は何群に分けられますか？",
            "back": "三群に分けられます：善心五、果心五、唯作心五です。"
        },
        {
            "id": "M13_R04",
            "front": "五禅那の違いは何ですか？",
            "back": "禅支の数と種類が異なります。初禅は五禅支、二禅は四禅支、三禅は三禅支、四禅は二禅支、五禅は二禅支（捨・一境性）です。"
        },
        {
            "id": "M13_R05",
            "front": "初禅那の五禅支は何ですか？",
            "back": "尋（Vitakka）、伺（Vicāra）、喜（Pīti）、楽（Sukha）、一境性（Ekaggatā）です。"
        },
        {
            "id": "M13_R06",
            "front": "禅那の修習の第一の利益は何ですか？",
            "back": "現在楽住（Diṭṭhadhammasukhavihāra）です。禅那に入る者は、現在において静寂と安穏を体験します。"
        },
        {
            "id": "M13_R07",
            "front": "禅那は観禅にどのように役立ちますか？",
            "back": "禅那は心の集中をもたらし、観禅のための基盤となります。心が静まると、諸法の真実性（無常・苦・無我）を観察しやすくなります。"
        },
        {
            "id": "M13_R08",
            "front": "勝智（Abhiññā）には何種類ありますか？",
            "back": "六種類あります：神変智・天耳智・他心智・宿住智・天眼智・漏尽智です。"
        },
        {
            "id": "M13_R09",
            "front": "禅那善業の異熟としてどこに生まれますか？",
            "back": "色界の梵天界に生まれます。梵天界は十六の梵天界に分けられます。"
        },
        {
            "id": "M13_R10",
            "front": "滅受想定（Nirodha-samāpatti）とは何ですか？",
            "back": "すべての心と心所が一時的に停止する定です。阿羅漢と三果の聖者のみが入ることができます。"
        }
    ],
    
    "quizSeeds": [
        {
            "id": "M13_Q01",
            "type": "mcq",
            "question": "到大心（Mahaggata）は何種類の心から成りますか？",
            "correctAnswer": "27",
            "distractors": ["15", "12", "54"],
            "explanation": "到大心は二十七種類（色界心十五＋無色界心十二）から成ります。"
        },
        {
            "id": "M13_Q02",
            "type": "mcq",
            "question": "色界心（Rūpāvacara citta）とは何ですか？",
            "correctAnswer": "色界に流転する心",
            "distractors": ["欲界に流転する心", "無色界に流転する心", "出世間の心"],
            "explanation": "色界心は色界に流転する心です。十五種類あり、禅那によって生じます。"
        },
        {
            "id": "M13_Q03",
            "type": "mcq",
            "question": "十五色界心はどのような構造で分けられますか？",
            "correctAnswer": "善5・果5・唯作5",
            "distractors": ["初禅5・二禅5・三禅5", "善10・果5", "善5・果10"],
            "explanation": "十五色界心は善心五、果心五、唯作心五に分けられます。各群は五禅那に基づきます。"
        },
        {
            "id": "M13_Q04",
            "type": "mcq",
            "question": "初禅那は何禅支を具足しますか？",
            "correctAnswer": "5",
            "distractors": ["3", "4", "2"],
            "explanation": "初禅那は五禅支（尋・伺・喜・楽・一境性）を具足します。"
        },
        {
            "id": "M13_Q05",
            "type": "mcq",
            "question": "初禅那の五禅支は何ですか？",
            "correctAnswer": "尋・伺・喜・楽・一境性",
            "distractors": ["喜・楽・捨・一境性", "尋・伺・喜・捨", "信・念・定・慧・捨"],
            "explanation": "初禅那の五禅支は尋（Vitakka）、伺（Vicāra）、喜（Pīti）、楽（Sukha）、一境性（Ekaggatā）です。"
        },
        {
            "id": "M13_Q06",
            "type": "mcq",
            "question": "第二禅那は初禅那からどの禅支を除きますか？",
            "correctAnswer": "尋",
            "distractors": ["伺", "喜", "楽"],
            "explanation": "第二禅那は初禅那から尋（Vitakka）を除きます。"
        },
        {
            "id": "M13_Q07",
            "type": "mcq",
            "question": "第五禅那は第四禅那からどの禅支を除き、何に置き換えますか？",
            "correctAnswer": "楽を除き捨に置き換える",
            "distractors": ["喜を除き捨に置き換える", "伺を除き捨に置き換える", "尋を除き捨に置き換える"],
            "explanation": "第五禅那は第四禅那から楽（Sukha）を除き、捨（Upekkhā）に置き換えます。"
        },
        {
            "id": "M13_Q08",
            "type": "mcq",
            "question": "禅那の修習の第一の利益は何ですか？",
            "correctAnswer": "現在楽住",
            "distractors": ["勝智", "神通", "梵天に生ずる"],
            "explanation": "禅那の修習の第一の利益は現在楽住（Diṭṭhadhammasukhavihāra）です。現在において静寂と安穏を体験します。"
        },
        {
            "id": "M13_Q09",
            "type": "mcq",
            "question": "勝智（Abhiññā）は何種類ありますか？",
            "correctAnswer": "6",
            "distractors": ["3", "4", "5"],
            "explanation": "勝智は六種類あります：神変智・天耳智・他心智・宿住智・天眼智・漏尽智です。"
        },
        {
            "id": "M13_Q10",
            "type": "mcq",
            "question": "滅受想定（Nirodha-samāpatti）に入ることができるのは誰ですか？",
            "correctAnswer": "阿羅漢と三果の聖者",
            "distractors": ["すべての衆生", "凡夫のみ", "有学のみ"],
            "explanation": "滅受想定は阿羅漢と三果の聖者のみが入ることができます。凡夫には入ることができません。"
        }
    ]
}
