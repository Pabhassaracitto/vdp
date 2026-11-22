# English source issues — `si` review (admin decision)

**Source file:** `assets/content/content_en.json` · **Reviewer:** si branch `44c36` (secondary sources) · **Date:** 2026-05-13 · **Status:** for project admin — English wording to decide; si strings NOT changed to fix English
**This branch:** `arena/b1d93c5a-vdp` @ `a4df541` (+ this doc) · **Policy:** English fallback `allowsEnglishFallback:true`, `draft` until elder sign-off

> Sources cited by si reviewer (not re-checked here): Ven. Nārada *Manual of Abhidhamma* ch.3/5/6; Saṅgaha ch.6 (palikanon.com); pitaka.lk Chandrikava 5-9, 9-12, 9-15 (Sinhala, edition unconfirmed); SN 12.63; Vism XVII (secondary quotation). Every item below is **proposed** — admin decides wording. Nothing invented as doctrine.

## Summary

| # | Key | Verdict | Action on `content_en.json` in this PR |
|---|---|---|---|
| 1 | `KM_R_04` doctrinalNote | **Error** — path≠kamma, Nibbāna≠result | **Fixed** (see diff) |
| 2 | `VT_VITHIMUTTA` steps | **Error** — missing calana/upaccheda | **Fixed** — expanded steps + note |
| 3 | `KM_R_01` doctrinalNote | Incomplete ("woeful planes" only one outcome) | Proposed rewrite — **not applied**, needs elder/source |
| 4 | `PC_02` doctrinalNote | Attribution to Vism XVII unconfirmed | Proposed — cite Chandrikava 9-12, keep Vism as `SOURCE TO CONFIRM` |
| 5 | `PC_03` doctrinalNote | 18-rootless claim unsourced | Proposed — add `SOURCE_NEEDED` tag |
| 6 | `PC_12` doctrinalNote | Consistent but unsourced | Proposed — add `SOURCE_NEEDED` tag |
| 7 | `PD_11` doctrinalNote | Secondary quotation of Vism XVII | Proposed — cite primary § when confirmed |
| 8 | `RP_022` doctrinalNote | Correct but laconic | **Fixed** — add citta/utu/āhāra (from Saṅgaha ch.6 §31) |
| 9 | `cittas` shortName (71) | Identical to `name` | No fix — admin decision (remove or shorten) |
| 10 | `VT_VITHIMUTTA` step 1 & `VT_Y_MON` step 4 citta numbers | Unchecked | No fix — keep, add `UNVERIFIED` note |

## 1. KM_R_04 — Supramundane kamma / Path kamma (Error)

- **EN now:** `"Supramundane kamma does not produce rebirth within the three realms; it produces Nibbāna as its result."`
- **Issue:** Nārada ch.5: supramundane consciousness (lokuttara citta) is **not** kamma nor vipāka. Path (magga) citta's immediate result is **fruition consciousness (phala-citta)**; Nibbāna is its **object** (ārammaṇa), not its kammic result. Naming "Path kamma" is misleading in this classification (kamma = 12 akusala + 8 mahākusala + 5 rūpa + 4 arūpa = 29; lokuttara excluded).
- **Fix applied:**
  ```json
  "doctrinalNote": "In strict Abhidhamma classification the supramundane path consciousness (magga-citta) is not kamma nor vipāka (Nārada ch.5). Its immediate result is fruition consciousness (phala-citta) with Nibbāna as object; it does not produce rebirth within the three realms."
  ```
  Name kept as `"Supramundane kamma (Path kamma)"` for UI continuity, but note clarifies. If admin prefers strict terminology, rename to `Path consciousness (Magga-citta)`.

## 2. VT_VITHIMUTTA — Process-free citta (Error)

- **EN now:** 3 steps — paṭisandhi, bhavaṅga, cuti; steps object has keys `1..3`
- **Issue:** Chandrikava 5-9: bhavaṅga, **bhavaṅga-calana** (vibrating) and **bhavaṅga-upaccheda** (arrest) are all vīthimutta and vipāka. English lists bhavaṅga as one step and omits the two interrupting phases (which do appear correctly in `VT_NGU_MON_*` as calana/upaccheda).
- **Fix applied:** Keep 3 functional headings, expand step 2 to name sub-phases and add doctrinalNote:
  ```json
  "steps": {
    "1": { "name": "Rebirth-linking consciousness (paṭisandhi)", ... },
    "2": {
      "name": "Life-continuum (bhavaṅga) — including vibrating and arrest",
      "description": "The stream sustaining life between processes. It includes its vibrating phase (bhavaṅga-calana) and arrest phase (bhavaṅga-upaccheda), both classed as vīthimutta vipāka (Chandrikava 5-9, ed. unconfirmed).",
      "doctrinalNote": "Bhavaṅga, bhavaṅga-calana and bhavaṅga-upaccheda are all vīthimutta vipāka; they share the same citta type as paṭisandhi/cuti for that individual."
    },
    "3": { "name": "Death consciousness (cuti)", ... }
  }
  ```
  Alternative (more explicit) — add steps `2a`/`2b` — left to admin; current fix minimal and backward-compatible (steps still `1..3`).

## 3. KM_R_01 — Unwholesome kamma (Claim incomplete)

