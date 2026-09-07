# Study content tooling

Scripts that build and validate the study content shipped in
`assets/content/content_<locale>.json`.

Full plan and rationale: [`doc/localization_content_plan.md`](../../doc/localization_content_plan.md).

## The scripts

| Script | Purpose |
|---|---|
| `build_content.py` | Serialises the authored Vietnamese source (`m1_m5_m7.py`, `m6_m8.py`, `m9_m10.py`) into `content_vi.json`. **Vietnamese is the source of truth.** |
| `build_source_notes.py` | Regenerates `docs/study-content-sources.md`, the audit trail. Run after `build_content.py`. |
| `build_glossary.py` | Builds the 324-headword Pāḷi glossary every translation must key to. |
| `init_locale.py` | Scaffolds / refreshes a translation worksheet, and promotes it to a shippable file. |
| `check_content_locale.py` | Validates a translation before it may ship. |

## Translating a new language

```bash
# 1. Agree terminology FIRST — this gates everything else.
python3 tool/content/build_glossary.py
#    Fill the hi / zh / zh_TW / si / my / ja columns in l10n_work/glossary.csv,
#    following the reference edition named in that file's header.
python3 tool/content/build_glossary.py --report     # aim for >= 95%

# 2. Generate the worksheet.
python3 tool/content/init_locale.py hi
#    -> l10n_work/content_hi.worksheet.json

# 3. Translate: replace every "TODO".
#    Each field carries a sibling `_src` block with the Vietnamese original
#    and the English reference, so you never need a second file open.

# 4. Check as you go.
python3 tool/content/check_content_locale.py hi \
    --file l10n_work/content_hi.worksheet.json --glossary

# 5. Promote to the app bundle.
python3 tool/content/init_locale.py hi --strip
#    -> assets/content/content_hi.json  (no _src, no TODOs)

# 6. Enable it in the app: in
#    lib/core/localization/content_languages.dart change that language's
#    status from `planned` to `draft` (then `reviewed` after approval).

# 7. Final gates.
python3 tool/check_localizations.py
python3 tool/subset_fonts.py       # regenerate fonts — content adds glyphs!
flutter test
```

## Never translate these

`id` · `namePali` / `pali` · `type` · `sourceRefs` — plus every structural
field in `assets/data/*.json` (`bhumiGroup`, `vedana`, `group`, `causes`, …).

Pāḷi is the anchor that keeps all languages aligned and keeps every claim
traceable to a source PDF. `check_content_locale.py` rejects any change to it.

## Worksheets are not committed

`l10n_work/` is gitignored: worksheets are large, regenerable TODO scaffolds.
Only the `--strip` output in `assets/content/` ships. Re-running
`init_locale.py` **preserves** anything already translated, so it is safe to
regenerate after the Vietnamese source changes.

Two things depend on this separation:

* `pubspec.yaml` bundles `assets/content/` wholesale — a worksheet placed there
  would ship `TODO` to end users.
* `subset_fonts.py` builds font subsets from `assets/content/`, so only real
  translations contribute glyphs.

## Validation rules

Hard failures block a release; soft warnings are for the reviewer.
See §5 of the plan document for the full table.

```bash
python3 tool/content/check_content_locale.py --all              # everything shipped
python3 tool/content/check_content_locale.py hi --glossary      # + terminology
python3 tool/content/check_content_locale.py --all --strict     # soft -> hard
```
