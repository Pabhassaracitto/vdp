# -*- coding: utf-8 -*-
"""
Japanese (ja) translation-source proposal — Priority content batch.
==============================================================
DRAFT for independent review. Not doctrinal approval.

This file adds the missing Japanese fields to the translation source tables
used by tool/content/build_full_catalogs.py. It is a *proposal* — the
integrator applies it to the authoritative source files
(data_priority_conditions.py, data_priority_cetasikas.py, etc.) and regenerates.

Scope:
  1. Paticcas (PD_01–PD_12): four aspects, doctrinalNote, examples
  2. Paccayas (PC_01–PC_24): paccayaDhamma, paccayuppanna, doctrinalNote,
     examples, subdivision labels
  3. Vithis (VT_*): arisingCondition, significance, doctrinalNote, step names
     and descriptions
  4. Cetasikas (CS_*): characteristic, function, manifestation, proximateCause
  5. Rupas (RP_*): characteristic, function, manifestation, proximateCause,
     doctrinalNote
  6. Kammas (KM_*): doctrinalNote, examples

Terminology baseline:
  - Glossary column ja (l10n_work/glossary.csv)
  - Japanese Theravāda Abhidhamma convention (南伝上座部アビダンマ)
  - Cited source: 南伝大蔵経 65: 摂阿毘達磨義論 (tr. Mizuno Kogen)
    NOTE: I cannot independently verify page numbers in that edition.
    Terms are drawn from the agreed glossary and cross-checked against
    standard Theravāda Abhidhamma usage. Where I could not verify a
    specific passage in Mizuno's edition, confidence is marked
    'glossary' (agreed term, source unverified for prose context).

Confidence levels:
  'glossary'  — term appears in the agreed glossary; prose is composed
                by this agent and awaits qualified doctrinal review
  'attested'  — term and usage are standard in Japanese Theravāda
                Abhidhamma literature
  'unverified' — could not cross-check against cited source; left for
                English fallback
"""

# ═══════════════════════════════════════════════════════════════
# 1. PATICCAS — Paṭiccasamuppāda twelve links
#    Missing fields: characteristic, function, manifestation,
#    proximateCause, doctrinalNote, examples
# ═══════════════════════════════════════════════════════════════

PATICCAS_JA = {
    "PD_01": {
        # 無明 (Avijjā) — glossary attested
        "characteristic": "了知しないこと — 真実の本性（四諦・三相）に対する盲目。",
        "function": "明晰な観察を覆い隠し、行の生起の因縁となること。",
        "manifestation": "迷いと暗闇として — 気づかぬまま業（行）を造り続けること。",
        "proximateCause": "如理作意の欠如（非如理作意）；善知識に出遇わないこと、正法を聴聞しないこと。",
        "doctrinalNote": "無明には identifiable な始まりがない（anamatagga）。無明の滅尽は四道の道心の証得による。",
        "examples": [
            "この身体は無常であると知らず、我として執着し、その我を守ろうと業を造る。"
        ],
    },
    "PD_02": {
        # 行 (Saṅkhārā) — glossary: 行
        "characteristic": "行為と編成 — 身・口・意による意図的な形成。",
        "function": "業を造ること — 来世の結生をもたらす業力を蓄積すること。",
        "manifestation": "蓄積された業として — 識を結生へと導くこと。",
        "proximateCause": "無明を条件として（無明がなければ、行は出世間となり新たな業を造らない）。",
        "doctrinalNote": "縁起における行（Saṅkhārā）とは、業を形成する思（cetanā）心所を意味する。",
        "examples": [
            "善心で布施することは福行であり、その識は善趣に結生する。",
            "禅定を成就することは不動行であり、その識は色界・無色界に結生する。"
        ],
    },
    "PD_03": {
        # 識 (Viññāṇa) — glossary: 識
        "characteristic": "対象を知ること — 結生識が新たな名色の上に安住すること。",
        "function": "結生すること — 新たな生命を開くこと。",
        "manifestation": "新たな存在が形づくられること — 名と色が現れること。",
        "proximateCause": "業（行）を条件として；名色は安住する基盤でなければならない。",
        "doctrinalNote": "識と名色は互いに寄りかかる — まさに二本の葦の束が互いに支え合うように。",
        "examples": [
            "受胎の瞬間に結生識が現れ、名色が発育し、新しい生命が始まる。"
        ],
    },
    "PD_04": {
        # 名色 (Nāmarūpa) — glossary: 名色
        "characteristic": "存在すること — 心と身体が現れ発育すること。",
        "function": "識の活動基盤となり、六処が発育する条件となること。",
        "manifestation": "六処が完全に形成されること。",
        "proximateCause": "識を条件として；色を生ずる四因（業・心・時節・食物）。",
        "doctrinalNote": None,  # English has no doctrinalNote for PD_04
        "examples": [
            "胎内において：結生識が現れ、名色は受精卵から満胎まで徐々に発育する。"
        ],
    },
    "PD_05": {
        # 六処 (Saḷāyatana) — glossary: 六処
        "characteristic": "受け取る準備 — 対象が入る六つの門。",
        "function": "心と外界の対象が出遇う門（dvāra）となること。",
        "manifestation": "触（phassa）が成立すること — 心と対象が出遇うこと。",
        "proximateCause": "完全に発育した名色を条件として。",
        "doctrinalNote": None,
        "examples": [
            "新生児：六処が完成し、外界との接触が始まる。"
        ],
    },
    "PD_06": {
        # 触 (Phassa) — glossary: 触
        "characteristic": "触れること — 根・境・識の三者の出遇い。",
        "function": "根・境・識を集め合わせ、受（vedanā）の生起を条件づけること。",
        "manifestation": "心・心所・根・境が集合すること。",
        "proximateCause": "三者の具足：根＋境＋識。",
        "doctrinalNote": "縁起の触（Phassa）は、触心所（CS_PHASSA）と同じ。",
        "examples": [
            "眼が美しい対象を見る：眼処＋色所縁＋眼識が眼触となり、喜受が生じる。"
        ],
    },
    "PD_07": {
        # 受 (Vedanā) — glossary: 受
        "characteristic": "味わうこと — 触の後、対象を楽・苦・中性として経験すること。",
        "function": "対象を楽しむこと — 非如理作意が勝つとき、愛（taṇhā）の生起を条件づけること。",
        "manifestation": "楽・苦・中性の経験として心に形成されること。",
        "proximateCause": "触を条件として。",
        "doctrinalNote": "ここが四念処の要所：受に止まり、愛へと成熟させないこと。",
        "examples": [
            "称賛を聞き（触）、喜受が生じる。正念がなければ、さらなる渇望（愛）が生じる。"
        ],
    },
    "PD_08": {
        # 愛 (Taṇhā) — glossary: 愛
        "characteristic": "渇き — 受によって生じた執着する欲求。",
        "function": "対象に grasping すること — 取（upādāna）の生起を条件づけること。",
        "manifestation": "執着が確立すること；再生の循環が続くこと。",
        "proximateCause": "受（特に楽受・喜受）を条件として。",
        "doctrinalNote": "愛は四聖諦における集諦。愛の滅尽が苦の滅尽 — 涅槃。",
        "examples": [
            "美味しい食物を見て、愛が生じる：もっと食べたいと望む。",
            "苦痛に出遇い、存在しないことへの愛が生じる：存在したくないと望む。"
        ],
    },
    "PD_09": {
        # 取 (Upādāna) — glossary: 四取
        "characteristic": "強く掴むこと — 離さない執着。",
        "function": "対象を固く把握すること — 有（bhava）の生起を条件づけること。",
        "manifestation": "有が形づくられること — 再生を生ずる業力が蓄積されること。",
        "proximateCause": "愛を条件として — 取は愛が増強・固化したもの。",
        "doctrinalNote": None,
        "examples": [
            "お金を欲しいだけでなく（愛）、お金を手放せないこと（取）。"
        ],
    },
    "PD_10": {
        # 有 (Bhava) — glossary: 有
        "characteristic": "存在すること — 再生を生ずる準備の整った蓄積された業力。",
        "function": "来世における生の生起を条件づけること。",
        "manifestation": "業に対応する界に再生が生ずること。",
        "proximateCause": "取を条件として — 取は有の燃料。",
        "doctrinalNote": None,
        "examples": [
            "生涯にわたり寛大に布施する人は、欲界善有を積み、来世に富者として結生する。"
        ],
    },
    "PD_11": {
        # 生 (Jāti) — glossary: 生
        "characteristic": "結生すること — 識が新たな界に結生すること。",
        "function": "新たな生命を開くこと — 苦の全体を引き連れて。",
        "manifestation": "苦（老死）が現れること。",
        "proximateCause": "有（業力）を条件として。",
        "doctrinalNote": "三世の循環がここで繋がる：生（PD_11）は来世の果の側の識（PD_03）に対応する。",
        "examples": [
            "受胎の瞬間が生である — すべての苦はこれに続く。"
        ],
    },
    "PD_12": {
        # 老死 (Jarāmaraṇa) — glossary: 老死
        "characteristic": "老いと死 — すべての条件形成された心身の必然的な衰滅。",
        "function": "一つの生命を終えること — 解脱が達成されなければ新たな循環を続けること。",
        "manifestation": "一つの生命が閉じられること；解脱なければ循環は続く。",
        "proximateCause": "生を条件として — 生あるところに老死は必ず続く。",
        "doctrinalNote": "解脱とは無明（PD_01）と愛（PD_08）の滅尽 — 涅槃の証得。",
        "examples": [
            "生まれたすべての存在は老い、死ななければならない。",
            "無明と愛が滅尽されるとき、老死はもはや続かない。"
        ],
    },
}


