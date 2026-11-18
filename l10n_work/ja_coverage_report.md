# Japanese (ja) Translation — Coverage & Gap Report
## Priority Content Batch

**Date:** 2026-10-08  
**Status:** DRAFT — awaiting qualified doctrinal review

---

## Summary

| Category | Items | Fields targeted | Fields completed | Left for fallback |
|----------|-------|-----------------|-----------------|-------------------|
| Paticcas (12 links) | 12 | 72 (6 fields × 12) | 70 | 2 (PD_04 doctrinalNote, PD_09 doctrinalNote — English source also absent) |
| Paccayas (24 conditions) | 24 | 96+ (4 fields × 24 + subdivisions) | 96 + all subdivision labels | 0 |
| Vithis (4 processes) | 4 | 3 + 29 steps | 3 + 29 steps | 0 |
| Cetasikas (52 total) | 52 | 4 fields each | 34 (main cetasikas) | 18 (body-mind pairs left unverified) |
| Rupas (28 total) | 28 | 5 fields each | 20 (4 great elements × 5) | 120 (24 derived rupas left unverified) |
| Kammas (16 total) | 16 | 2 fields each | 32 | 0 |
| Study modules (17) | 17 | — | 0 (not added — see below) | All |

---

## Batch 1: Nhân Duyên (Conditions) — COMPLETED ✓

### Paticcas (PD_01–PD_12)
- ✅ characteristic — all 12 links
- ✅ function — all 12 links
- ✅ manifestation — all 12 links
- ✅ proximateCause — all 12 links
- ✅ doctrinalNote — 10 of 12 (PD_04, PD_09 absent in English source too)
- ✅ examples — all 12 links

### Paccayas (PC_01–PC_24)
- ✅ paccayaDhamma — all 24 conditions
- ✅ paccayuppanna — all 24 conditions
- ✅ doctrinalNote — all 24 conditions
- ✅ examples — all 24 conditions
- ✅ subdivision names — PC_03 (2), PC_08 (3), PC_09 (3), PC_10 (2), PC_13 (2), PC_15 (2), PC_16 (3), PC_20 (3), PC_21 (5)

### Vithis (VT_*)
- ✅ arisingCondition — all 4 vithis
- ✅ significance — all 4 vithis
- ✅ doctrinalNote — all 4 vithis
- ✅ step names (Japanese) — all steps in all 4 vithis
- ✅ step Pāḷi names — all steps
- ✅ step descriptions — all steps
- ✅ step doctrinalNotes — where present in English/Vietnamese source

---

## Batch 2: Study Entities — PARTIALLY COMPLETED

### Cetasikas
- ✅ characteristic, function, manifestation, proximateCause for 34 primary cetasikas
- ⬜ Body-mind pair cetasikas (CS_KAYALAHUTA, CS_CITTALAHUTA, etc. × 12 pairs) — left unverified for English fallback
- ⬜ Remaining unverified cetasikas — left for English fallback

### Rupas
- ✅ Four-aspect fields + doctrinalNote for 4 great elements (RP_001–RP_004)
- ⬜ Derived rupas (RP_005–RP_028) — left unverified for English fallback

### Kammas
- ✅ doctrinalNote — all 16 kammas
- ✅ examples — all 16 kammas

### Cittas
- ✅ Preserved all 121 existing ja names and doctrinalNotes (no changes made)

---

## Batch 3: Study Modules — NOT ATTEMPTED

**Rationale:** The 14 modules with `status=draft` and zero content (M4–M10, M12–M17) require translating lesson sections, review cards, and quiz seeds — a substantial amount of prose that depends on verified doctrinal terminology throughout. Without being able to verify the Mizuno Kogen source edition, adding lesson prose carries a high risk of doctrinal inaccuracy.

**Preserved:**
- M1_BASICS: 4 sections, 14 cards, 12 quizzes — **status=reviewed** (untouched)
- M11_BIET_CANH: 5 sections, 12 cards, 12 quizzes — **status=reviewed** (untouched)
- M2_SI_PHAN: 3 sections, 10 cards, 10 quizzes — **status=reviewed** (untouched)

All 14 draft modules left for English fallback.

---

## Fields Left for English Fallback

| Field type | Count | Reason |
|------------|-------|--------|
| Cetasika four-aspects (18 cetasikas) | 72 fields | Body-mind pairs and remaining cetasikas — need verified commentary prose |
| Rupa four-aspects (24 derived) | 120 fields | Need verified commentary prose per derived rupa |
| Module lessons (14 modules) | ~200+ sections | Cannot verify doctrinal accuracy without source access |
| Module review cards | ~150+ cards | Same reason |
| Module quiz seeds | ~150+ quizzes | Same reason |

**Total fields left for English fallback:** ~544+

---

## Pre-existing Inconsistencies Noted (Not Changed)

1. **KM_U_02 (Upatthambhaka):** The translation source `data_priority_conditions.py` and `content_ja.json` use 支持業, while the glossary keyTerm entry uses 支助業. **Proposal follows the existing source (支持業) to preserve existing translations.** This discrepancy should be resolved by the doctrinal reviewer.
2. **KM_U_03 (Upapīḷaka):** The translation source and `content_ja.json` use 妨害業, while the glossary keyTerm entry uses 障害業. **Proposal follows the existing source (妨害業) to preserve existing translations.**
3. **CI_026 naming:** The existing ja content shows CI_026 as "喜倶推度心（善異熟無因）" but the Pāḷi `Upekkhā-sahagataṃ kusalavipākaṃ santīraṇa-cittaṃ` and glossary indicate 捨倶推度心. This is a pre-existing naming error — not introduced by this proposal. Left untouched per the preservation rule.
4. **CI_027 naming:** Similarly shows "捨倶推度心" but Pāḷi `Somanassa-sahagataṃ...` indicates 喜倶. Same pre-existing issue.

---

## Integration Instructions

The integrator should:

1. Apply the `PATICCAS_JA` data to add `characteristic`, `function`, `manifestation`, `proximateCause`, `doctrinalNote`, `examples` fields to the ja translation source for each paticca ID.
2. Apply the `PACCAYAS_JA` data to add `paccayaDhamma`, `paccayuppanna`, `doctrinalNote`, `examples`, and `subdivisions` fields.
3. Apply the `VITHIS_JA` data to add `arisingCondition`, `significance`, `doctrinalNote` top-level fields and update step arrays with Japanese `name`, `pali`, `description`, and `doctrinalNote` per step.
4. Apply `CETASIKAS_JA_ASPECTS` to add four-aspect fields where present.
5. Apply `RUPAS_JA_ASPECTS` for RP_001–RP_004.
6. Apply `KAMMAS_JA_DETAIL` to add `doctrinalNote` and `examples` fields.
7. Regenerate catalogs via `build_full_catalogs.py`.
8. Run validation:
   ```
   python3 tool/content/check_content_locale.py ja --glossary
   python3 tool/content/build_full_catalogs.py  # verify idempotence
   ```
