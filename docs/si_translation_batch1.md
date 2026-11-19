# Sinhala (si) translation — Batch 1 (Nhân Duyên) and gap review

Status: **draft, not reviewed**. The si locale stays `draft` with English fallback on.
Nothing here marks any locale as reviewed.

## 1. What changed in this batch

| File | Change | Ships through builder? |
|---|---|---|
| `tool/content/data_priority_conditions.py` | 14 si field corrections (see §2) | Yes. `build_full_catalogs.py` emits these fields. |
| `tool/content/data_priority_si_detail.py` (new, Batch 1) | Four-aspect fields for 12 paticca factors; `paccayaDhamma` / `paccayuppanna` for 23 paccayas | **No.** The builder does not read this module yet. See §5. |
| `tool/content/data_priority_si_detail_notes.py` (new, Batch 1 and 2 remaining fields) | Paccaya examples, subdivisions and doctrinalNote; paticca examples and doctrinalNote; rupa, kamma and vithi doctrinalNote | **No.** Same integration as Batch 1. See §5. |
| `tool/content/data_priority_si_detail_cittas.py` (new, Batch 2) | `doctrinalNote` for all 121 cittas (template sentence, see §3d) | **No.** Same integration as Batch 1. See §5. |
| `tool/content/data_priority_si_detail_vithi.py` (new, Batch 1) | Steps for VT_NGU_MON_LON (9), VT_Y_MON (6), VT_VITHIMUTTA (3) | **No.** Same integration as Batch 1. See §5. |
| `tool/content/data_priority_si_detail_b2.py` (new, Batch 2) | Four-aspect fields for 52 cetasikas and 28 rupas; examples for 12 cittas and 16 kammas; `arisingCondition` / `significance` for 4 vithis | **No.** Same integration as Batch 1. See §5. |
| `docs/si_translation_batch1.md` (this file) | Ledger, coverage, questions | No |

Not touched: `assets/content/content_si.json` (generated; the coordinator regenerates it), the builder, other locales, fallback code, the registry, tests, and any PR or branch metadata.

Verification run in this session:
- `build_catalog('si')` run in a scratch copy only (not written to the repo). It differs from the committed `content_si.json` in exactly the 14 leaves listed in §2.
- `check_content_locale.py si --glossary` on the rebuilt scratch catalog: exit 0, `717/4312 slots, 16.6%`. The slot count is unchanged because these are corrections, not new fields.
- Not run: `build_full_catalogs.py` against the repo, `check_localizations.py`, `subset_fonts.py`, `flutter analyze` / `flutter test`.

## 2. Corrections to existing si entries (shipped via builder)

Each change was checked against the Abhidharma Chandrikava (Mātara Sri Dhammavamsa Thera, pitaka.lk), page labels in brackets.