# ═══════════════════════════════════════════════════════════════
# 2. PACCAYAS — 24 conditions (Paṭṭhāna Naya)
#    Missing: paccayaDhamma, paccayuppanna, doctrinalNote, examples
#    Plus subdivision labels/names where present
# ═══════════════════════════════════════════════════════════════

PACCAYAS_JA = {
    "PC_01": {
        # Hetu-paccaya — 因縁
        "paccayaDhamma": "六因：貪（lobha）・瞋（dosa）・痴（moha）・無貪（alobha）・無瞋（adosa）・無痴（amoha）。",
        "paccayuppanna": "因に相応する心（citta と cetasika）およびその心が生ずる色法 — 生存中の心生色、結生時の業生色。",
        "doctrinalNote": "六因の心所のみが因である。他の心所がどれほど強くとも、他の縁によってのみ自らの法を支える。",
        "examples": [
            "貪根心は貪と痴の二因を持つ：二因合わせてその心刹那全体を不善とする。",
            "無因心（ahetuka）には因がなく、因縁を受けない — 例えば二つの受受心。"
        ],
    },
    "PC_02": {
        # Ārammaṇa-paccaya — 所縁縁
        "paccayaDhamma": "六境：色・声・香・味・触・法（涅槃や禅定を含む）。",
        "paccayuppanna": "89心 — 対象を知るすべての心 — と52心所。",
        "doctrinalNote": "清浄道論XVIIによれば、禅修者が無明を慧で観察するとき、無明は善の所縁縁となる。",
        "examples": [
            "色所縁（映像）が眼識と相応心所の所縁縁となる。",
            "涅槃が出世間心の所縁縁となる。"
        ],
    },
    "PC_03": {
        # Adhipati-paccaya — 増上縁
        "paccayaDhamma": "四倶生増上 — 意欲（chanda）・精進（viriya）・心（citta）・観察（vīmaṃsā、慧）；および増上所縁。",
        "paccayuppanna": "増上と共に生ずる心所；増上所縁については、89心（無因異熟心を除く）と相応心所。",
        "doctrinalNote": "18無因心には増上縁は生じない。また因が一つのみの心にも生じない。",
        "examples": [
            "禅修者の精進が最も強いとき、精進が禅那の心刹那全体を主導する。",
            "貴重な品に心を奪われた人：その品が貪心の増上所縁となる。"
        ],
        "subdivisions": [
            {"name": "倶生増上", "pali": "Sahajāt'ādhipati"},
            {"name": "所縁増上", "pali": "Ārammaṇ'ādhipati"},
        ],
    },
    "PC_04": {
        # Anantara-paccaya — 無間縁
        "paccayaDhamma": "直前に滅した心と心所（阿羅漢の死心を除く）。",
        "paccayuppanna": "直後に生ずる心と心所。",
        "doctrinalNote": "無間縁は心識の相続の基盤 — 二つの心刹那の間に隙間はない。",
        "examples": [
            "五門心路において、眼識の滅が無間縁となり受取心生起の道を開く。",
            "結生識の滅が無間縁となり、第一有分心の生起を導く。"
        ],
    },
    "PC_05": {
        # Samanantara-paccaya — 等無間縁
        "paccayaDhamma": "直前に滅した心と心所。",
        "paccayuppanna": "直後に続く心と心所。",
        "doctrinalNote": "無間縁と等無間縁は同一の現実、表現の違いのみ — 硬貨の表裏のようなもの。",
        "examples": [
            "「道を譲る」面が無間縁、「直ちに続く」面が等無間縁。"
        ],
    },
    "PC_06": {
        # Sahajāta-paccaya — 倶生縁
        "paccayaDhamma": "共に生ずる四名蘊；四大種；生存中の心と心所；結生時の名と色。",
        "paccayuppanna": "互いに倶生する名法；生存中の心生色・業生色；結生時に相互に支え合う名色。",
        "doctrinalNote": "倶生縁は一名刹那における名色の同時性を説明するために最も用いられる縁。",
        "examples": [
            "一つの貪心刹那において、受・想・行・識が共に生じ互いに支え合う。",
            "結生の瞬間、結生識と業生色は倶生縁によって互いを支える。"
        ],
    },
    "PC_07": {
        # Aññamañña-paccaya — 相互縁
        "paccayaDhamma": "倶生の四名蘊；四大種；結生時の名と色。",
        "paccayuppanna": "まさにそれらの法 — 関係は双方向的。",
        "doctrinalNote": "相互縁は常に倶生縁に伴うが、より狭い：心生色は識と相互ではない。",
        "examples": [
            "四大種：地界は水界を支え、水界は地界を支える — 単独で立つ元素はない。"
        ],
    },
    "PC_08": {
        # Nissaya-paccaya — 依止縁
        "paccayaDhamma": "倶生の四名蘊；四大種；および六処（眼・耳・鼻・舌・身・心基）。",
        "paccayuppanna": "倶生の心所；派生色；および七識界と相応心所。",
        "doctrinalNote": "親依止縁と区別すること：依止縁は直接の基盤、親依止縁は遠方からの強力な援助。",
        "examples": [
            "眼処が眼識と相応心所の依止縁となる。",
            "心基（hadaya-vatthu）は生涯にわたり意識界全体を支える。"
        ],
        "subdivisions": [
            {"name": "倶生依止", "pali": "Sahajāta-nissaya"},
            {"name": "前生依止（依処）", "pali": "Purejāta-nissaya (vatthu)"},
            {"name": "基所縁前生依止", "pali": "Vatthārammaṇa-purejāta-nissaya"},
        ],
    },
    "PC_09": {
        # Upanissaya-paccaya — 親依止縁
        "paccayaDhamma": "強く注目された所縁；直前に滅した識；および自然的条件（信・戒・気候・食物・友人など）。",
        "paccayuppanna": "その後生ずる心と心所。",
        "doctrinalNote": "縁起の受縁愛の繋ぎは、主に自然的親依止縁によって説明される。",
        "examples": [
            "楽受は愛に対する自然的親依止縁 — 受が快いゆえに愛が強まる。",
            "信が布施を強く支え；貪が盗みを強く支える。"
        ],
        "subdivisions": [
            {"name": "所縁親依止", "pali": "Ārammaṇ'ūpanissaya"},
            {"name": "無間親依止", "pali": "Anantar'ūpanissaya"},
            {"name": "自然親依止", "pali": "Pakat'ūpanissaya"},
        ],
    },
    "PC_10": {
        # Purejāta-paccaya — 前生縁
        "paccayaDhamma": "既に生起した六処（色法）および六境 — 具体的な物質的現象。",
        "paccayuppanna": "後に生ずる心と心所。",
        "doctrinalNote": "前生縁は色法のみに適用される；名法は前生縁となり得ない。",
        "examples": [
            "眼処がまず存在しなければならない；その後でのみ眼識が生じ得る。",
            "現在の色所縁（17心刹那の寿命）が眼門心路の前生縁となる。"
        ],
        "subdivisions": [
            {"name": "依処前生", "pali": "Vatthu-purejāta"},
            {"name": "所縁前生", "pali": "Ārammaṇa-purejāta"},
        ],
    },
    "PC_11": {
        # Pacchājāta-paccaya — 後生縁
        "paccayaDhamma": "85心（欲界・色界・無色界・出世間の一切心。結生心を除く）と52心所。",
        "paccayuppanna": "先に生じた業生の身体（生存中の肉体）。",
        "doctrinalNote": "後に生じた名法が先に生じた色法を支えるのみ；逆はあり得ない。",
        "examples": [
            "生存中の心・心所が既に生じた身体を支え、衰朽を防ぐ。",
            "空腹が食事を促す — 後の名法が先に生じた色法を養う。"
        ],
    },
    "PC_12": {
        # Āsevana-paccaya — 習行縁
        "paccayaDhamma": "先行する速行心と相応心所（最終速行と道速行を除く）。",
        "paccayuppanna": "直後に生ずる速行心と相応心所。",
        "doctrinalNote": "出世間の道速行は習行縁ではない。一刹那のみに生ずるため。",
        "examples": [
            "七速行の中で、第一速行が第二速行の習行縁となる。",
            "反復唱誦による暗記：繰り返すほど後が続けやすくなる — 同じ原理。"
        ],
    },
    "PC_13": {
        # Kamma-paccaya — 業縁
        "paccayaDhamma": "善・不善の思（cetanā）心所。",
        "paccayuppanna": "倶生業：それと共に生ずる心・心所および心生色。異時業：異熟心・心所および結生時の業生色。",
        "doctrinalNote": "十二支の行縁識・有縁生の繋ぎは、異時業縁によって説明される。",
        "examples": [
            "布施の行為における思は、来世の異熟心と業生色を支える（異時業）。",
            "貪心刹那の思がその心刹那全体を不善とする（倶生業）。"
        ],
        "subdivisions": [
            {"name": "倶生業", "pali": "Sahajāta-kamma"},
            {"name": "異刹那業", "pali": "Nānākkhaṇika-kamma"},
        ],
    },
    "PC_14": {
        # Vipāka-paccaya — 異熟縁
        "paccayaDhamma": "36異熟心（無因異熟・欲界美異熟・大異熟）と相応38心所。",
        "paccayuppanna": "共に生ずる異熟心所およびそれらが生ずる業生色。",
        "doctrinalNote": "異熟心は新たな業を造らない — 「果は果を生ぜず」を理解する要点。",
        "examples": [
            "結生識は異熟心である：それと共に生ずる業生色を支える。",
            "眼識は異熟心であり、新たな業を造ることなく倶生心所を異熟縁で支える。"
        ],
    },
    "PC_15": {
        # Āhāra-paccaya — 食縁
        "paccayaDhamma": "物質的食物（色法）および三名食：触・思・識。",
        "paccayuppanna": "食物の色法が身体を支える；三名食が心・心所・心生色を支える。",
        "doctrinalNote": "経蔵（SN 12.63）の四食の観想と関連づけること。",
        "examples": [
            "食物が物質的身体を支える — 段食（物質食）。",
            "思食：意志が業を養い、生死の輪廻を延長する。"
        ],
        "subdivisions": [
            {"name": "色食", "pali": "Rūp'āhāra"},
            {"name": "名食", "pali": "Nām'āhāra"},
        ],
    },
    "PC_16": {
        # Indriya-paccaya — 根縁
        "paccayaDhamma": "20根：五感覚浄色根・命根色・十四名法根（受・信・精進・念・定・慧・三無漏根・意根）。",
        "paccayuppanna": "感覚根が七識界を統御する；名法根が倶生の心・心所を統御する；命根色が業生色を維持する。",
        "doctrinalNote": "五力 — 信・精進・念・定・慧 — は禅修において均整が取れていなければならない。",
        "examples": [
            "眼根が眼識を統御する — 眼根がなければ見ることはできない。",
            "定根が禅那の心刹那全体を統御する。"
        ],
        "subdivisions": [
            {"name": "前生根", "pali": "Purejāta-indriya"},
            {"name": "命根", "pali": "Jīvit'indriya"},
            {"name": "倶生根", "pali": "Sahajāta-indriya"},
        ],
    },
    "PC_17": {
        # Jhāna-paccaya — 禅支縁
        "paccayaDhamma": "七禅支：尋・伺・喜・楽・憂・捨・一境性。",
        "paccayuppanna": "相応する心と心所（二身識を除く）、およびその心が生ずる色法。",
        "doctrinalNote": "禅定成就に限られない：七禅支は通常の心識においても機能する。",
        "examples": [
            "尋が心を対象に導く — 共に生ずる法に対する禅支縁。",
            "第二禅では尋はないが、喜と一境性が禅支縁として機能する。"
        ],
    },
    "PC_18": {
        # Magga-paccaya — 道縁
        "paccayaDhamma": "十二道支：正見・正思惟・正語・正業・正命・正精進・正念・正定 — および邪見・邪思惟・邪精進・邪一境性。",
        "paccayuppanna": "相応する心と心所（二身識を除く）、およびその心が生ずる色法。",
        "doctrinalNote": "道縁は善・不善の両方に機能する — 出世間の八正道に限られない。",
        "examples": [
            "善心における正見が心刹那全体を善の方へ導く。",
            "貪心における邪見が心刹那を不善の方へ導く — 道縁には二つの側面がある。"
        ],
    },
    "PC_19": {
        # Sampayutta-paccaya — 相応縁
        "paccayaDhamma": "倶生の四名蘊。",
        "paccayuppanna": "まさにその四蘊 — 双方向の関係。",
        "doctrinalNote": "相応し得るのは名法のみ；色法は共通の所縁・基を持たないため、相応し得ない。",
        "examples": [
            "一つの心刹那における受と想は相応する：一つの基で一つの所縁を知る。"
        ],
    },
    "PC_20": {
        # Vippayutta-paccaya — 不相応縁
        "paccayaDhamma": "名法（色法を支えるとき）、または色法（名法を支えるとき）。",
        "paccayuppanna": "色法（倶生または前生）、または名法（倶生または後生）。",
        "doctrinalNote": "この縁は心と物質の関係を表現する — 十二支の名色分析の背骨。",
        "examples": [
            "心基（色法）が意識（名法）を支える — 異なる種類ゆえに不相応縁。",
            "結生時、結生識と業生色は共に生じるが、異なる種類のまま。"
        ],
        "subdivisions": [
            {"name": "倶生不相応", "pali": "Sahajāta-vippayutta"},
            {"name": "前生不相応", "pali": "Purejāta-vippayutta"},
            {"name": "後生不相応", "pali": "Pacchājāta-vippayutta"},
        ],
    },
    "PC_21": {
        # Atthi-paccaya — 有縁
        "paccayaDhamma": "倶生縁・前生縁・後生縁・食縁・根縁として機能する法を含む。",
        "paccayuppanna": "それら五縁によって支えられる法。",
        "doctrinalNote": "24縁中最も広範 — 五つの他の縁を包含する。",
        "examples": [
            "眼処が存在するゆえに眼識が生じ得る — 有縁。",
            "四大種が存在することで派生色を支える。"
        ],
        "subdivisions": [
            {"name": "倶生有", "pali": "Sahajāta-atthi"},
            {"name": "前生有", "pali": "Purejāta-atthi"},
            {"name": "後生有", "pali": "Pacchājāta-atthi"},
            {"name": "食有", "pali": "Āhāra-atthi"},
            {"name": "根有", "pali": "Indriya-atthi"},
        ],
    },
    "PC_22": {
        # Natthi-paccaya — 無有縁
        "paccayaDhamma": "直前に滅した心と心所。",
        "paccayuppanna": "直後に生ずる心と心所。",
        "doctrinalNote": "無間縁と同じ範囲だが、前の識の不在を強調する点で異なる。",
        "examples": [
            "眼識が滅することで受取心が生じ得る。"
        ],
    },
    "PC_23": {
        # Vigata-paccaya — 離縁
        "paccayaDhamma": "直前に滅した心と心所。",
        "paccayuppanna": "直後に生ずる心と心所。",
        "doctrinalNote": "同一の現実、二つの言い方：無有は「もはやそこにない」を強調、離は「去った」を強調。",
        "examples": [
            "有分心の刹那が、直前に滅し（離）、次の有分心を支える。"
        ],
    },
    "PC_24": {
        # Avigata-paccaya — 不離縁
        "paccayaDhamma": "倶生縁・前生縁・後生縁・食縁・根縁として機能する法を含む。",
        "paccayuppanna": "それら五縁によって支えられる法。",
        "doctrinalNote": "21–24の対（有・無有・離・不離）は二組の同義語で24縁を閉じる。",
        "examples": [
            "心基が未だ滅せず、意識を支え続ける。"
        ],
    },
}


