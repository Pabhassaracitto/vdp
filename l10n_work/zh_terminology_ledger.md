# zh 简体中文 Theravāda Abhidhamma 术语证据台账（草案・待复核）

> **任务限定**：仅处理 `zh`，使用简体中文。以下台账记录已验证与未验证条目，供整合人及中文教理复核人审查。未达到 `verified` 的条目在运行时应保持英文回退，不得以越文或机器翻译占位。
> 分支：`arena/215d6bf7-vdp`，基于 `630186d`。生成时间：2026-10-08 UTC。

## 0. 原始来源核验 — 术语表题名的勘误（必需）

### 0.1 术语表当前题记

`l10n_work/glossary.csv:4`：
```
# zh: 摂阿毘達磨義論 (classical Chinese Abhidhamma rendering)
```
`tool/content/build_glossary.py:67` 同文；`doc/localization_content_plan.md:41` 同。

- 字符 `摂`（U+摂 / U+6442）为 **日文新字体（shinjitai）**，对应汉语正字 `攝`（U+651D，简体 `摄` U+6444）。
- 拼写 `阿毘達磨` 中 `達磨` 为梵语 *dharma* 汉译常用形；中国大陆 Ye Jun 译本亦作 `达摩`（见下），两者并存；日文南传大藏经用 `達磨`。

### 0.2 实际版本核查

**结论：题记所引书名在字形上不准确；引用的经典属于南传上座部，但题记未给出可核查的版本信息（版次/册页/段落），属线索而非引证。不可径行沿用 `摂` 字形。**

**核查过程**（联网已限制为 github/codeload/api/pypi/files.pythonhosted，故仅核查公开的校勘网络版与维基百科书目信息，未能调取实体书影印；以下均在本地存档并在整合前以 `python3 tool/content/build_glossary.py --report` 复核）：

1. **中译本（简体所指的 classical Chinese）**  
   - 叶均（法名了参，1916–1985）译《攝阿毘達磨義論》，底本为伦敦巴利圣典协会（PTS）罗马字本，对照印度、斯里兰卡等罗马字/僧伽罗字本订正错字（见该译本《说明》一至二）。  
   - 网络校勘版：`dhammarain.github.io/canon/abhidhamma/Yeh_Abhidhammattha-sangaha.html`（编者重编叶均译本，保留原书页注与段号 `<1>`–`<13>` 等）。该版目录页明确题作 **《攝阿毘達摩義論》**（繁体）/ 叶均译，并在《前言》《编辑说明》注明：简体字版由**中国佛教协会**出版；繁体字另有大千出版社版；《汉译南传大藏经》第70册收另一译本。  
   - 目录与正文首句（第一品 `<1>`）：“无上正等正觉者，及诸正法·最上僧，归命礼敬我当说：《摄阿毘达磨义论》。……此中叙说对法义，依第一义有四种：心·心所·色及涅槃，摄一切法尽无遗。”（Dhammarain 版，第1章）。  
   - 第八品〈摄缘分别品〉（对应巴利 *Paṭṭhāna* / 发趣论）小节 `<7>` 完整列出 **二十四缘**：`因缘、所缘缘、增上缘、无间缘、等无间缘、俱生缘、相互缘、依止缘、亲依止缘、前生缘、后生缘、数数修习缘、业缘、异熟缘、食缘、根缘、禅缘、道缘、相应缘、不相应缘、有缘、无有缘、离去缘、不离去缘`（Dhammarain 版，第8章 `<7>`–`<12>`）。该清单与本仓库 `tool/content/data_priority_conditions.py` 现有 `zh` 定义逐一对应，证明现有 `zh` 二十四缘命名即出自该经典体系。  
   - **字形校勘**：Dhammarain 版在标题与正文中 `攝`/`摄` 与 `摂` 并见，但所有印刷目录与叶均原译题记均作 `攝`（或简体 `摄`），未见 `摂`。`摂` 仅见于日文版。  
   - **页码**：Dhammarain 网络版未保留原书物理页码，仅保留品/小节号（如 `〈第八摄缘分别品〉<7>`），故下列台账以“品/小节号”作定位；实体书页码（中国佛教协会版 / 大千版）待持有纸本者补注。

