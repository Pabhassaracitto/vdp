# Sinhala (si) translation — Batch 1 (Nhân Duyên) and gap review

Status: **draft, not reviewed**. The si locale stays `draft` with English fallback on.
Nothing here marks any locale as reviewed.

## 1. What changed in this batch

| File | Change | Ships through builder? |
|---|---|---|
| `tool/content/data_priority_conditions.py` | 14 si field corrections (see §2) | Yes. `build_full_catalogs.py` emits these fields. |
| `tool/content/data_priority_si_detail.py` (new, Batch 1) | Four-aspect fields for 12 paticca factors; `paccayaDhamma` / `paccayuppanna` for 23 paccayas | **No.** The builder does not read this module yet. See §5. |
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

## 4. Field coverage (si) — gap inventory

Status key: ✅ present in si catalog · 🟡 drafted here, not shipped · ❌ no si value (English fallback)

| Category | Entities | Name / short / description | Four aspects | Other fields |
|---|---|---|---|---|
| cittas | 121 | ✅ name, doctrinalNote (Pāḷi-only template, see §6) | n/a | 🟡 examples for the 12 akusala cittas (18 items). The other 109 cittas have no English examples either. |
| cetasikas | 52 | ✅ name, shortName, description | 🟡 208 fields | — |
| rupas | 28 | ✅ name, shortName, description | 🟡 112 fields | ❌ doctrinalNote (28) |
| paccayas | 24 | ✅ name, shortName, definition (14 corrected, §2) | 🟡 paccayaDhamma (23), 🟡 paccayuppanna (23) | ❌ examples, subdivisions, doctrinalNote |
| paticcas | 12 | ✅ name, shortName, description (4 corrected, §2) | 🟡 48 fields | ❌ doctrinalNote (12), examples (12) |
| kammas | 16 | ✅ name, shortName, description (1 corrected) | n/a | 🟡 examples (32 items, 16 entries); ❌ doctrinalNote (16) |
| vithis | 4 | ✅ name, shortName, description | n/a | 🟡 arisingCondition, significance (4 each); ❌ doctrinalNote (4); steps only for VT_NGU_MON_RATLON (11 of 11 steps; the other three vithis have none) |
| studyModules | 17 | ✅ title, description | n/a | ❌ lessonSections, reviewCards, quizSeeds for all 17 (Batch 3, not started) |

## 5. Builder integration (for coordinator; NOT applied)

`build_full_catalogs.py` does not read `data_priority_si_detail.py`, so the 🟡 values do nothing until the builder is changed. Proposed change, in outline:

1. Import `SI_PATICCA_ASPECTS` and `SI_PACCAYA_DETAIL` from `data_priority_si_detail`.
2. In the paticca loop, if `loc == "si"`, add the four keys from `SI_PATICCA_ASPECTS[pid]` to `paticcas[pid]`.
3. In the paccaya loop, if `loc == "si"`, add `paccayaDhamma` and `paccayuppanna` from `SI_PACCAYA_DETAIL[pid]`.
4. Keep the English fallback for missing keys. Do not copy English into the locale.
5. Build twice (idempotence), then `check_content_locale.py si --glossary`.

Batch 2 (`data_priority_si_detail_b2.py`) needs the same kind of change for `cetasikas` and `rupas` (four keys each), `kammas` (`examples`), `vithis` (`arisingCondition`, `significance`) and `cittas` (`examples`).

Citta examples need a specific note: today the builder copies citta examples only from the existing `content_si.json` (`existing_citta_examples`). That is circular for si, so the coordinator should take citta examples from `SI_CITTA_EXAMPLES` instead.

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

## 8. Not translated yet

- Rupa `doctrinalNote` (28) and kamma `doctrinalNote` (16). Citta and paticca `doctrinalNote` are in §4.
- Paccaya examples (48 items), subdivisions (9 items), doctrinalNote (24); paticca doctrinalNote (12) and examples (12).
- PC_11 four-aspect pair (count question, Q5).
- Vithi `doctrinalNote` (4) and steps for the other three vithis.
- All lessonSections / reviewCards / quizSeeds for 17 modules (Batch 3; needs a coherent reviewed batch).
- Cittas examples for the 109 cittas that have no English examples (nothing to translate from).

Open source checks (not for council): PC_11, PD_02, PC_20, study-module edition. English fallback stays on for si. Nothing is marked reviewed.
