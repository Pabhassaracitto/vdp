# Myanmar (`my`) translation proposal — terminology evidence ledger & coverage report

**Locale:** `my` only. No other locale, no builder/runtime code, no registry/status,
no test file was modified.
**Deliverable shape:** commits on branch `arena/fcadccc3-vdp`, opened as a pull
request against `main`. Changes are confined to translation *source tables*;
`assets/content/content_my.json` was **not** regenerated — that is the
integrator's step.
*(An earlier revision of this ledger was handed over as a standalone unified
diff, `l10n_work/my_proposal.patch`. The pull request supersedes that file; it
is not committed, because a 313 KB copy of this same diff would go stale the
moment any table is edited.)*
**Status:** `draft` / `partial`. This is a draft for independent review, not
doctrinal approval.

---

## 1. Files in the proposal

| File | Kind | Contents |
|---|---|---|
| `tool/content/data_priority_my_conditions.py` | new | paticcas ×12 (4 aspects + note + examples), paccayas ×24 (paccayaDhamma, paccayuppanna, note, examples, subdivisions), vithis ×4 (arisingCondition, significance, doctrinalNote + 18 step entries) |
| `tool/content/data_priority_my_cetasikas.py` | new | 52 cetasikas × 4 aspects |
| `tool/content/data_priority_my_cittas.py` | new | 12 akusala cittas × examples |
| `l10n_work/gen/M8_NHAN_DUYEN.json` | new | full module: 7 sections, 18 cards, 16 quizzes |
| `l10n_work/gen/M17_DUYEN_CHI_TIET.json` | **+`my` key** | full module: 6 sections, 12 cards, 12 quizzes |

Why parallel `my`-only modules rather than extending the existing tuples:
`build_full_catalogs.py` unpacks `data_priority_*.py` entries **positionally for
all seven locales** (e.g. `name, short_name, desc = base`). Adding a fourth
element would change the arity for `hi/ja/si/th/zh/zh_TW` too. The umbrella
prompt explicitly permits "clearly named per-locale modules", so nothing shared
is touched.

`l10n_work/gen/M17_DUYEN_CHI_TIET.json` already carried an `hi` translation. The
`my` block was appended textually so the diff to that file is **376 insertions /
1 deletion** (the closing brace only); the `hi` object is byte-for-byte identical
to `HEAD` — verified:

```
hi identical to HEAD: True
locales present: ['hi', 'my']
```

---

## 2. Verification status — read this first

**What could be verified in this environment:**

1. **Project glossary** — `l10n_work/glossary.csv`, column `my`, header line 11.
   397 headwords carry an agreed `my` rendering. The file header (line 7) names
   the baseline: `# my: Myanmar let-than manual tradition (Abhidhammattha
   Sangaha)`. I programmatically confirmed that **132 of these agreed renderings
   appear verbatim in the new text** (list in §3).
2. **Existing authored `my` content** in the repo — `assets/content/content_my.json`
   and the `"my"` tuples in `tool/content/data_priority_conditions.py`. Used as the
   register and compound-formation baseline (e.g. `ပစ္စည်း` for *paccaya*,
   `အတိမဟန္တာရုံ ပဉ္စဒွါရဝီထိ` for the vithi names, `အဟိတ်`/`မဟဂ္ဂုတ်`/`လောကုတ္တရာ`
   for the bhūmi vocabulary).
3. **Canonical anchors** — each entity's own `sourceRefs` in `assets/data/*.json`
   (Paṭṭhāna *Paccayaniddesa*, Abhidhamma Piṭaka VII; Visuddhimagga ch. XVII,
   PTS iii 532–533). These loci were read from the dataset, not invented.