| ID | Field | Before | After | Reason |
|---|---|---|---|---|
| PC_07 | definition | තුන්පයින් සිටි මුට්ටියක් | ත්‍රීදණ්ඩය (කත්තිරික්කය) … | Source simile is the three-stick tripod [9-14]. "Pot on three legs" was not in the source. |
| PC_09 | definition | බලවත් හේතුවක් … | ඉතා බලවත් නිශ්‍රය වශයෙන් … | Source defines upanissaya as "very strong nissaya" [9-14]. |
| PC_13 | name | කම්ම ප්‍රත්‍යය | කර්ම ප්‍රත්‍යය | Glossary: Kamma = කර්ම. |
| PC_17 | definition | …අරමුණෙහි තදින් ඇලවීම… | ධ්‍යානාංග අරමුණ කරා එළඹ මැනවින් බලන ආකාරයෙන් … | Source: jhāna = closely looking at the object, mountain-top simile [9-16]. |
| PC_18 | definition | නිවන කරා හෝ යම් ගතියක් … | සුගති, දුර්ගති හෝ නිර්වාණයට … | Source: path leads to good/bad destination or nibbāna [9-16]. |
| PC_19 | definition | දිය සහ කිරි මෙන් … | එකම වස්තුව, එකම අරමුණ, … චතුමධුරය … | Source simile is the four sweets (catumadhura) [9-16]. |
| PC_20 | definition | දිය සහ තෙල් මෙන් … | ෂඩ්රසය … | Source simile is the six tastes, sweet and sour mixed but not fused [9-17]. |
| PD_03 | shortName | විඤ්ඤාණය | විඥානය | Glossary: Viññāṇa = විඥාන; source uses විඥාන [9-17]. |
| PD_03 | description | …විඤ්ඤාණය… | …විඥානය… | Same. |
| PD_06 | shortName | ස්පර්ශය | ඵස්ස | Glossary: Phassa = ඵස්ස. |
| PD_06 | description | …විඤ්ඤාණය… | …විඥානය… | Same as PD_03. |
| PD_07 | description | ස්පර්ශයෙන් … | ඵස්සයෙන් … | Same as PD_06 (name form). |
| PD_08 | shortName | තෘෂ්ණාව | තණ්හාව | Glossary: Taṇhā = තණ්හා. |
| KM_P_01 | description | …පංචානන්තර්ය හෝ ධ්‍යාන | …නියත මිථ්‍යාදෘෂ්ටිය, පඤ්චානන්තරිය හෝ මහග්ගත කුසල් | Source garuka = niyata micchādiṭṭhi, pañcānantariya, mahaggata kusala [6-6]. |

Note on KM_P_01: the new wording lists the source's three garuka classes. Native review should confirm the Sinhala term for "niyata micchādiṭṭhi" (see §7, Q8).

## 3. Batch 1 translations (in `data_priority_si_detail.py`, not yet shipped)

- **Paticca four aspects (PD_01–PD_12, 48 fields).** Each field is a Sinhala rendering of the English reference in `content_en.json`. The Sinhala source for these passages was **not** checked (see §6). Mark as unverified draft.
- **Paccaya `paccayaDhamma` / `paccayuppanna` (PC_01–PC_24 except PC_11, 46 fields).** Lists and relations were checked against Chandrikava 9-13, 9-14, 9-16, 9-17 where those pages were read. PC_11 is left to English because the English count ("85 cittas") could not be checked against a Sinhala source. PC_12 and PC_10 were checked only against the English reference and the existing definitions. Treat as unverified.
- **Left to English fallback in this batch:** paccaya `examples` (48 items), `subdivisions` (9 items), paccaya `doctrinalNote` (24), paticca `doctrinalNote` (12) and `examples` (12), and the PC_11 pair above.

## 3b. Batch 2 translations (in `data_priority_si_detail_b2.py`, not yet shipped)

