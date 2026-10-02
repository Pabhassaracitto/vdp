# VDP content handoff — two remaining large tasks

Repo: `Pabhassaracitto/vdp`, branch `arena/01a0f39c-vdp`.
Read `tool/content/README.md` and `doc/localization_content_plan.md` first — they
document the whole pipeline these tasks must follow.

Already done this session (do not redo): dark-mode contrast fix in
`lib/features/quiz/quiz_screen.dart`; `content_en.json` fully real for
`cittas` (names + examples + doctrinalNote), `cetasikas`, `rupas`, `kammas`,
`paticcas`, `vithis`, `paccayas` (all Tier-A entity fields); all 244
`lessonSections[].keyTerms[].meaning` across all 17 study modules (was
`"Related to {term}"` placeholder everywhere, now real one-sentence glosses).
Reference file: `l10n_work/gen_entities/lesson_terms_en.json`.

---

## Task 1 — Rewrite `lessonSections` body paragraphs & summaries in `content_en.json`

**Scope:** 437 of 477 `body` sentences (92%) and 92 of 93 `summary` fields
(99%) across 16 of 17 study modules (`M1_BASICS` is already fully real) are
auto-generated placeholder text, e.g.:

- `"This paragraph explains {Term}: its characteristic, function and role
  within the citta as taught in the Abhidhamma."`
- `"This section presents the Abhidhamma teaching on the relevant mental
  factors: their definitions, classifications and relationships as preserved
  in the source material."`
- `"Summary of this section."`

Path: `assets/content/content_en.json` → `studyModules.<MODULE_ID>
.lessonSections[].body` (array of strings) and `.summary` (string).
`title`, `keyTerms[].term`/`.pali`, and `sourceRefs` are already correct —
leave them untouched. Do not touch `id`, `translationStatus`, or anything in
`assets/data/*.json`.

**How to find every instance precisely:**
```python
import json
en = json.load(open('assets/content/content_en.json', encoding='utf-8'))
for mid, m in en['studyModules'].items():
    for sec in m.get('lessonSections', []):
        if sec.get('summary') == 'Summary of this section.':
            print('SUMMARY', mid, sec['id'])
        for i, b in enumerate(sec.get('body', [])):
            if b.startswith('This paragraph explains') or \
               b.startswith('This section presents the Abhidhamma teaching'):
                print('BODY', mid, sec['id'], i)
```

**Reference material to write from (all already in the repo):**
1. `assets/data/{cittas,cetasikas,rupas,kammas,paticca,vithis,paccayas}.json`
   — canonical Vietnamese source with real `trangThai`/`phanSu`/`thanhTuu`/
   `nhanGan`/`doctrinalNote`/`examples` per entity, already traceable to the
   PDFs via `sourceRefs`.
2. `assets/content/content_en.json` entity sections (`cittas`, `cetasikas`,
   `rupas`, `kammas`, `paticcas`, `vithis`, `paccayas`) — **already contain
   accurate English translations of the above** (fixed this session). Most
   `keyTerms` in `lessonSections` map 1:1 to an entity already described
   there in correct English — reuse that language rather than retranslating
   from scratch.
3. `reference/*.pdf` (10 Vietnamese source PDFs, e.g. `VDP-TamSo.pdf`,
   `VDP-Nghiep.pdf`, `VDP-ToatYeuVeDuyen.pdf`) — each `lessonSection` already
   cites the exact file/page/note in `sourceRefs`; use these for anything not
   covered by the entity JSON (e.g. M8/M17 dependent-origination narrative,
   M10 cognitive-process narrative, M15 combination tables, M16 persons and
   realms).
4. `l10n_work/gen_entities/lesson_terms_en.json` — the 244 keyTerm glosses
   already written this session; good style reference and avoids
   re-deriving definitions already nailed down.

**Style:** flowing educational prose, 2–4 sentences per body paragraph,
matching the register already used in `M1_BASICS` (already real, read it
first as the quality bar) and in the fixed entity `doctrinalNote` fields.
`summary` = one sentence capturing the section's main point, written only
after the body of that section is fixed.