# ═══════════════════════════════════════════════════════════════
# 3. VITHIS — Cittavīthi process
#    Missing: arisingCondition, significance, doctrinalNote,
#    step names/descriptions/doctrinalNotes
# ═══════════════════════════════════════════════════════════════

VITHIS_JA = {
    "VT_NGU_MON_RATLON": {
        "arisingCondition": "五境（色・声・香・味・触）が対応する根に非常に強く作用するとき。",
        "significance": "最も完全な心路 — 7速行が業を完全に造り、彼所縁が残りの対象を享受する。",
        "doctrinalNote": "極大所縁 = 7速行＋2彼所縁が可能なほど十分な対象。",
        "steps": [
            {
                "stepNumber": 1,
                "name": "過去有分",
                "pali": "Atīta-bhavaṅga",
                "description": "対象が作用する前、通常に流れている有分心。",
                "doctrinalNote": "その人の結生心・死心と同じ種類の心。"
            },
            {
                "stepNumber": 2,
                "name": "有分振動",
                "pali": "Bhavaṅga-calana",
                "description": "対象が根に作用し、有分心が初めて振動する。"
            },
            {
                "stepNumber": 3,
                "name": "有分断",
                "pali": "Bhavaṅgupaccheda",
                "description": "有分の流れが完全に切断され — 心路が始まる。",
                "doctrinalNote": "この刹那の後、五門転向心生起。"
            },
            {
                "stepNumber": 4,
                "name": "五門転向",
                "pali": "Pañcadvārāvajjana",
                "description": "五感覚門を開き、対象に向かう。どの門に対象があるかを確定する。",
                "doctrinalNote": "CI_028 — 捨倶、11心所。業を造らない。"
            },
            {
                "stepNumber": 5,
                "name": "双五識",
                "pali": "Dvipañca-viññāṇa",
                "description": "対応する感覚器を通じて対象を知覚する。遍一切心所7つのみ。",
                "doctrinalNote": "不善果（CI_013–017）または善果（CI_020–024）は結生業による。"
            },
            {
                "stepNumber": 6,
                "name": "受取",
                "pali": "Sampaṭicchana",
                "description": "双五識から対象を受け取り、内部の心識の流れに転送する。",
                "doctrinalNote": "CI_018 = 不善果捨倶；CI_025 = 善果捨倶。10心所。"
            },
            {
                "stepNumber": 7,
                "name": "推度",
                "pali": "Santīraṇa",
                "description": "対象を観察・検討する — 善か不善か、好ましいかどうかを判定する。",
                "doctrinalNote": "CI_027（喜倶）は対象が非常に美しいときにのみ現れる。"
            },
            {
                "stepNumber": 8,
                "name": "決定",
                "pali": "Voṭṭhapana",
                "description": "対象の善・不善を最終確定し — 7速行への道を開く。",
                "doctrinalNote": "CI_029（意門転向心）が決定の役割を果たす。11心所。次の速行の種類を決定する。"
            },
            {
                "stepNumber": 9,
                "name": "速行（7刹那）",
                "pali": "Javana (1–7)",
                "description": "7刹那の連続した速行 — 善または不善の業を造る。第1刹那：現法受業；第7刹那：次々受業；第2–6刹那：後後受業。",
                "doctrinalNote": "7回同一種類の心。心路の中で唯一業を造る部分。"
            },
            {
                "stepNumber": 10,
                "name": "彼所縁（2刹那）",
                "pali": "Tadārammaṇa (1–2)",
                "description": "速行の後に残りの対象を享受する2刹那の彼所縁。極大所縁の心路にのみ生ずる。新たな業は造らない。",
                "doctrinalNote": "Tadā = 「そのとき」；ārammaṇa = 所縁。対象が十分な強さのときにのみ生ずる。"
            },
            {
                "stepNumber": 11,
                "name": "心路後有分",
                "pali": "Post-vīthi Bhavaṅga",
                "description": "心路が終了した後、有分の流れが通常に再開する。"
            },
        ],
    },
    "VT_NGU_MON_LON": {
        "arisingCondition": "五境が7速行を生じさせるに十分な強さだが、彼所縁を生じさせるほどではない。",
        "significance": "最も通常の心路 — 7速行を通じて業が完全に造られる。",
        "doctrinalNote": "極大所縁の心路と唯一の違いは、2刹那の彼所縁がないこと。",
        "steps": [
            {
                "stepNumber": 1,
                "name": "有分振動",
                "pali": "Bhavaṅga-calana",
                "description": "対象の作用により有分心が振動する。"
            },
            {
                "stepNumber": 2,
                "name": "有分断",
                "pali": "Bhavaṅgupaccheda",
                "description": "有分の流れが切断され — 心路が始まる。"
            },
            {
                "stepNumber": 3,
                "name": "五門転向",
                "pali": "Pañcadvārāvajjana",
                "description": "五門を開く。"
            },
            {
                "stepNumber": 4,
                "name": "双五識",
                "pali": "Dvipañca-viññāṇa",
                "description": "感覚器を通じて対象を知覚する。"
            },
            {
                "stepNumber": 5,
                "name": "受取",
                "pali": "Sampaṭicchana",
                "description": "対象を受け取る。"
            },
            {
                "stepNumber": 6,
                "name": "推度",
                "pali": "Santīraṇa",
                "description": "対象を観察する。"
            },
            {
                "stepNumber": 7,
                "name": "決定",
                "pali": "Voṭṭhapana",
                "description": "対象を確定し、速行への道を開く。"
            },
            {
                "stepNumber": 8,
                "name": "速行（7刹那）",
                "pali": "Javana (1–7)",
                "description": "7刹那の速行が業を造る。その後彼所縁はない。",
                "doctrinalNote": "7速行の後、心は直ちに有分に落ちる。"
            },
            {
                "stepNumber": 9,
                "name": "心路後有分",
                "pali": "Post-vīthi Bhavaṅga",
                "description": "心路の後、有分が再開する。"
            },
        ],
    },
    "VT_Y_MON": {
        "arisingCondition": "法処（dhammārammaṇa）が意門に現れる — 思考、記憶、想像。",
        "significance": "すべての内面的精神活動を説明する。意業を造り、身業・口業の源泉となる。",
        "doctrinalNote": "意門心路は意門転向心（CI_029）から始まり、五門転向を経ない。",
        "steps": [
            {
                "stepNumber": 1,
                "name": "有分振動",
                "pali": "Bhavaṅga-calana",
                "description": "法処の作用により有分心が振動する。"
            },
            {
                "stepNumber": 2,
                "name": "有分断",
                "pali": "Bhavaṅgupaccheda",
                "description": "有分が断たれ — 意門心路が始まる。"
            },
            {
                "stepNumber": 3,
                "name": "意門転向",
                "pali": "Manodvārāvajjana",
                "description": "意門を開き、心は法処に向かう。同時に決定（意門心路では転向が決定を兼ねる）の役割も果たす。",
                "doctrinalNote": "CI_029 が意門転向と決定を兼ねる。11心所。"
            },
            {
                "stepNumber": 4,
                "name": "速行（7刹那）",
                "pali": "Javana (1–7)",
                "description": "7刹那の速行 — 意業を造る。すべての思考、発話、意図的行為の源。",
                "doctrinalNote": "意業を直接に造る。口業・身業も意門から始まる。"
            },
            {
                "stepNumber": 5,
                "name": "彼所縁（任意）",
                "pali": "Tadārammaṇa (option)",
                "description": "意門心路における彼所縁 — 法処の強さ次第。"
            },
            {
                "stepNumber": 6,
                "name": "心路後有分",
                "pali": "Post-vīthi Bhavaṅga",
                "description": "有分が再開する。"
            },
        ],
    },
    "VT_VITHIMUTTA": {
        "arisingCondition": "結生：前生の終わりに。有分：心路の間。死：色命根の滅尽時。",
        "significance": "再生のメカニズムと前世・今生の連結を説明する。",
        "doctrinalNote": "離路心は新たな業を造らない — 業的に不定の異熟心。",
        "steps": [
            {
                "stepNumber": 1,
                "name": "結生心",
                "pali": "Paṭisandhi-citta",
                "description": "新たな生命の最初の心 — 前生の死心から続く。業の種子を帯びる。",
                "doctrinalNote": "CI_019/CI_026 = 二因者；CI_027 = 特別な喜楽者；CI_063–CI_070 = 三因者または天人。"
            },
            {
                "stepNumber": 2,
                "name": "有分心",
                "pali": "Bhavaṅga-citta",
                "description": "心路の間に生命を維持する心識の流れ。無数に生滅を繰り返す。すべての心識活動の基盤。",
                "doctrinalNote": "有分 = 生命を維持する部分。深い睡眠中、心路の間に生起する。"
            },
            {
                "stepNumber": 3,
                "name": "死心",
                "pali": "Cuti-citta",
                "description": "最後の心刹那 — 色命根が滅し、死心が滅するとき、一生が終了する。直後に新しい生の結生心が生じる。",
                "doctrinalNote": "Cuti = 移動、去ること。死心の所縁 = 近所縁（Āsanna）。"
            },
        ],
    },
}