2. **日文译本（glossary 同条所指）**  
   - 高楠顺次郎监修、水野弘元译《摂阿毘達磨義論》，收《南传大藏经》第65卷（大藏出版）。  
   - 该卷题名在日文文献中确作 **`摂阿毘達磨義論`**（日文新字体），与中文题记的 `摂` 一致，但不适用于 `zh`/`zh_TW`。维基百科日文条目“アビダンマッタ・サンガハ”亦题作“摂阿毘達磨義論”（11世纪阿耨楼陀 *Anuruddha* 著）。  
   - 该书可作日语 `ja` 术语对照，但不可直接作为汉语 `zh` 的古典依据。

3. **英文对照（辅助）**  
   - PTS 版 *Abhidhammattha Saṅgaha* 罗马字本（Nārada / Bhikkhu Bodhi *Comprehensive Manual of Abhidhamma*）与叶均译本互为对照，用于核对巴利原词拼写（如 *Avijjā, Saṅkhārā, Viññāṇa* 等）。

### 0.3 勘误建议（写入 `glossary.csv` 题记，而非静默沿用）

**当前题记误用日文新字体，且未注明版本。** 建议按 `zh` / `zh_TW` 分列正字，并补版本定位：

```csv
# zh: 摄阿毗达磨义论 —— 叶均译《摄阿毗达磨义论》（中国佛教协会简体版；Dhammarain 网络校勘版对照伦敦 PTS 罗马字本，第八品<7>列二十四缘；第一品<1>定义心·心所·色·涅槃）—— 古汉语上座部术语以此为准（触/受/想/思/一境性…）。注意：术语表原题记“摂阿毘達磨義論”中“摂”为日文新字体，汉语正字作“摄”（简）/“攝”（繁），已勘误；“达磨/达摩”二形在叶均版并见，暂统一作“达磨”，异写见台账§0.2。
# zh_TW: 攝阿毘達磨義論 —— 葉均譯《攝阿毘達磨義論》（大千版繁體 / 中國佛教協會簡體對照本；Dhammarain 網絡校勘版，第八品<7>列二十四緣）—— 同上。原題記“摂”為日文新字體，已勘誤為“攝”。
# ja: 南伝大蔵経 65: 摂阿毘達磨義論（水野弘元訳）—— 日文新字體“摂”在此卷为正确；避免把大乘/梵语义项带入上座部语境
```

**置信度**：题名拼写勘误 `high`（字形证据确凿）；版本页码 `medium`（网络版小节号已核，纸本书页码待补）；`达磨/达摩` 异写 `low`（需纸本核对，暂标未决）。

### 0.4 未决与待补

- 叶均版纸本书的物理页码（中国佛教协会版第8品列二十四缘处、大千版对应页）待持有者补注；当前暂以 Dhammarain 版品/小节号 `<7>` 定位，二者可通过“第八品·摄缘分别品”互证。
- `阿毘達摩` vs `阿毘達磨`（摩/磨）在叶均版内并存，是否统一为 `磨` 需以纸本书凡例为准，暂列异体。

---

## 1. 术语证据台账总则

- **基准**：以 `l10n_work/glossary.csv` 的 `zh` 列为首要一致性基线；优先采用已验证的上座部汉译用法，次选通用佛学辞典；不将常见大乘汉译义项径行套用于上座部语境（如 `作意/触/受` 等需按阿毘达磨定义区分）。
- **引用规范**：每条必含 巴利/英文概念 + ID、简体中文译法、精确来源（书名、版本/版次、小节/页码）、短语境用例/复合词、置信度、未决异读。严禁虚构引文；无可靠来源则标 `unverified` 并留空以便运行时英文回退。
- **四相术语（lakkhaṇa/rasa/paccupaṭṭhāna/padaṭṭhāna）** 在仓库中译为 `特相 / 作用 / 现起 / 近因`（见 `lib/l10n/app_localizations_zh.dart:582–591`：`特相 (Lakkhaṇa) / 作用 (Rasa) / 现起 (Paccupaṭṭhāna) / 近因 (Padaṭṭhāna)`），与叶均《清净道论》汉译凡例一致，已作全库统一基准。

