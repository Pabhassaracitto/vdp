# Thai (`th`) — batch 1 deliverable: Nhân Duyên (Paṭiccasamuppāda · 24 paccayas · vīthis)

**Status: `draft` / not reviewed.** This is a Thai translation *proposal* for a
qualified Thai reviewer and for the integration agent. No other locale, no
builder/runtime code, no registry/status and no test file in the repository has
been modified in the working tree.

## 1. Files in this delivery

| File | What it is |
| --- | --- |
| `tool/content/data_priority_th.py` | **New, Thai-only** translation source table (327 authored Thai strings). Contains `PATICCAS`, `PACCAYAS`, `VITHIS`, `CORRECTIONS`. |
| `l10n_work/th/build_hook.diff` | **Proposed** locale-guarded merge in `tool/content/build_full_catalogs.py` (not applied to the repo). Without it the builder cannot emit the deeper fields — see §5. |
| `l10n_work/th/TERMINOLOGY_EVIDENCE_LEDGER.md` | Terminology evidence ledger (term → Thai rendering → Thai source & section → confidence → unresolved forms). |
| `l10n_work/glossary_evidence_th.csv` | Machine-readable evidence ledger in the shape the project asks for (`pali, term, source_ref, confidence(high\|medium\|low), note`) — **83 rows** covering every term authored or repaired in batch 1. Not the full 397-row glossary: rows whose Thai cell this batch did not touch are still to be verified (see §6). |
| `l10n_work/th/glossary_th_corrections.csv` | **14 rows** of `l10n_work/glossary.csv` whose **th** column must be fixed before the glossary is regenerated (shared file — sent to the integrator; each row carries its exact line number). |
| `l10n_work/th/ci_evidence.txt` | Exact commands run and their output (scratch-copy build, byte-identity of the other six locales, idempotence, locale checkers). |
| `l10n_work/th/th_only.patch` | Unified diff of this delivery (new files only; nothing else touched). |

## 2. What was translated (batch 1 = work priority 1)

| Section | Fields translated | Count |
| --- | --- | --- |
| `paticcas` (PD_01–PD_12) | `characteristic`, `function`, `manifestation`, `proximateCause` (all 12) + `doctrinalNote` (8 — the four where `content_en.json` has none were deliberately left absent) | 56 strings + 15 examples |
| `paccayas` (PC_01–PC_24) | `paccayaDhamma`, `paccayuppanna`, `doctrinalNote` (all 24), `subdivisions` for the 9 paccayas that have them, `examples` | 72 strings + 25 subdivision entries + 42 examples |
| `vithis` (VT_*) | `arisingCondition`, `significance`, `doctrinalNote` (all 4) + **all 29 step texts** (VT_NGU_MON_RATLON 11, VT_NGU_MON_LON 9, VT_Y_MON 6, VT_VITHIMUTTA 3) | 12 + 29 steps |
| Repairs | `cittas` CI_026/CI_027 (somanassa/equanimity swap), CI_028/CI_029 (Khmer-script corruption); `kammas` KM_P_01…KM_U_04 (names/short names/descriptions were attached to the wrong ids) | 4 + 8 entries |

Register and conventions: Thai Abhidhamma teaching Thai (อภิธรรมโชติกะ /
อภิธัมมัตถสังคหะ). The four aspects read `…เป็นลักษณะ / …เป็นกิจ /
…เป็นปัจจุปัฏฐาน / …เป็นปทัฏฐาน` (ลักขณาทิจตุกะ). Pāḷi terms are kept in Thai
transliteration following `l10n_work/glossary.csv` (th) and the Thai sources;
no English text is embedded in any Thai value (verified by script). Entity IDs
inside prose (`CI_028`, `CS_PHASSA`-style references) are preserved unchanged.

## 3. Coverage effect (measured on a scratch copy with the hook applied)

| Metric | before | after |
| --- | --- | --- |
| `check_content_locale.py th` coverage slots | 717/4312 (16.6 %) | **981/4312 (22.8 %)** |
| Leaf fields missing vs `content_en.json` in `paticcas` / `paccayas` / `vithis` | 71 / 164 / 54 | **0 / 0 / 0** |

## 4. Fields intentionally left on English fallback (not gaps by accident)

