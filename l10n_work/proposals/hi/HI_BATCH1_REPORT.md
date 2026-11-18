# VDP · Hindi (`hi`) — Batch 1 proposal (Nhân Duyên) — report for integrator

Status: **PROPOSAL, not integrated.** Nothing in `assets/content/`, `tool/content/build_*`, Dart, tests, registry, or other locales was changed. No commit, branch, or PR. `build_full_catalogs.py` was **not** run.

Deliverables (all under `l10n_work/proposals/hi/`, untracked):

| File | Purpose |
|---|---|
| `hi_batch1_nhanduyen.patch` | Unified diff adding `tool/content/data_priority_hi_conditions_detail.py` (new file). Verified: `git apply --check` passes on a clean `HEAD` archive. |
| `data_priority_hi_conditions_detail.py` | Same module as the patch (source of truth for review). |
| `HI_BATCH1_REPORT.md` | This report (ledger + coverage + wiring). |

---

## 1. Scope delivered and not delivered

| Batch | Scope | Status |
|---|---|---|
| **1 — Nhân Duyên** | paticcas: 4 aspects + doctrinalNote + examples (12 items). paccayas: paccayaDhamma, paccayuppanna, doctrinalNote, examples, subdivisions (24 items, 25 subdivisions). vithis: process context (4) + every step name/description/doctrinalNote (29 steps). | **Done as proposal** (except fields in §4 kept on English). |
| 2 — Study entities | cittas examples (EN 12), cetasikas four-aspect fields (EN 52 × 4), rupas doctrinalNote (EN 23), kammas doctrinalNote/examples | **Not started.** |
| 3 — Study modules | EN: 93 lesson sections, 246 review cards, 233 quiz seeds across 17 modules; Hindi currently has 0 of each. EN bodies are now real (0 placeholders), so they are translatable. | **Not started.** Recommended as Batch 2/3 follow-up; too large to review to bar in this batch. |

Existing good Hindi was preserved: all 12 paticca name/shortName/description, 24 paccaya name/shortName/definition, 4 vithi name/shortName/description, and the existing step names for steps 1–11 of `VT_NGU_MON_RATLON` (with the corrections in §3).

## 2. Source verification — honest status

* The glossary names the Hindi baseline as Rewata Dhamma, *Abhidharma Prakasini* (Hindi, Varanasi 1967). The sandbox can reach only github/npm/pypi hosts for shell; a web search located a Hindi scan of the Abhidhammattha Sangaha with Rewata Dhamma's Hindi commentary on archive.org (item `abhidhammaatthasangoofanuruddhaacharyawithabhdarmavimarshinibhadantarewatadhamma_624_A`, ~1 GB). Only its landing page could be read; **no OCR text was accessible**.
* **Therefore no Hindi term is verified against the 1967 edition, and no page/section citation is given.** Confidence below reflects glossary agreement + Vietnamese source + Pāḷi usage only.
* Terms follow the glossary `hi` column wherever one exists. Where the glossary is Sanskritized or inconsistent, the Pāḷi sense is noted and the form is flagged (§3).

## 3. Terminology evidence ledger (Batch 1 terms)

Columns: Pāḷi/English · ID · Hindi used · Source/glossary check · Context in this batch · Confidence · Variant / open question.