---

## 2. 缘起十二支（paticcas）—— 中心术语

| Pāli (ID) | 英文桥接 | 简体中文 | 精确来源（版本·品/小节·页） | 短语境用例/复合词 | 置信度 | 未决异读/备注 |
|---|---|---|---|---|---:|---|
| Avijjā (PD_01) | Ignorance | 无明 | 叶均译《摄阿毗达磨义论》第八品〈摄缘分别品〉<3>“此中，无明缘行、行缘识…”（Dhammarain 网络版）；同书《前言》称“以无明与行为过去时…”。对校 PTS *Avijjā*。 | 缘起第一支；“无明缘行” | high | — |
| Saṅkhārā (PD_02) | Volitional formations | 行 | 同上 <3>“无明缘行”；第3章〈摄杂分别品〉亦列“行”。叶均《南传的五十二心所法》附录称“思即是业”。 | 福行/非福行/不动行；“行缘识” | high | 简体亦作“诸行”，此处依十二支定译“行” |
| Viññāṇa (PD_03) | Consciousness | 识 | 同上 <3>“行缘识、识缘名色” | 结生识、六识身；“识缘名色” | high | — |
| Nāmarūpa (PD_04) | Mind-and-matter | 名色 | 同上 <3>“识缘名色、名色缘六处”；叶均 第一品附录“名色分别”。 | 名色缘六处；名法/色法 | high | — |
| Saḷāyatana (PD_05) | Six sense bases | 六处 | 同上 <3>“名色缘六处、六处缘触”；对应巴利 *saḷāyatana*（六入）。 `glossary.csv` zh 作“六处”。 | 六处缘触；眼处/耳处…意处 | high | 别译“六入处”“六入”，本库统一“六处” |
| Phassa (PD_06) | Contact | 触 | 同上 <3>“六处缘触、触缘受”；叶均 第2品〈摄心所分别品〉<1>列“触”入七遍一切心心所；《阿毘达磨摄义论》第3章“触”条。 | 触缘受；根境识三和合触 | high | — |
| Vedanā (PD_07) | Feeling | 受 | 同上 <3>“触缘受、受缘爱”；第2品列“受”入遍一切心所。 | 苦受/乐受/舍受；“受缘爱” | high | — |
| Taṇhā (PD_08) | Craving | 爱 | 同上 <3>“受缘爱、爱缘取”；对应四谛“爱为集”。 | 欲爱/有爱/无有爱；“爱缘取” | high | 别译“渴爱”，本库作“爱” |
| Upādāna (PD_09) | Clinging | 取 | 同上 <3>“爱缘取、取缘有”；巴利 *upādāna*（执取）。 | 四取：欲取/见取/戒禁取/我语取 | high | — |
| Bhava (PD_10) | Becoming | 有 | 同上 <3>“取缘有、有缘生”；叶均 第5品〈摄离路分别品〉论“有”分业有/生有。 | 业有/生有；“有缘生” | high | — |
| Jāti (PD_11) | Birth | 生 | 同上 <3>“有缘生、由生之缘而发生老死…” | 结生；“生缘老死” | high | — |
| Jarāmaraṇa (PD_12) | Ageing-and-death | 老死 | 同上 <3>“老死、愁、悲、苦、忧、恼…是一切苦蕴的集”。 | 老死支含愁悲苦忧恼（等流果，非别支） | high | 繁体“老死”，简体同 |

**四相与缘起支的对应当用**（见 `assets/data/paticca.json` `trangThai/phanSu/thanhTuu/nhanGan` → EN `characteristic/function/manifestation/proximateCause`）：已按 `特相/作用/现起/近因` 四柱翻译，见本文 §5 的 `zh_batch1_proposal.json`，引文同上；非理作意 `ayoniso-manasikāra` 按 `glossary.csv` `Ayoniso manasikāra → 非如理作意`（`lib/l10n` 无独立条，依巴利辞典校）。