| Section | Remaining fields | Reason |
| --- | --- | --- |
| `cetasikas` (52) | four aspects ×4 = 208 | Not in this batch; next batch (needs its own term-by-term review). |
| `rupas` (28) | four aspects ×4 + `doctrinalNote` = 135 | idem |
| `cittas` | `shortName` where English has one (89), `examples` (12) | idem (plus a decision: 32 English cittas ship `shortName: null`) |
| `kammas` | `doctrinalNote` (16), `examples` (16), remaining leaf slots | idem |
| all 17 `studyModules` | 6006 slots (`lessonSections`, `reviewCards`, `quizSeeds`) | Priority 3; the Thai module content does not exist yet and must be authored module-by-module (quiz items authored atomically). |
| `paticcas` PD_04/PD_05/PD_09/PD_10 | `doctrinalNote` | `content_en.json` has no such field for these ids; nothing was invented. |
| `paccayas` | `examples`/notes for fields the English source does not carry | idem |

## 5. Integration notes (for the coordinator — do not merge blindly)

1. **The hook is required.** `build_full_catalogs.py` currently publishes only
   `name`/`shortName`/`description` for these sections, so nothing in
   `data_priority_th.py` can reach `content_th.json` without a merge step.
   `build_hook.diff` is a minimal, locale-guarded (`if loc == "th"`) addition:
   - it never runs for another locale (verified: hi/ja/my/si/zh/zh_TW byte-identical after the build),
   - it preserves existing Thai prose unless the entry is in `CORRECTIONS`
     (verified: the authored VT_NGU_MON_RATLON step text already in
     `content_th.json` is kept),
   - it is idempotent (two consecutive builds produced identical files).
   Review/apply it, or copy the three merge statements into your own
   integration step. Applying it touches **no** other locale and no runtime
   code.
2. **Fix the Thai glossary first** (`glossary_th_corrections.csv`), then
   regenerate `l10n_work/glossary.json`. The eight corrected kamma names will
   otherwise trip `S5` glossary-drift warnings against the currently rotated
   `Garuka-kamma → ชนกกรรม …` rows.
3. **Source-metadata bug worth fixing on the integration side:**
   `tool/content/data_priority_conditions.py`, `KAMMAS`, has the `pali` labels of
   the `KM_P_*` (by-function: Janaka/Upatthambhaka/Upapīḷaka/Upaghātaka) and
   `KM_U_*` (by-priority: Garuka/Āsanna/Āciṇṇa/Kaṭattā) groups swapped. That
   bug is what produced the wrong Thai names and the rotated glossary rows.
   `assets/data/kammas.json` and `content_en.json` agree with each other and
   with this patch; only the table labels and the two generated glossary files
   disagree.
4. Rebuild and check:
   ```bash
   python3 tool/content/build_full_catalogs.py
   python3 tool/content/build_full_catalogs.py          # idempotence
   python3 tool/check_localizations.py
   python3 tool/content/check_content_locale.py th
   python3 tool/content/check_content_locale.py th --glossary   # S5 only after step 2
   flutter analyze && flutter test
   ```
   Expected after step 2: `✓ th (981/4312 slots, 22.8%)` and no hard failures
   (the current run in `ci_evidence.txt` is green; `S5` warns until the
   glossary rows are fixed).
5. `assets/content/content_th.json` is generated — the working tree keeps it
   untouched, as required; regenerate it via the builder rather than editing it.

## 6. Glossary coverage of this batch, and open questions for qualified Thai review

`l10n_work/glossary_evidence_th.csv` has 83 rows: **39** of them map to an
existing `l10n_work/glossary.csv` headword (the note carries the line number),
and **44** are terms the glossary does not currently contain — the four aspects
(ลักษณะ / รสะ / ปัจจุปัฏฐาน / ปทัฏฐาน / ลักขณาทิจตุกะ), the 24 paccaya names
(only `Paccaya` itself is a headword today), the vīthi moment names
(อตีตภวังค์, ภวังคจลนะ, ภวังคุปัจเฉทะ, ทวิปัญจวิญญาณ, โวฏฐัพพนะ, ชวนะ …) and the
field-level terms ปัจจัยธรรม / ปัจจยุปบันนธรรม. Those 44 are candidates for the
glossary, but adding headwords is the coordinator's call (`glossary.csv` is a
shared file). The remaining ~358 headwords were **not** verified in this batch —
they belong to batches 2–3 (cetasikas, rupas, modules).

See `TERMINOLOGY_EVIDENCE_LEDGER.md` §6 (U-1…U-9). The most consequential are
U-1 (the 84-citta figure for อารัมมณาธิปติ in `PC_03`), U-2 (postnascence: the
English narrows the conditioned state to kamma-born matter, while the Thai
Paṭṭhāna teaching includes matter born of any of the four origins) and U-6
(the English "three understanding faculties" list in `PC_16`).
