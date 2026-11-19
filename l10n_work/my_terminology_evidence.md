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