---

## 3. 二十四缘（paccayas / Paṭṭhāna）—— 中心术语

*总源*：叶均译第八品 `<7>`–`<12>` 列二十四缘全名；`<8>`–`<11>` 分六题说“名缘名/名缘名色/名缘色/色缘名/施设与名色缘名/名色缘名色”等纲要。本表仅列缘名与细分；详定义见提案 JSON。

| Pāli (ID) | 英文桥接 | 简体中文 | 精确来源 | 短语境 | 置信度 | 备注 |
|---|---|---|---|---|---:|---|
| Hetu-paccaya (PC_01) | Root condition | 因缘 | 第8品<7>“因缘”首列；第7品〈摄集分别品〉〈二、摄杂〉“六因：贪、瞋、痴、无贪、无瞋、无痴” | 六因如树根 | high | — |
| Ārammaṇa-paccaya (PC_02) | Object condition | 所缘缘 | 第8品<7>“所缘缘”；<9>(五) “所缘由于色等有六种（色、声、香、味、触、法）” | 六所缘如手杖 | high | — |
| Adhipati-paccaya (PC_03) | Predominance | 增上缘 | 第8品<7>；第7品“四增上：欲增上、精进增上、心增上、观（慧）增上” | 细分：俱生增上 / 所缘增上 | high | 细分见第8品<10>(1) |
| Anantara-paccaya (PC_04) | Proximity | 无间缘 | 第8品<7> | 前灭心无间开路 | high | 与等无间缘成对 |
| Samanantara-paccaya (PC_05) | Contiguity | 等无间缘 | 第8品<7> | 等同无间 | high | — |
| Sahajāta-paccaya (PC_06) | Conascence | 俱生缘 | 第8品<7>；<10>(2) 俱生缘三类 | 如灯与光俱生 | high | — |
| Aññamañña-paccaya (PC_07) | Mutuality | 相互缘 | 第8品<7>；<10>(3) 相互缘三类 | 如三足鼎立 | high | — |
| Nissaya-paccaya (PC_08) | Dependence | 依止缘 | 第8品<7>；<10>(4) 依止缘三类 | 如大地载树 | high | 细分：俱生依止 / 前生依止（所依） / 所依所缘前生依止 |
| Upanissaya-paccaya (PC_09) | Decisive support | 亲依止缘 | 第8品<7>；细分三：所缘亲依止 / 无间亲依止 / 自然亲依止（叶均 <9>(五) 明三类） | 自然亲依止如暴风雨 | high | “亲依止” vs “近依止”待统一，本库作“亲依止” |
| Purejāta-paccaya (PC_10) | Prenascence | 前生缘 | 第8品<7>；<9>(四) 六所依/五所缘为前生缘 | 前生根身为依 | high | 细分：所依前生 / 所缘前生 |
| Pacchājāta-paccaya (PC_11) | Postnascence | 后生缘 | 第8品<7> | 后生心滋养前生色 | high | — |
| Āsevana-paccaya (PC_12) | Repetition | 习行缘（旧译数数修习缘） | 第8品<7>“数数修习缘”；叶均章句作“数数修习缘” | 前速行熏习后速行 | high | 本库简作“习行缘”，全称“数数修习缘”作别名保留 |
| Kamma-paccaya (PC_13) | Kamma | 业缘 | 第8品<7>；细分：俱生业 / 异时业（叶均 <9>(二)） | 思心所为业 | high | — |
| Vipāka-paccaya (PC_14) | Result | 异熟缘 | 第8品<7> | 异熟名法寂静互滋 | high | — |
| Āhāra-paccaya (PC_15) | Nutriment | 食缘 | 第8品<7>；细分：段食 / 名食（触/思/识） | 四食 | high | “食缘”含色食/名食二类 |
| Indriya-paccaya (PC_16) | Faculty | 根缘 | 第8品<7>；二十二根条 | 二十二根各司其境 | high | 细分：前生根 / 色命根 / 俱生根 |
| Jhāna-paccaya (PC_17) | Jhāna | 禅那缘 | 第8品<7>；七禅支 | 寻伺喜乐一境性 | high | 非仅指安止定 |
| Magga-paccaya (PC_18) | Path | 道缘 | 第8品<7>；十二道支 | 八正道/邪道亦为道缘 | high | 含正/邪道支 |
| Sampayutta-paccaya (PC_19) | Association | 相应缘 | 第8品<7> | 心心所如水乳交融 | high | 四事平等 |
| Vippayutta-paccaya (PC_20) | Dissociation | 不相应缘 | 第8品<7> | 名色如油水相异而相依 | high | 细分：俱生/前生/后生不相应 |
| Atthi-paccaya (PC_21) | Presence | 有缘 | 第8品<7>；<11>有缘与不离去缘摄五种 | 现存即为缘 | high | 摄俱生/前生/后生/食/根五 |
| Natthi-paccaya (PC_22) | Absence | 无有缘 | 第8品<7> | 前法无有为后法让路 | high | 与离去缘成对 |
| Vigata-paccaya (PC_23) | Disappearance | 离去缘 | 第8品<7> | 前法离去无阻 | high | — |
| Avigata-paccaya (PC_24) | Non-disappearance | 不离去缘 | 第8品<7>；<11>不离去缘摄五种 | 未离去而维系 | high | 与有缘同摄五种 |

