# Arena AI Agent Team Assignment: Incremental Priority-Content Translation

## Objective

Complete the missing learner-facing translations in the VDP Flutter app, focusing on the **Study** and **Nhân Duyên** (Paṭiccasamuppāda / 24 conditions) tabs. Translate incrementally, but preserve doctrinal accuracy over coverage speed.

Target content locales:

- Hindi: `hi`
- Simplified Chinese: `zh`
- Traditional Chinese: `zh_TW`
- Sinhala: `si`
- Burmese/Myanmar: `my`
- Japanese: `ja`
- Thai: `th`

The owner explicitly prefers readable English fallback while a translation is missing. **Do not hide those fields and do not copy English into the locale JSON to fake a translation.** Keep the runtime field-level fallback to the English catalog enabled while these catalogs are `draft`. Non-Vietnamese locales must never fall back to Vietnamese. For `zh_TW`, try `zh` before English.

## Repository and coordination

- Work in the existing checkout and on its active Arena branch. Do not create or switch branches.
- The existing pull request is **#37**; update it rather than opening a duplicate.
- Coordinate as one team: assign each language to one translation agent and appoint one integration agent. Translation agents should work only in their assigned translation-source files; the integration agent owns the builder, generated JSON, tests, and final integration.
- Do not commit independently per language, file, or agent. Aim for **one consolidated translation commit**; at most two additional logical commits if code/tests must be separated from the content batch. Do not amend or force-push existing commits. Keep the final PR to a small number of meaningful commits for straightforward rebase/merge.

## Sources and terminology

Before translating, inspect and use:

- `l10n_work/glossary.csv` and `tool/content/build_glossary.py`
- `assets/content/content_en.json` as the English reference
- `assets/content/content_vi.json` and `assets/data/*.json` for the Vietnamese source and stable Pāḷi/source structure
- `doc/localization_content_plan.md`
- `docs/study-content-sources.md` and the cited source material when present
- Existing locale-specific translation tables under `tool/content/`

Pāḷi names, canonical IDs, formulas, `sourceRefs`, and structural fields are not ordinary prose: preserve them exactly unless the schema explicitly marks the field as translatable. Prefer the established tradition and glossary for each target language. In particular, do not import Mahāyāna/Sanskrit senses into Theravāda Japanese or Chinese terminology.

## Translation rules — non-negotiable

1. **Accuracy first.** Do not invent a doctrinal claim, example, quiz answer, or source attribution. If meaning is ambiguous or the language tradition cannot be verified, leave that field absent so the English fallback remains visible and record the uncertainty for a qualified reviewer.
2. **No blind machine-translation pass.** Drafts must be checked against the glossary and doctrinal source. A second, independent language-capable agent should review each batch; mark unresolved points for native/senior review.
3. Keep locale assets genuinely localized. Missing fields should remain missing in that locale asset and resolve through runtime fallback; never paste the English reference or Vietnamese source into a translation file as a placeholder.
4. Keep translation statuses honest. Leave languages in `draft` and lesson metadata `partial` until the stated completeness and review criteria are met. Do not mark any language `reviewed` merely because an AI agent generated a draft.
5. Preserve existing good translations. In particular, do not overwrite already-authored Simplified/Traditional Chinese or Japanese lesson content or non-placeholder vithi-step translations. Do not restore the legacy generic Chinese citta-example template (`生起于相应境遇中（...）`); it is not a citta-specific example and now correctly falls back to English.
6. Translate complete quiz items (question, correct answer, and every distractor) together. Do not ship a mixed-language quiz item as if complete.

## Work plan

Work in reviewable batches and keep a coverage ledger by locale, section, and field. Prioritize in this order:

### Batch 1 — Nhân Duyên detail content

- `paticcas`: missing four aspects (`characteristic`, `function`, `manifestation`, `proximateCause`), doctrinal notes, and examples.
- `paccayas`: missing conditioning/conditioned states (`paccayaDhamma`, `paccayuppanna`), doctrinal notes, examples, and subdivision names/notes.
- `vithis`: missing process context and missing step names/descriptions/doctrinal notes.

### Batch 2 — Study entity detail content

- `cittas`: translated examples and any genuinely authored explanatory fields.
- `cetasikas`: names, short names, descriptions, and four-aspect fields where the target-language wording can be grounded in the glossary/source.
- `rupas` and `kammas`: translate only schema fields that are displayed or consumed by the app; verify call sites before adding new fields.

### Batch 3 — Study lessons, review, and quizzes

- Audit all 17 modules. Fill missing `lessonSections`, `reviewCards`, and `quizSeeds` without overwriting existing localized items.
- Use stable IDs and preserve source references. Do not translate `sourceRefs` metadata or Pāḷi key terms unless their schema says otherwise.
- Complete a quiz item atomically; otherwise leave it on English fallback.

If the whole scope cannot be completed to the quality bar in one batch, finish and review a coherent batch rather than spreading unreviewed fragments across every locale. Leave the remaining fields absent so they continue to render in English.

## Implementation requirements

- Treat authored translation tables as the source of truth. Extend the existing `tool/content/data_priority_*.py` sources or add clearly named per-locale modules; update `tool/content/build_full_catalogs.py` so generated catalogs are reproducible.
- Do not hand-edit generated `assets/content/content_<locale>.json` without updating the source/builder. Regenerate the seven catalogs and confirm a second build is idempotent.
- Keep `ContentLanguage.allowsEnglishFallback` enabled while these catalogs are draft. Ensure the safe lookup order is selected locale → same-language/regional locale (where applicable) → English, never Vietnamese.
- Update regression tests to check both precedence (authored local text beats English) and fallback (missing local text resolves to English, not Vietnamese). Tests must continue to pass as newly translated fields are added.

## Validation gates

Run and report:

```bash
python3 tool/check_localizations.py
python3 tool/content/check_content_locale.py hi zh zh_TW si my ja th --glossary
python3 tool/content/build_full_catalogs.py
python3 tool/content/build_full_catalogs.py  # verify idempotence
flutter analyze
flutter test
```

Also inspect the learner-facing call sites and manually audit representative screens in each target locale. Report any tool unavailable in the environment; do not claim it passed.

## Deliverables

1. Translation-source changes and regenerated catalog assets for the completed batch.
2. Regression tests for local-first, English fallback, regional Chinese fallback, and no Vietnamese leakage.
3. A concise coverage/review report listing, per locale, translated fields, fields still using English fallback, glossary/source decisions, and questions needing native doctrinal review.
4. A small number of logical commits only, pushed to the existing Arena branch, with PR #37 updated and CI passing. Do not merge the PR.
