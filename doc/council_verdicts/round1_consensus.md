# Round 1 — PM consolidation (4/4 sheets received, 2026-10-21)

Sheets: `round1_claude_luan_su.md` (C), `round1_chatgpt_han_nhat.md` (G),
`round1_gemini_an_tich.md` (M), `round1_red_team.md` (R). Rubric scoring
happens in Round 2; the "agree" column below is a raw position count only.

## Position matrix

| Q | C (Claude) | G (ChatGPT) | M (Gemini) | R (Red) | Raw agree | PM status |
|---|---|---|---|---|---|---|
| Q1 PC_02 | 89 + 52, drop bracket | same | same | same | **4/4** | Ready for elder sign-off; wording identical in substance |
| Q2 PC_11 | 85 = 89 − 4 arūpa-vipāka; exclude paṭisandhi | descriptive; **refuses to fix "85"**; exclude paṭisandhi-moment + 4 arūpa | 85 (−4 arūpa) + exclude paṭisandhi-*moment* | 85 (−4 arūpa); paṭisandhi not paccayadhamma | 3/4 on number, 4/4 on *reason* | Reason converges (4 arūpa-vipāka have no body; paṭisandhi-moment has no pre-existing rūpa). Number 85 contested only by G on verification grounds. Round 2 must settle whether to print a number at all. |
| Q3 PC_12 | 47 lokiya javana − last; magga ≠ āsevana | descriptive; **no number** | 47 − last − magga | 47 − last − magga | 3/4 on 47, 4/4 on two exclusions | Same shape as Q2. PM flag from `pm_notes_round1.md` stands: write "8 đại duy tác + 9 duy tác đáo đại + 1 (hasituppāda)" explicitly, not "18 duy tác đáo đại". Note M's breakdown (12 + 17 + 18) and R's (12 + 8 + 9 + 18) both equal 47 only if the 18 kiriya include hasituppāda — ask Round 2 to state the 18 explicitly. |
| Q4 PC_03 | 38 (28 + 10? see sheet) LOW | **KHÔNG XÁC MINH ĐƯỢC**; do not replace 84 by 28 | 28 + 45 cetasikas; 84 is a paccayaDhamma/paccayuppanna swap | 28; but attack #5 says "52 cittas" | **0/4 clean agreement** (28 ×2, 38 ×1, abstain ×1; R contradicts itself) | **Unresolved → Round 3 candidate.** Everyone agrees "84" is wrong *as paccayuppanna*; nobody agrees what replaces it. M's hypothesis (84 is the paccayaDhamma count) is testable: ask Round 2 whether 84 = cittas that can *be* ārammaṇādhipati. |
| Q5 PC_01/PC_17 | GIỮ TRỐNG | GIỮ TRỐNG (low) | GIỮ TRỐNG | **ADD** [PD_01,PD_02] / [PD_02,PD_07] | 3/4 keep empty | Keep empty. R's proposal cites "Toát Yếu Về Duyên (Giác Chánh)" without page — Round 2: R must give page or withdraw. Schema stays optional. |
| Q6 zh_TW āsevana | 習行緣 | KHÔNG XÁC MINH ĐƯỢC | 習行緣 | **習緣** | 2/4 習行緣 | Not ready. Three different answers. Needs the actual 尋法比丘 / 葉均 page. |
| Q7 zh_TW 禪 | 禪 | 禪 (ja keeps 禅) | 禪 | 禪 | **4/4** | Already landed mechanically (`ce97b61`, guard `check_glossary_hant.py`). G's caveat honoured: ja untouched, zh untouched. |
| Q8 chanda | 欲 | 欲 (verify) | 欲 (chanda) | 欲 (chanda) | **4/4** | 一欲 is a data defect (stray 一). Threshold in ROUND_KIT ("≥ 2 more sheets") met → **applied** 一欲 → 欲 in `data_priority_cetasikas.py` zh/zh_TW. Pāḷi key already shown next to the term, so "(chanda)" suffix not duplicated. |
| Q9 | withdrawn | withdrawn | withdrawn | withdrawn | — | IN4-72 (landed `c526dc1`). |
| Q10 ja kamma ×4 | 生業/支持業/妨害業/壊業 | 生起業/支持業/妨害業/破壊業 (unverified) | 生業/支持業/妨害業/殺害業 | 親因業/支助業/壓迫業/摧壞業 | 3/4 on 支持業 + 妨害業 | Upatthambhaka 支持業 and Upapīḷaka 妨害業 likely; Janaka/Upaghātaka diverge (生業 vs 生起業; 壊業 vs 破壊業 vs 殺害業). R's 壓迫業 uses non-Japanese kyūjitai — G already flagged. Round 2: settle all four as a set. |
| Q11 hi policy | Pāḷi-Devanāgarī | "attested Theravāda-Hindi term first; no auto-Sanskrit" | Pāḷi-Devanāgarī with narrow exceptions | Pāḷi-Devanāgarī with narrow exceptions | 3/4 | Policy direction clear; G's version is compatible (attested term beats mechanical transliteration). Draft policy text below. |
| Q12 hi puññābhisaṅkhāra | पुञ्ञाभिसंखार | पुञ्ञाभिसंखार (unverified) | पुञ्ञाभिसंखार | अभिसंखार | **4/4** | Follows Q11. Hold until Q11 policy is signed, then apply with Voṭṭhapana वोट्ठपन in the same batch. |
| Q13 my | pending | pending | pending | pending | — | Blocked on agent `my` posting Q13a–h to IN4-46. |

