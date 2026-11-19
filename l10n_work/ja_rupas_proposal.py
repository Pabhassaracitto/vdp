# -*- coding: utf-8 -*-
"""
Japanese translation proposal for 24 derived rupas (RP_005-RP_028).

Sources:
- Glossary ja column (l10n_work/glossary.csv)
- Vietnamese source: assets/data/rupas.json
- Theravāda Abhidhamma convention

Confidence: glossary (terms from agreed glossary, prose translated from Vietnamese)
"""

RUPAS_JA_DERIVED = {
    "RP_005": {
        # 眼浄色 (Cakkhu-pasāda) - Eye faculty
        "characteristic": "繊細で透明 — 色所縁を捉える能力を持つこと。",
        "function": "可見の対象を見ること。",
        "manifestation": "眼門における視覚の基盤として現れること。",
        "proximateCause": "他の三大種と倶生する四大種。",
        "doctrinalNote": "業のみによって生ずる。無色界には存在しない。",
    },
    "RP_006": {
        # 耳浄色 (Sota-pasāda) - Ear faculty
        "characteristic": "繊細 — 声所縁を捉える能力を持つこと。",
        "function": "可聴の対象を聞くこと。",
        "manifestation": "耳門における聴覚の基盤として現れること。",
        "proximateCause": "四大種。",
        "doctrinalNote": "色界の梵天は音でCommunicationするので耳根を持つ。",
    },
    "RP_007": {
        # 鼻浄色 (Ghāna-pasāda) - Nose faculty
        "characteristic": "繊細 — 香所縁を捉える能力を持つこと。",
        "function": "嗅ぐ対象を嗅ぐこと。",
        "manifestation": "鼻門における嗅覚の基盤として現れること。",
        "proximateCause": "四大種。",
        "doctrinalNote": "欲界にのみ存在する。色界の梵天は鼻根を持たない。",
    },
    "RP_008": {
        # 舌浄色 (Jivhā-pasāda) - Tongue faculty
        "characteristic": "繊細 — 味所縁を捉える能力を持つこと。",
        "function": "味わう対象を味わうこと。",
        "manifestation": "舌門における味覚の基盤として現れること。",
        "proximateCause": "四大種。",
        "doctrinalNote": "欲界にのみ存在する。梵天は飲食しないので舌根を持たない。",
    },
    "RP_009": {
        # 身浄色 (Kāya-pasāda) - Body faculty
        "characteristic": "繊細で遍在 — 触所縁（地・火・風）を捉えること。",
        "function": "触れる対象を触れること。",
        "manifestation": "身門における触觉の基盤として現れること。",
        "proximateCause": "四大種。",
        "doctrinalNote": "色界の梵天は身根を持つ。無想界には存在しない。",
    },
    "RP_010": {
        # 色所縁 (Rūpa-ārammaṇa) - Visible form
        "characteristic": "顕現・表現 — 眼根によって見られる対象。",
        "function": "視覚の対象となること。",
        "manifestation": "色彩・形相として現れること。",
        "proximateCause": "四大種。",
        "doctrinalNote": "色所縁（色彩）は色法（物質一般）とは異なる。",
    },
    "RP_011": {
        # 声所縁 (Sadda-ārammaṇa) - Sound
        "characteristic": "鳴り響くこと — 耳根によって聞かれる対象。",
        "function": "聴覚の対象となること。",
        "manifestation": "音として現れること。",
        "proximateCause": "四大種または心の作用。",
        "doctrinalNote": None,
    },
    "RP_012": {
        # 香所縁 (Gandha-ārammaṇa) - Odour
        "characteristic": "香ること — 鼻根によって嗅がれる対象。",
        "function": "嗅覚の対象となること。",
        "manifestation": "香りとして現れること。",
        "proximateCause": "四大種。",
        "doctrinalNote": None,
    },
    "RP_013": {
        # 味所縁 (Rasa-ārammaṇa) - Taste
        "characteristic": "味わい — 舌根によって味わわれる対象。",
        "function": "味覚の対象となること。",
        "manifestation": "味として現れること。",
        "proximateCause": "四大種。",
        "doctrinalNote": None,
    },
    "RP_014": {
        # 女根色 (Itthi-bhāva) - Femininity
        "characteristic": "女性的性質 — 女性としての特質を表すこと。",
        "function": "女性の身体・行動・声などを決定すること。",
        "manifestation": "女性的な外見・振る舞いとして現れること。",
        "proximateCause": "業生色。",
        "doctrinalNote": "業のみによって生ずる。",
    },
    "RP_015": {
        # 男根色 (Purisa-bhāva) - Masculinity
        "characteristic": "男性的性質 — 男性としての特質を表すこと。",
        "function": "男性の身体・行動・声などを決定すること。",
        "manifestation": "男性的な外見・振る舞いとして現れること。",
        "proximateCause": "業生色。",
        "doctrinalNote": "業のみによって生ずる。",
    },
    "RP_016": {
        # 心所依処 (Hadaya-vatthu) - Heart base
        "characteristic": "心の基盤 — 識界の物質的依処となること。",
        "function": "意門として機能すること。",
        "manifestation": "心の物質的基盤として現れること。",
        "proximateCause": "業生色。",
        "doctrinalNote": "心臓の内部に存在するとされる。",
    },
    "RP_017": {
        # 命根色 (Jīvitindriya-rūpa) - Material life faculty
        "characteristic": "生命力 — 業生色を維持・保護すること。",
        "function": "業生色の寿命を維持すること。",
        "manifestation": "業生色の存続として現れること。",
        "proximateCause": "業。",
        "doctrinalNote": "業生色のみを維持する。心生色などは維持しない。",
    },
    "RP_018": {
        # 食素 (Āhāra-rūpa / Ojā) - Nutriment
        "characteristic": "栄養 — 身体を養うこと。",
        "function": "色聚を支持・維持すること。",
        "manifestation": "身体の滋養として現れること。",
        "proximateCause": "摂取された食物。",
        "doctrinalNote": "段食（物質的食物）の栄養素。",
    },
    "RP_019": {
        # 空界 (Ākāsa-dhātu) - Space element
        "characteristic": "隙間・限界 — 色聚を区画すること。",
        "function": "色聚の境界を形成すること。",
        "manifestation": "隙間・空洞として現れること。",
        "proximateCause": "四大種。",
        "doctrinalNote": "無色界には存在しない。",
    },
    "RP_020": {
        # 身表 (Kāya-viññatti) - Bodily intimation
        "characteristic": "身体による意思表示 — 身業を表現すること。",
        "function": "身体の動きによって意図を伝えること。",
        "manifestation": "身振・動作として現れること。",
        "proximateCause": "心。",
        "doctrinalNote": "心生色。意志に基づく身体の動き。",
    },
    "RP_021": {
        # 語表 (Vacī-viññatti) - Vocal intimation
        "characteristic": "音声による意思表示 — 口業を表現すること。",
        "function": "音声によって意図を伝えること。",
        "manifestation": "言語・音声として現れること。",
        "proximateCause": "心。",
        "doctrinalNote": "心生色。意志に基づく発話。",
    },
    "RP_022": {
        # 色軽快性 (Rūpa-lahutā) - Lightness of materiality
        "characteristic": "軽快 — 色の重さを除くこと。",
        "function": "色の硬直を除去すること。",
        "manifestation": "色の敏捷性として現れること。",
        "proximateCause": "軽快性を伴う色聚。",
        "doctrinalNote": "心生色および時節生色に存在する。",
    },
    "RP_023": {
        # 色柔軟性 (Rūpa-mudutā) - Malleability of materiality
        "characteristic": "柔軟 — 色の硬さを除くこと。",
        "function": "色の強剛を除去すること。",
        "manifestation": "色の柔軟性として現れること。",
        "proximateCause": "柔軟性を伴う色聚。",
        "doctrinalNote": "心生色および時節生色に存在する。",
    },
    "RP_024": {
        # 色適業性 (Rūpa-kammaññatā) - Wieldiness of materiality
        "characteristic": "適業 — 色の不適業性を除くこと。",
        "function": "色の不适応性を除去すること。",
        "manifestation": "色の適応性として現れること。",
        "proximateCause": "適業性を伴う色聚。",
        "doctrinalNote": "心生色および時節生色に存在する。",
    },
    "RP_025": {
        # 色積聚 (Rūpa-upacaya) - Integration of materiality
        "characteristic": "集積 — 色聚を初めて生起させること。",
        "function": "色法を積み上げること。",
        "manifestation": "色の最初の生起として現れること。",
        "proximateCause": "四因のいずれか（業・心・時節・食物）。",
        "doctrinalNote": "結生時および生存中の新生時にのみ存在する。",
    },
    "RP_026": {
        # 色続 (Rūpa-santati) - Continuity of materiality
        "characteristic": "継続 — 色聚を維持すること。",
        "function": "色法を引き継ぐこと。",
        "manifestation": "色の存続として現れること。",
        "proximateCause": "積聚色。",
        "doctrinalNote": "積聚から滅坏までの間に存在する。",
    },
    "RP_027": {
        # 色老 (Rūpa-jaratā) - Ageing of materiality
        "characteristic": "老化 — 色聚を成熟させること。",
        "function": "色法を老衰させること。",
        "manifestation": "色の衰えとして現れること。",
        "proximateCause": "続色。",
        "doctrinalNote": "色法の老化は49刹那の住位から始まる。",
    },
    "RP_028": {
        # 色無常 (Rūpa-aniccatā) - Impermanence of materiality
        "characteristic": "滅坏 — 色聚を完全に消滅させること。",
        "function": "色法を滅尽させること。",
        "manifestation": "色の消滅として現れること。",
        "proximateCause": "老色。",
        "doctrinalNote": "色法の17刹那の寿命の最後。",
    },
}