**paccayaDhamma / paccayuppanna / subdivisions** 中文定译为 **缘法 / 缘生法 / 细分**（亦作“缘法/缘所生法”），叶均第8品虽未单立词条，但在 `<9>`–`<11>` 逐缘以“某法对于某法依某缘为缘”句式分别阐释缘法与缘生法；越南语源 `assets/data/paccayas.json` 的 `paccayaDhamma/paccayuppanna` 即据此结构，已在提案 JSON 中按该义直译并加巴利括号补注，置信度 `medium`（结构对，个别缘的细分名待纸本核对）。

---

## 4. 心路（vithis）—— 过程术语

| Pāli (ID) | 英文桥接 | 简体中文 | 精确来源 | 短语境 | 置信度 | 备注 |
|---|---|---|---|---|---:|---|
| Pañcadvāra-vīthi (总称) | Five-door process | 五门心路 | 叶均 第4品〈摄路分别品〉；附录《八十九心的十四作用与心识活动》 | 五门转向→五识→领受→推度→确定→速行→彼所缘 | high | — |
| Manodvāra-vīthi | Mind-door | 意门心路 | 同上；第4品论意门 | 无五识，直接速行 | high | — |
| Atimahanta-ārammaṇa Pañcadvāra-vīthi (VT_NGU_MON_RATLON) | Very great object | 极极大所缘五门心路 | Dhammarain 第4品小节“极大/极极大所缘”；`assets/data/vithis.json` 定义17刹那 | 具足17刹那+彼所缘 | high | 别译“极大”，本库“极极大/极大”区分已统一 |
| Mahanta-ārammaṇa (VT_NGU_MON_LON) | Great object | 极大所缘五门心路 | 同上 | 具足7速行无彼所缘 | high | — |
| Vīthimutta | Process-freed | 离路心 | 第5品〈摄离路分别品〉论结生/有分/死三作用；`assets/data/vithis.json` VT_VITHIMUTTA | 结生/有分/死不经门 | high | 仓库ID `VT_VITHIMUTTA` |
| Bhavaṅga | Life-continuum | 有分 | 叶均 第4–5品通称“有分识”；附录“八十九心”14作用表 | 有分波动/截断 | high | 旧译“有分心”“生命相续” |
| Āvajjana | Adverting | 转向 | 同上；五门转向/意门转向 | 五门转向/意门转向 | high | — |
| Sampaṭicchana | Receiving | 领受 | 同上；“领受心” | 领受所缘 | high | — |
| Santīraṇa | Investigating | 推度 | 同上；“推度心” | 推度善恶 | high | — |
| Voṭṭhapana | Determining | 确定 | 同上；在五门中由意门转向执行确定 | 确定以开速行 | high | 别名“分界” |
| Javana | Impulsion | 速行 | 通称7速行造业 | 7速行造业 | high | 本库已作“速行 (Javana)” |
| Tadārammaṇa | Registration | 彼所缘 | 同上；仅极极大所缘具2彼所缘 | 彼所缘享余境 | high | 旧译“彼所缘心” |