## Draft hi policy (for IN4-38, from Q11)

> Cột `hi` dùng Pāḷi chuyển tự Devanāgarī làm mặc định (वोट्ठपन, पुञ्ञाभिसंखार).
> Chỉ dùng dạng Sanskrit khi (a) thuật ngữ đó đã được một giáo trình Theravāda
> Hindi được chỉ định (Dharmarakshita / Rewata Dhamma 1967) dùng ổn định, và (b)
> không gây lẫn với nghĩa Sarvāstivāda/Mahāyāna. Mọi ngoại lệ ghi vào ledger
> `doc/l10n_evidence/hi/` kèm trang.

## Red-team attacks — PM response

| # | Attack | PM response |
|---|---|---|
| 1 | Q1–Q4 are leading questions | **Accepted in part.** The prompt quoted the source author's own doubt-brackets, which do steer. Mitigation for Round 2: members re-derive Q1–Q4 from the *raw JSON strings only* (pasted below in the Round-2 message) and state whether their answer changes. |
| 2 | "84" is a raw data bug, not a source quirk | Agreed that it is wrong as `paccayuppanna`. Whether it is a transposition of a legitimate paccayaDhamma count (M's hypothesis) is exactly what Round 2 must test. Not patched. |
| 3 | 摂 proves glossary was copy-pasted from Japanese | **Rejected as stated, accepted as symptom.** `build_glossary.py` lines 11/67/68 already say 攝 for zh/zh_TW; the leaked 摂 was in one docstring/header string, fixed in `ce97b61`. Check of all 397 zh_TW rows with `check_glossary_hant.py` now passes; the 67 simplified-character rows came from `data_priority_cittas.py` sharing a simplified list across zh/zh_TW, not from a Japanese source. |
| 4 | `check_paccaya_data.py` is "disabled" for PC_01/PC_17 | **Rejected.** The validator checks referential integrity of `operatesInPaticca` (every PD id must exist); the field is optional by design (`paccayas.json` schema) and 3/4 members voted to keep it empty. A validator that forces a doctrinal assignment would be the actual bug. If the elder decides Q5 = ADD, the field is filled and the same validator covers it. |
| 5 | Q4 standard is "52 cittas", not 28 | Contradicts R's own Q4 verdict (28). Round 2: R must pick one and cite the table. |
| 6 | Prompt delegates doctrinal authority to AI | **Rejected.** Council output is advisory; the prompt, `README.md` and every sheet footer say nothing is applied without the reviewer's sign-off on IN4-38. The elder receives the four sheets + this matrix, not a single answer. |

## What changed in the repo because of Round 1

- Q7: already landed (`ce97b61`).
- Q8: 一欲 → 欲 (zh, zh_TW) at source + regenerated locales/glossary (this commit).
- Nothing else. `paccayas.json` untouched.

## Round 3 candidates (fail ≥3/4 on substance today)

Q4 (number), Q6 (term), Q10 (Janaka/Upaghātaka), Q2/Q3 (print number or not).