# ═══════════════════════════════════════════════════════════════
# 4. CETASIKAS — four-aspect fields
#    Missing: characteristic, function, manifestation, proximateCause
# ═══════════════════════════════════════════════════════════════
# Note: These are composed from the Abhidhammattha-saṅgaha
# framework. The four aspects (特相・味/作用・現起・足場/近因)
# follow the standard lakkhaṇa-rasa-paccupaṭṭhāna-padaṭṭhāna
# structure used in Theravāda commentarial tradition.

CETASIKAS_JA_ASPECTS = {
    "CS_PHASSA": {
        "characteristic": "触れること — 心と対象の衝突・接触。",
        "function": "心と対象が出遇うことを媒介すること。",
        "manifestation": "心・根・対象の集合として現れること。",
        "proximateCause": "根・境・識の三者の具足。",
    },
    "CS_VEDANA": {
        "characteristic": "感受すること — 対象の味を味わうこと。",
        "function": "対象を体験・受容すること。",
        "manifestation": "心における楽・苦・中性の経験として現れること。",
        "proximateCause": "触（phassa）を近因として。",
    },
    "CS_SANNA": {
        "characteristic": "標記すること — 対象の特徴を捉えること。",
        "function": "対象の相を記憶・識別すること。",
        "manifestation": "対象の印を何度も参照する態度として現れること。",
        "proximateCause": "美しく見える対象の表面（saññāの錯覚的側面）。",
    },
    "CS_CETANA": {
        "characteristic": "促すこと — 倶生法を対象に導くこと。",
        "function": "業を形成すること — 身・口・意の行為を組織すること。",
        "manifestation": "調整・指揮として現れること。",
        "proximateCause": "倶生の心所（ Beautiful の場合は浄法に、不善の場合は烦恼に）。",
    },
    "CS_EKAGGATA": {
        "characteristic": "集中すること — 心を単一の対象に安定させること。",
        "function": "心の散乱を鎮め、対象に固定すること。",
        "manifestation": "平静・不動として現れること。",
        "proximateCause": "楽受を近因として（禅定において）。",
    },
    "CS_JIVITINDRIYA": {
        "characteristic": "維持すること — 倶生名法の生命を保つこと。",
        "function": "生命・存続を守護すること。",
        "manifestation": "倶生法の存続・活力として現れること。",
        "proximateCause": "自らが生じさせるべき倶生法。",
    },
    "CS_MANASIKARA": {
        "characteristic": "指向すること — 心を対象に結びつけること。",
        "function": "心と心所を対象に導くこと。",
        "manifestation": "対象への心の結附として現れること。",
        "proximateCause": "対象そのもの。",
    },
    "CS_VITAKKA": {
        "characteristic": "投じること — 心に対象に粗く向けること。",
        "function": "心を対象上に置くこと。",
        "manifestation": "心の対象への初回の適用として現れること。",
        "proximateCause": "対象または相応する心所。",
    },
    "CS_VICARA": {
        "characteristic": "巡らせること — 心を対象上で持続的に検討すること。",
        "function": "心を対象に留め置くこと。",
        "manifestation": "対象上の心の持続的運動として現れること。",
        "proximateCause": "尋（vitakka）を近因として。",
    },
    "CS_ADHIMOKKHA": {
        "characteristic": "決定すること — 対象を確定し疑わないこと。",
        "function": "迷いを排して対象に確信を置くこと。",
        "manifestation": "確信・判定として現れること。",
        "proximateCause": "決定すべき対象。",
    },
    "CS_VIRIYA": {
        "characteristic": "精進すること — 心を一層努力させること。",
        "function": "怠惰を抑え、善法を支援すること。",
        "manifestation": "退かない不退転として現れること。",
        "proximateCause": "精進すべき事（精進処）。",
    },
    "CS_PITI": {
        "characteristic": "喜ぶこと — 所縁に喜悅を味わうこと。",
        "function": "身心に歓喜を満たすこと。",
        "manifestation": "身心の昂揚・喜悅として現れること。",
        "proximateCause": "身軽安と心軽安（あるいは一境性）。",
    },
    "CS_CHANDA": {
        "characteristic": "欲すること — 対象を得ようとする意志。",
        "function": "対象の把握を願うこと。",
        "manifestation": "対象への志向として現れること。",
        "proximateCause": "対象そのもの。",
    },
    "CS_LOBHA": {
        "characteristic": "掴むこと — 対象に執着すること。",
        "function": "対象を離さないこと。",
        "manifestation": "貪着として現れること。",
        "proximateCause": "楽と見なされる対象。",
    },
    "CS_DITTHI": {
        "characteristic": "見ること — 歪んだ見方で対象を把握すること。",
        "function": "真実を見誤り、誤った見解を確信すること。",
        "manifestation": "邪な解釈として現れること。",
        "proximateCause": "如理作意の欠如。",
    },
    "CS_MANA": {
        "characteristic": "誇るること — 自己を高め評価すること。",
        "function": "自己を賛美すること。",
        "manifestation": "高慢として現れること。",
        "proximateCause": "隠された貪（lobha）。",
    },
    "CS_DOSA": {
        "characteristic": "荒れること — 対象に怒り・嫌悪を抱くこと。",
        "function": "対象を押しのけ破壊すること。",
        "manifestation": "迫害・破壊として現れること。",
        "proximateCause": "九種の怒りの因（ Vatthūni）。",
    },
    "CS_ISSA": {
        "characteristic": "嫉むこと — 他者の成功を忍びないこと。",
        "function": "他者の富徳を妬むこと。",
        "manifestation": "嫉妬・羨望として現れること。",
        "proximateCause": "他者の成功・繁栄。",
    },
    "CS_MACCHARIYA": {
        "characteristic": "吝むこと — 他者と共有しないこと。",
        "function": "自分のものを隠し守ること。",
        "manifestation": "惜しみ・吝嗇として現れること。",
        "proximateCause": "自分の富や徳に対する執着。",
    },
    "CS_KUKKUCCA": {
        "characteristic": "後悔すること — 善悪の行為について悔むこと。",
        "function": "行ったこと・行わなかったことを悔いること。",
        "manifestation": "不安・懊悩として現れること。",
        "proximateCause": "善悪の行為の差異。",
    },
    "CS_MOHA": {
        "characteristic": "盲目であること — 真実を知らないこと。",
        "function": "対象の真実性を覆い隠すこと。",
        "manifestation": "迷いと暗闇として現れること。",
        "proximateCause": "非如理作意。",
    },
    "CS_AHIRIKA": {
        "characteristic": "恥じないこと — 身・口・意の悪行を恥ずかしく思わないこと。",
        "function": "不浄な行いを促進すること。",
        "manifestation": "汚染された猪のように振る舞うこと。",
        "proximateCause": "非如理作意。",
    },
    "CS_ANOTTAPPA": {
        "characteristic": "畏れないこと — 悪行の報いを恐れないこと。",
        "function": "不浄な行いに踏み出すこと。",
        "manifestation": "蜂に刺された熊のように振る舞うこと。",
        "proximateCause": "非如理作意。",
    },
    "CS_UDDHACCA": {
        "characteristic": "散動すること — 心の不安定。",
        "function": "心を落ち着かせないこと。",
        "manifestation": "散乱・揺れ動きとして現れること。",
        "proximateCause": "非如理作意。",
    },
    "CS_THINA": {
        "characteristic": "沈むこと — 心の重苦・硬直。",
        "function": "心の活力を除去すること。",
        "manifestation": "暗闇・沈滞として現れること。",
        "proximateCause": "倦怠・懈怠・食後の眠気。",
    },
    "CS_MIDDHA": {
        "characteristic": "眠いこと — 心所の重苦・硬直。",
        "function": "心の活力を覆い隠すこと。",
        "manifestation": "暗闇・沈滞として現れること。",
        "proximateCause": "倦怠・懈怠・食後の眠気。",
    },
    "CS_VICIKICCHA": {
        "characteristic": "疑うこと — 決定できないこと。",
        "function": "迷い・揺れ動き。",
        "manifestation": "猶予・不安定な決定として現れること。",
        "proximateCause": "非如理作意。",
    },
    "CS_SADDHA": {
        "characteristic": "信ずること — 三宝に対する清浄な信心。",
        "function": "心を清浄にし、精進を促すこと。",
        "manifestation": "信受・決定として現れること。",
        "proximateCause": "聴聞または如理作意。",
    },
    "CS_SATI": {
        "characteristic": "念ずること — 対象に注意を向け続けること。",
        "function": "忘れないこと — 対象を保持し続けること。",
        "manifestation": "守護・直面として現れること。",
        "proximateCause": "堅固な想（saññā）または四念処。",
    },
    "CS_HIRI": {
        "characteristic": "恥じること — 悪行を恥ずかしく思うこと。",
        "function": "悪行を抑止すること。",
        "manifestation": "慎みとして現れること。",
        "proximateCause": "世間に対する敬意。",
    },
    "CS_OTTPA": {
        "characteristic": "畏れること — 悪行の結果を恐れること。",
        "function": "悪行を遠ざけること。",
        "manifestation": "恐怖・退避として現れること。",
        "proximateCause": "世間の制裁に対する畏敬。",
    },
    "CS_ALOBHA": {
        "characteristic": "執着しないこと — 対象に貪らないこと。",
        "function": "対象を掴まないこと。",
        "manifestation": "無執着として現れること。",
        "proximateCause": "如理作意。",
    },
    "CS_ADOSA": {
        "characteristic": "怒らないこと — 対象に嫌悪を抱かないこと。",
        "function": "柔和に振る舞うこと。",
        "manifestation": "穏やかさ・慈愛として現れること。",
        "proximateCause": "如理作意。",
    },
    "CS_TATRAMAJJHATTATA": {
        "characteristic": "中立であること — 心と心所を均等に保つこと。",
        "function": "偏りを防ぐこと。",
        "manifestation": "平静・中庸として現れること。",
        "proximateCause": "倶生の心所または如理作意。",
    },
    "CS_KARUNA": {
        "characteristic": "哀れむこと — 他者の苦に心を動かされること。",
        "function": "他者の苦を忍びないこと。",
        "manifestation": "非暴力・害さないこととして現れること。",
        "proximateCause": "他者の苦悩を見ること。",
    },
    "CS_MUDITA": {
        "characteristic": "随喜すること — 他者の幸福を共に喜ぶこと。",
        "function": "他者の成功を喜ぶこと。",
        "manifestation": "悦び・満足として現れること。",
        "proximateCause": "他者の繁栄を見ること。",
    },
    "CS_PANNA": {
        "characteristic": "洞察すること — 諸法の真実性を照らすこと。",
        "function": "無明の暗闇を払うこと。",
        "manifestation": "光明・明瞭な洞察として現れること。",
        "proximateCause": "定（samādhi）または如理作意。",
    },
    "CS_SAMMAVACA": {
        "characteristic": "正しい言葉 — 虚妄・悪口・兩舌・綺語を離れること。",
        "function": "不善な言葉遣いを断つこと。",
        "manifestation": "清浄な言葉として現れること。",
        "proximateCause": "如理作意と正見。",
    },
    "CS_SAMMAKAMMANTA": {
        "characteristic": "正しい行為 — 殺生・偸盗・邪淫を離れること。",
        "function": "不善な身の行為を断つこと。",
        "manifestation": "清浄な身業として現れること。",
        "proximateCause": "如理作意と正見。",
    },
    "CS_SAMMAAJIVA": {
        "characteristic": "正しい生活 — 邪命を離れること。",
        "function": "不正な生計を断つこと。",
        "manifestation": "清浄な生活様式として現れること。",
        "proximateCause": "正語と正業。",
    },
}

