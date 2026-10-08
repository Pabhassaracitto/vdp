# Integration contract — per-locale translation modules (cycle 1 decision)

Decided by the project manager on 2026-10-09 after reading the cycle-1
handoffs from `hi`, `zh`, `zh_TW`, `si`, `my`, `ja` (IN4-42…48, IN4-49).
Six agents produced six different delivery shapes. From now on there is
**one** shape. The `zh_TW` pattern is adopted because it is the only one that
touched no shared file and is idempotent.

## 1. One file per locale, nothing else

```
tool/content/data_priority_<locale>.py      # tracked, owned by that locale agent
```

`<locale>` ∈ `hi, zh, zh_tw, si, my, ja, th` (lower-case, underscore).

The module exposes exactly:

```python
LOCALE = "zh_TW"            # catalog key as used in assets/content/
def apply(catalog: dict) -> dict:
    """Fill ONLY fields that are empty/missing in `catalog`. Never overwrite.
    Must be idempotent: apply(apply(c)) == apply(c)."""
```

Allowed inside: plain dict literals (`PATICCAS_*`, `PACCAYAS_*`, `VITHIS_*`,
`CETASIKAS_*`, `RUPAS_*`, `KAMMAS_*`, `CITTAS_*`, `MODULES_*`) and the
`apply()` helper. Nothing else is imported from or written to shared files.

Not allowed from a locale agent:
- patches to `data_priority_conditions.py`, `data_priority_cetasikas.py`,
  `build_full_catalogs.py`, `build_glossary.py`, `glossary.csv`, tests,
  generated JSON (the `zh` and `si` cycle-1 patches must be re-shaped);
- proposals that live only in `l10n_work/` (gitignored → lost when the
  sandbox dies) or outside the repo (`/home/user/si_handoff/`);
- subdivisions as a list — they must be a dict keyed by immutable `namePali`
  with `{name, note}` values (see `PaccayaModel.localizedSubdivisionName`).

## 2. Builder hook (integrator-owned, applied once)

At the end of `build_catalog()` in `build_full_catalogs.py`, before `out`
is returned:

```python
import importlib
mod_name = f"tool.content.data_priority_{loc.lower()}"
try:
    importlib.import_module(mod_name).apply(out)
except ModuleNotFoundError:
    pass
```

Lesson modules still go through `merge_batch.py l10n_work/gen/<MODULE_ID>.json`;
commit the resulting `assets/content/content_<locale>.json` in the same
integration commit.

## 3. Evidence ledgers are tracked

```
doc/l10n_evidence/<locale>/glossary_evidence_<locale>.csv   # 397 rows
doc/l10n_evidence/<locale>/batch<N>_ledger.md
```

`confidence` vocabulary: `verified-page` (page/section cited from a native
edition) · `glossary` (matches agreed glossary, no page) · `repo` (only
evidence is existing repo text) · `low` (agent choice, needs elder).
`high` without a page citation is not allowed — `my` cycle-1 "high=306"
must be relabelled `repo`.

## 4. Delivery = pushed branch + comment

A handoff is accepted only when all of:
1. `tool/content/data_priority_<locale>.py` (+ ledgers under `doc/l10n_evidence/`)
   are **committed and pushed** to the agent's own Arena branch;
2. the Linear comment on the locale issue names the branch and commit SHA;
3. `python3 tool/content/check_content_locale.py <locale> --file <projected json> --glossary`
   output is pasted (projected slot count), plus `git apply --check`/import
   smoke test result.

The integrator cherry-picks that single commit; no patch files.

## 5. Shared-table bugs found in cycle 1 (integrator fixes once, all locales)

- `data_priority_conditions.py::KAMMAS` has `KM_P_*` ↔ `KM_U_*` Pāḷi names
  swapped and `KM_R_04` mislabelled (verified against `assets/data/kammas.json`).
  Tracked in Linear; do **not** patch per locale.
- `l10n_work/glossary.csv` line 4: `摂` (shinjitai) → `攝`.
- 67 `zh_TW` glossary rows still simplified (`禅/处/无/边/识`); 55 jhāna rows
  need the zh_TW agent's terminology call, the other 12 are mechanical.
- Duplicate glossary keys `Aparāpariyavedanīya-kamma` / `Aparāpariyavedanīyakamma`.

## 6. Doctrinal questions go to IN4-38 only

Each locale lists its List B in its own issue; the manager consolidates them
into one numbered queue on IN4-38 for the reviewer. Do not paste the same
question into IN4-50 **and** IN4-51 **and** IN4-49.