| Pāḷi / English | ID | Hindi used | Source check | Context | Conf. | Variant / open question |
|---|---|---|---|---|---|---|
| Avijjā / Ignorance | PD_01 | अविद्या | glossary `hi` ✔ (not edition-verified) | characteristic, anamatagga note | M | Sanskritized; Pāḷi अविज्जा. Glossary form kept. |
| Saṅkhārā / Volitional formations | PD_02 | संस्कार | glossary ✔ | = cetanā-cetasika (VI note) | M | Sanskritized; Pāḷi सङ्खार. |
| Viññāṇa / Consciousness | PD_03 | विज्ञान | glossary ✔ | rebirth-linking | M | Sanskritized; Pāḷi विञ्ञाण. |
| Nāmarūpa / Mind and matter | PD_04 | नाम-रूप | glossary ✔ | six bases develop | M-H | — |
| Saḷāyatana / Six sense bases | PD_05 | षडायतन | glossary ✔ | — | M-H | — |
| Phassa / Contact | PD_06, CS_PHASSA | स्पर्श | glossary (cetasika) ✔ | — | H | Pāḷi फस्स. |
| Vedanā / Feeling | PD_07 | वेदना | glossary ✔ | — | H | — |
| Taṇhā / Craving | PD_08 | तृष्णा | glossary ✔ | दुःख-समुदय | M | Pāḷi तण्हा. |
| Upādāna / Clinging | PD_09 | उपादान | glossary ✔ | — | H | — |
| Bhava / Becoming | PD_10 | भव | glossary ✔ | — | H | — |
| Jāti / Birth | PD_11 | जाति | glossary ✔ | — | H | — |
| Jarāmaraṇa / Ageing and death | PD_12 | जरा-मरण | glossary ✔ | — | H | — |
| Paṭiccasamuppāda | (note) | प्रतीत्यसमुत्पाद | glossary ✔ | notes | M | Sanskritized; Pāḷi पटिच्चसमुप्पाद. Decision for Hindi editor. |
| Hetu / Root | PC_01 | हेतु (existing) | existing ✔ | — | H | — |
| Ārammaṇa / Object | PC_02 | आलम्बन (existing) | existing; Sanskrit *ālambana* | — | M | Pāḷi ārammaṇa; "आरम्मण" is the Pāḷi-form alternative. |
| Adhipati / Predominance | PC_03 | अधिपति (existing) | existing | — | M | — |
| Chanda / Desire-to-act | PC_03 | छन्द | glossary (cetasika) ✔ | conascent dominant | H | — |
| Vīriya / Energy | PC_03 | वीर्य | glossary ✔ | conascent dominant | H | — |
| Vīmaṃsā (= paññā) | PC_03 | मीमांसा (प्रज्ञा) | **not in glossary** | conascent dominant | L | Unglossed. Glossary has Paññā → प्रज्ञेन्द्रिय (faculty) only. Needs decision. |
| Paññatti (VI "chế định") | PC_02 | प्रज्ञप्ति | **not in glossary** | object list | L | EN bridge says "meditative attainments"; **VI says chế định (paññatti)**. Hindi follows VI. See §5. |
| Nibbāna | PC_02, PD_08 | निर्वाण | not individually checked | — | M | — |
| Sahajāta / Conascence | PC_06 | सहजात (existing) | existing | — | M | — |
| Aññamañña / Mutuality | PC_07 | अन्योन्य (existing) | existing | — | M | — |
| Nissaya / Dependence | PC_08 | निश्रय (existing name) | existing; **not in glossary** | subdivisions | L-M | Existing name `निश्रय` kept (EN bridge "dependence"); Pāḷi nissaya. |
| Upanissaya / Decisive support | PC_09 | उपनिश्रय (existing name) | existing; not in glossary | subdivisions | L-M | Same. |
| Purejāta / Prenascence | PC_10 | पुरेजात (existing) | existing | — | M | — |
| Pacchājāta / Postnascence | PC_11 | पश्चाज्जात (existing) | existing | — | M | Existing form kept. |
| Āsevana / Repetition | PC_12 | आसेवन (existing) | existing | — | M | — |
| Javana | VT, PC_12 | जवन | glossary ✔ | — | H | — |
| Kamma / Kamma condition | PC_13 | कर्म | glossary ✔ | — | H | Sanskritized; Pāḷi कम्म. |
| Cetanā / Volition | PC_13 | चेतना | glossary ✔ | — | H | — |
| Vipāka / Result | PC_14 | विपाक | glossary ✔ | — | H | — |
| Āhāra / Nutriment | PC_15 | आहार (existing); कवलीकार आहार (existing defn) | existing; `कवलीकार` **not in glossary** | — | M | Unglossed compound. |
| Mahābhūta | PC_06/07/08 | महाभूत | glossary ✔ (चार महाभूत) | — | H | — |
| Upādāya rūpa | PC_08 | उपादाय रूप | glossary ✔ | — | H | — |
| Indriya / Faculty | PC_16 | इन्द्रिय (existing); जीवितिन्द्रिय | glossary (cetasika) `जीवितिन्द्रिय` ✔ | — | H | Glossary spelling **जीवितिन्द्रिय** used (not जीवितेन्द्रिय). |
| Jhāna / Jhāna-factor | PC_17 | **ध्यान** (existing name ध्यान प्रत्यय; glossary `Jhāna → ध्यान`) | glossary ✔ | — | M | **Sanskritized.** Pāḷi झान is the Theravāda form; glossary chooses ध्यान. Flag. |
| Vitakka / Vicāra / Pīti / Ekaggatā | PC_17 | वितर्क / विचार / प्रीति / एकाग्रता | glossary ✔ | jhāna factors | H | — |
| Domanassa | PC_17 | दौर्मनस्य | glossary ✔ | (ưu) | H | — |
| Upekkhā | PC_17 | उपेक्षा | glossary (Upekkhā-sahagataṃ) ✔ | — | H | — |
| Magga / Path | PC_18 | मार्ग (existing) | glossary (Magga citta → मार्ग चित्त) ✔ | — | H | Sanskritized; Pāḷi magga is the same word. |
| Sammā-diṭṭhi … Sammā-samādhi | PC_18 | सम्यक् दृष्टि, सम्यक् संकल्प, सम्यक् वाक्, सम्यक् कर्मान्त, सम्यक् आजीव, सम्यक् व्यायाम, सम्यक् स्मृति, सम्यक् समाधि | keyTerm ✔ but **cetasika glossary has 'सम्यग्वाक्', 'सम्यगाजीव', 'सम्यक्-कर्मान्त' (hyphen/spelling variance)** | — | M | **Internal glossary variance**: sammā-vācā appears as `सम्यक् वाक्` (keyTerm) and `सम्यग्वाक्` (cetasika). Used keyTerm form. |
| Micchā-diṭṭhi etc. | PC_18 | मिथ्या दृष्टि … | standard Hindi | — | M | Unglossed. |
| Sampayutta / Association | PC_19 | सम्प्रयुक्त (existing) | existing | — | M | Pāḷi sampayutta. |
| Vippayutta / Dissociation | PC_20 | विप्रयुक्त (existing) | existing; glossary `Diṭṭhigatavippayuttaṃ → दृष्टिविप्रयुक्त` ✔ | — | H | — |
| Atthi / Natthi (presence / absence) | PC_21–22 | अस्ति / नास्ति (existing) | existing | — | M | Existing names used (not Pāḷi अत्थि/नत्थि). |
| Vigata / Avigata | PC_23–24 | विगत / अविगत (existing) | existing | — | M | — |
| Bhavaṅga / life-continuum | VT | भवङ्ग | glossary ✔ | — | H | — |
| Bhavaṅgupaccheda / arrest | VT | भवङ्गुपच्छेद | existing ✔ (not in glossary) | — | M | — |
| Bhavaṅga-calana / vibrating | VT | भवङ्ग चलन | existing; unglossed | — | M | — |
| Pañcadvārāvajjana / five-door adverting | VT | पञ्चद्वारावर्जन | glossary ✔ | — | H | **Sanskritized** `आवर्जन`; Pāḷi *āvajjana* → आवज्जन. Glossary form kept. |
| Manodvārāvajjana | VT | मनोद्वारावर्जन | glossary ✔ | — | H | As above. |
| Dvipañcaviññāṇa | VT | द्वि-पञ्चविज्ञान | glossary ✔ | — | H | — |
| Sampaṭicchana | VT | सम्प्रतीच्छन चित्त | glossary ✔ | — | H | **Conflicts with existing `सम्पटिच्छन` in content_hi**; glossary used. |
| Santīraṇa | VT | सन्तीरण चित्त | glossary ✔ | — | H | **Conflicts with existing `सन्तिरण`**; glossary used. |
| Voṭṭhapana (determining) | VT | व्यवस्थान | glossary ✔ (`Voṭṭhapana → व्यवस्थान`) | — | M | **Conflicts with existing `वोट्ठपन (व्यवस्थापन)`** and the Pāḷi name. Glossary used; decision for editor. |
| Tadārammaṇa | VT | तदालम्बन (existing) | existing; unglossed | — | M | — |
| Vīthi / Cittavīthi | VT | वीथि / चित्त-वीथि | glossary ✔ | — | H | — |
| Vīthimutta | VT | वीथिमुक्त | glossary ✔ | — | H | — |
| Paṭisandhi / rebirth-linking | VT, PD_03 | प्रतिसन्धि (चित्त/विज्ञान) | glossary ✔ | — | H | — |
| Cuti / death-consciousness | VT | च्युति चित्त | **not in glossary** | — | L | Unglossed; needs decision. |
| Dvihetuka / Tihetuka | VT | द्विहेतुक पुद्गल / त्रिहेतुक पुद्गल | glossary ✔ | — | H | — |
| Manokamma | VT | मनोकर्म | glossary ✔ | — | H | — |
| Abyākata-vipāka (VI "Quả Vô Ký") | VT | अव्याकृत विपाक-चित्त | **not in glossary** | — | L | Unglossed. |
| Satipaṭṭhāna (VI "Tứ Niệm Xứ") | PD_07 | स्मृति-उपस्थान (सतिपट्ठान) | **not in glossary** | — | L-M | Unglossed; Pāḷi form given in parentheses. |
| Anamatagga / ayoniso-manasikāra | PD_01 | अनमतग्ग / अयोनिसो-मनसिकार | **not in glossary** | — | L-M | Unglossed Pāḷi transliterations. |
| Sabbacittasādhāraṇa (VI "Biến hành") | VT | सार्वत्रिक (चैतसिक) | **not in glossary** | — | L-M | Unglossed. |