# Remaining cetasikas that follow body-mind pair pattern
for _cs_id in [
    "CS_KAYALAHUTA", "CS_CITTALAHUTA",
    "CS_KAYAMUDUTA", "CS_CITTAMUDUTA",
    "CS_KAYAKAMMANNATA", "CS_CITTAKAMMANNATA",
    "CS_KAYAPASSADDHI", "CS_CITTAPASSADDHI",
    "CS_KAYAPAGUNNATA", "CS_CITTAPAGUNNATA",
    "CS_KAYUJUKATA", "CS_CITTUJUKATA",
]:
    CETASIKAS_JA_ASPECTS.setdefault(_cs_id, None)
# These remain unverified — leave for English fallback until
# the specific paired-aspect wording is reviewed by a qualified
# Japanese Theravāda scholar.


# ═══════════════════════════════════════════════════════════════
# 5. RUPAS — four-aspect fields + doctrinalNote
#    Missing: characteristic, function, manifestation,
#    proximateCause, doctrinalNote
# ═══════════════════════════════════════════════════════════════

RUPAS_JA_ASPECTS = {
    "RP_001": {
        # 地界 (Paṭhavī-dhātu)
        "characteristic": "硬さまたは柔らかさ — 物質の堅牢性または柔軟性。",
        "function": "同一の色聚（kalāpa）において他の色法の基盤となること。",
        "manifestation": "身体的接触を通じて硬さ・柔らかさとして感知されること。",
        "proximateCause": "他の三大種（水・火・風）との倶生。",
        "doctrinalNote": "四大種は常に分離不可能に共に生じる。無色界には物質はない。",
    },
    "RP_002": {
        # 水界 (Āpo-dhātu)
        "characteristic": "流動性または凝集性 — 物質を結合させる性質。",
        "function": "他の色法をまとめること。",
        "manifestation": "凝固・結合として現れること。",
        "proximateCause": "他の三大種との倶生。",
        "doctrinalNote": "水界は物質の「まとまり」を維持する。触所縁ではない（身識で直接知覚されない）。",
    },
    "RP_003": {
        # 火界 (Tejo-dhātu)
        "characteristic": "熱さまたは冷たさ — 温度の質。",
        "function": "他の色法を成熟させること、または老化させること。",
        "manifestation": "身体接触を通じて温かさ・冷たさとして感知されること。",
        "proximateCause": "他の三大種との倶生。",
        "doctrinalNote": "火界は物質の成熟と老化の両方に関与する。",
    },
    "RP_004": {
        # 風界 (Vāyo-dhātu)
        "characteristic": "支持性または運動性 — 圧力・移動の質。",
        "function": "他の色法を動かすこと。",
        "manifestation": "身体接触を通じて圧力・動きとして感知されること。",
        "proximateCause": "他の三大種との倶生。",
        "doctrinalNote": "風界は四大の中で最も顕著に知覚される（身的苦楽受の基盤）。",
    },
}
# Remaining rupas (RP_005–RP_028) are left unverified for prose
# fields. Their names and shortNames already exist in the glossary
# (e.g., 眼浄色, 耳浄色, 色所縁, 命根色, etc.). Adding characteristic
# etc. for all 28 would require verified Theravāda commentary prose
# in Japanese that I cannot independently confirm.