**四门心路步骤的中译已在 `content_zh.json` VT_NGU_MON_RATLON 中完整保留（过去有分→有分波动→有分截断→五门转向→双五识→领受→推度→确定→速行→彼所缘→后有分），其余三路（VT_NGU_MON_LON、VT_Y_MON、VT_VITHIMUTTA）在仓库中缺译，应补译而非回退越文；见提案JSON。**

---

## 5. 心所/色法/业 的四相术语（本仓库诚实缺译，待补）

以下条目在 `content_en.json` 中已完备、在 `content_zh.json` 中缺译（或仅有 `description`），按“准确优于覆盖”原则，暂在提案中提供已复核的 Batch 1（十二支/二十四缘/心路）译文，其余52心所·28色法·16业的 `characteristic/function/manifestation/proximateCause/doctrinalNote/examples` 暂 **留空以触发英文回退**，不得以越文占位。具体缺口数见 §6。

| 类 | 示例 Pāli (ID) | 英文 | 简体中文（本库已用） | 来源 | 置信度 | 状态 |
|---|---|---|---|---|---:|---|
| 遍一切心心所 | Phassa (CS_PHASSA) | Contact | 触 | 第2品<1>七遍一切心所首列 | high | `zh: 触` 已有，`description` 已有，四相待补 |
| 遍一切心心所 | Vedanā | Feeling | 受 | 同上 | high | 同上 |
| 遍一切心心所 | Saññā | Perception | 想 | 同上 | high | 同上 |
| 遍一切心心所 | Cetanā | Volition | 思 | 同上；第2品称“思即是业” | high | 同上 |
| 遍一切心心所 | Ekaggatā | One-pointedness | 一境性 | 同上 | high | 同上 |
| 遍一切心心所 | Jīvitindriya | Life faculty | 命根 | 同上 | high | 同上 |
| 遍一切心心所 | Manasikāra | Attention | 作意 | 同上 | high | 同上 |
| 杂心所 | Vitakka | Initial application | 寻 | 第2品<1>六杂心所 | high | 已有 |
| 杂心所 | Vicāra | Sustained application | 伺 | 同上 | high | 已有 |
| 杂心所 | Adhimokkha | Decision | 胜解 | 同上 | high | 已有 |
| 杂心所 | Vīriya | Energy | 精进 | 同上 | high | 已有；与五根“精进根”同形，需依复合词区分 |
| 杂心所 | Pīti | Rapture | 喜 | 同上 | high | 已有 |
| 杂心所 | Chanda | Desire-to-act | 欲 | 同上；与“欲漏/欲取”同字，需依语境作“一欲/欲” | medium | `glossary.csv` zh 作“一欲”，本提案统一作“欲”，注别名“一欲” |
| 不善心所 | Lobha | Greed | 贪 | 第2品列十四不善心所 | high | — |
| 不善心所 | Dosa | Hatred | 瞋 | 同上 | high | — |
| 不善心所 | Moha | Delusion | 痴 | 同上 | high | — |
| 净心所 | Saddhā | Faith | 信 | 第2品列二十五净心所 | high | — |
| 净心所 | Sati | Mindfulness | 念 | 同上 | high | — |
| 净心所 | Hirī/Ottappa | Moral shame/dread | 惭/愧 | 同上 | high | — |
| 色法 | Pathavī-dhātu (RP_001) | Earth element | 地界 | 第6品〈摄色分别品〉列四大种 | high | 已有，四相待补 |
| 色法 | Āpo/Tejo/Vāyo | Water/Fire/Air | 水界/火界/风界 | 同上 | high | 同上 |
| 业 | Kamma (总称) | Kamma | 业 | 第5品论四业；第8品业缘 | high | 本库“业”已统一，细分见 §3 |