**Glossary defects to report to the glossary owner (not silently fixed):**
1. `Puññābhisaṅkhāra → पुष्याभिसंस्कार` and `Apuññābhisaṅkhāra → अपुष्याभिसंस्कार`: the Hindi appears to use पुष्य (a different word) for पुण्य. Not used in this batch.
2. `Voṭṭhapana → व्यवस्थान` vs. existing content `वोट्ठपन`.
3. `Sammā-vācā` appears as both `सम्यक् वाक्` (keyTerm) and `सम्यग्वाक्` (cetasika).
4. `Jhāna → ध्यान` is Sanskritized; the Pāḷi (`झान`) has the Theravāda tradition behind it. Decision needed.

## 4. Coverage — translated vs. left on English fallback

Measured against English reference (EN) field presence, simulated merge into a scratch copy (not shipped):

| Section | Fields | Translated (proposal) | Left on English |
|---|---|---|---|
| paticcas (12) | characteristic, function, manifestation, proximateCause, doctrinalNote, examples | **68/68** (EN-present slots) | — |
| paccayas (24) | paccayaDhamma, paccayuppanna, doctrinalNote, examples | **90/96** | `PC_02.paccayuppanna`, `PC_03.paccayuppanna` (VI ? / truncated "trừ tâm không bắt cảnh" / "…"); `PC_11.paccayaDhamma`, `PC_12.paccayaDhamma` (VI "?" then "chính xác" self-correction); `PC_16.paccayaDhamma` (VI list truncated "…"); `PC_15.doctrinalNote` (external citation SN 12.63, unverified) |
| paccayas subdivisions | name, note | **25/25** (all subdivision keys) | — |
| vithis (4) | arisingCondition, significance, doctrinalNote | **12/12** | — |
| vithis steps (29) | name, description, doctrinalNote (as EN-present) | **all 29 steps** | — |