# ═══════════════════════════════════════════════════════════════
# 6. KAMMAS — doctrinalNote, examples
# ═══════════════════════════════════════════════════════════════

KAMMAS_JA_DETAIL = {
    "KM_T_01": {
        # 順現法受業 (Diṭṭhadhammavedanīyakamma)
        "doctrinalNote": "現法受業は、まさに今生においてのみ成熟の機会を持つ。もし今世で成熟できなければ、無効業（ahosi-kamma）となる。",
        "examples": [
            "清らかな心で布施し、まさにこの生でその果報を受ける。",
            "五逆罪（父殺し・母殺し・阿羅漢殺し・仏身出血・僧伽分裂）はまさにこの生で地獄に堕ちる。"
        ],
    },
    "KM_T_02": {
        # 順次生受業 (Upapajjavedanīyakamma)
        "doctrinalNote": "次生受業は次の生において必ず成熟する。もし来世で成熟できなければ、無効業となる。",
        "examples": [
            "禅定を成就して来世に色界梵天として結生する。",
            "五近無間業に準ずる重大な不善業。"
        ],
    },
    "KM_T_03": {
        # 順後後受業 (Aparāpariyavedanīyakamma)
        "doctrinalNote": "後後受業は第三生以降のいずれかで成熟する。成熟しない限り無効にならない。",
        "examples": [
            "日常的に行う善行が、遠い来世で果報をもたらす。",
            "長年の修行の業が、数劫後に阿羅漢果として成熟する。"
        ],
    },
    "KM_T_04": {
        # 既有業 (Ahosikamma)
        "doctrinalNote": "無効業は、成熟の機会を逃した業。果報を生じないが、過去の行為の記録としては業の分類に含められる。",
        "examples": [
            "今生で果報を受けるはずだった順現法受業が、条件の欠如で成熟せず無効となったもの。",
            "阿羅漢の最後の生における残存業 — 結生することなく無効となる。"
        ],
    },
    "KM_U_01": {
        # 生産業 (Janakakamma)
        "doctrinalNote": "生産業は結生時に新たな存在を生じさせ、生存中も異熟心・業生色を生じさせる。一切の有情は生産業によって存在する。",
        "examples": [
            "前世の善業が人間界への結生を導く。",
            "不善業が四悪趣への結生を生じさせる。"
        ],
    },
    "KM_U_02": {
        # 支持業 (Upatthambhakakamma)
        "doctrinalNote": "支持業はそれ自体では結生を生じさせないが、生産業の果報を助長・持続させる。",
        "examples": [
            "人間に結生した後、善行が幸福と長寿を継続させる。",
            "悪趣に結生した後、さらなる不善が苦痛を増大させる。"
        ],
    },
    "KM_U_03": {
        # 妨害業 (Upapīḷakakamma)
        "doctrinalNote": "妨害業は生産業の果報を抑圧し、楽や苦の享受を損なう。",
        "examples": [
            "善業で人間に結生したが、妨害業により病気や貧困に苦しむ。",
            "不善業で悪趣に結生したが、過去善業の妨害によりある程度の安楽を得る。"
        ],
    },
    "KM_U_04": {
        # 破壊業 (Upaghātakakamma)
        "doctrinalNote": "破壊業はより強力な力で他の業の果報を完全に断ち切り、自らの果報を生じさせる。",
        "examples": [
            "強大な不善業が天界の果報を断ち、地獄に堕とす。",
            "禅定の善業が過去の不善業の果報を遮断する。"
        ],
    },
    "KM_P_01": {
        # 重業 (Garukakamma)
        "doctrinalNote": "重業は来世の結生先を最優先で決定する。善の重業は禅定、不善の重業は五逆罪。",
        "examples": [
            "禅定を成就している者は、臨終時に禅定の重業が働き色界に結生する。",
            "五逆罪の者は、他に選択の余地なく地獄に堕ちる。"
        ],
    },
    "KM_P_02": {
        # 近死業 (Āsannakamma)
        "doctrinalNote": "重業がない場合、臨終時に記憶される業が次の結生を導く。他人が想起させることもある。",
        "examples": [
            "臨終時に過去に布施した光景が思い出され、善趣に結生する。",
            "屠殺者が臨終時に屠殺の光景を見て、地獄に堕ちる。"
        ],
    },
    "KM_P_03": {
        # 習熟業 (Āciṇṇakamma)
        "doctrinalNote": "重業も近死業もない場合、生涯に反復した習慣的な業が結生を導く。",
        "examples": [
            "毎日のように布施を習慣とする者は、その習熟業により善趣に結生する。",
            "日常的に嘘をつく者は、その習熟業により悪趣に堕ちる傾向がある。"
        ],
    },
    "KM_P_04": {
        # 既作業 (Kaṭattākamma)
        "doctrinalNote": "上記三種がない場合、過去に偶然行った業が結生を導く。意図の弱い行為。",
        "examples": [
            "特に意図せず一度だけ善行を行い、それが遠い来世で結生を導く。",
            "無意識に行った軽微な不善が、条件が揃ったときに果報をもたらす。"
        ],
    },
    "KM_R_01": {
        # 欲界不善業
        "doctrinalNote": "十不善業道が四悪趣への転生因となる。",
        "examples": [
            "殺生・偸盗・邪淫等の身悪行。",
            "妄語・兩舌・悪口・綺語等の口悪行。"
        ],
    },
    "KM_R_02": {
        # 欲界善業
        "doctrinalNote": "十善業道が人間界と六欲天への転生をもたらす。",
        "examples": [
            "布施・持戒・禅修等の善行。",
            "十善業道の遵守により人間に結生する。"
        ],
    },
    "KM_R_03": {
        # 色界善業
        "doctrinalNote": "色界五禅の善心が色界十六梵天への転生因となる。",
        "examples": [
            "初禅の定を成就して梵衆天に結生する。",
            "四禅の定を成就して色究竟天に結生する。"
        ],
    },
    "KM_R_04": {
        # 無色界善業
        "doctrinalNote": "四無色定の善心が無色界四天への転生因となる。",
        "examples": [
            "空無辺処定を成就して空無辺処天に結生する。",
            "非想非非想処定を成就して非想非非想処天に結生する。"
        ],
    },
}
