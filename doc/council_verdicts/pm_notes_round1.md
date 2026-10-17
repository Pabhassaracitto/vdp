# PM notes on council Round 1 (2026-10-09)

Purpose: what the project manager checked against the repo before the sheet
goes further. Not doctrine; just hygiene so the elder's time is not wasted.

## Procedure

- Only **1 of 4** Round-1 sheets received (Claude / AI-Luận sư). The member
  correctly refused to simulate the other three. Decision: **Option B** —
  run the same prompt on ChatGPT, Gemini and Grok/Qwen in fresh sessions,
  collect their Round-1 sheets verbatim into this folder, then paste all four
  back into each session for Round 2. Do not accept simulated members.
- The sheet's signature date (2025-07-14) is a model artefact; the sheet was
  received 2026-10-09.

## Repo cross-checks on the content

| Q | Check | Result |
|---|---|---|
| Q1 | Claude's rewrite drops the parenthesis entirely. | Consistent with `paccayuppanna` elsewhere in `paccayas.json` which uses bare counts. No repo conflict. |
| Q2 | Proposed "85 (trừ 4 quả vô sắc)" vs source "85 … trừ tục sanh". | Both give 85 but by different exclusions — the elder must pick the *reason*, not just the number, because the locales translate the reason. |
| Q3 | "47 đổng lực" and "18 duy tác đáo đại (8 đại duy tác + 10 duy tác đáo đại)". | Arithmetic internally consistent (12+8+9+18 = 47). Note: 8 mahākiriya are *kāmāvacara*, not mahaggata — the label "18 duy tác đáo đại" in the short JSON string is misleading; if adopted, write "8 đại duy tác + 9 duy tác đáo đại + …" explicitly. Flag to elder. |
| Q4 | Proposed 38 includes 18 mahaggata cittas as ārammaṇādhipati paccayuppanna. | **PM flag:** mahaggata cittas take paññatti/kasiṇa objects; whether they can "esteem" an object as ārammaṇādhipati is exactly the kind of point that differs between textbooks. Claude itself marks this *Vừa* and asks for Table 8.3. Treat Q4 as **unresolved**; do not let a single sheet settle it. |
| Q5 | GIỮ TRỐNG. | Matches `check_paccaya_data.py` (PASS, schema allows absent). Low risk. |
| Q7 | 禪 everywhere in zh_TW. | Already integrator-owned mechanical fix (IN4-44 / IN4-49 §5). Can proceed independent of elder. |
| Q8 | 一欲 → 欲. | `glossary.csv` row 18 `Chanda` has 一欲 in both zh and zh_TW; `data_priority_cetasikas.py` line ~126 is the source. Wait for ≥ 2 more sheets before editing. |
| Q10/Q11 | Sources explicitly marked "KHÔNG XÁC MINH ĐƯỢC". | Good behaviour; these need the Hán–Nhật / Ấn–Tích members with the actual books. |
| Phát hiện ngoài lề | 摂→攝, duplicate Aparāpariya keys, 禅 rows, Voṭṭhapana Sanskrit form. | All already on IN4-49/IN4-72 lists except the regex sweep of zh_TW for other simplified characters — added as a follow-up task for the integrator (cheap). |

## What is NOT to be done yet

- No edit to `assets/data/paccayas.json` (Q1–Q4) until the elder signs on IN4-38.
- No glossary edits from this sheet except the mechanical ones already approved.