Unchanged (existing, preserved): paticca name/shortName/description; paccaya name/shortName/definition; vithi name/shortName/description.

Validator (read-only): `check_content_locale.py hi --glossary` on shipped `content_hi.json` = **717 / 4312 (16.6%)**, PASS. On the simulated merge = **975 / 4312 (22.6%)**, PASS, no glossary failures.

## 5. Corrections and issues found in existing content / English bridge (for owners)

1. **CJK leak in shipped `content_hi.json`:** `vithis.VT_NGU_MON_RATLON.steps.4.doctrinalNote = "अहेतुक क्रिया意界।"`. Corrected in the proposal to `CI_028 — उपेक्षा वेदना, 11 चैतसिक। कोई कर्म नहीं बनता।`. The builder currently re-reads this file for steps, so the fix must be applied through the table (§6).
2. **Unsupported Hindi additions removed:** `VT_NGU_MON_RATLON.steps.2.doctrinalNote = "बाह्य विषय के प्रभाव का आरंभ।"` and `steps.11.doctrinalNote = "जीवन-सातत्य।"` have no EN/VI counterpart; not carried forward.
3. **EN bridge vs. VI source (paccayas):** `PC_02` EN says ārammaṇa list includes "meditative attainments"; VI says "gồm cả Niết-bàn và chế định" (paññatti). Hindi follows VI (प्रज्ञप्ति). **EN owner should correct.**
4. **EN bridge count claim:** `VT_NGU_MON_RATLON` description says "2 vibrating and 1 arresting bhavaṅga", but the source step table has one `Bhavaṅga-calana` step (repeatCount 1). Hindi keeps the description as-is and does not invent a step. **Source/EN owner to reconcile.**
5. **Source self-corrections unresolved:** VI `PC_02`, `PC_03`, `PC_11`, `PC_12` and `PC_16` contain `?` / `chính xác` / `…` markers; EN states clean numbers that the VI does not fully support. Left on English until the Vietnamese author confirms.
6. **Ambiguous PC_02 claim:** EN "All 89 cittas" for ārammaṇa uppanna conflicts with VI "89 tâm (trừ … ?)". Not translated.