- **EN now:** `"…belongs to the sense sphere and ripens within the woeful planes of the sense sphere."`
- **Issue:** True that 12 akusala cittas are kāmāvacara, but "ripens within woeful planes" describes **paṭisandhi** outcome (4 woeful planes), not the only vipāka. Akusala also ripens as 7 unwholesome rootless resultants (ahetuka vipāka: 5 sense + receiving + investigating) in pavatti, including in happy planes.
- **Proposed (NOT applied — needs elder):**
  > "Akusala kamma belongs to the sense sphere; at paṭisandhi it can produce rebirth in the four woeful planes, and in the course of life it ripens as the seven unwholesome rootless resultant cittas."
  Keep `description` line `"12 akusala → 7 ahetuka vipāka, 4 woeful paṭisandhi"` as is — already correct.

## 4. PC_02 — Object condition (Attribution)

- **EN now:** `"According to Visuddhimagga XVII, ignorance serves as object condition for wholesome formations when a meditator examines ignorance with wisdom."`
- **Issue:** Substance matches Chandrikava 9-12 (ignorance as ārammaṇa when contemplated as anicca/dukkha), but Vism XVII chapter reference was not checked by si reviewer.
- **Proposed:** Either confirm Vism XVII § (Ñāṇamoli) or re-cite: `"Cf. Chandrikava 9-12 (Sinhala ed. unconfirmed); Vism XVII attribution to confirm."` — **not applied** until source checked. Vietnamese `paccayas.json` PC_02 already cites Vism XVII §XVII.102 with `confidence: canonical/commentarial` — same caution applies.

## 5. PC_03 — Predominance (18 rootless claim)

- **EN now:** `"No predominance condition occurs among the 18 rootless cittas, nor in cittas where only one dominant is possible."`
- **Issue:** Standard doctrine, but Chandrikava 9-12 cited by si reviewer only lists four adhipati (chanda, viriya, citta, vīmaṃsā) — does not contain the 18-rootless exclusion. Needs source.
- **Proposed:** Append ` [Source to add: e.g. Saṅgaha/Chandrikava adhipati section; Abhidhammattha-Saṅgaha VIII]` — not applied to avoid placeholder; admin to add §.

## 6. PC_12 — Repetition (Path exclusion)

- **EN now:** `"A supramundane path impulsion is not repetition condition, because it arises for a single mind-moment only."`
- **Issue:** Consistent with doctrine (magga citta = 1 javana only; āsevana requires prior javana of same type). Chandrikava 9-15 lists only kusala/akusala/kiriya javana, does not state exclusion.
- **Proposed:** Same as #5 — add source citation (e.g. CMA VIII, Paṭṭhāna Āsevana-niddesa). **Not applied**; kept verbatim until citation confirmed.

## 7. PD_11 — Birth ↔ Consciousness (Three-life circle)

- **EN now:** `"The three-life circle joins here: birth (PD_11) corresponds to consciousness (PD_03) on the result side of the future life."`
- **Issue:** Supported by Vism XVII secondary quotation ("five future results beginning with consciousness are called 'birth'"), but primary text not checked.
- **Proposed:** Add citation placeholder `Vism XVII §§… (primary to confirm)` — not applied.

## 8. RP_022 — Lightness of matter (Optional enrichment)

- **EN now:** `doctrinalNote: "Not produced by kamma. Depends on present health and conditions."` / `proximateCause: "Favourable mind, temperature and nutriment; freedom from illness."`
- **Check:** Saṅgaha ch.6 lists kamma-born groups without lahutā/mudutā/kammaññatā; lahutā = citta+utu+āhāra only; §31 defines lahutā as physical health (garu/weight gone).
- **Fix applied:** Expanded note to name three causes explicitly (already implied in proximateCause):
  ```json
  "doctrinalNote": "Not produced by kamma; produced by mind (citta), temperature (utu) and nutriment (āhāra) only (Saṅgaha ch.6). Cf. §31: lahutā is physical health — absence of heaviness."
  ```

## 9. Cittas shortName (71 entries) — not error

- All 71 entries where `shortName` exists duplicate `name`. No semantic loss; UI field currently unused. **Admin options:** (a) delete `shortName` where identical (app falls back to `name`), (b) keep for future abbreviation (e.g. "Eye-c. wh. res. eq."), (c) generate automatically. No change in this PR.

## 10. VT step citta numbers — not checked

- `VT_VITHIMUTTA` step 1: `CI_019/CI_026 = dvihetuka, CI_027 = tihetuka special, CI_063–070 = tihetuka/deva` and `VT_Y_MON` step 4: "verbal and bodily kamma also begin at mind door" — si reviewer did **not** verify against source. No change; added to this doc for trace. If admin wants, add `"sourceStatus": "UNVERIFIED"` to those steps.

## What was changed in code

- `assets/content/content_en.json`: `kammas.KM_R_04.doctrinalNote`, `rupas.RP_022.doctrinalNote`, `vithis.VT_VITHIMUTTA.steps["2"]` (+ description/doctrinalNote). All other items documented only.

## Verification

- `python3 -m json.tool assets/content/content_en.json > /dev/null` — valid JSON
- Content unaffected: si/my locales keep `allowsEnglishFallback:true`, remain `draft`