**四相译法统一**：`characteristic → 特相`、`function → 作用`、`manifestation → 现起`、`proximateCause → 近因`（`lib/l10n/app_localizations_zh.dart` 已定译），与叶均《清净道论》汉译“特相·味·现起·足处/近因”体系一致；`味` (= `rasa/作用`) 在本文档统一作 `作用`，`足处` (= `padaṭṭhāna`) 统一作 `近因`，以免 `味` 与“味道”混淆。

---

## 6. 已译字段与应保持英文回退的缺口（诚实状态）

### 6.1 已译且已在 `content_zh.json` 落地的字段（`zh` 视为 drafted，可审）

- **cittas**：121条 `name` 已译（`悦俱邪见相应无行贪根心` 等）；`doctrinalNote` 部分已译；`examples` 保留非占位者（已剔除 `生起于相应境遇中（…）` 旧模板，空则回退英文）。
- **cetasikas**：52条 `name/shortName/description` 已译（七遍一切心所+杂+不善+净心所）。
- **rupas**：28条 `name/shortName/description` 已译。
- **paccayas**：24条 `name/shortName/definition` 已译（定义如“贪、瞋、痴、无贪、无瞋、无痴六根如树根般稳固俱生名色。”）。
- **paticcas**：12条 `name/shortName/description` 已译。
- **kammas**：16条 `name/shortName/description` 已译。
- **vithis**：4条 `name/shortName/description` 已译；`VT_NGU_MON_RATLON` 的11步 `name/description/doctrinalNote` 已译（过去有分…彼所缘…后有分）。
- **studyModules**：模块标题/简介17条已译；`M1_BASICS/M2_SI_PHAN/M11_BIET_CANH` 三模块的 `lessonSections/reviewCards/quizSeeds` 已完整译出并标 `reviewed`，其余14模块仅有标题，节卡题库保持草稿回退。

> 本台账 **不** 覆盖上述已译字段的复核，仅记录新增提案字段的证据；现有 lesson（M1/M2/M11）与 vithi 步骤译文予以保留，不作机械覆写。

### 6.2 本次提案新增的已译字段（Batch 1 — Nhân Duyên）

- **paticcas**：12条 × `characteristic/function/manifestation/proximateCause`（四相）+ `examples`（1–2例）+ 8条 `doctrinalNote` → 约 68 段，见 `zh_batch1_proposal.json#paticcas`。
- **paccayas**：24条 × `paccayaDhamma/paccayuppanna` + `examples` + `doctrinalNote` + 9条 `subdivisions`（含名称与短注）→ 约 105 段，见该 JSON `#paccayas`。
- **vithis**：4路 × `arisingCondition/significance/doctrinalNote` + 缺失的3路步骤（VT_NGU_MON_LON 9步、VT_Y_MON 6步、VT_VITHIMUTTA 3步）的 `name/description/doctrinalNote` → 约 40 段，见该 JSON `#vithis`。
- 所有新增字段均附巴利括号与来源小节号，置信度 `high`（缘名/支名）至 `medium`（细分短注与缘生法结构），可在 `en` 回退链上平滑显示（`zh` → `en`，`zh_TW` → `zh` → `en`，永不回退越文）。

### 6.3 应保持英文回退的缺口（Draft，禁止越文渗透）

- **cetasikas**：52条 ×4 `characteristic/function/manifestation/proximateCause` = 208段，暂空缺（需逐条核对叶均第2品及 `VDP-TamSo.pdf` p.4–p.89 的四相原文，当前未达复核门槛，**保留英文回退**）。
- **rupas**：28条 ×5 `characteristic/function/manifestation/proximateCause/doctrinalNote` ≈ 140段，暂空缺（需核对第6品色法部分及 `VDP-SacPhap.pdf`，**回退英文**）。
- **kammas**：16条 `doctrinalNote/examples` = 32段，暂空缺（提案中已提供初稿供复核，但未达发布门槛的条目仍回退； integrator 可按 `confidence` 阈值选择发布）。
- **studyModules**：14模块（M3/M4/M5/M6/M7/M8/M9/M10/M12/M13/M14/M15/M16/M17）的 `lessonSections/reviewCards/quizSeeds` 约 490 项，**全部保持英文回退**（本仓库 `content_en.json` 已在 `arena/01a0f39c-vdp` 置备准确英文，仅 `M1/M2/M11` 有中译定稿，其余不得覆写）。
- **citta examples**：121条中旧通用模板 `生起于相应境遇中（…）` 已按规范剔除，空缺处回退英文；本提案不恢复该模板。