## 6. Builder wiring the integrator must add (builder NOT changed here)

`tool/content/build_full_catalogs.py` currently emits only name/shortName/description (paticca), name/shortName/definition (paccaya), and name/shortName/description (vithi, plus steps from the existing `content_hi.json`). To ship this batch the integrator should:

1. `import tool.content.data_priority_hi_conditions_detail as dhi` and, for `loc == "hi"`, merge:
   * `paticcas[pid].update(dhi.HI_PATICCAS[pid])` (only when present)
   * `paccayas[pid].update({k: v for k, v in dhi.HI_PACCAYAS[pid].items() if k != "subdivisions"})` and set `paccayas[pid]["subdivisions"] = dhi.HI_PACCAYAS[pid]["subdivisions"]`
   * `vithis[vid].update({k: v for k, v in dhi.HI_VITHIS[vid].items() if k != "steps"})`, and for each step `steps_map[sn] = {**existing, **dhi.HI_VITHIS[vid]["steps"][sn]}`.
2. Make the table win over `existing_vithi_step_translation` for `hi` so the `意界` value is not re-imported from `content_hi.json`. (The old value is only re-read from the existing file.)
3. Keep `allowsEnglishFallback` as is. Nothing here changes runtime fallback.

Runtime check: the Dart call sites (`lib/core/localization/localized_content.dart`) read `paccayaDhamma`, `paccayuppanna`, `doctrinalNote`, `examples`, `subdivisions[*].name/note`, `paticcas[*].characteristic/function/manifestation/proximateCause/doctrinalNote/examples`, and `vithis.arisingCondition/significance/doctrinalNote/steps[*].name/description/doctrinalNote`. Field names match.

## 7. Validation not run / not claimed

* `build_full_catalogs.py` (forbidden for this agent), `flutter analyze`, `flutter test`, `check_localizations.py`: **not run**. The coordinator should run them after integration.
* Patch apply-check and simulated merge: run and passing (see §4).
* No Dart, builder, registry, or other-locale file was touched.

## 8. Questions for the native / Hindi doctrinal reviewer

1. Confirm the Hindi edition's form for *Voṭṭhapana* (व्यवस्थान vs. वोट्ठपन), *Āvajjana* (आवर्जन vs. आवज्जन), and *Sampaṭicchana / Santīraṇa* (glossary forms vs. existing).
2. Decide Sanskritized vs. Pāḷi forms for the core terms (अविद्या/अविज्जा, संस्कार/सङ्खार, विज्ञान/विञ्ञाण, कर्म/कम्म, ध्यान/झान, प्रतीत्यसमुत्पाद/पटिच्चसमुप्पाद). The glossary currently chooses Sanskritized forms.
3. Provide the Hindi term for *Vīmaṃsā* (in the paccaya list) and for *Paññatti* (object list), and whether *Cuti* / *Abyākata-vipāka* / *Satipaṭṭhāna* have settled Hindi renderings.
4. Confirm the Hindi form of the four sammā / four-factor names (glossary has two variants).
5. Confirm the Vietnamese author's intent for PC_02/03/11/12/16 (see §4, §5).