**Per-module scope (body sentences needing rewrite / total):**
M11_BIET_CANH 16/25 · M2_SI_PHAN 7/12 · M4_AKUSALA 52/52 · M12_VO_NHAN 16/16 ·
M3_TINH_HAO_BIEN_HANH 37/43 · M5_SOBHANA 14/14 · M13_SAC_GIOI 12/14 ·
M14_VO_SAC_GIOI 13/13 · M7_SIEU_THE 14/14 · M6_NGHIEP 38/38 ·
M8_NHAN_DUYEN 31/31 · M9_SAC_PHAP 33/33 · M10_LO_TRINH 40/40 ·
M15_TAM_SO_PHOI_HOP 35/35 · M16_NGUOI_VA_COI 46/46 · M17_DUYEN_CHI_TIET 33/33.
(This can be split module-by-module across several agent sessions —
each module is independent.)

**After each module:**
```bash
python3 -m json.tool assets/content/content_en.json > /dev/null   # valid JSON
python3 tool/content/check_content_locale.py en --glossary        # 0 warnings
```
Commit to `arena/01a0f39c-vdp` only. **Before committing**, always run
`git fetch origin arena/01a0f39c-vdp && git diff origin/arena/01a0f39c-vdp --stat`
and if local HEAD has silently diverged to a stale commit, recover with
`git reset --mixed origin/arena/01a0f39c-vdp` (this has happened repeatedly
in this session — always verify before every commit).

---

## Task 2 — Native-language translation of Tier-A entity fields (hi, si, my, th, zh, zh_TW, ja)

**Scope:** for all 7 non-vi/en locales, `assets/content/content_<locale>.json`
only has `name` / `shortName` / `description` (and citta `doctrinalNote`) per
entity — every deeper field (`characteristic`, `function`, `manifestation`,
`proximateCause`, `examples`, `paccayaDhamma`, `paccayuppanna`, step
descriptions, etc.) is missing and currently falls back to the now-correct
English in `content_en.json`. That fallback is accurate but not native-
language, which is the residual cause of any remaining "feels like English
leaking" complaints for users of hi/si/my/th/zh/zh_TW/ja.

**Source of truth for meaning:** `assets/content/content_en.json`'s entity
sections (`cittas`, `cetasikas`, `rupas`, `kammas`, `paticcas`, `vithis`,
`paccayas`) — all fixed this session, all real. Translate **from this
English**, not from scratch from the Vietnamese, to guarantee consistency
with what EN/other-locale users already see. Keep Pāḷi terms embedded exactly
as in `glossary.json`/`glossary.csv`.

**Field counts per entity category** (same for every locale):
cetasikas 52×4 fields=208 · rupas 28×5=140 · cittas 121×1(examples; name/
doctrinalNote are done)=121 · kammas 16×2=32 · paticcas 12×5(+8 doctrinalNote)=68 ·
vithis 4×4(+ step fields)=16+ · paccayas 24×4(+9 subdivisions)=105.
≈ 690 fields × 7 languages ≈ 4,800 individual translations. This is a large,
multi-session undertaking — **recommend running it one language at a time**,
or one entity category at a time across all 7 languages, whichever an agent
session can complete validated in one sitting.

**Process per locale** (`tool/content/README.md` §"Translating a new
language" — adapt step 2 since these locales already exist):
```bash
python3 tool/content/init_locale.py hi           # regenerates worksheet,
                                                   # preserves existing real fields
# -> l10n_work/content_hi.worksheet.json has a TODO (or stale EN fallback)
#    for every field listed above, each with a `_src` sibling showing the
#    Vietnamese original and the current English reference — translate those.
python3 tool/content/check_content_locale.py hi \
    --file l10n_work/content_hi.worksheet.json --glossary
python3 tool/content/init_locale.py hi --strip   # -> assets/content/content_hi.json
```
Repeat for si, my, th, zh, zh_TW, ja.

**Hard rules (unchanged, from `tool/content/README.md`):** never translate
`id` / `namePali` / `pali` / `type` / `sourceRefs` / any field in
`assets/data/*.json`; reuse `l10n_work/glossary.json` terminology; no `TODO`
left in shipped output; `translationStatus: "draft"` is acceptable for a
first pass. Validate with `check_content_locale.py <locale> --glossary`
(0 warnings) before promoting with `--strip`, then
`python3 tool/check_localizations.py && python3 tool/subset_fonts.py`.

**Before every commit:** repeat the git-HEAD-reset recovery check described
in Task 1 — this bug has recurred multiple times this session and silently
rewinds local history if skipped.