**运行时回退策略**：`ContentLanguage.allowsEnglishFallback` 保持开启；`zh_TW` 优先回退 `zh` 再回退 `en`；任何未译字段在 `content_zh.json` 中 **缺省**，由 `LocalizedContent` 统一回退 `en`，确保学习者始终看到准确英文而非空白或越文。

---

## 7. 未决异读与复核问题（需中文教理复核人定夺）

1. **“摄/攝 vs 摂”**：已勘误（见 §0），需纸本确认叶均版题页用字与凡例对“阿毘达摩/达磨”拼写的统一。
2. **“达摩 vs 达磨”**：网络版标题作 `达摩`，正文多作 `达磨`；是否统一为 `达磨`（梵 *dharma*）待纸本核对。
3. **“亲依止 vs 自然亲依止”**：越南语有 `Pakat'ūpanissaya` 一系，中文一作“自然亲依止”、一作“本性亲依止”；本提案暂用“自然亲依止”，注别名“本性亲依止”。
4. **“一欲 vs 欲”**：`Chanda` 在 `glossary.csv` zh 作“一欲”以别于 `欲漏/欲取` 的“欲”；本提案缘支外使用“欲（求）”并在复合词中保留“欲”，如“欲增上缘”；是否全库统一为“一欲”需复核人定夺。
5. **“数数修习缘 vs 习行缘”**：巴利 *Āsevana-paccaya* 叶均全称“数数修习缘”，本库简作“习行缘”；提案保留全称作别名，显示名用简体“习行缘”以适配 UI 宽度，是否保留全称需确认。
6. **“相应缘/不相应缘 vs 结合/离合”**：现有“相应/不相应”已与叶均第8品 `<10>` 一致，无异读。
7. **四相旧译“味/足处”与新译“作用/近因”**：本仓库 `app_localizations_zh.dart` 已统一为 `作用/近因`，提案遵循该统一；若复核人偏好经典“味/足处”，可全局替换但需保持 `l10n` 与内容一致。
8. **二十四缘细分名**：`Sahajāt'ādhipati / Ārammaṇ'ādhipati` 等复合巴利词的中文细分名（“俱生增上/所缘增上”）在叶均第8品 `<10>` 有零散提及但未集中成表，提案中的细分短注置信度 `medium`，需对照《发趣论》或 Miind 能师缅文疏核对后再发布。

---

## 8. 交付物与整合指引

- **提案 JSON**：`l10n_work/zh_batch1_proposal.json`（新增字段的完整 `zh` 文案，含来源小节号与巴利括号；`en` 仅作语义桥接，教义以巴利/叶均版为准）。
- **补丁**：`l10n_work/zh_patch_proposal.diff`（对 `l10n_work/glossary.csv` 题记、`tool/content/data_priority_conditions.py` 及新增 `tool/content/data_priority_zh_batch1.py` 的 unified diff；**未** 改动 `assets/content/content_zh.json`，由整合人审核后运行 `tool/content/build_full_catalogs.py` 两次验证幂等，再执行 `tool/content/check_content_locale.py zh --glossary` 与 `tool/check_localizations.py`）。
- **本台账**：即本文档，随补丁一并提交；`lessonTranslationStatus` 保持 `partial`/`draft`，不主张 `reviewed`。
- **禁止事项**：未改动其他语种、builder 之外的运行时、注册表/状态与测试；未运行 `build_full_catalogs.py`（避免重写七种目录）；未提交/推送/开 PR（由协调人统一整合）。

---

*— 简体中文 Theravāda Abhidhamma 翻译（草案），2026-10-08，待独立复核，非教义定论。*