- **Cetasikas (52 × 4 = 208 fields)** and **rupas (28 × 4 = 112 fields)**: the four aspects, rendered from the English reference. Key coverage checked against `content_en.json`: no missing or extra IDs, no empty values.
- **Cittas examples (12 entries, 18 items):** the akusala cittas that have English examples. Translated as written in the English reference.
- **Kamma examples (16 entries, 32 items):** translated as written in the English reference. Doctrinal claims such as the realm of rebirth are the council's to check.
- **Vithi `arisingCondition` / `significance` (4 × 2 = 8 fields).**
- **Not translated in Batch 2:** rupa `doctrinalNote` (28; several English notes are specific claims, for example about Brahmās' faculties, that need a source before translation); cetasika `doctrinalNote` is not in the data.

Status for all of 3b: **unverified draft**. The English reference is the only text these were rendered from. Sinhala commentary or Abhidharmārtha Saṅgraha was not checked.

## 3c. Remaining example, subdivision and doctrinalNote translations (`data_priority_si_detail_notes.py`, not yet shipped)

Translated from the English fields in `content_en.json` (same status as §3: draft, unverified, not read by the builder):

- **Paccaya examples:** 40 items across 23 paccayas (PC_01–PC_24, except PC_11).
- **Paccaya subdivisions:** 25 keys across 9 paccayas, Pāḷi keys unchanged, with `name` and `note` in Sinhala.
- **Paccaya doctrinalNote:** 22 entries (PC_01–PC_24, except PC_11 and PC_15).
- **Paticca examples:** 15 items across 12 paticcas (PD_01–PD_12).
- **Paticca doctrinalNote:** 7 entries (PD_01, 02, 03, 06, 07, 08, 12).
- **Rupa doctrinalNote:** 21 entries (all except RP_002 and RP_022).
- **Kamma doctrinalNote:** 14 entries (all except KM_R_01 and KM_R_04).
- **Vithi doctrinalNote:** 3 entries (all except VT_Y_MON).

Key sets were checked against `content_en.json`. Each missing key is one of the intentional English exclusions in §8.

## 3d. Citta doctrinalNote and vithi steps (not yet shipped)

- **Citta doctrinalNote (121):** the English note is a fixed template: name, group, accompanying feeling, canonical Pāḷi designation. The Sinhala sentence reuses the committed si citta name (`content_si.json`) and maps the group and feeling words:
  - Groups: unwholesome → අකුසල්; rootless → අහේතුක; sobhana_kamavacara → සෝභන කාමාවචර; fine-material-sphere → රූපාවචර; immaterial-sphere → අරූපාවචර; supramundane → ලෝකෝත්තර.
  - Feelings: joy → සෝමනස්ස; equanimity → උපෙක්ඛා; pleasure → සුඛ; pain → දුක්ඛ. The spellings follow the committed citta names.
  - The Pāḷi designation is copied verbatim from English.
  - Status: template output, a direct rendering of the English sentence. The group and feeling assignments come from the English data and are not re-checked against a source.
- **Vithi steps (18):** VT_NGU_MON_LON (9), VT_Y_MON (6), VT_VITHIMUTTA (3). Step names reuse the committed VT_NGU_MON_RATLON wording. Checked against Chandrikava 5-3, 5-6 and 5-9 (see §3f). No step-level doctrinalNote for VT_Y_MON 3–4 and VT_VITHIMUTTA 1 (§8).

## 3e. Study module pilots: M1_BASICS, M2_SI_PHAN, M3 (not yet shipped)

- `tool/content/data_priority_si_study_m1.py`: lessonSections (4 sections, 14 keyTerms), reviewCards (14), quizSeeds (12, one-to-one translation of question, correctAnswer, distractors and explanation).
- Structure, ids, Pāḷi terms and sourceRefs are copied from `content_en.json`, not retyped. Counts and keys were checked.
- Terms used: the glossary forms where they exist (ඵස්ස, වේදනා, සඤ්ඤා, චේතනා, ඒකග්ගතා, ජීවිතින්ද්‍රිය, මනසිකාර, විතක්ක, විචාර, අධිමොක්ඛ, වීරිය, පීති, ඡන්ද, අඤ්ඤසමාන, සබ්බචිත්තසාධාරණ, පකිණ්ණක). Open items are logged in §7 (ඵස්ස vs ස්පර්ශය).
- Status: draft, unverified against Sinhala texts. English keeps the source-file notes in sourceRefs.

**M2_SI_PHAN** — `tool/content/data_priority_si_study_m2.py` (`SI_STUDY_M2`, DRAFT): 3 lessonSections, 10 reviewCards, 10 quizSeeds (3 distractors each). Checked against English: ids, Pāḷi, type, sourceRefs, body lengths, keyTerm ids, distractor count, no answer/distractor overlap, no Devanagari.
- Terms: Mocatuka → මෝහ චතුක්ක චෛතසික; Ahirika → අහිරික; Anottappa → අනොත්තප්ප; Uddhacca → උද්ධච්ච; Akusala cetasika → අකුසල චෛතසික; Moha → මෝහ; Akusala → අකුසල්.
- Not in glossary, chosen here and open: **sukha** (used as සුඛ, jhāna factor) and **nīvaraṇa** (used as නීවරණ, in M2_S03). Both need a glossary entry and a source check.

**M3** — `tool/content/data_priority_si_study_m3.py` (`SI_STUDY_M3`, DRAFT): 7 lessonSections, 20 reviewCards, 20 quizSeeds (3 distractors each). Same checks as M2, all passing.
- Cetasika names use the `CS_*` glossary rows where those exist (for example, කායපස්සද්ධි, චිත්තපස්සද්ධි, කායකම්මඤ්ඤතා, සම්මාවාචා, සද්ධා, සති, කරුණා, මුදිතා, පඤ්ඤින්ද්‍රිය). Bare-name glossary rows that conflict with these were not used (for example ප්‍රඥේන්ද්‍රිය, ලහුතාව, මුදුතාව, කම්මඤ්ඤතාව).
- Glossary variants kept as they are: අප්‍රමාණ; සෝභන; විරති (glossary form "විරති 3").
- Descriptors with no verified Sinhala gloss, such as passaddhi/lahutā/mudutā/kammaññatā/pāguññatā/ujukatā as "tranquillity/lightness/…", are translated descriptively and marked for native review. Not verified against a Sinhala Abhidhamma text.
- Source issues in the English M3 that were copied as-is and flagged, not fixed: keyTerm `TERM_BA_NHAN_THIEN_M3` has Vietnamese text in its `pali` field ("Vô tham – Vô sân – Vô si"); M3_Q20 asks about the three kinds of wisdom "according to development", while the answer lists the three kinds in general.
- Quiz items are translated one-to-one; none fell back to English.

## 3f. Review pass on drafts (this round; still draft, nothing marked reviewed)

Each entry was checked against the English meaning, field by field. Pāḷi, ids, and sourceRefs were not changed.

- **Paccaya (PC_01–12):** paccayaDhamma and paccayuppanna match English. PC_11 stays English (§8).
- **Paticca (PD_01–12):** four-aspect, examples and doctrinalNote read against English. Fixed: PD_02 doctrinalNote had a repeated "චේතනා (චේතනා)" (now "Cetanā" in Pāḷi form); PD_03 simile changed from "ගසා තබන කොළ" to "නළා පැදුරු", matching the English "two sheaves of reeds"; PD_07 doctrinalNote "මූලය" → "හරය" for "crux"; ඵස්ස used for Phassa where the Sinhala referred to the factor (PD_05–07 examples and doctrinalNote, PC_15 paccayaDhamma and its Nām'āhāra note). PD_06 shortName still uses ස්පර්ශය, to be aligned in the council pass (§7).
- **Citta doctrinalNote (121):** the template was checked for each entry: feeling word (head and tail), group, sasaṅkhārika/asaṅkhārika, and Pāḷi designation. Fixed: CI_026 and CI_027 had their feeling words swapped; CI_056–CI_078 (prompted, even numbers) said "unprompted"; CI_030 now says "ක්‍රියා" (functional) and uses the Chandrikava 5-9 form හසිතුප්පාද. The per-entry gloss is still a template, not checked against a Sinhala text.
- **Vithi steps:** VT_NGU_MON_LON compared with Chandrikava 5-3 (mahanta-ārammaṇa vīthi, pitaka.lk/books/abhidharma-chandrikava/5-3.html): steps 1–9 and the absence of tadārammaṇa match. VT_VITHIMUTTA: the rules in Chandrikava 5-9 (tadārammaṇa, vīthimutta, bhavaṅga) match; fixed "අසංඛ්‍යාත වාරයක්" → "වාර" and "ආසන්න (ආසන්න)" → "මරණාසන්න (āsanna)". VT_Y_MON: compared with Chandrikava 5-6 (parittā manodvārika vīthi, pitaka.lk/books/abhidharma-chandrikava/5-6.html): bhavaṅga-calana, upaccheda, manodvārāvajjana (which also performs determining), 7 javana, and tadārammaṇa for a clear object, match. Registration is optional in the English, and Chandrikava gives two tadārammaṇa for a clear object and none for an unclear one, so the English wording fits. The VT_Y_MON doctrinalNote (CI_029 does both adverting and determining) is supported by 5-6; its "11 mental factors" count is not verified and it stays English (§8).
- **Cetasika four-aspect (52):** all 52 read against English. Fixed: CS_KUKKUCCA manifestation (remorse, not "sorrow"); CS_TATRAMAJJHATTATA "සමසභාවිකත්වය" → "සමභාවය" (the first form is not a standard word); CS_THINA "භවාංග" → "භවංග" (the spelling used in citta and vithi).
- **M3 (S05–S07, R01–R20, Q01–Q20):** read against English. Fixed: "ඍජුතාව" → "උජුකතාව" (as in S06 and R06); "කරුණාව/මුදිතාව" → "කරුණා/මුදිතා" in the S07 summary and body, matching the title and glossary; S06 "අස්ථිරභාවයට" → "නොසන්සුන් බවට" for restlessness; the S06 closing note listing the six non-universal factors by name was removed, since English does not name them. Sammāsaddhā → සම්මාසද්ධා.
- **M3 items kept on purpose:** the Faith etymology (saṃ + dah), the Shame cause list (5), the Dread cause list (4), and "ධ්‍යාන සහ උසස් අභිඥා ඉක්මනින්" in S06 are all present in English, so they stay. TERM_PANNINDRIYA (S03) and TERM_TU_QUYEN_M3 (S07) both have the same definition because English uses Paññindriya as a keyTerm in both sections. They are not merged, so the structure matches English. M3_Q20 keeps the English question wording (see §3e).
- **Rupa four-aspect (28):** all 28 read against English. Fixed: RP_012 characteristic "ගලා ඇවිදීම" → "ගලා පැතිරීම" (wafting forth). Rupa doctrinalNote is still not translated (§4).
- **Quiz items:** all distractors and explanations are translated one-to-one. None fell back to English.

## 4. Field coverage (si) — gap inventory

Status key: ✅ si value in committed `content_si.json` · 🟡 drafted in `tool/content/data_priority_si_*` (not shipped) · ⚪ English fallback on purpose (§8) · ❌ not translated yet.
Counts are English entries with a non-empty field. Checked by script this round; the old table was out of date.

| Category | Entities | Name / shortName / description | Four aspects | Other fields |
|---|---|---|---|---|
| cittas | 121 | ✅ name (121). shortName (71 entries): English shortName equals name in every case, so the si shortName equals the si name; not yet written to the catalog (§5). | n/a | 🟡 doctrinalNote (121, revised, §3f; committed content_si has the older template). 🟡 examples (12 entries). |
| cetasikas | 52 | ✅ name, shortName, description (52) | 🟡 208 fields (52 × 4), reviewed §3f | — |
| rupas | 28 | ✅ name, shortName, description (28) | 🟡 112 fields (28 × 4), reviewed §3f | 🟡 doctrinalNote (21 of 23); ⚪ RP_002, RP_022 (§8) |
| paccayas | 24 | ✅ name, shortName, definition (24; 14 corrected, §2) | 🟡 paccayaDhamma (23 of 24), 🟡 paccayuppanna (23 of 24); ⚪ PC_11 | 🟡 examples (23 of 24); 🟡 subdivisions (9 of 9); 🟡 doctrinalNote (22 of 24); ⚪ PC_11, PC_15 (§8) |
| paticcas | 12 | ✅ name, shortName, description (12; 4 corrected, §2) | 🟡 48 fields (12 × 4) | 🟡 examples (12); 🟡 doctrinalNote (7 of 8); ⚪ PD_11 (§8) |
| kammas | 16 | ✅ name, shortName, description (16; 1 corrected) | n/a | 🟡 examples (16 entries); 🟡 doctrinalNote (14 of 16); ⚪ KM_R_01, KM_R_04 (§8) |
| vithis | 4 | ✅ name, shortName, description (4) | 🟡 arisingCondition, significance (4 each) | 🟡 steps for all four vithis (VT_NGU_MON_RATLON ✅ committed, 11; VT_NGU_MON_LON 9, VT_Y_MON 6, VT_VITHIMUTTA 3 🟡); 🟡 doctrinalNote (3 of 4); ⚪ VT_Y_MON (§8) |
| studyModules | 17 | ✅ title, description (17) | n/a | 🟡 3 modules drafted: M1_BASICS (`data_priority_si_study_m1.py`; 4 sections, 14 reviewCards, 12 quizSeeds), M2_SI_PHAN (`_m2.py`; 3, 10, 10), M3 (`_m3.py`; 7, 20, 20). ❌ the other 14 modules (Batch 3, not started) |

## 5. Builder integration (for coordinator; NOT applied)

`build_full_catalogs.py` does not read `data_priority_si_detail.py`, so the 🟡 values do nothing until the builder is changed. Proposed change, in outline:

1. Import `SI_PATICCA_ASPECTS` and `SI_PACCAYA_DETAIL` from `data_priority_si_detail`.
2. In the paticca loop, if `loc == "si"`, add the four keys from `SI_PATICCA_ASPECTS[pid]` to `paticcas[pid]`.
3. In the paccaya loop, if `loc == "si"`, add `paccayaDhamma` and `paccayuppanna` from `SI_PACCAYA_DETAIL[pid]`.
4. Keep the English fallback for missing keys. Do not copy English into the locale.
5. Build twice (idempotence), then `check_content_locale.py si --glossary`.

Batch 2 (`data_priority_si_detail_b2.py`) needs the same kind of change for `cetasikas` and `rupas` (four keys each), `kammas` (`examples`), `vithis` (`arisingCondition`, `significance`) and `cittas` (`examples`).

Citta examples need a specific note: today the builder copies citta examples only from the existing `content_si.json` (`existing_citta_examples`). That is circular for si, so the coordinator should take citta examples from `SI_CITTA_EXAMPLES` instead.

Citta shortName (71 entries): the English shortName is identical to the English name in all 71 cases. The coordinator can set si shortName to the committed si name, with no new translation. This is not part of the drafts.

Note: both modules are keyed by `loc == "si"` only. They must not be applied to any other locale.

## 6. Evidence ledger (terminology)

| Pāḷi / English ID | si rendering used | Source, edition, section | Context phrase | Confidence | Unresolved variants |
|---|---|---|---|---|---|
| paccaya / Condition | ප්‍රත්‍යය | Chandrikava (pitaka.lk), 9-1 heading | "ප්‍රත්‍යය හා ප්‍රත්‍යයොත්පන්න" | High | පච්චය appears only inside Pāḷi quotes |
| paccayuppanna | ප්‍රත්‍යයොත්පන්න | Chandrikava 9-1 | (heading) | High | — |
| hetu / root | හේතු | Chandrikava 9-12 | — | High | — |
| anantara | අනන්තර | Chandrikava 9-13 | "අනන්තර භාවයෙන් උපකාර" | High | — |
| samanantara | සමනන්තර | Chandrikava 9-13 | "මනා කොට අනන්තර" | High | — |
| sahajāta | සහජාත | Chandrikava 9-13 | "එක් වැ උපදීම" | High | — |
| aññamañña | අඤ්ඤමඤ්ඤ | Chandrikava 9-14 | "ත්‍රීදණ්ඩය හෙවත් කත්තිරික්කය" | High | අන්‍යෝන්‍ය (in builder name) |
| nissaya | නිස්සය (in builder) / නිශ්‍රය (in source body) | Chandrikava 9-14 | "අධිෂ්ඨාන භාවයෙන් … ආධාර" | Medium | නිස්සය vs නිශ්‍රය (both in source) — pick one |
| upanissaya | උපනිස්සය; "ඉතා බලවත් නිශ්‍රය" | Chandrikava 9-14 | — | High | — |
| āhāra (four) | ආහාර; කබලීකාරාහාර, ඵස්සාහාර, මනෝසඤ්චේතනාහාර, විඤ්ඤාණාහාර | Chandrikava 9-16 | — | High | — |
| indriya (20) | ඉන්ද්‍රිය | Chandrikava 9-16 | "විස්සෙකි" | High | — |
| jhāna factors (7) | ධ්‍යානාංග | Chandrikava 9-16 | විතර්ක, විචාර, ප්‍රීති, එකාග්‍රතා, සෞමනස්ස, දෞර්මනස්ස, උපේක්ෂා | High | ධ්‍යානාඞ්ග (source spelling) |
| magga factors (12) | මාර්ග අංග | Chandrikava 9-16 | — | High | — |
| sampayutta | සම්පයුත්ත (builder) | Chandrikava 9-16 | "සම්ප්‍රයුක්ත" heading | Medium | සම්පයුත්ත vs සම්ප්‍රයුක්ත |
| vippayutta | විප්පයුත්ත (builder) | Chandrikava 9-17 | "විප්‍රයුක්ත" heading | Medium | විප්පයුත්ත vs විප්‍රයුක්ත |
| atthi / natthi | අත්ථි / නත්ථි (builder) | Chandrikava 9-17 | "අස්තිප්‍රත්‍යය", "නාස්ති" | Medium | **අස්ති/නාස්ති** (source) vs අත්ථි/නත්ථි (builder). Needs council decision. |
| vigata / avigata | විගත / අවිගත | Chandrikava 9-17 | — | High | — |
| ṣaḍrasa (six tastes) | ෂඩ්රසය | Chandrikava 9-17 | "මධුරාම්ලාදි ෂට්රසය" | High | — |
| catumadhura (four sweets) | චතුමධුරය | Chandrikava 9-16 | "කිරි ගිතෙල් මී සකුරු" | High | — |
| kamma | කර්ම (glossary) | Glossary row Kamma | — | High | කම්ම (builder, changed) |
| avijjā | අවිද්‍යා / අවිද්‍යාව | Glossary; Chandrikava 9-14 uses අවිද්‍යාව | — | High | — |
| saṅkhāra | සංස්කාර | Chandrikava 9-14 | — | Medium | සංඛාර; අභිසංඛාර (source uses both) |
| viññāṇa | විඥාන (glossary) | Glossary row Viññāṇa; Chandrikava 9-17 uses විඥානය | — | High | විඤ්ඤාණ (Chandrikava 9-13, 9-14) |
| phassa | ඵස්ස (glossary) | Glossary row Phassa; Chandrikava 9-14 | — | High | ස්පර්ශ (builder shortName, changed) |
| taṇhā | තණ්හා (glossary) | Glossary row Taṇhā; Chandrikava 9-14 uses තණ්හාව | — | High | තෘෂ්ණා (source headings, builder shortName, changed) |
| upādāna | උපාදාන | Chandrikava 9-14 | — | High | — |
| nāmarūpa | නාම-රූප | Glossary | — | High | — |
| ayoniso manasikāra | අයෝනිසෝ මනසිකාරය | Glossary keyTerm | — | High | — |
| niyata micchādiṭṭhi / garuka | නියත මිථ්‍යාදෘෂ්ටිය | Chandrikava 6-6 (garuka classes) | — | Medium | මිච්ඡාදිට්ඨි vs මිථ්‍යාදෘෂ්ටි |
| four-aspect labels (lakkhaṇa, rasa, paccupaṭṭhāna, padaṭṭhāna) | not used as values; field meanings only | Standard Sinhala Abhidhamma usage; not checked against a text this session | — | Medium | function: කෘත්‍යය or රස |

Unverified: the paticca four-aspect *content* (characteristic / function / manifestation / proximateCause). It comes from the English reference, which follows the commentarial four-aspect method. The Sinhala text that would confirm it (Visuddhimagga or Abhidharmārtha Saṅgraha in Sinhala) was not accessible or checked. The Sinhala Abhidharmārtha Saṅgraha scan on tipitaka.lk (141 pp.) is image-only and was not read.

## 7. Terminology disputes for council

Scope decision: the council decides terminology only. Everything else stays English (see §8).

Competing usages found in the source (Chandrikava, pitaka.lk):
- අත්ථි/නත්ථි vs අස්ති/නාස්ති — 9-17 uses both.
- නිස්සය vs නිශ්‍රය — 9-14 uses both.
- විඥාන vs විඤ්ඤාණ — 9-13, 9-14, 9-17 use both.
- තණ්හා vs තෘෂ්ණා — 9-14 uses තණ්හා in text; headings elsewhere use තෘෂ්ණා.
- ඵස්ස vs ස්පර්ශය — the glossary says ඵස්ස for Phassa; the current content_si shortName is ස්පර්ශය.
- Sampayutta / vippayutta: Sanskritised and Pāḷi-based forms both appear.

Questions:
1. **Q1.** Paccaya 21–22: අත්ථි/නත්ථි (builder) or අස්ති/නාස්ති (source)?
2. **Q2.** viññāṇa: confirm විඥාන as the house form against විඤ්ඤාණ.
3. **Q3.** taṇhā: confirm තණ්හා as the house form against තෘෂ්ණා.
4. **Q4.** Phassa: confirm ඵස්ස (glossary) or ස්පර්ශය (current shortName).
5. **Q5.** nissaya: confirm නිස්සය or නිශ්‍රය.
6. **Q6.** sampayutta / vippayutta: confirm the house forms.
7. **Q7.** niyata micchādiṭṭhi: confirm මිථ්‍යාදෘෂ්ටිය or මිච්ඡාදිට්ඨිය.

## 7b. Dropped from council scope (kept English, not terminology)

- Four-aspect Sinhala content as a draft: stays draft, no council sign-off requested.
- PC_11 wording and number (85 cittas): open source check, see §8.
- PD_02 claim about saṅkhāra becoming lokuttara: open source check, see §8.
- PC_20 simile wording: open source check, see §8.
- Citta and vithi doctrinalNote sources and the vithi-steps home: structural decisions for the coordinator.
- Study-module source edition (IN4-45 cites "Sinhala Abhidharmārtha Saṅgraha"): not verified, see §8.

## 8. Still English (on purpose)

Left in English because the English claim is either unsourced in our files or doubtful. Each needs a source check, not a translation decision:

- **PC_11** (whole entry): the English says 85 cittas. The count and wording need checking.
- **PC_15** doctrinalNote: cites SN 12.63; the citation is not verified.
- **PD_11** doctrinalNote: a correspondence claim between PD_11 and PD_03.
- **RP_002** and **RP_022** doctrinalNote: RP_022 says lightness of matter is not produced by kamma; this needs checking against the Abhidhamma list of causes.
- **KM_R_01** and **KM_R_04** doctrinalNote: KM_R_04 says path kamma produces Nibbāna as its result; check whether the result is fruition instead.
- **VT_Y_MON** doctrinalNote: the adverting/determining claim is supported by Chandrikava 5-6 (§3f); the "11 mental factors" count is not verified, so the whole note stays English.
- Vithi steps: the step-level doctrinalNote for VT_Y_MON steps 3–4 and VT_VITHIMUTTA step 1 (citta-number and kamma-location claims).
- Rupa/kamma/paticca items above are translated, but the claims inside them are still unverified.

Not translated yet, outside this batch:

- lessonSections / reviewCards / quizSeeds for the other 14 modules (Batch 3). M1_BASICS, M2_SI_PHAN and M3 are drafted (§3e).
- Cittas examples for the 109 cittas that have no English examples (nothing to translate from).

English fallback stays on for si. Nothing is marked reviewed. Terminology questions (§7) are deferred, as agreed.