4. **One external Burmese-script attestation** — WisdomLib's Pāḷi entry for
   *padaṭṭhāna* quotes a Burmese text rendering it ပဒဋ္ဌာနီ ("proximate cause /
   that on which it depends"). This corroborates the ပဒဋ္ဌာန် rendering used in
   the four-aspect prose.

**What could NOT be verified, and is therefore marked unverified:**

- **Page-level citation to a named Myanmar edition.** The glossary names the
  *let-than* tradition generically; it does not name an edition, compiler, or
  page. Outbound network access in this sandbox is limited to
  `github.com / api.github.com / registry.npmjs.org / pypi.org /
  files.pythonhosted.org`, so no Myanmar-script Abhidhamma manual could be
  retrieved and paginated. Searches attempted returned Japanese, Sinhala, Thai,
  English and Indonesian Abhidhamma material plus the English-language Pa-Auk
  texts — none of which is admissible as a Myanmar let-than attestation.
- Consequently **no invented edition/page citations appear anywhere in this
  proposal.** Every "Source" cell below states exactly what was checked.
  Terms whose doctrinal sense rests on an unchecked manual page are flagged
  **UNVERIFIED — needs Myanmar Sayadaw review** in §7.

**Confidence scale used:**
- **H** — rendering is in the project glossary `my` column *and* already used by
  previously-authored `my` content in this repo.
- **M** — rendering is in the glossary `my` column but is newly exercised in
  prose here; not previously attested in this repo.
- **L** — rendering is not in the glossary; chosen by regular Pāḷi→Myanmar
  transliteration or as a Burmese calque. **Requires reviewer sign-off.**

---

## 3. Terminology evidence ledger

Source column legend:
`GLOSSARY` = `l10n_work/glossary.csv` col `my` (verified by reading the file)
`REPO-MY` = matches text already authored in `content_my.json` / `data_priority_conditions.py`
`SRCREF` = doctrinal locus taken from the entity's own `sourceRefs`
`WLIB` = WisdomLib Pāḷi entry quoting a Burmese text

### 3.1 Terms used verbatim from the agreed glossary (132 confirmed present)

These were matched programmatically against the new text; the full matched set is
reproducible with the check in §6. Highlighted below are the load-bearing terms
for this batch:

| Pāḷi | ID / context | Myanmar rendering | Source | Conf. |
|---|---|---|---|---|
| Paṭiccasamuppāda | M8 module, `PD_*` | ပဋိစ္စသမုပ္ပါဒ် | GLOSSARY | H |
| Paṭṭhāna | `TERM_PATTHANA` | ပဋ္ဌာန်း | GLOSSARY | H |
| Paccaya | `TERM_PACCAYA`, all `PC_*` | ပစ္စည်း | GLOSSARY + REPO-MY | H |
| Avijjā | `PD_01` | အဝိဇ္ဇာ | GLOSSARY | H |
| Saṅkhārā | `PD_02` | သင်္ခါရ | GLOSSARY | H |
| Viññāṇa | `PD_03` | ဝိညာဏ် | GLOSSARY | H |
| Nāmarūpa | `PD_04` | နာမ်ရုပ် | GLOSSARY | H |
| Saḷāyatana | `PD_05` | သဠာယတန | GLOSSARY | H |
| Phassa | `PD_06`, `CS_PHASSA` | ဖဿ | GLOSSARY | H |
| Vedanā | `PD_07`, `CS_VEDANA` | ဝေဒနာ | GLOSSARY | H |
| Taṇhā | `PD_08` | တဏှာ | GLOSSARY | H |
| Upādāna | `PD_09` | ဥပါဒါန် | GLOSSARY | H |
| Bhava | `PD_10` | ဘဝ | GLOSSARY | H |
| Jāti | `PD_11` | ဇာတိ | GLOSSARY | H |
| Jarāmaraṇa | `PD_12` | ဇရာ-မရဏ | GLOSSARY | H |
| Kilesavaṭṭa | `TERM_KILESAVATTA` | ကိလေသဝဋ် | GLOSSARY | H |
| Kammavaṭṭa | `TERM_KAMMAVATTA` | ကမ္မဝဋ် | GLOSSARY | H |
| Vipākavaṭṭa | `TERM_VIPAKAVATTA` | ဝိပါကဝဋ် | GLOSSARY | H |
| Dve mūlāni | `TERM_DVE_MULANI` | မူလနှစ်ပါး | GLOSSARY | H |
| Tayo addhā / Addhā | `TERM_TAYO_ADDHA`, `TERM_BA_THOI_M17` | ကာလသုံးပါး | GLOSSARY | H |
| Vīsatākārā / Visākāra | `TERM_VISATAKARA`, `TERM_20_HANH_TUONG_M17` | အခြင်းအရာ ၂၀ | GLOSSARY | H |
| Tisandhi | `TERM_TISANDHI` | စပ်ကြား ၃ ပါး | GLOSSARY | H |
| Catusaṅkhepa | `TERM_CATUSANKHEPA` | အကျဉ်းလေးပါး | GLOSSARY | H |
| Kammabhava | `TERM_NGHIEP_HUU_M17`, `TERM_29_TAM_M17` | ကမ္မဘဝ | GLOSSARY | H |
| Upapattibhava | `TERM_SANH_HUU_M17` | ဥပပတ္တိဘဝ | GLOSSARY | H |
| Kammaja-rūpa | `TERM_SAC_NGHIEP_TUC_SINH_M17` | ကမ္မဇရုပ် | GLOSSARY | H |
| Mānāyatana | `TERM_Y_NHAP_M17` | မနာယတန | GLOSSARY | H |
| Manovedanā | `TERM_Y_THO_M17` | မနောဝေဒနာ | GLOSSARY | H |
| Vedanāpaccayā taṇhā | `TERM_THO_DUYEN_AI_M17` | ဝေဒနာပစ္စယာ တဏှာ | GLOSSARY | H |
| Viññāṇapaccayā nāmarūpaṁ | `TERM_THUC_DUYEN_M17` | ဝိညာဏပစ္စယာ နာမရူပံ | GLOSSARY | H |
| Jāti (4) | `TERM_BON_CACH_SINH_M17` | ဇာတိ ၄ မျိုး (အဏ္ဍဇ၊ ဇလာဗုဇ၊ သံသေဒဇ၊ ဩပပါတိက) | GLOSSARY | M |
| Soka, Parideva, Dukkha, Domanassa, Upāyāsa | `TERM_SAUU_BI_KHO_UU_NAO_M17` | စိုးရိမ်ခြင်း၊ ငိုကြွေးခြင်း၊ ဆင်းရဲခြင်း၊ နှလုံးမသာခြင်း၊ ပြင်းစွာပူပန်ခြင်း | GLOSSARY (exact 5-tuple) | H |
| Apuññābhisaṅkhāra | `TERM_APUNNA` | အပုညာဘိသင်္ခါရ | GLOSSARY | H |
| Puññābhisaṅkhāra | `TERM_PUNNA` | ပုညာဘိသင်္ခါရ | GLOSSARY | H |
| Āneñjābhisaṅkhāra | `TERM_ANENJA` | အာနေဉ္ဇာဘိသင်္ခါရ | GLOSSARY | H |
| Moha | `CS_MOHA`, `TERM_MOHA_M8` | မောဟ | GLOSSARY | H |
| Vijjā | `TERM_VIJJA` | ဝိဇ္ဇာ | GLOSSARY | H |
| Ayoniso manasikāra | `PD_01.proximateCause` | အယောနိသောမနသိကာရ | GLOSSARY | H |
| Bhavaṅga | vithi steps | ဘဝင်စိတ် | GLOSSARY | H |
| Javana | vithi steps | ဇော | GLOSSARY | H |
| Tadālambana | vithi steps | တဒါရုံ | GLOSSARY | H |
| Pañcadvārāvajjana | vithi steps | ပဉ္စဒွါရာဝဇ္ဇန်း | GLOSSARY | H |
| Manodvārāvajjana | vithi steps | မနောဒွါရာဝဇ္ဇန်း | GLOSSARY | H |
| Sampaṭicchana | vithi steps | သမ္ပဋိစ္ဆိုင်းစိတ် | GLOSSARY | H |
| Voṭṭhapana | vithi steps | ဝုဋ္ဌော | GLOSSARY | H |
| Vīthimutta-citta | `VT_VITHIMUTTA` | ဝီထိမုတ်စိတ် | GLOSSARY | H |
| Atimahanta-ārammaṇa | `VT_NGU_MON_RATLON` | အတိမဟန္တာရုံ | GLOSSARY | H |
| All 52 cetasika names | `CS_*` | (glossary renderings) | GLOSSARY | H |
| 5 sobhana pairs (kāya-/citta- passaddhi, lahutā, mudutā, kammaññatā, pāguññatā, ujugatā) | `CS_KAYA*`, `CS_CITTA*` | ကာယ… / စိတ္တ… compounds | GLOSSARY | H |
| Sammā-vācā / -kammanta / -ājīva | `CS_SAMMA*` | သမ္မာဝါစာ / သမ္မာကမ္မန္တ / သမ္မာအာဇီဝ | GLOSSARY | H |
| Karuṇā / Muditā | `CS_KARUNA`, `CS_MUDITA` | ကရုဏာ / မုဒိတာ | GLOSSARY | H |
| Jīvitindriya (Rūpa) | `PC_16` subdivisions | ရူပဇီဝိတိန္ဒြေ | GLOSSARY | H |
| Hadaya-vatthu | `PC_08`, `M17_S01` | ဟဒယဝတ္ထု | GLOSSARY | H |
| Pasādarūpa / Nipphannarūpa | `M17_S01`, `PC_10` | ပသာဒရုပ် / နိပ္ဖန္နရုပ် | GLOSSARY | H |
| Ojā | `PC_15` | ကဗဠီကာရာဟာရ | GLOSSARY | H |
| Kāyakamma / Vacīkamma / Manokamma | `M17_S04` | ကာယကံ / ဝစီကံ / မနောကံ | GLOSSARY | H |
| Six gocara objects | `PC_02` | ရူပါရုံ / သဒ္ဒါရုံ / ဂန္ဓာရုံ / ရသာရုံ / ဖောဋ္ဌဗ္ဗာရုံ / ဓမ္မာရုံ | GLOSSARY (5 of 6) | M |

### 3.2 Renderings NOT in the glossary — reviewer sign-off required (confidence L)

| Pāḷi | English | Myanmar rendering used | Basis | Note |
|---|---|---|---|---|
| padaṭṭhāna | proximate cause | ပဒဋ္ဌာန် | WLIB (Burmese text ပဒဋ္ဌာနီ) + regular transliteration | The four-aspect label set. **Best-attested of this group.** |
| lakkhaṇa | characteristic | လက္ခဏာ | regular transliteration | Standard Pāḷi loanword in Myanmar Buddhist prose |
| paccupaṭṭhāna | manifestation | ပစ္စုပ္ပဋ္ဌာန် | regular transliteration | not previously used in this repo |
| rasa / kicca | function | (prose, no label term) | — | written as plain prose, so no term choice is locked in |
| paccaya-dhamma | conditioning state | ပစ္စည်းဖြစ်သော တရား | Burmese calque of ပစ္စည်း + ဖြစ် | **L** — glossary gives ပစ္စည်း only |
| paccayuppanna | conditioned state | ပစ္စည်းကြောင့် ဖြစ်သော တရား | Burmese calque | **L** |
| sahajāta | conascent | အတူဖြစ် | matches `PC_06.shortName` in `data_priority_conditions.py` | H via REPO-MY |
| purejāta / pacchājāta | prenascence / postnascence | ရှေးဦးစွာ ဖြစ်သော / နောက်မှ ဖြစ်သော | matches `PC_10`/`PC_11` shortNames | H via REPO-MY |
| āsevana | repetition | ထပ်ခါထပ်ခါ အလေ့အကျင့်ပြုခြင်း | paraphrase of `PC_12.shortName` ထုံမွှမ်း | M |
| vipāka (as condition) | result | ဝိပါက် | matches `PC_14` prose | H via REPO-MY |
| indriya | faculty | ဣန္ဒြေ | regular transliteration; glossary has only compounds (ပညိန္ဒြေ, ဇီဝိတိန္ဒြေ) | M |
| avyākata | indeterminate | အဗျာကတ | regular transliteration | **L** — not in glossary |
| nissandaphala | consequent result | နိဿန္ဒဖလ | Pāḷi retained as-is | safe: untranslated loanword |
| sotāpanna…arahatta path/fruit names | — | (reused from `data_priority_cittas.py`) | REPO-MY | H |

### 3.3 Doctrinal loci (from each entity's own `sourceRefs`)

| Locus | Used for | Confidence recorded in source |
|---|---|---|
| Paṭṭhāna, *Paccayaniddesa* — e.g. *Hetupaccayaniddesa*; Abhidhamma Piṭaka VII | all 24 `PC_*` definitions, paccayaDhamma, paccayuppanna, subdivisions | `canonical` |
| Visuddhimagga ch. XVII (*Paññābhūminiddesa*), PTS iii 532–533 | `PC_02.doctrinalNote`, `PC_09.doctrinalNote`, paccaya↔paticca mapping | `commentarial` |
| `VDP-ToatYeuVeDuyen.pdf` pp. 2–27 | M8 and M17 lesson bodies, cards, quizzes | project source PDF |

Two Vietnamese source strings contain the author's own unresolved editing marks
(`PC_02`, `PC_11`, `PC_12` — e.g. *"89 tâm (trừ 2 ngũ thức thân? — chính xác:
trừ tâm không bắt cảnh)"*). I followed the **resolved English rendering and the
canonical Paṭṭhāna count**, not the hesitant Vietnamese. Recorded in §7 as a
question for the reviewer rather than silently smoothed over.

---

## 4. Fields translated vs. left for English fallback

### 4.1 Translated in this batch (880 new slots; `my` 16.6% → 37.0%)

| Section | Field(s) | Count | UI call site |
|---|---|---|---|
| `paticcas` | characteristic, function, manifestation, proximateCause | 12 × 4 = 48 | `LocalizedPaticcaContent` |
| `paticcas` | doctrinalNote (8), examples (12 → 15 strings) | 23 | `localizedDoctrinalNote` / `localizedExamples` |
| `paccayas` | paccayaDhamma, paccayuppanna, doctrinalNote | 24 × 3 = 72 | `localizedPaccayaDhamma` / `…Paccayuppanna` / `…DoctrinalNote` |
| `paccayas` | examples | 24 → 46 strings | `localizedExamples` |
| `paccayas` | subdivisions `.name` + `.note` | 28 pairs = 56 | `localizedSubdivisionName` / `…Note` |
| `cetasikas` | characteristic, function, manifestation, proximateCause | 52 × 4 = 208 | `cetasika_detail_sheet.dart:63-66` |
| `cittas` | examples (CI_001…CI_012) | 12 → 21 strings | `LocalizedCittaContent.localizedExamples` |
| `vithis` | arisingCondition, significance, doctrinalNote | 4 × 3 = 12 | `LocalizedVithiContent` |
| `vithis` | steps for `VT_NGU_MON_LON` (9), `VT_Y_MON` (6), `VT_VITHIMUTTA` (3) | 18 steps → 43 strings | `localizedStepName/Description/DoctrinalNote` |
| `studyModules.M8_NHAN_DUYEN` | title, description, 7 sections (28 body + 22 keyTerms), 18 cards, 16 quizzes | 232 | `LocalizedStudyModuleContent` |
| `studyModules.M17_DUYEN_CHI_TIET` | title, description, 6 sections (33 body + 14 keyTerms), 12 cards, 12 quizzes | 196 | same |

### 4.2 Intentionally left absent (English fallback stays visible)

| Scope | Reason |
|---|---|
| **`rupas` four aspects + `doctrinalNote`** (135 slots) | **No UI call site.** `LocalizedRupaContent` (localized_content.dart:83-88) resolves only `name` and `description`. Translating these would ship text no screen can display. Verified by grepping `lib/features/detail/rupa_detail_sheet.dart` — zero references to `trangThai/phanSu/thanhTuu/nhanGan/doctrinalNote`. |
| **`kammas` `doctrinalNote` + `examples`** (32 slots) | **No UI call site.** `LocalizedKammaContent` (lines 90-93) resolves only `name` and `description`. |
| **`VT_NGU_MON_RATLON` steps** | Already authored in `content_my.json` (all 11 steps). Preserved verbatim; **not** re-authored. |
| **15 of 17 study modules** (M1–M7, M9–M16) | Prioritised complete, source-grounded Nhân Duyên units over partial coverage of all 17, per the brief ("do not trade doctrinal accuracy for coverage"). See §8. |
| Any field where the Myanmar rendering could not be grounded | none needed — no field was dropped for that reason in this batch; but every **L**-confidence term in §3.2 is a review gate before merge. |

### 4.3 Preserved

Every string previously authored for `my` is byte-identical after applying the
proposal. Checked programmatically across `paticcas`, `paccayas`, `cetasikas`,
`cittas`, `vithis` (including all `steps` sub-fields):

```
pre-existing authored text altered: none (all preserved)
```

---

## 5. Builder integration required (integrator-owned)

I did **not** modify `build_full_catalogs.py`, and did **not** run it. The new
tables are inert until the builder is taught to read them. Required change, for
the integrator:

```python
# build_full_catalogs.py — add imports next to the existing ones
import tool.content.data_priority_my_conditions as dcond_my
import tool.content.data_priority_my_cetasikas as dcet_my
import tool.content.data_priority_my_cittas as dcit_my

# …inside build_catalog(loc), after each section is assembled, overlay:
if loc == "my":
    for pid, extra in dcond_my.PATICCAS_MY.items():
        paticcas.setdefault(pid, {}).update(extra)
    for pid, extra in dcond_my.PACCAYAS_MY.items():
        paccayas.setdefault(pid, {}).update(extra)
    for vid, extra in dcond_my.VITHIS_MY.items():
        entry = vithis.setdefault(vid, {})
        for k, v in extra.items():
            if k == "steps":
                entry.setdefault("steps", {}).update(v)
            else:
                entry[k] = v
    for cid, extra in dcet_my.CETASIKAS_MY.items():
        cetasikas.setdefault(cid, {}).update(extra)
    for cid, ex in dcit_my.CITTA_EXAMPLES_MY.items():
        cittas.setdefault(cid, {})["examples"] = ex
    for kid, extra in dcit_my.KAMMAS_MY.items():
        kammas.setdefault(kid, {}).update(extra)
```

**This exact snippet has been executed and verified** — see §6, "End-to-end
integration rehearsal".

Notes for the integrator:
- The overlays are **additive**: they only set keys the builder currently omits,
  so other locales are unaffected and `my`'s existing values are untouched.
- `existing_citta_examples()` already drops English copies, so routing the
  citta examples through the table is safe and idempotent.
- `subdivisions` must be emitted as a **dict keyed by the invariant Pāḷi name**
  with `name`/`note` — this is what
  `PaccayaModel.localizedSubdivisionName` looks up (verified against
  `lib/core/localization/localized_content.dart:150-171` and the shipped
  `content_en.json` shape). My table already uses that shape.
- Modules: `python3 tool/content/merge_batch.py l10n_work/gen` merges both
  `hi` and `my` from the `gen/` directory using the existing tool — no code
  change needed. Verified by dry-run (§6).

---

## 6. Validation run log (commands actually executed)

```
$ python3 tool/content/check_content_locale.py my \
      --file /tmp/vdp_work/content_my.proposed.json --glossary --strict
✓ my  (1597/4312 slots, 37.0%)
EXIT: 0        # no H1–H6 hard failures, no S1–S5 soft warnings

$ python3 tool/content/check_content_locale.py --all --quiet
EXIT: 0        # every shipped catalog still clean

$ python3 tool/check_localizations.py
OK: 26 locales, 350 UI keys, content [en, hi, ja, my, si, th, vi, zh, zh_TW]
EXIT: 0
```

`content_my.proposed.json` was assembled in `/tmp` by applying my tables to the
shipped `content_my.json` and running the **real** `merge_module()` from
`tool/content/merge_module_translation.py` on the two module files. It is a
preview for validation only — it is **not** the deliverable and is not in the repo.

Structural checks that ran against that file:
- ID sets match `assets/data/*.json` exactly: paticcas 12/12, paccayas 24/24,
  cetasikas 52/52, citta-example IDs 12/12, per-vithi step numbers 9/9, 6/6, 3/3.
- All 9 `paccayas[*].subdivisions` blocks (25 subdivision entries in total —
  exactly the 9 paccayas that have subdivisions in the Vietnamese source) have
  key sets and **order** matching `assets/data/paccayas.json` `namePali` lists;
  the comparison returns zero mismatches.
- Both modules merge via the real `merge_module()`; `id`, `pali`, `type` and
  `sourceRefs` all resolve back to `content_vi.json`.
- 28 quiz seeds: no distractor equals the correct answer, no duplicate
  distractors, no empty question/answer/explanation, every seed fully translated
  (H4/H5 clean).
- Zero Vietnamese diacritics anywhere in the proposed file (S2 clean).
- Glossary drift check (`--glossary`, S5) clean.

### End-to-end integration rehearsal (executed, in a throwaway worktree)

To prove the recommended builder snippet actually works, I applied the patch to a
detached `git worktree` at `HEAD`, added the §5 snippet to that worktree's copy
of `build_full_catalogs.py`, and ran the two documented steps. The real checkout
was not used for this. Results:

```
$ git apply --check l10n_work/my_proposal.patch        -> OK
$ git apply       l10n_work/my_proposal.patch          -> OK

# step 1 — builder overlay, my only (build_catalog, not build_all)
built content_my.json
idempotent (2nd build identical): True aa9c610eebbd8276
✓ my  (1207/4312 slots, 28.0%)        EXIT: 0
   -> entities+meta = 1173 slots, studyModules = 34 slots
   -> assets/content/: only content_my.json modified

# step 2 — modules via the existing tool, no code change
$ python3 tool/content/merge_batch.py l10n_work/gen
hi: merged 2 module(s) -> assets/content/content_hi.json   M17_DUYEN_CHI_TIET, M6_NGHIEP
my: merged 2 module(s) -> assets/content/content_my.json   M17_DUYEN_CHI_TIET, M8_NHAN_DUYEN

✓ my  (1597/4312 slots, 37.0%)        EXIT: 0
```

The two steps land on exactly **1597 slots / 37.0%**, matching the preview
catalog validated above. The builder alone reaches 28.0% because it does not
handle study modules — that is `merge_batch.py`'s job.

**Side effect to expect, not caused by this patch:** running `merge_batch.py`
over `l10n_work/gen/` also merges the **pre-existing `hi`** modules. At `HEAD`,
`content_hi.json` has `M6_NGHIEP` and `M17_DUYEN_CHI_TIET` with **0** sections /
cards / quizzes, so that run populates them from the `hi` translations already in
those files. Verified: the `hi` block in `gen/M17_DUYEN_CHI_TIET.json` is
identical to `HEAD`'s copy, and `content_hi.json` afterwards contains **0
Myanmar-script runs** — no `my` text leaked into `hi`.

**Not run, and why:** `flutter analyze` and `flutter test` — neither `flutter`
nor `dart` is on `PATH` in this sandbox (`command -v dart` → not found). This
proposal changes **zero Dart code and zero shipped asset**, so those gates are
unaffected by it, but they have **not** been executed here. The integrator must
run them after applying the patch and regenerating the catalog.
`build_full_catalogs.py` was deliberately not run, per the brief.

---

## 7. Unresolved questions for qualified (Sayadaw / native reviewer) review

1. **Page-level attestation.** None of the four-aspect prose or Paṭṭhāna
   subdivisions carries a verified Myanmar-edition page citation. The glossary
   names the *let-than* tradition but no edition. A reviewer with the manual
   should confirm the လက္ခဏာ / ရသ / ပစ္စုပ္ပဋ္ဌာန် / ပဒဋ္ဌာန် framing and spot-check
   the compounds.
2. **`paccaya-dhamma` / `paccayuppanna` labels.** Rendered as Burmese calques
   (ပစ္စည်းဖြစ်သော တရား / ပစ္စည်းကြောင့် ဖြစ်သော တရား) because the glossary has no
   headword for them. Myanmar Paṭṭhāna teaching may have a set term — please
   supply one and I will propagate it across all 24 entries.
3. **`avyākata` (အဗျာကတ)** in `VT_VITHIMUTTA.doctrinalNote` is not in the
   glossary. Confirm, or replace with the preferred Myanmar wording for
   kammically-indeterminate resultant mind.
4. **Vietnamese source hesitations.** `PC_02`, `PC_11`, `PC_12`
   `paccayaDhamma` in `assets/data/paccayas.json` still contain the author's
   `? — chính xác:` marks. I followed the English/canonical counts (89 cittas;
   85 cittas excluding rebirth-linking; impulsions excluding the final and path
   javana). Confirm these are the intended figures and consider cleaning the
   Vietnamese source.
5. **`PC_03.paccayuppanna` count of 84 cittas** follows the English reference's
   "excluding rootless resultant cittas". The Vietnamese says *"trừ tâm quả vô
   nhân…"* with an ellipsis. Confirm the exact exclusion.
6. **`indriya` as ဣန္ဒြေ** — glossary only has compounds (ပညိန္ဒြေ,
   ဇီဝိတိန္ဒြေ). Confirm the bare form.
7. **M17_S01 body[5]** restates the 153-group / 30-rūpa paṭisandhi computation
   from the Vietnamese source. The arithmetic is the source's, not mine; a
   reviewer should confirm the presentation is faithful.
8. **`fōṭṭhabbārammaṇa` (ဖောဋ္ဌဗ္ဗာရုံ) and `dhammārammaṇa` (ဓမ္မာရုံ)** — the glossary
   lists only the other four gocara objects. Both are formed by the same
   pattern; confirm spelling.

---

## 8. Remaining `my` work (next batches, in priority order)

| Priority | Scope | Slots |
|---|---|---|
| 1 | `M10_LO_TRINH` (cittavīthi) — pairs with the vithis work just shipped | ~200 |
| 2 | `M9_SAC_PHAP` (rūpa) + `M6_NGHIEP` (kamma) — `hi` already has M6 | ~200 |
| 3 | `M1_BASICS`, `M2_SI_PHAN`, `M11_BIET_CANH` — the cetasika modules that back the 208 four-aspect fields just translated | ~250 |
| 4 | `M3`–`M5`, `M7`, `M12`–`M16` | remainder |
| — | `rupas` / `kammas` extra fields | **blocked** until UI call sites are added |

Current standing after this proposal: **1597 / 4312 slots = 37.0%**
(was 717 = 16.6%).

---

## 9. Glossary evidence ledger (IN4-50 deliverable)

`l10n_work/glossary_evidence_my.csv` — all **397** headwords, columns
`pali, term, source_ref, confidence, note` as specified by IN4-50.

* `source_ref` is copied **verbatim** from the `refs` column of
  `l10n_work/glossary.csv`. No page-level Myanmar-edition citation was invented
  (see §7 question 1 — none could be retrieved in this sandbox).
* `confidence` is derived mechanically, not by assertion:
  * **high — 306 rows**: the glossary `my` rendering appears verbatim in the
    shipped `assets/content/content_my.json` at `HEAD` (in-repo attestation).
  * **medium — 38 rows**: rendering is not in a shipped catalog but is exercised
    by this cycle's `my` tables / module files.
  * **low — 53 rows**: glossary rendering only; **no attestation available** —
    these are the ones that need reviewer sign-off, in addition to the 8
    questions in §7.
---

## 10. Re-measured against current `main` (addendum, supersedes §6 numbers)

§6 was run against the branch base commit `630186d`. `origin/main` has since
moved to `78efbe1`, which touches 80 files. The whole rehearsal above was
therefore **re-run from scratch in a throwaway worktree at `origin/main`**:

```
baseline                     ✓ my  (714/4312 slots, 16.6%)
+ builder overlay (§5)       ✓ my  (1204/4312 slots, 27.9%)   idempotent 77a159f4da5401f4
+ merge_batch l10n_work/gen  ✓ my  (1594/4312 slots, 37.0%)

check_content_locale.py my --glossary --strict   EXIT 0
check_content_locale.py --all --quiet            EXIT 0
```

So the numbers to quote on current `main` are **714 → 1594 / 4312 (37.0%)**,
not 717 → 1597. The −3 delta is entirely `kammas.KM_R_04`, whose
name/shortName/description exist at `630186d` but were dropped on `main`; every
other section is slot-identical between the two commits. My tables are keyed by
invariant id, so nothing in this proposal needed to change.

The §5 builder snippet still applies unchanged: `grep -n "^    out = {"
tool/content/build_full_catalogs.py` returns **line 293 on `origin/main` as
well**, and the marker is unique.

### Pre-existing failure on `main`, not caused by this proposal

`tool/check_localizations.py` **exits 1 on pristine `origin/main`** — 480
findings across all 24 non-English locales, because `main` added UI keys to
`app_en.arb` (and filled only `app_vi.arb`). Verified by running the checker on
a clean `origin/main` worktree with none of my files present: same exit code.

For `my` specifically, `lib/l10n/app_my.arb` is missing **16 keys** that
`app_en.arb` has (366 vs 350):

```
suggestCorrection, suggestCorrectionHint, suggestCorrectionTitle,
suggestCorrectionIntro, suggestCorrectionCurrentText,
suggestCorrectionSuggestionLabel, suggestCorrectionSuggestionHint,
suggestCorrectionReasonLabel, suggestCorrectionReasonHint,
suggestCorrectionReviewLink, suggestCorrectionSubmit,
suggestCorrectionCopied, suggestCorrectionSuccessTitle,
suggestCorrectionSuccessBody, copyLink, linkCopied
```

These are **UI strings, not study content**, and they are outside the scope of
this proposal (which touches only content source tables). Flagged rather than
silently fixed. At the base commit `630186d` this checker still passed
(EXIT 0, 26 locales / 350 UI keys), which is what §6 records.

### Not run

`flutter analyze` and `flutter test` — neither `flutter` nor `dart` is on
`PATH` in this sandbox. This proposal changes zero Dart code and zero shipped
asset, but the gates have not been executed here.
---

## 11. Full gap audit + Batch 3 first module (M1_BASICS)

### Where the remaining slots actually are

`check_content_locale.py` derives the 4312 denominator from the Vietnamese
source (`expected_slots()`), so the split is fixed:

| Bucket | Slots | Share |
| -- | -- | -- |
| `studyModules` | **3075** | 71.3% |
| entities | 1237 | 28.7% |

Everything left is essentially study modules — 15 of 17 were untranslated.

### The entity gap is mostly missing at the SOURCE, not missing translations

I audited every field the app actually reads (call-site map re-verified against
`lib/core/localization/localized_content.dart` on current `main`; it is
unchanged — `rupas` and `kammas` still expose only `name` + `description`).
115 consumed entity slots were empty. Cross-checking each against **both**
`content_vi.json` and `content_en.json`:

| Gap | Count | Verdict |
| -- | -- | -- |
| `cittas.examples` | 109 | **No source.** `assets/data/cittas.json` carries `examples` for exactly 12/121 cittas (CI_001–CI_012, already translated). EN has the same 12. Nothing to translate. |
| `vithis.steps.doctrinalNote` | 12 | **No source.** VI is `None` for all 12; EN has 15 of 29, a strict subset of what `my` already carries. Nothing to translate. |
| `paticcas.doctrinalNote` | 4 | **No source.** PD_04, PD_05, PD_09, PD_10 are `None` in VI and absent in EN. Nothing to translate. |
| `kammas.name` / `.description` | 2 | **Real gap — fixed.** `KM_R_04`. |

So of 115 empty entity slots, **113 have nothing to translate from**. Filling
them would mean inventing doctrine, which this brief forbids. They stay absent
for English fallback. Filling them is a *content authoring* task (IN4-38 /
IN4-39 territory), not a translation task.

### Why `KM_R_04` was missing, and the glossary fix it implies

Root cause: the glossary headword **`Lokuttara-kamma / Magga-kamma` has an empty
`my` cell** in `l10n_work/glossary.csv`, so the shared table emits nothing and
`main`'s catalog dropped the entry (this is the −3 slot delta recorded in §10).

Added as `KAMMAS_MY` in `tool/content/data_priority_my_cittas.py`, built only
from glossary-attested pieces — `Lokuttara` → လောကုတ္တရာ, `Kamma` → ကံ,
`Magga citta` → မဂ်စိတ် (hence မဂ်), `Phala citta` → ဖိုလ်စိတ်:

* `name` → **လောကုတ္တရာကံ (မဂ်ကံ)**

**Proposed glossary fill (→ IN4-49):** set the `my` cell of
`Lokuttara-kamma / Magga-kamma` to `လောကုတ္တရာကံ (မဂ်ကံ)`.

The §5 builder snippet gained one line for this:

```python
    for kid, extra in dcit_my.KAMMAS_MY.items():
        kammas.setdefault(kid, {}).update(extra)
```

### Batch 3 — `M1_BASICS` (7 universal cetasikas), translated in full

`l10n_work/gen/M1_BASICS.json` — 4 sections / 14 review cards / 12 quiz seeds.
Chosen first because it is the declared prerequisite module ("nền tảng bắt buộc
trước khi học các module khác") and every term in it is one I had already fixed
while translating the 52 cetasikas, so no new terminology risk was introduced.

Verified in a throwaway worktree at `main` (`d7b6793`):

```
baseline                      ✓ my  (714/4312 slots, 16.6%)
+ builder overlay (§5)        ✓ my  (1206/4312 slots, 28.0%)   idempotent d1105a5ecf531e67
+ merge_batch l10n_work/gen   ✓ my  (1742/4312 slots, 40.4%)   (3 modules merged)

check_content_locale.py my --glossary --strict   EXIT 0
check_content_locale.py --all --quiet            EXIT 0
check_paccaya_data.py                            EXIT 0
```

`1594 → 1742` = **+148**: 146 from M1_BASICS (its `title`/`description` were
already emitted by the builder, so 2 of its 148 slots were pre-filled) plus 2
from `KM_R_04`.

Structural and integrity checks, all clean:

* ids and counts match `content_vi.json` exactly — sections 4/4, cards 14/14,
  quiz seeds 12/12, keyTerm ids per section, body paragraph counts 4/5/4/5,
  distractor counts per seed. The real `merge_module()` accepted it.
* 12 quiz seeds: no `correctAnswer` among distractors, exactly 3 distractors
  each, no duplicates, no empty field.
* **0** Vietnamese tone marks; **0** fields without Myanmar script.
* 15 glossary headwords used, each matching the glossary `my` cell verbatim:
  ဖဿ · ဝေဒနာ · သညာ · စေတနာ · ဧကဂ္ဂတာ · ဇီဝိတိန္ဒြေ · မနသိကာရ · ဝိတက် ·
  ဝိစာရ · အဓိမောက္ခ · ပီတိ · ဆန္ဒ · အညသမာန်း · သဗ္ဗစိတ္တသာဓာရဏ · ပကိဏ်း.

### Remaining after this batch

14 modules, ~2533 slots, largest first: M4_AKUSALA 284 · M3_TINH_HAO_BIEN_HANH
273 · M6_NGHIEP 266 · M10_LO_TRINH 234 · M16_NGUOI_VA_COI 224 · M9_SAC_PHAP 223
· M15_TAM_SO_PHOI_HOP 171 · M11_BIET_CANH 151 · M7_SIEU_THE 136 · M12_VO_NHAN
118 · M14_VO_SAC_GIOI 115 · M5_SOBHANA 114 · M13_SAC_GIOI 114 · M2_SI_PHAN 110.

Note for whoever takes `M10_LO_TRINH`: section **M10_S09** is titled
*"Vīthimutta — chưa có nguồn trong tài liệu này"* in the Vietnamese source, and
**M10_S05 does not exist**. That is the open source gap tracked as IN4-53; do
not invent content for S09.

---

## 12. Batch 3 (cont.) — module `M5_SOBHANA`

`l10n_work/gen/M5_SOBHANA.json` — new, 3 sections / 10 review cards / 10 quiz
seeds, `translationStatus: draft`. Module id is the filename, matching the
existing `l10n_work/gen/` convention.

Measured with the real merge pipeline in a throwaway worktree at `d7b6793`:

```
baseline                      ✓ my  (714/4312 slots, 16.6%)
+ builder overlay (§5)        ✓ my  (1206/4312 slots, 28.0%)   idempotent d1105a5ecf531e67
+ merge_batch l10n_work/gen   ✓ my  (1854/4312 slots, 43.0%)   (4 modules merged)
```

`merge_batch` reported for `my`: `M17_DUYEN_CHI_TIET, M1_BASICS, M5_SOBHANA,
M8_NHAN_DUYEN` — so the real `merge_module()` accepted `M5_SOBHANA`. Catalog now
**4/17** modules with `lessonSections`.

Per-module net contribution is *field count − 2*, because the builder already
emits `title` and `description` for every module (verified: `build_catalog('my')`
returns title=True desc=True sections=0 for all four). Hence M1_BASICS
148 → **+146** and M5_SOBHANA 114 → **+112** (1742 → 1854).

Verification, all clean:

* ids and counts match `content_vi.json` exactly — sections 3/3, cards 10/10,
  seeds 10/10, keyTerm ids per section, body paragraph counts 5/5/4, distractor
  counts per seed.
* 10 quiz seeds: exactly 3 distractors each, no `correctAnswer` among
  distractors, no duplicates, no empty field.
* **0** Vietnamese tone marks and **0** non-Myanmar fields among the 114
  translatable fields (`id`, `pali`, `translationStatus` excluded — `id` is an
  invariant identifier and `pali` legitimately holds Latin-script Pāḷi).
  The same re-run over `M1_BASICS` gives 0/0 across its 148 fields, confirming
  the figure quoted in §11.

### Terms used, all attested

Every doctrinal term in this module already had a glossary `my` cell or an
in-repo attestation from the merged batches:

| Pāḷi | Myanmar | Source of attestation |
| --- | --- | --- |
| `Sobhana` | သောဘဏ | glossary |
| `Kāmāvacara` | ကာမာဝစရ | glossary |
| `Mahākusala citta` | မဟာကုသိုလ်စိတ် | glossary |
| `Mahāvipāka citta` | မဟာဝိပါက်စိတ် | glossary |
| `Mahākiriya citta` | မဟာကြိယာစိတ် | glossary |
| `Ñāṇasampayutta` | ဉာဏသမ္ပယုတ် | glossary |
| `Ñāṇavippayutta` | ဉာဏဝိပ္ပယုတ် | glossary |
| `Asaṅkhārika` | အသင်္ခါရိက | glossary |
| `Sasaṅkhārika` | သသင်္ခါရိက | glossary |
| `Diṭṭhigatasampayutta` | ဒိဋ္ဌိဂတသမ္ပယုတ် | glossary |
| `Somanassa-` | သောမနဿ… | in-repo (22 occurrences) |
| `Upekkhā-` | ဥပေက္ခာ… | in-repo (48 occurrences) |

Three glossary gaps, worked around rather than invented:

* **`arahant` has no glossary row.** Rendered as the composed
  **အရဟတ္တဖိုလ်ရ ပုဂ္ဂိုလ်** ("a person who has attained Arahatta-phala") from
  attested pieces only — `Arahatta` → အရဟတ္တ, `Phala` → ဖိုလ်, and ပုဂ္ဂိုလ် for
  "person". Propose adding `Arahant` → **ရဟန္တာ** (→ IN4-49); if accepted, the
  module can be shortened to the ordinary term.
* **`sekha` / `ariya` have no rows.** The source says "bậc thánh hữu học". Rather
  than coin a term, the three still-in-training noble persons are named
  explicitly — **သောတာပတ္တိ၊ သကဒါဂါမိ၊ အနာဂါမိ ပုဂ္ဂိုလ်များ** — all three
  attested in the glossary via their `*-magga` rows. Doctrinally equivalent and
  more concrete.
* **`petā` / `tiracchāna` have no rows.** Used ပြေတ and တိရစ္ဆာန်, the standard
  Burmese for the two apāya; ငရဲ (niraya), နတ် (deva), ဗြဟ္မာ (brahmā) and
  လူ (manussa) were already in use. Flagging these four for the council rather
  than leaving the realm list half-English.

### Glossary defect found while working (→ IN4-49)

Four `glossary.csv` rows carry **`sasaṅkhārika` in the Pāḷi column but render it
as `အသင်္ခါရိက`** — the *a*- prefix form, i.e. the opposite pairing:

```
Somanassa-sahagataṃ ñāṇasampayuttaṃ sasaṅkhārikaṃ   -> …ဉာဏသမ္ပယုတ် အသင်္ခါရိက မဟာကြိယာစိတ်
Somanassa-sahagataṃ ñāṇavippayuttaṃ sasaṅkhārikaṃ   -> …ဉာဏဝိပ္ပယုတ် အသင်္ခါရိက မဟာကြိယာစိတ်
Upekkhā-sahagataṃ ñāṇasampayuttaṃ sasaṅkhārikaṃ     -> …ဉာဏသမ္ပယုတ် အသင်္ခါရိက မဟာကြိယာစိတ်
Upekkhā-sahagataṃ ñāṇavippayuttaṃ sasaṅkhārikaṃ     -> …ဉာဏဝိပ္ပယုတ် အသင်္ခါရိက မဟာကြိယာစိတ်
```

All four are Mahākiriya rows; the standalone `Asaṅkhārika` / `Sasaṅkhārika` rows
are correct, and I followed the standalone rows. Whoever owns `glossary.csv`
should fix these four (→ IN4-49), otherwise the Mahākiriya citta names will be
wrong in any downstream generation.

### Remaining

13 modules, ~2419 slots. Largest first: M4_AKUSALA 284 · M3_TINH_HAO_BIEN_HANH
273 · M6_NGHIEP 266 · M10_LO_TRINH 234 · M16_NGUOI_VA_COI 224 · M9_SAC_PHAP 223
· M15_TAM_SO_PHOI_HOP 171 · M11_BIET_CANH 151 · M7_SIEU_THE 136 · M12_VO_NHAN
118 · M14_VO_SAC_GIOI 115 · M13_SAC_GIOI 114 · M2_SI_PHAN 110.

Note `l10n_work/gen/M6_NGHIEP.json` already exists carrying an `hi` block only —
whoever takes `M6_NGHIEP` must **append** `my` and leave `hi` byte-identical.

---

## 13. Batch 3 (cont.) — module `M4_AKUSALA` (12 akusala cittas, 14 akusala cetasikas)

`l10n_work/gen/M4_AKUSALA.json` — new, 8 sections / 20 review cards / 20 quiz
seeds, `translationStatus: draft`. Largest single module in the set (284 slots).

Measured with the real merge pipeline in a throwaway worktree at `51954c2`:

```
baseline                      ✓ my  (714/4312 slots, 16.6%)
+ builder overlay (§5)        ✓ my  (1206/4312 slots, 28.0%)   idempotent d1105a5ecf531e67
+ merge_batch l10n_work/gen   ✓ my  (2136/4312 slots, 49.5%)   (5 modules merged)
```

`merge_batch` reported for `my`: `M17_DUYEN_CHI_TIET, M1_BASICS, M4_AKUSALA,
M5_SOBHANA, M8_NHAN_DUYEN` — the real `merge_module()` accepted it. Catalog now
**5/17** modules with `lessonSections`.

Delta `1854 → 2136` = **+282** = 284 translatable fields − 2 (the builder
already emits `title`/`description` for every module, consistent with §12).

Verification, all clean:

* ids and counts match `content_vi.json` exactly — sections 8/8, cards 20/20,
  seeds 20/20, keyTerm ids per section, body paragraph counts 5/5/5/4/5/10/11/7,
  distractor counts.
* **all 27 `pali` values byte-identical to the Vietnamese source** — checked
  field by field, since `pali` is not translated.
* 20 quiz seeds: exactly 3 distractors each, no `correctAnswer` among
  distractors, no duplicates, no empty field.
* **0** Vietnamese tone marks and **0** non-Myanmar fields across the 284
  translatable fields (`id` / `pali` / `translationStatus` excluded).

### Terms used — four attestation tiers, from solid to reviewable

**Tier A — glossary `my` cell present (28).** `Citta` `Akusala citta` `Lobha`
`Dosa` `Moha` `Asaṅkhārika` `Sasaṅkhārika` `Diṭṭhigatasampayutta` `Diṭṭhi`
`Sakkāyadiṭṭhi` `Māna` `Issā` `Macchariya` `Kukkucca` `Thīna` `Middha`
`Vicikicchā` `Domanassa` `Paṭigha` `Uddhacca` `Lobhatuka cetasika` `Taṇhā`
`Upādāna` `Ahirika` `Anottappa` `Vīriya` `Akusala cetasika`
`Sabbākusalasādhāraṇā`. No judgement calls.

**Tier B — no glossary row, but already in use in the shipped catalog (5).**

| Pāḷi | Myanmar | Occurrences in existing `my` text |
| --- | --- | --- |
| `Somanassa` | သောမနဿ | 35 |
| `Upekkhā` | ဥပေက္ခာ | 56 |
| `Diṭṭhigatavippayutta` | ဒိဋ္ဌိဂတဝိပ္ပယုတ် | 5 |
| `Rāga` | ရာဂ | 1 |
| `Āsava` | အာသဝေါ | 1 |

Reusing these keeps the module consistent with what is already published. `Rāga`
and `Āsava` are single-occurrence, so they deserve a glossary row.

**Tier C — no glossary row, composed from attested pieces (5).**

| Pāḷi | Myanmar | Basis |
| --- | --- | --- |
| `Dosatuka cetasika` | ဒေါသတိက စေတသိက် | exact parallel to glossary `Lobhatuka` → လောဘတိက စေတသိက် |
| `Micchā diṭṭhi` | မိစ္ဆာဒိဋ္ဌိ | ဒိဋ္ဌိ attested; မိစ္ဆာ has 0 occurrences — **review** |
| `Ayoniso manasikāra` | အယောနိသော မနသိကာရ | မနသိကာရ attested (§M1_BASICS); အယောနိသော has 0 — **review** |
| 4 `āsava` | ကာမာသဝေါ / ဘဝါသဝေါ / ဒိဋ္ဌာသဝေါ / အဝိဇ္ဇာသဝေါ | အာသဝေါ attested once |
| 5 `khandha` | ရူပက္ခန္ဓာ ဝေဒနာက္ခန္ဓာ သညာက္ခန္ဓာ သင်္ခါရက္ခန္ဓာ ဝိညာဏက္ခန္ဓာ | ရူပက္ခန္ဓာ attested 4×, others follow the same pattern |

### Tier D — no attestation at all. **These are the parts to review.**

Eleven Pāḷi terms appear **only in two synonym lists** and nowhere else in the
module. None has a glossary row and none appears in the shipped catalog. I wrote
them as `Burmese transliteration (Pāḷi — Burmese gloss)` so that (a) the Pāḷi
is visible to whoever checks, and (b) the meaning is carried by the descriptive
gloss rather than by the transliteration being correct. **If the council
disagrees with any transliteration, only the first token needs changing — the
gloss and the Pāḷi stay valid.**

`M4_S06` body 3 — synonyms of `Lobha`:

| Pāḷi | As written | Status |
| --- | --- | --- |
| `Pema` | ပေမ | transliteration only |
| `Piya` | ပိယ | transliteration only |
| `Nandi` | နန္ဒိ | transliteration only |

`M4_S07` body 4 — states associated with `Dosa`:

| Pāḷi | As written | Status |
| --- | --- | --- |
| `Soka` | ဆောက | transliteration only |
| `Parideva` | ပရိဒေဝ | transliteration only |
| `Hiṃsa` | ဟိံသာ | transliteration only |
| `Palāsa` | ပလာသ | transliteration only |
| `Kodha` | ကောဓ | transliteration only |
| `Bherava` | ဘေရဝ | transliteration only |
| `Bhaya` | ဘယ | transliteration only |

`M4_S06` body 7 — two fixed wrong views:

| Pāḷi | As written | Status |
| --- | --- | --- |
| `Ahetuka-diṭṭhi` | အဟိတ်ကဒိဋ္ဌိ | composed; ဒိဋ္ဌိ attested |
| `Akiriya-diṭṭhi` | အကိရိယဒိဋ္ဌိ | composed; ဒိဋ္ဌိ attested |

Per the brief these are the candidates for "leave in English": I judged a
transliteration-plus-gloss to be more useful to a reader than a half-English
list, but they are flagged here so the council can overrule them wholesale.
**No doctrinal content was added** — every one of these appears in the
Vietnamese source with its own gloss, which is what I translated.

Two more judgement calls worth a look:

* **`Dosatuka` (ဒေါသတိက)** — the Vietnamese source says "Sân phần". I formed it
  by exact parallel with the glossary's `Lobhatuka` → လောဘတိက. If the council
  prefers a different formation, the change is confined to this one token, which
  occurs in `M4_S05` body 4, the `TERM_DOSA_NHOM_M4` keyTerm, and the module
  description.
* **The 9 `māna`** (`M4_S06` body 9) — the Vietnamese gives a 3×3 matrix
  ("hơn ỷ hơn" etc.). I rendered it as *standing of self* × *standing of the
  other* ("သာသူအပေါ် မာန်ထောင်၍ — ငါသာသည်၊ ငါတူသည်၊ ငါနိမ့်သည်"),
  which is more explicit than a literal transliteration of the matrix but says
  the same thing. Worth a doctrinal check.

### Remaining

12 modules, ~2137 slots. Largest first: M3_TINH_HAO_BIEN_HANH 273 · M6_NGHIEP
266 · M10_LO_TRINH 234 · M16_NGUOI_VA_COI 224 · M9_SAC_PHAP 223 ·
M15_TAM_SO_PHOI_HOP 171 · M11_BIET_CANH 151 · M7_SIEU_THE 136 · M12_VO_NHAN 118
· M14_VO_SAC_GIOI 115 · M13_SAC_GIOI 114 · M2_SI_PHAN 110.

---

## 14. Batch 3 (cont.) — module `M2_SI_PHAN`, plus three corrections to §13

`l10n_work/gen/M2_SI_PHAN.json` — new, 3 sections / 10 review cards / 10 quiz
seeds, `translationStatus: draft`. This closes the loop opened by `M4_S05`,
which points at M2 for the four universal akusala cetasikas.

```
baseline                      ✓ my  (714/4312 slots, 16.6%)
+ builder overlay (§5)        ✓ my  (1206/4312 slots, 28.0%)   idempotent d1105a5ecf531e67
+ merge_batch l10n_work/gen   ✓ my  (2244/4312 slots, 52.0%)   (6 modules merged)
```

`merge_batch` for `my`: `M17_DUYEN_CHI_TIET, M1_BASICS, M2_SI_PHAN, M4_AKUSALA,
M5_SOBHANA, M8_NHAN_DUYEN` — **6/17** modules. Delta `2136 → 2244` = **+108** =
110 fields − 2, again matching the rule in §12.

Verification over **all four** authored modules at once:

| Module | s/c/q | Translatable fields | Structure vs VI | `pali` vs VI | VN marks | Non-Myanmar |
| --- | --- | --- | --- | --- | --- | --- |
| `M1_BASICS` | 4/14/12 | 148 | match | match | 0 | 0 |
| `M2_SI_PHAN` | 3/10/10 | 110 | match | match | 0 | 0 |
| `M4_AKUSALA` | 8/20/20 | 284 | match | match | 0 | 0 |
| `M5_SOBHANA` | 3/10/10 | 114 | match | match | 0 | 0 |

### §13 was wrong in three places — corrected here

§13 recorded `Dosatuka` and `Mocatuka` as composed-from-nothing (Tier C) and
`Soka`/`Parideva` as unattested (Tier D). **All four have glossary rows.** My
lookup used exact key matching against the `pali` column, which silently skipped
`Dosatuka cetasika`, `Mocatuka`, and the compound row
`Soka, Parideva, Dukkha, Domanassa, Upāyāsa`. Re-running with substring matching
found them.

| Term | I had written | Glossary actually says | Action |
| --- | --- | --- | --- |
| `Mocatuka` | မောဟတိက (my own formation) | **မောစတုက္က စေတသိက်** | `M4_AKUSALA`: 6 occurrences replaced |
| `Dosatuka cetasika` | ဒေါသတိက (my own formation) | **ဒေါသစတုက္က စေတသိက်** | `M4_AKUSALA`: 10 occurrences replaced |
| `Soka` | ဆောက (transliteration) | **စိုးရိမ်ခြင်း** (descriptive) | `M4_AKUSALA` body: replaced |
| `Parideva` | ပရိဒေဝ (transliteration) | **ငိုကြွေးခြင်း** (descriptive) | `M4_AKUSALA` body: replaced |
| `Nāma-khandha` | နာမ်ခန္ဓာ | **နာမက္ခန္ဓာ ၄ ပါး** | `M1_BASICS`: 3 occurrences replaced |

The group names are now မောစတုက္က / လောဘတိက / ဒေါသစတုက္က, exactly as the
glossary has them. Note the glossary is *itself* uneven here — `Lobhatuka` uses
တိက while `Dosatuka` and `Mocatuka` use စတုက္က — but the glossary column wins,
so I followed it rather than regularising.

**Tier D shrinks from 11 to 9.** Still without any attestation, all confined to
two synonym lists in `M4_AKUSALA`: `Pema` ပေမ, `Piya` ပိယ, `Nandi` နန္ဒိ
(§S06 body 3); `Hiṃsa` ဟိံသာ, `Palāsa` ပလာသ, `Kodha` ကောဓ, `Bherava` ဘေရဝ,
`Bhaya` ဘယ (§S07 body 4); plus the composed `အဟိတ်ကဒိဋ္ဌိ` /
`အကိရိယဒိဋ္ဌိ` (§S06 body 7). Written as *transliteration (Pāḷi — Burmese
gloss)* so a reviewer can overrule the transliteration without touching the
meaning. **These remain the only reviewable terms in the four modules.**

Also flagging, not fixing: I render the Thīna group as **ထိနတိက**. There is no
glossary row for it, and the Vietnamese source only says "Hôn phần", so I formed
it by parallel with `Lobhatuka` → လောဘတိက. If the council prefers a
စတုက္က-style name for consistency with the other two groups, the change is
confined to `M4_AKUSALA` §S05 and its `TERM_THINA_MIDDHA_M4` keyTerm.

### `M2_SI_PHAN` terms

All doctrinal terms attested: `Akusala cetasika` `Moha` `Ahirika` `Anottappa`
`Uddhacca` `Hiri` `Ottappa` `Jhāna` `Pīti` `Vitakka` `Sabbākusalasādhāraṇā`
`Mocatuka` from glossary `my` cells; `ရူပက္ခန္ဓာ` (4×) and `သုခ` (12×) in-repo.

Two composed, both flagged:

* **`နီဝရဏ်`** for *triền cái* / `nīvaraṇa` — no glossary row. Standard
  Burmese; used in `M2_S03` body 4 and `M2_R10`/`M2_Q09`. Propose a glossary row.
* **`သုခဈာန်အင်္ဂ`** for *chi thiền Lạc* / `sukha-jhānaṅga` — composed from
  attested သုခ + ဈာန်; `Jhānaṅga` itself has no row. The Vietnamese source's
  claim that uddhacca opposes the *sukha* jhāna-factor is reproduced as written,
  not reinterpreted.

### Remaining

11 modules, ~2027 slots. Largest first: M3_TINH_HAO_BIEN_HANH 273 · M6_NGHIEP
266 · M10_LO_TRINH 234 · M16_NGUOI_VA_COI 224 · M9_SAC_PHAP 223 ·
M15_TAM_SO_PHOI_HOP 171 · M11_BIET_CANH 151 · M7_SIEU_THE 136 · M12_VO_NHAN 118
· M14_VO_SAC_GIOI 115 · M13_SAC_GIOI 114.

**Process note for the next batch:** check glossary membership by **substring**,
not exact key. Three silent misses in one module came from exact matching.

---

## 15. Batch 3 (cont.) — module `M3_TINH_HAO_BIEN_HANH` (25 sobhaṇa cetasikas)

`l10n_work/gen/M3_TINH_HAO_BIEN_HANH.json` — new, 7 sections / 20 review cards /
20 quiz seeds, `translationStatus: draft`. 273 slots.

```
baseline                      ✓ my  (714/4312 slots, 16.6%)
+ builder overlay (§5)        ✓ my  (1206/4312 slots, 28.0%)   idempotent d1105a5ecf531e67
+ merge_batch l10n_work/gen   ✓ my  (2515/4312 slots, 58.3%)   (7 modules merged)
```

`merge_batch` for `my`: `M17_DUYEN_CHI_TIET, M1_BASICS, M2_SI_PHAN,
M3_TINH_HAO_BIEN_HANH, M4_AKUSALA, M5_SOBHANA, M8_NHAN_DUYEN` — **7/17**. Delta
`2244 → 2515` = **+271** = 273 − 2, same rule as §12.

Structure and text checks pass (ids/counts vs VI, 20 seeds × 3 distinct
distractors with no `correctAnswer` among them, 0 Vietnamese tone marks, 0
non-Myanmar fields across the 273 translatable fields). **One `pali` field
deliberately differs from the source — see below.**

### Two more glossary defects (→ IN4-49)

Found while looking up `Paññindriya`:

1. **`Paññā` → `ပညိန္ဒြေ`** — that string reads *paññ-indri-ya*. It is the
   rendering of **`Paññindriya`**, filed under the headword **`Paññā`**. `Paññā`
   (wisdom) should be **ပညာ**, which appears 8× in the shipped catalog but has
   no glossary row of its own. Note `assets/data/cetasikas.json` gives
   `CS_PANNA.namePali = "Paññā"` while `content_en.json` names it *"Wisdom
   faculty"*, so the mis-filing may be deliberate downstream and wrong upstream —
   either way the two rows disagree with each other.

2. **`Paññindriya` → `ပညာိန္ဒြေ`** — codepoints are
   `1015 100A 102C 102D 1014 1039 1012 103C 1031`: ပ + ည + **U+102C (AA)** +
   **U+102D (I)** + န + ္ + ဒ + ြ + ေ. **Two vowel signs stacked on one
   consonant** — not valid Myanmar orthography for any reading.

   I had copied this string into 16 places in M3 before checking it. Replaced
   all 16 with the well-formed **ပညိန္ဒြေ**, which *is* in the glossary (under
   the `Paññā` headword, see defect 1) and reads correctly as *paññindriya*.
   Copying a malformed string 16 times to honour a broken row would have spread
   the defect, so I chose accuracy and flagged it instead. **This is a
   deliberate departure from the glossary column and is the one such case.**

### One Vietnamese leak in the source, not reproduced (→ IN4-53)

`content_vi.json` → `M3_S05` → `TERM_BA_NHAN_THIEN_M3` has

```
"pali": "Vô tham – Vô sân – Vô si"
```

The `pali` field of the Vietnamese source holds **Vietnamese**, not Pāḷi. I
wrote the actual Pāḷi — `Alobha – Adosa – Amoha` — because the brief forbids
Vietnamese in `my` assets and this field is not a translation target. Verified
empirically that this does not break anything: the real `merge_module()`
accepted M3 (it checks section/card/seed/keyTerm **counts and ids** and
distractor counts, not `pali`), and `merge_batch` reported 7 modules merged.

This is the **only** `pali` value in the five authored modules that differs from
the source: of 75 `keyTerms.pali` values across M1/M2/M3/M4/M5, **74 match byte
for byte** and this is the single exception.

### Terms used

**Glossary rows (30+):** `Sobhana` `Saddhā` `Sammāsaddhā` `Sati` `Hiri`
`Ottappa` `Ahirika` `Anottappa` `Alobha` `Adosa` `Tatramajjhattatā`
`Passaddhi` `Lahutā` `Mudutā` `Kammaññatā` `Pāguññatā` `Ujukatā` and all twelve
`Kāya-`/`Citta-` compound rows `Sammāvācā` `Sammākammanto` `Sammā-ājīvo`
`Viratiyo` `Appamaññā` `Karunā` `Muditā` `Musāvāda` `Mettā`(in-repo 1×), plus
the compound row
`Suttamayā – Cintāmayā – Bhāvanāmayā` → **သုတမယ၊ စိန္တာမယ၊ ဘာဝနာမယ ဉာဏ် ၃ ပါး**
for the three wisdoms.

`ပညာ` for *paññā* is used from in-repo attestation (8×) because, per defect 1
above, the glossary's `Paññā` row does not actually render *paññā*.

**No attestation — 4 terms, all in `M3_S04` body 2** (the four wrong kinds of
speech):

| Pāḷi | As written | Note |
| --- | --- | --- |
| `Pisuṇāvācā` | ပိသုနဝါစာ | transliteration + gloss "ကွဲပြားစေသော စကား" |
| `Pharusa-vācā` | ဖရုသဝါစာ | transliteration + gloss "ကြမ်းတမ်းသော စကား" |
| `Samphappalāpa` | သမ္ဖပ္ပလာပ် | transliteration + gloss "အကျိုးမရှိသော ပြောခြင်း" |
| `Micchāsaddhā` | မိစ္ဆာသဒ္ဓါ | composed; သဒ္ဓါ attested, မိစ္ဆာ is not |

Same convention as §13/§14 Tier D: *transliteration (Pāḷi — Burmese gloss)*, so
a reviewer can overrule the transliteration without touching the meaning.

Running total of reviewable terms across the five modules: **13** (9 from
`M4_AKUSALA`, 4 here). Everything else is glossary- or in-repo-attested.

### Remaining

10 modules, ~1754 slots: M6_NGHIEP 266 · M10_LO_TRINH 234 · M16_NGUOI_VA_COI 224
· M9_SAC_PHAP 223 · M15_TAM_SO_PHOI_HOP 171 · M11_BIET_CANH 151 · M7_SIEU_THE
136 · M12_VO_NHAN 118 · M14_VO_SAC_GIOI 115 · M13_SAC_GIOI 114.

### Arithmetic reconciliation

So the numbers can be checked by hand: the 2515 is not just
`1206 + (my five modules)`. `merge_batch` also merges the two modules already
on `main`, and those contribute too.

| Module | Fields | Net |
| --- | --- | --- |
| `M8_NHAN_DUYEN` *(pre-existing)* | 223 | +221 |
| `M17_DUYEN_CHI_TIET` *(pre-existing)* | 171 | +169 |
| `M1_BASICS` | 148 | +146 |
| `M2_SI_PHAN` | 110 | +108 |
| `M3_TINH_HAO_BIEN_HANH` | 273 | +271 |
| `M4_AKUSALA` | 284 | +282 |
| `M5_SOBHANA` | 114 | +112 |
| **total** | **1323** | **+1309** |

`1206 + 1309 = 2515`, matching `check_content_locale.py` exactly.

---

## 16. Batch 3 (cont.) — modules `M13_SAC_GIOI` and `M14_VO_SAC_GIOI`

Two new files, taken together because they cover the same territory — the 27
mahaggata cittas, 15 rūpāvacara + 12 arūpāvacara — and share terminology.

* `l10n_work/gen/M13_SAC_GIOI.json` — 3 sections / 10 cards / 10 seeds, 114 fields.
* `l10n_work/gen/M14_VO_SAC_GIOI.json` — 3 sections / 10 cards / 10 seeds, 115 fields.

```
baseline                      ✓ my  (714/4312 slots, 16.6%)
+ builder overlay (§5)        ✓ my  (1206/4312 slots, 28.0%)   idempotent d1105a5ecf531e67
+ merge_batch l10n_work/gen   ✓ my  (2740/4312 slots, 63.5%)   (9 modules merged)
```

`merge_batch` for `my` lists 9 modules; **9/17** now have `lessonSections`. Delta
`2515 → 2740` = **+225** = (114 − 2) + (115 − 2), consistent with §12.

Structure and text checks pass on both (ids/counts vs VI, 20 seeds × 3 distinct
distractors, 0 Vietnamese tone marks, 0 non-Myanmar fields across 229
translatable fields, all `pali` values byte-identical to the source).

### One more glossary inconsistency

`Anāgāmi` has **two conflicting glossary renderings**:

| Row | `my` |
| --- | --- |
| `Anāgāmi` (standalone) | **အနာဂါမ်** |
| `Anāgāmi-magga-{paṭhama…catuttha}-jhāna-cittaṃ` (5 rows) | **အနာဂါမိ**မဂ်စိတ် |

I used **အနာဂါမိ**, matching the five compound rows and the shipped `my` catalog.
Flagging the standalone row for IN4-49 rather than introducing a second spelling.

*(Count corrected in §17: I originally wrote "13 occurrences already in the
shipped `my` catalog (including `M4_AKUSALA`)". Both halves were wrong — the
shipped `content_my.json` at `286c41d` has **0** study modules with sections, so
no module contributed anything, and the true count is **10**, all of them in the
`cittas` catalog: the five `Anāgāmi-magga` cittas `CI_116`–`CI_120` and the five
`Anāgāmi-phala` cittas `CI_136`–`CI_140`. The "13" was a string count over
`content_my.json` **plus** the not-yet-committed `gen/` files.)*

### Terms used

**Glossary rows:** `Mahaggata` → မဟဂ္ဂုတ် / `Mahaggatacitta` → မဟဂ္ဂုတ်စိတ် ·
`Rūpāvacara` → ရူပါဝစရ · `Arūpāvacara` → အရူပါဝစရ ·
`Arūpāvacara-kiriyā` → အရူပါဝစရကြိယာ · `Jhāna` → ဈာန် · `Ekaggatā` → ဧကဂ္ဂတာ ·
`Vicāra` → ဝိစာရ · `Vitakka`/`Pīti` (M1_BASICS rows) · `Abhiññā` → အဘိညာဉ် ·
`Nirodha-samāpatti` → နိရောဓသမာပတ် · `Āyatana` → အာယတန · and all four arūpa
āyatana rows (`Ākāsānañcāyatana`, `Viññāṇañcāyatana`, `Ākiñcaññāyatana`,
`Nevasaññā-nāsaññāyatana`) · `Bhavaṅga` → ဘဝင်စိတ် ·
`Paṭisandhi viññāṇa` → ပဋိသန္ဓေဝိညာဏ် · `Rūpāvacarakusala` /
`Arūpāvacarakusala` for the kusala group names.

**In-repo attestation:** `စုတိ` (2×) for *cuti*, `ဝိပဿနာ` (1×) for *vipassanā*,
`သုခ` (16×), `ဗြဟ္မာ` (5×).

**No attestation — flagged for the council (4 terms):**

| Pāḷi | As written | Where |
| --- | --- | --- |
| `Kasina` | ကသိုဏ် | `M14_S02` body 1, `M14_R04` |
| `Samatha` | သမထ | `M13_S03` title/body, `M13_R10` |
| `Dibbacakkhu` / `Pubbenivāsa` / `Dibbasota` / `Iddhividha` / `Cetopariya` | ဒိဗ္ဗစက္ခု / ပုဗ္ဗေနိဝါသ / ဒိဗ္ဗသောတ / ဣဒ္ဓိဝိဓ / စေတောပရိယ | `M13_S03` body 3, `M13_R10`, `M13_Q09` |
| `Anāgāmi` (see inconsistency above) | အနာဂါမိ | `M13_S03` body 5, `M13_Q10` |

The five abhiññā names are written as *Burmese (Pāḷi — Burmese gloss)*, the
convention from §13–§15, so the meaning does not depend on the transliteration.
`ကသိုဏ်` and `သမထ` are the standard Burmese forms but have no glossary row and no
in-repo occurrence — propose adding both.

Running total of reviewable terms across the seven authored modules: **21**
(9 from M4 per §14, 4 from M3 per §15, 8 here — `Kasina`, `Samatha`, the five
abhiññā names, and `Anāgāmi`).

### Remaining — counted with the tool's own `count_slots`

I first wrote "~1529" here by hand and it was wrong. Recounting with
`check_content_locale.count_slots` imported directly (not re-implemented) gives
**1523 slots across 8 modules**. The earlier per-module weights quoted in §11–§15
were already produced by this method and are confirmed correct:

```
M6_NGHIEP 266 · M10_LO_TRINH 234 · M16_NGUOI_VA_COI 224 · M9_SAC_PHAP 223
M15_TAM_SO_PHOI_HOP 171 · M11_BIET_CANH 151 · M7_SIEU_THE 136 · M12_VO_NHAN 118
= 1523
```

`count_slots` over all 17 modules returns **3075**, matching the `studyModules`
share of the 4312 denominator recorded in §11. Note `STRUCTURAL_KEYS` excludes
`id`, `pali`, **`type`**, **`sourceRefs`** and `translationStatus` — my own
field counter had been omitting `type` and `sourceRefs`, which is why a naive
recount overshoots (it gave 2102 for the same 8 modules). Use the tool's
function.

---

## 17. Batch 3 (cont.) — modules `M12_VO_NHAN` + `M7_SIEU_THE`, and a correction to §16

Two more modules translated in full. Coverage after this commit:

```
baseline (HEAD, assets untouched)      714/4312  (16.6%)
+ §5 builder overlay, my only         1206/4312  (28.0%)   7a0dcdcd5d740aec, idempotent 2×
+ merge_batch.py l10n_work/gen        2990/4312  (69.3%)   my: merged 11 module(s)
                                                           hi: merged 2 module(s)  (pre-existing)
catalog studyModules with sections    11 / 17
```

### §16 claimed a glossary hit I had not actually used — corrected here

§16 lists `Bhavaṅga → ဘဝင်စိတ်` among the "glossary hits used" for M13/M14.
**That claim was false.** The glossary's only `Bhavaṅga` row is:

```
Bhavaṅga  ->  ဘဝင်စိတ်
```

but `M13_SAC_GIOI.json` carried `ဘဝင်္ဂ` 1× and `M14_VO_SAC_GIOI.json` 3×
(all in the paṭisandhi / bhavaṅga / cuti triad). `ဘဝင်္ဂ` is the plain Pāḷi
transliteration; the glossary column is the Burmese compound ဘဝင်စိတ်, and the
shipped `content_my.json` uses that form 3× (and `ဘဝင်္ဂ` 0×). Both files were
committed with the deviation in `286c41d`.

Fixed in this commit — all 4 occurrences → `ဘဝင်စိတ်`. `M12_VO_NHAN` had the same
error twice (`ဘဝင်္ဂစိတ်`, `ဘဝင်္ဂစိတ်စဉ်`) and was corrected **before** it was
ever committed. After the fix, `ဘဝင်္ဂ` occurs **0** times in the merged catalog.

Lesson: "glossary row exists" is not "glossary row was used". The check has to be
a string comparison against the row's `my` cell, run over the delivered file — not
a recollection while writing.

### Glossary rows actually used (Tier A, verified by substring scan)

`M12_VO_NHAN` — the module's core vocabulary is fully glossary-attested:

| Pāḷi headword | `my` column |
| --- | --- |
| `Ahetuka` | အဟိတ် |
| `Akusala-vipāka ahetuka` | အကုသလဝိပါက် အဟိတ်စိတ် |
| `Kusala-vipāka ahetuka` | ကုသလဝိပါက် အဟိတ်စိတ် |
| `Sampaṭicchana` | သမ္ပဋိစ္ဆိုင်းစိတ် |
| `Santīraṇa` | သန္တီရဏစိတ် |
| `Pañcadvārāvajjana` | ပဉ္စဒွါရာဝဇ္ဇန်း |
| `Manodvārāvajjana` | မနောဒွါရာဝဇ္ဇန်း |
| `Hasituppāda` | ဟသိတုပ္ပါဒ် |
| `Nānākālika hetu` | နာနာက္ခဏိက ကမ္မပစ္စည်း (I use the segment နာနာက္ခဏိက — Tier C) |

`M7_SIEU_THE`:

| Pāḷi headword | `my` column |
| --- | --- |
| `Lokuttara` / `Lokuttaracitta` | လောကုတ္တရာ / လောကုတ္တရာစိတ် |
| `Magga citta` | မဂ်စိတ် |
| `Sotāpatti` / `Sotāpattimagga` | သောတာပတ္တိ / သောတာပတ္တိမဂ် |
| `Arahatta` / `Arahattamagga` | အရဟတ္တ / အရဟတ္တမဂ် |
| `Sīlabbataparāmāsa` | သီလဗ္ဗတပရာမာသ |
| `Sakkāyadiṭṭhi` | သက္ကာယဒိဋ္ဌိ |
| `Vicikicchā` | ဝိစိကိစ္ဆာ |
| `Sammā-vācā` / `Sammā-kammanta` / `Sammā-ājīva` | သမ္မာဝါစာ / သမ္မာကမ္မန္တ / သမ္မာအာဇီဝ |

### Second instance of the `Anāgāmi` defect: `Sakadāgāmi`

The §16 `Anāgāmi` finding is not isolated. `Sakadāgāmi` has the **same** conflict:

```
Sakadāgāmi                                 -> သကဒါဂါမ်          (standalone row)
Sakadāgāmi-magga-paṭhama-jhāna-cittaṃ      -> ပထမဈာန် သကဒါဂါမိမဂ်စိတ်
… and 4 further magga rows, all သကဒါဂါမိ
```

In the shipped `content_my.json` at `286c41d`: `သကဒါဂါမ်` = **0** occurrences,
`သကဒါဂါမိ` = **10** — the five `Sakadāgāmi-magga` cittas `CI_111`–`CI_115` and
the five `Sakadāgāmi-phala` cittas `CI_131`–`CI_135`, one hit in `name` each.
(The shipped catalog at this commit has **0** study modules with sections, so
every occurrence is entity content, none of it mine.) So the compound rows and
the shipped catalog agree on `…ာမိ`; the standalone row is the outlier. I used
`သကဒါဂါမိ` and `သကဒါဂါမိမဂ်စိတ်` throughout `M7_SIEU_THE`, i.e. the attested
form, and flag the row to PSRC-49 alongside the `Anāgāmi` item. Same
recommendation: make the standalone rows agree with the five magga rows.

*Measurement note: my first count here said 13, for both `Sakadāgāmi` and the
§16 `Anāgāmi` figure. Both came from scanning `content_my.json` concatenated
with the `gen/` directory, which at that moment held three further occurrences
from my own uncommitted `M7_SIEU_THE.json`. Count the shipped catalog alone.*

### Terms composed by me — for council review (Tier C / Tier D)

**Tier D — no glossary row and no prior in-repo occurrence (0 in shipped
`content_my.json`):**

| Pāḷi | As written | Where |
| --- | --- | --- |
| `Maggaṅga` | မဂ်အင်္ဂါ | `M7_S02` body 4, `M7_S03` body 1, `M7_R06`, `M7_Q05` |
| `Sammā-diṭṭhi` | သမ္မာဒိဋ္ဌိ | `M7_S02` body 4 |
| `Sammā-saṅkappa` | သမ္မာသင်္ကပ္ပ | `M7_S02` body 4 |
| `Sammā-vāyāma` | သမ္မာဝါယာမ | `M7_S02` body 4 |
| `Sammā-sati` | သမ္မာသတိ | `M7_S02` body 4 |
| `Sammā-samādhi` | သမ္မာသမာဓိ | `M7_S02` body 4 |

All six sit in one place: the enumeration of the noble eightfold path in
`M7_S02` body 4 (and its echoes in `M7_S03`/`M7_R06`/`M7_Q05`). The glossary has
rows for `Sammā-vācā`, `Sammā-kammanta` and `Sammā-ājīva` but **none** for the
other five, so the set as shipped is three attested forms and five composed ones.
A single council decision covering the `Sammā-` prefix settles all six; the
three existing rows already show the pattern (Pāḷi stem + Burmese transcription,
no gloss).

**Tier C — no standalone row, but the segment is attested inside a glossary
compound or in the shipped catalog:** `Āvajjana → အာဝဇ္ဇန်း` (inside
`Pañcadvārāvajjana`/`Manodvārāvajjana`) · `Kiriyā → ကြိယာ` (inside
`Arūpāvacara-kiriyā`) · `Nibbāna → နိဗ္ဗာန်` (shipped 2×, no row) ·
`Nānākālika → နာနာက္ခဏိက` (inside `Nānākālika hetu`).

Running total of reviewable terms across the nine modules I have authored:
**28** — 9 from M4 (§14), 4 from M3 (§15), 8 from M13/M14 (§16), and here 6
Tier-D `Sammā-`/`Maggaṅga` forms plus the `Sakadāgāmi` conflict.

### No doctrinal content was added

Every body paragraph, card and seed in both modules renders a Vietnamese source
string that already exists in `content_vi.json`. The integrity pass confirms it
structurally: for all nine of my modules, section/card/seed counts and **ids**
match the VI source exactly, every `keyTerms[i].pali` is byte-identical to the VI
source (`pali-diff = 0` for M12 and M7), each of the 10 + 12 new seeds has three
distinct distractors none of which equals `correctAnswer`, and there are **0**
Vietnamese tone marks and **0** non-Myanmar leaf strings across 1412 delivered
leaves:

```
M1  4/14/12  148   M2  3/10/10  110   M3  7/20/20  273   M4  8/20/20  284
M5  3/10/10  114   M12 4/10/10  118   M7  3/12/12  136   M13 3/10/10  114
M14 3/10/10  115                                     TOTAL 1412   ALL OK
```

### Arithmetic reconciliation

`count_slots` over the 11 merged modules returns **1806** VI slots. The builder
emits `title` + `description` for each module, so the merge adds
`1806 − 2×11 = 1784`, and `1206 + 1784 = 2990` — exact. This is the same
"fields − 2 per module" rule reconciled in §16, now confirmed over 11 modules.

### Remaining — recounted with the tool's own `count_slots`

§16's figure of **1523 across 8 modules** stands. Subtracting M7 (136) and M12
(118) leaves **1269 across 6 modules**:

```
M6_NGHIEP 266 · M10_LO_TRINH 234 · M16_NGUOI_VA_COI 224 · M9_SAC_PHAP 223
M15_TAM_SO_PHOI_HOP 171 · M11_BIET_CANH 151 = 1269
```

`count_slots` over all 17 modules returns **3075** again; `done` total **1806**;
`TODO` total **1269**. Note for the next batch: `l10n_work/gen/M6_NGHIEP.json`
contains **only an `hi` block** — it must be read-modified, never overwritten.

### Gates run on this commit

```
python3 tool/content/check_content_locale.py my --glossary --strict   EXIT 0   (2990/4312, 69.3%)
python3 tool/content/check_content_locale.py --all --quiet            EXIT 0
python3 tool/check_paccaya_data.py                                    EXIT 0   (24/24, 52 links)
builder rebuild 2×                                                    identical (7a0dcdcd5d740aec)
content_hi.json Myanmar-script runs after merge_batch                 0
```

Not run here, unchanged reason: `flutter analyze` / `flutter test` — no Flutter
SDK on `PATH`. No Dart file and no shipped asset is touched by this commit;
CI runs both on the branch.

---

## 18. Batch 3 (cont.) — `M11_BIET_CANH` + `M15_TAM_SO_PHOI_HOP`, and a glossary-conformance check that finally works

Two more modules translated in full:

| Module | s/c/q | Slots | Subject |
| --- | --- | --- | --- |
| `M11_BIET_CANH` | 5/12/12 | 151 | the 6 pakiṇṇaka cetasikas |
| `M15_TAM_SO_PHOI_HOP` | 6/12/12 | 171 | how the 52 cetasikas combine into each citta |

```
baseline (HEAD ad48764)                714/4312  (16.6%)
+ §5 builder overlay, my only         1206/4312  (28.0%)   7a0dcdcd5d740aec
+ merge_batch.py l10n_work/gen        3308/4312  (76.7%)   my: merged 13 module(s)
catalog studyModules with sections    13 / 17
```

Reconciles exactly: `count_slots` over the 13 merged modules = **2128**; the builder
emits `title` + `description` per module, so `1206 + (2128 − 26) = 3308`.

### The check that §17 said was needed — written, and it immediately found 12 real defects

§17 concluded that "a glossary row exists" is not "the glossary row was used", and
that the check has to be a string comparison over the delivered file. So I wrote it:
for every `keyTerms[i]` in every module, look up `pali` as an **exact key** in
`glossary.csv` and assert the row's `my` cell appears **inside that keyTerm's `term`
field**. First version used substring-search over the whole file — that gives false
positives (e.g. `စေတသိက် ၅၂ ပါး` was "found" in M15 only because the module
`description` happens to contain it). Scoping the comparison to the `term` field
found **16 mismatches across 8 modules**. Four are the documented deviations
(`Paññindriya` ×2, `Sakadāgāmi`, `Anāgāmi`). The other **12 were real drift and are
fixed in this commit**:

| Module | keyTerm | Was | Now (glossary) |
| --- | --- | --- | --- |
| `M12_VO_NHAN` | `Nānākālika hetu` | နာနာက္ခဏိက ဟိတ် | နာနာက္ခဏိက ကမ္မပစ္စည်း |
| `M15_…` | `—` (total cetasikas) | စုစုပေါင်း စေတသိက်အရေအတွက် | စေတသိက် ၅၂ ပါး |
| `M17_…` | `Viññāṇapaccayā nāmarūpaṁ` | descriptive gloss | ဝိညာဏပစ္စယာ နာမရူပံ |
| `M17_…` | `Vedanāpaccayā taṇhā` | descriptive gloss | ဝေဒနာပစ္စယာ တဏှာ |
| `M17_…` | `Jāti (4)` | **ဇာတိ ၄ မျိုး** | **ယောနိ ၄ ပါး** |
| `M17_…` | `Soka, Parideva, …` | ` – ` separators | `၊ ` separators |
| `M3_…` | `Viratiyo` | ဝိရတီ | ဝိရတီ ၃ ပါး |
| `M3_…` | `Kāya – Citta` | ကာယ – စိတ္တ | ကာယနှင့် စိတ္တ |
| `M3_…` | `Suttamayā – Cintāmayā – Bhāvanāmayā` | ပညာ ၃ ပါး (…) | သုတမယ၊ စိန္တာမယ၊ ဘာဝနာမယ ဉာဏ် ၃ ပါး |
| `M4_AKUSALA` | `Ayoniso manasikāra` | with a space | အယောနိသောမနသိကာရ |
| `M4_AKUSALA` | `Thīna + Middha` | ထိနတိက (၂) | ထိနနှင့် မိဒ္ဓ (၂) |
| `M8_NHAN_DUYEN` | `Dve mūlāni` | မူလနှစ်ပါး | မူလနှစ်ပါး (အဝိဇ္ဇာနှင့် တဏှာ) |

**One of these was a genuine accuracy error, not cosmetic.** `Jāti (4)` renders the
four ways of birth — `aṇḍaja`, `jalābuja`, `saṃsedaja`, `opapātika` — which in
Burmese Abhidhamma usage are the **ယောနိ ၄ ပါး**, set against **ခန္ဓာဇာတိ ၃ မျိုး**
(pañca-/catu-/eka-vokāra). My `ဇာတိ ၄ မျိုး` collapsed that contrast. Fixed in the
keyTerm *and* in all three body/card sites in `M17`.

### The blind spot in substring scanning — and why it cost me a term

`glossary.csv` **does** have a row `Sabbākusalasādhāraṇā → သဗ္ဗာကုသလသာဓာရဏ`. My
substring scan for `Sabbākusalasādhāraṇa` returned `NONE`, because the row's headword
ends in `…ṇā` (macron) and my query ended in `…ṇa` — `sabbākusalasādhāraṇa` is not a
substring of `sabbākusalasādhāraṇā`. So I composed `အကုသလသာဓာရဏ` from the
`Sabbacittasādhāraṇa` pattern and reported it as Tier D. The exact-key lookup found
it in one pass. Fixed in `M15`.

This supersedes the §12/§14 advice to "substring-scan `pali`". Substring scanning
catches comma-joined and compound rows, which exact lookup misses — but it also
silently misses **diacritic variants**. The right procedure is both: exact-key
lookup over the keyTerms' own `pali` values for conformance, *and* substring scanning
when hunting for a term that may be buried inside a longer headword. Both must be
NFC-normalised.

### Two process errors this turn, both caught and reverted before commit

**1. Re-serialising a file to change one string.** I loaded `M8`/`M17` with
`json.load`, edited, and wrote back with `json.dump(…, indent=2)`. The content was
correct but the whole file was re-formatted — `git diff` showed **751 lines** changed
in `M17` and 38 in `M8` for four and one string edits. Reverted; re-did it as a
scoped textual replacement. Final diff: `M17` 14 lines, `M8` 2 lines.

**2. A regex that walked into the wrong locale — and wrote Myanmar into `hi`.**
`M17_DUYEN_CHI_TIET.json` holds both an `hi` and a `my` block, and `hi` comes first.
My first fix searched forward from `"id": "TERM_…"` for the next `"term":` — which
belongs to the **Hindi** copy. It replaced four Hindi values with Myanmar text, a
direct breach of the `my`-only constraint. Caught only because the printed `was:`
values came back in Devanagari. Reverted and re-done with a locale-scoped search
(`s.index('\n  "my": {')` first) plus an assertion that the value being replaced is
Myanmar script. Verified afterwards: the `hi` block is **byte-identical to `HEAD`**
(`json.dumps(sort_keys=True)` comparison), and the merged `content_hi.json` contains
**0** Myanmar-script runs.

The lesson generalises: any file under `l10n_work/gen/` may be multi-locale. Never
edit one by whole-file re-serialisation, and never locate a field by forward search
without first scoping to the locale block.

### Terms for council review

**Tier D from `M11`** — no glossary row, 0 occurrences in the shipped catalog:
`Viriyabala` ဝီရိယဗလ · `Vīriya-sambojjhaṅga` ဝီရိယသမ္ဗောဇ္ဈင် · the five pīti
degrees `Khuddikā` ခုဒ္ဒိကာပီတိ · `Khaṇikā` ခဏိကာပီတိ · `Okkantikā`
အောက္ကန္တိကာပီတိ · `Ubbegā` ဥဗ္ဗေကာပီတိ · `Pharaṇā` ဖရဏာပီတိ · the three
chanda kinds `Kāmacchanda` ကာမစ္ဆန္ဒ · `Dhammacchanda` ဓမ္မစ္ဆန္ဒ · `Kiriyāchanda`
ကြိယာစ္ဆန္ဒ. Each is written *Burmese (Pāḷi)* with the meaning carried by the
surrounding sentence, so an overruling decision changes one token.

**Tier C:** `Viriyindriya → ဝီရိယိန္ဒြေ` (no row of its own, but the `-indriya`
pattern is attested by `Jīvitindriya → ဇီဝိတိန္ဒြေ`).

**`ထိနတိက` stays, deliberately.** It appears 11× in M4/M15 body and card text as the
grouping name in a series — `မောစတုက္က ၄၊ လောဘတိက ၃၊ ဒေါသစတုက္က ၄၊ ထိနတိက ၂၊
ဝိစိကိစ္ဆာ ၁`. That `-တိက` / `-စတုက္က` pattern *is* the glossary's own convention
(`Mocatuka → မောစတုက္က`, `Dosatuka cetasika → ဒေါသစတုက္က`), so it is a parallel
construction rather than an invention; every occurrence is glossed `(ထိန၊ မိဒ္ဓ)`.
The pair-name keyTerm now carries the glossary form `ထိနနှင့် မိဒ္ဓ`.

**Tier A, all M11/M15 core vocabulary glossary-attested:** `Pakiṇṇaka → ပကိဏ်း` ·
`Aññasamāna → အညသမာန်း` · `Sabbacittasādhāraṇa → သဗ္ဗစိတ္တသာဓာရဏ` · `Vitakka →
ဝိတက်` · `Vicāra → ဝိစာရ` · `Adhimokkha → အဓိမောက္ခ` · `Vīriya → ဝီရိယ` ·
`Sammāpadhāna → သမ္မပ္ပဓာန် ၄ ပါး` · `Pīti → ပီတိ` · `Chanda → ဆန္ဒ` ·
`Cetasikasaṅgaha → စေတသိက်သင်္ဂဟ` · `Sabbākusalasādhāraṇā → သဗ္ဗာကုသလသာဓာရဏ` ·
`Paramatthasacca → ပရမတ္ထသစ္စာ` · `Nāma-khandha → နာမက္ခန္ဓာ ၄ ပါး` · `Lobhamūla →
လောဘမူစိတ်` · `Dosamūla → ဒေါသမူစိတ်` · `Dvipañcaviññāṇa → ဒွိပဉ္စဝိညာဏ် ၁၀` ·
`Hasanacitta → ဟသိတုပ္ပါဒ်စိတ်` · `Mahākusala → မဟာကုသိုလ်` · `Mahaggatacitta →
မဟဂ္ဂုတ်စိတ်` · `Lokuttaracitta → လောကုတ္တရာစိတ်` · `Viratiyo → ဝိရတီ ၃ ပါး` ·
`Appamaññā → အပ္ပမညာ` · `Karuṇā → ကရုဏာ` · `Muditā → မုဒိတာ`.

Running total of reviewable terms: **38** (28 through `M7_SIEU_THE` per §17, plus
the 10 Tier-D items above).

### Integrity, all 13 modules I have authored

All ids, body-paragraph counts, `keyTerms[i].pali` values, seed distractor counts and
leaf scripts verified against `content_vi.json` and `check_content_locale.count_slots`:

```
M1  148/148 · M2 110/110 · M3 273/273 · M4 284/284 · M5 114/114 · M7 136/136
M8  223/223 · M11 151/151 · M12 118/118 · M13 114/114 · M14 115/115
M15 171/171 · M17 171/171                                TOTAL 2128/2128
0 Vietnamese tone marks · 0 non-Myanmar leaves · 138 seeds · keyTerms.pali 124/125
identical (the 1 exception is the documented Vietnamese-in-`pali` source defect)
```

### Remaining — recounted with the tool's own `count_slots`

**4 modules, 947 slots:**

```
M6_NGHIEP 266 · M10_LO_TRINH 234 · M16_NGUOI_VA_COI 224 · M9_SAC_PHAP 223 = 947
```

`count_slots` over all 17 modules returns **3075**; done 13 = **2128**; TODO 4 =
**947**. Standing cautions: `l10n_work/gen/M6_NGHIEP.json` holds **only an `hi`
block** — read-modify-write, and verify `hi` is byte-identical afterwards.
`M10_S09` is titled *"Vīthimutta — chưa có nguồn"* in the VI source and `M10_S05`
does not exist (IN4-53).

### Gates run on this commit

```
python3 tool/content/check_content_locale.py my --glossary --strict   EXIT 0   (3308/4312, 76.7%)
python3 tool/content/check_content_locale.py --all --quiet            EXIT 0
python3 tool/check_paccaya_data.py                                    EXIT 0   (24/24, 52 links)
builder rebuild                                                       7a0dcdcd5d740aec (unchanged)
merged content_hi.json Myanmar-script runs                            0
M17 gen file `hi` block vs HEAD                                       byte-identical
```

Not run here, unchanged reason: `flutter analyze` / `flutter test` — no Flutter SDK
on `PATH`. This commit changes zero Dart and zero shipped asset; CI runs both.
