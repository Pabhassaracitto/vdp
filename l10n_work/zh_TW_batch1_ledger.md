# zh_TW batch 1 — translation proposal, coverage and terminology evidence ledger

Agent: Traditional Chinese / Taiwan (zh_TW) translation agent
Date: 2026-10-08 · Branch: `arena/8fd29c08-vdp`
Status of the locale: **draft**, catalog **partial**, English fallback **on**.
Do not mark any content `reviewed` on the strength of this batch.

Deliverable (zh_TW only, no shared file touched):

| File | Kind | Notes |
| --- | --- | --- |
| `tool/content/data_priority_zh_tw.py` | **new** translation-source module | 670 authored zh_TW strings + wiring helpers |

Nothing else was edited: no other locale, no builder, no runtime fallback, no
registry/status, no test, and `assets/content/content_zh_TW.json` was **not**
hand-edited and **not** regenerated (`build_full_catalogs.py` was not run).

---

## 1. Native-source verification — required finding

### 1.1 The glossary's source title is wrong for zh_TW — FLAGGED, not changed

`l10n_work/glossary.csv` header, line 4:

```
# zh_TW: 摂阿毘達磨義論 (traditional-script Chinese rendering)
```

**「摂」 is not a Traditional Chinese character.** It is the Japanese shinjitai
form of 「攝」; the glossary has inherited the Japanese column's spelling (the
`ja:` line directly below it cites 南伝大蔵経 65, 水野弘元 譯, which does use
摂). The correct Traditional / Taiwan form is:

> 阿耨樓陀（Ācariya Anuruddha）造，葉均 譯，《**攝**阿毘達磨義論》
> (Abhidhammatthasaṅgaha)
> 繁體版：台北，大千出版社，2002 年 2 月初版，ISBN 9789578231849，262 頁。
> （簡體版：中國佛教協會，1986 年 11 月。）

Verification: 博客來 (books.com.tw) catalogue entry for ISBN 9789578231849 —
書名《攝阿毗達摩義論》，作者 阿耨樓陀，譯者 葉均，出版社 大千，出版地 台灣，
語言 繁體中文, 262 頁 [5](https://www.books.com.tw/products/0010188834);
蔡奇林《巴利學研究紀要：1995–2001》records 葉均（1916–1985）譯《攝阿毗達摩義論》，
台北，大千出版社，1997 年；嘉義，新雨雜誌社，1999 年
[3](http://www.agamarama.com/cityzen/jiangtan/ahanlunwen/balijiyao95-01.pdf);
dhammarain web edition 編輯說明 confirms 「葉均譯《攝阿毘達摩義論》簡体字版由
「中國佛教協會」出版，繁體字……另有大千出版社出版」
[1](https://dhammarain.github.io/canonical/abhidhamma/Yeh_Abhidhammattha-sangaha.html).

**Action for the integrator / glossary owner:** change the `zh_TW:` header line
to 《攝阿毘達摩義論》（葉均 譯；台灣繁體版：台北，大千出版社，2002，
ISBN 9789578231849）. I did not edit `glossary.csv` because it is a shared
table owned by the coordinator.

Note also that 《漢譯南傳大藏經》第 70 冊 carries a **different** translation
(悟醒 譯) [4](https://buddhism.lib.ntu.edu.tw/FULLTEXT/JR-AN/an122265.pdf),
and 尋法比丘's 1999 Chinese rendering of Bhikkhu Bodhi's
*Comprehensive Manual of Abhidhamma* (《阿毗達摩概要精解》) is the version most
widely circulated in Taiwan. This batch keys to 葉均 (the glossary's own
reference), and where 尋法比丘 / current Taiwan usage differs, the difference is
recorded in §3 below.

### 1.2 Terms verified **in context** (not from a word list)

All quotations below are from 葉均 譯《攝阿毘達摩義論》(dhammarain web edition),
read in the passage, not from an index.

| Quote (verified) | Section | What it grounds |
| --- | --- | --- |
| 「十二支：即無明、行、識、名色、六處、觸、受、愛、取、有、生、老死。」 | 第八攝緣分別品 · 一、緣起法 §3 | all 12 paticca link names (12/12 match shipped zh_TW **exactly**) |
| 「由生之緣而發生老死、愁、悲、苦、憂、惱。」 | 同上 | 愁、悲、苦、憂、惱 in PD_12 |
| 「三輪轉：即無明、愛、取為『煩惱輪轉』；稱為『業有』的一分有與行，是為『業輪轉』；稱為『生有』的一分有與其餘的（識、名色、六處、觸、受），是為『異熟輪轉』。」 | 同上 §6 | 業有 / 生有 in PD_10; 煩惱輪轉·業輪轉·異熟輪轉 |
| 「（發趣法攝有二十四緣）：因緣、所緣緣、增上緣、無間緣、等無間緣、俱生緣、相互緣、依止緣、親依止緣、前生緣、後生緣、數數修習緣、業緣、異熟緣、食緣、根緣、禪緣、道緣、相應緣、不相應緣、有緣、無有緣、離去緣、不離去緣。」 | 第八攝緣分別品 · 二、發趣法 §7 | 22/24 paccaya names (2 variants, see §3) |
| 「親依止有三種：即所緣親依止、無間親依止、自然（或本性）親依止。」 | 同上 §9 | PC_09 subdivisions |
| 「增上緣有二：即強有力的所緣對於名，依所緣增上（為增上緣）。俱生增上的四種（欲、心、精進、觀）……」 | 同上 §10 | PC_03 subdivisions |
| 「食緣有二種：即段食對於此身……非色食對於俱生的名色……」 | 同上 §10 | PC_15 subdivisions |
| 「六所依……對於七識界（依前生緣為緣）；五所緣……對於五識路，依前生緣（為緣）。」 | 同上 §9（四） | PC_10 subdivisions |
| 「有分心波動二次，遮斷了有分之流，轉向……而有五門轉向心……便生起見色的眼識、領受（所緣）的領受心、推度的推度心、確定的確定心……二十九速行心……波動七次，隨於速行之後而有二（剎那）彼所緣異熟心……」 | 第四攝路分別品 · 二、通過五門的心識過程 | 有分／五門轉向／領受／推度／確定／速行／彼所緣 — all vithi step names |
| 「於五門（眼、耳、鼻、舌、身），有極大、大、小、極小（的所緣境）……」 | 同上 §3 | the four object-strength classes (see §3, PC/vithi naming) |
| 「但於離路（的心），只有三種境轉起，即業、業相、趣相。」 | 第四攝路分別品 §2 | 離路心 (VT_VITHIMUTTA) |
| 「有結生、有分及死的作用的十九（心）……」 | 第三攝雜分別品 · 三、攝作用 | 結生／有分／死 |
| 「四增上：即欲增上、精進增上、心增上、觀（慧）增上。」 | 第七攝集分別品 · 二、攝雜 | PC_03 paccayaDhamma (see §3) |
| 「十二道支：即正見、正思惟、正語、正業、正命、正精進、正念、正定、邪見、邪思惟、邪精進、邪定。」 | 同上 | PC_18 paccayaDhamma — 12/12 match |
| 「四食：即段食（第一）、觸食第二、意思食第三、識食第四。」 | 同上 | PC_15 paccayaDhamma |
| 「二十二根：即眼根、耳根、鼻根、舌根、身根、女根、男根、命根、意根、樂根、苦根、喜根、憂根、捨根、信根、精進根、念根、定根、慧根、未知當知根、已知根、具知根。」 | 同上 | PC_16 paccayaDhamma |
| 「七禪支：即尋、伺、喜（Pīti）、一境性、喜（somanassa）、憂、捨。」 | 同上 | PC_17 paccayaDhamma |
| 「四取：即欲取、見取、戒禁取、我語取。」 | 第七攝集分別品 · 一、攝不善 | PD_09 doctrinal note |
| 「此中，眼即眼門……六種六法」、「六路：（心的過程）依門的區別，即眼門路、耳門路……意門路」 | 第三品四、第四品一 | 五門／意門 心路 |
| 品題 「三、色的等起」「四、色的聚」 | 第六攝色分別品 | 色聚 (kalāpa)，色法四種等起之源 |

### 1.3 Simplified characters found in the glossary's own zh_TW column — FLAGGED

The zh_TW column of `l10n_work/glossary.csv` still contains Simplified
characters in 12 rows (all `cittas`): `处` (處), `无` (無), `识` (識), `边` (邊).
Rows affected: `Nevasaññā-nāsaññāyatana-*`, `Viññāṇañcāyatana-*` (also `无`),
`Ākiñcaññāyatana-*`, `Ākāsānañcāyatana-*`. Not changed here — flagged for the
glossary owner, since these names are also echoed in the shipped catalog.

---

## 2. Terminology evidence ledger

Pāḷi / English concept and ID · zh_TW rendering chosen · native source with
edition/section · contextual phrase verified · confidence · difference from the
Simplified Chinese (`zh`) column.

| Pāḷi / English (ID) | zh_TW rendering | Source (edition, section) | Contextual phrase verified | Conf. | vs `zh` |
| --- | --- | --- | --- | --- | --- |
| Avijjā, Ignorance (PD_01) | 無明 | 葉均 譯《攝阿毘達摩義論》第八攝緣分別品·一、緣起法 §3 | 「十二支：即無明、行、識……」 | High | same |
| Saṅkhārā (PD_02) | 行 | 同上 | 同上 | High | same |
| puññâbhisaṅkhāra / apuñña / āneñja | 福行 · 非福行 · 不動行 | glossary.csv keyTerm rows (Apuññābhisaṅkhāra → 非福行) + 葉均 第八品 §6 | 「業有」/「業輪轉」 | High | same |
| Nāmarūpa (PD_04) | 名色 | 同上 §3 | 同上 | High | same |
| Saḷāyatana (PD_05) | 六處 | 同上 §3 | 「名色緣六處、六處緣觸」 | High | same (not 六入 — that is the Mahāyāna/Agama rendering) |
| Taṇhā (PD_08) | 愛 | 同上 §3, §6 | 「無明、愛、取為『煩惱輪轉』」 | High | same |
| kāma/bhava/vibhava-taṇhā | 欲愛 · 有愛 · 無有愛 | 同上 §6; 第七品「欲漏、有漏」 | 煩惱輪轉 | High | same |
| Upādāna (PD_09) | 取 | 同上 §3 | 同上 | High | same |
| cattāri upādānāni | 欲取 · 見取 · 戒禁取 · 我語取 | 第七攝集分別品·一、攝不善 | 「四取：即欲取、見取、戒禁取、我語取」 | High | same |
| Bhava (PD_10) | 有 | 第八品 §6 | 「業有」「生有」 | High | same |
| Jāti (PD_11) | 生 | 第八品 §3 | 「有緣生」 | High | same |
| Jarāmaraṇa (PD_12) | 老死 | 第八品 §3 | 「由生之緣而發生老死、愁、悲、苦、憂、惱」 | High | same |
| Hetu-paccaya (PC_01) | 因緣 | 第八品·二、發趣法 §7 | 二十四緣名目 | High | same |
| Ārammaṇa (PC_02) | 所緣緣 | 同上 | 同上 | High | same |
| Adhipati (PC_03) | 增上緣 | 同上 | 同上 | High | same |
| cattāro adhipati | 欲增上 · 精進增上 · 心增上 · 觀（慧）增上 | 第七攝集分別品·二、攝雜 | 「四增上：即欲增上、精進增上、心增上、觀（慧）增上」 | High | zh uses 審察 for vīmaṃsā; **Taiwan/葉均 uses 觀（慧）** — new prose uses 觀（慧，vīmaṃsā） |
| Anantara / Samanantara (PC_04/05) | 無間緣 · 等無間緣 | 第八品 §7 | 二十四緣名目 | High | same |
| Sahajāta / Aññamañña (PC_06/07) | 俱生緣 · 相互緣 | 同上 | 同上 | High | same |
| Nissaya (PC_08) | 依止緣 | 同上 | 同上 | High | same |
| Upanissaya (PC_09) | 親依止緣 | 同上 | 同上 | High | same |
| ārammaṇa / anantara / pakatûpanissaya | 所緣親依止 · 無間親依止 · 自然親依止 | 第八品 §9 | 「親依止有三種：即所緣親依止、無間親依止、自然（或本性）親依止」 | High | same |
| Purejāta / Pacchājāta (PC_10/11) | 前生緣 · 後生緣 | 第八品 §7 | 二十四緣名目 | High | same |
| **Āsevana (PC_12)** | **shipped: 習行緣** | 第八品 §7 | 「……數數修習緣……」 | **Medium — variant** | **MISMATCH with 葉均, who writes 數數修習緣.** Kept as shipped (preserve-existing rule); proposed change recorded, not applied. 尋法比丘/Bodhi lineage uses 重複緣. Needs senior pick. |
| Kamma (PC_13) | 業緣 | 第八品 §7 | 二十四緣名目 | High | same |
| sahajāta / nānākkhaṇika kamma | 俱生業 · 異剎那業 | 第八品 §9（二） | 「俱生的思……多剎那的思」 | High | same |
| Vipāka (PC_14) | 異熟緣 | 第八品 §7 | 二十四緣名目 | High | same |
| Āhāra (PC_15) | 食緣 | 同上 | 同上 | High | same |
| kabaḷīkāra / phassa / manosañcetanā / viññāṇa āhāra | 段食 · 觸食 · 意思食 · 識食 | 第七攝集分別品·二、攝雜 | 「四食：即段食（第一）、觸食第二、意思食第三、識食第四」 | High | same |
| Indriya (PC_16) | 根緣 | 第八品 §7 | 二十四緣名目 | High | same |
| 20 faculties | 五淨色根、命根色、十四名根（五受根·信·精進·念·定·慧·未知當知根·已知根·具知根·意根） | 第七品·二、攝雜 | 二十二根 名目 | High | same |
| **Jhāna-paccaya (PC_17)** | **shipped: 禪那緣** | 第八品 §7 | 「……禪緣……」 | High (low risk) | **葉均 writes 禪緣**; 禪那緣 is the common Taiwan rendering. Kept as shipped; noted. |
| satta jhānaṅgā | 尋 · 伺 · 喜 (pīti) · 樂 (sukha) · 憂 (domanassa) · 捨 (upekkhā) · 一境性 | 第七品·二、攝雜 | 「七禪支：即尋、伺、喜（Pīti）、一境性、喜（somanassa）、憂、捨」 | High | 葉均 glosses somanassa as 喜; I use 樂 to keep the five feelings distinct — see §4 note |
| Magga (PC_18) | 道緣 | 第八品 §7 | 二十四緣名目 | High | same |
| dvādasa maggaṅgā | 正見…正定 + 邪見·邪思惟·邪精進·邪定 | 第七品·二、攝雜 | 「十二道支：即正見、正思惟……邪定」 | High | same |
| Sampayutta / Vippayutta (PC_19/20) | 相應緣 · 不相應緣 | 第八品 §7 | 二十四緣名目 | High | same |
| Atthi / Natthi / Vigata / Avigata (PC_21–24) | 有緣 · 無有緣 · 離去緣 · 不離去緣 | 同上 | 同上 | High | same |
| Atimahanta-ārammaṇa (VT_NGU_MON_RATLON) | shipped: 極極大所緣 | 第四攝路分別品 §3 | 「有極大、大、小、極小（的所緣境）」 | Medium | **葉均 uses 極大境 for atimahanta and 大境 for mahanta**; zh_TW/glossary use 極極大／極大. Kept as shipped (glossary-consistent); noted for review |
| Mahanta-ārammaṇa (VT_NGU_MON_LON) | shipped: 極大所緣 | 同上 | 同上 | Medium | as above |
| bhavaṅga | 有分（有分心） | 第四品 §3 | 「有分心波動二次，遮斷了有分之流」 | High | same |
| pañcadvārāvajjana | 五門轉向 | 同上 | 「五門轉向心（的一次）生滅」 | High | same |
| sampaṭicchana / santīraṇa / voṭṭhapana | 領受心 · 推度心 · 確定心 | 同上 | 「領受（所緣）的領受心、推度的推度心、確定的確定心」 | High | same |
| javana | 速行（速行心） | 同上 | 「速行心……波動七次」 | High | same |
| tadārammaṇa | 彼所緣 | 第三攝雜分別品·三、攝作用 | 「八大異熟（心）及三推度（心）共十一（心）為彼所緣作用」 | High | same |
| dvipañca-viññāṇa | shipped: 雙五識 | 第四品 §3 | 「（二種前）五識」 | Medium | 葉均 says 二種前五識; 雙五識 is the Taiwan/尋法比丘 form. Kept |
| paṭisandhi / bhavaṅga / cuti | 結生 · 有分 · 死 | 第三品·三、攝作用 | 「有結生、有分及死的作用的十九（心）」 | High | same |
| vīthimutta | 離路心 | 第四品 §2 | 「但於離路（的心），只有三種境轉起，即業、業相、趣相」 | High | same |
| kamma / kamma-nimitta / gati-nimitta | 業 · 業相 · 趣相 | 同上 | 同上 | High | — |
| kalāpa | 色聚 | 第六攝色分別品 品題「四、色的聚」 | — | High | same |
| mahābhūta | 四大種 | 第六品 | — | High | same |
| hadaya-vatthu | 心所依處（心基） | 第三品·六、攝所依 | 「所依，即眼、耳、鼻、舌、身及心所依處六種」 | High | same |
| pasāda-rūpa | 淨色（眼淨色…身淨色） | 第六品·一、色的列舉 | — | High | same |
| lakkhaṇa / rasa / paccupaṭṭhāna / padaṭṭhāna | 特相 · 作用 · 現起 · 近因 | `lib/l10n/app_zh_TW.arb` (shipped UI labels); the scheme itself is the standard Theravāda 四種鑑別法 | UI already reads 特相 (Lakkhaṇa) / 現起 (Paccupaṭṭhāna) / 近因 (Padaṭṭhāna) | High | zh uses 现起; zh_TW uses 現起 ✓ |
| Janaka / Upatthambhaka / Upapīḷaka / Upaghātaka kamma | 令生業 · 支助業 · 妨害業 · 毀壞業 | cross-checked against `assets/data/kammas.json` Pāḷi, not against a Chinese source | — | **Medium — see §5** | current zh_TW has these four on the **wrong ids** |
| Garuka / Āsanna / Āciṇṇa / Kaṭattā kamma | 重業 · 臨死業 · 慣行業 · 累積業 | same | — | Medium — see §5 | same problem |
| Lokuttara / Magga kamma (KM_R_04) | 出世間業（道業） | `assets/data/kammas.json` | — | High | shipped zh_TW says 無色界善業 — **wrong** |

---

## 3. Completed fields (this batch)

Applied with `data_priority_zh_tw.apply(catalog)`; counts are fields actually
written into a copy of the shipped catalog:

| Section | Entities | Fields written | Notes |
| --- | --- | --- | --- |
| `paticcas` | 12 / 12 | **70** | characteristic, function, manifestation, proximateCause (12×4=48), doctrinalNote (10), examples (12) |
| `paccayas` | 24 / 24 | **105** | paccayaDhamma (24), paccayuppanna (24), examples (24), doctrinalNote (24), subdivisions (9 conditions × 2–5 items) |
| `vithis` | 4 / 4 | **54** | arisingCondition (4), significance (4), doctrinalNote (4), plus 18 missing steps for VT_NGU_MON_LON (9), VT_Y_MON (6), VT_VITHIMUTTA (3) |
| `cetasikas` | 52 / 52 | **208** | the four aspects (特相·作用·現起·近因) for all 52 |
| `rupas` | 28 / 28 | **135** | four aspects (28×4=112) + doctrinalNote (23) |
| `kammas` | 16 / 16 | **32** | doctrinalNote (16) + examples (16) |
| **Total** | | **604** | 670 authored strings (some multi-sentence) |

Catalog-wide missing-field count against the English reference:
**785 → 234** (`cittas` 192, `studyModules` 42 remain).
Zero values are identical to the English reference (no English-placeholder
leakage), and zero Vietnamese strings were introduced.

### Preserved, by design

* `VT_NGU_MON_RATLON` steps 1–11 (name + description + doctrinalNote) already
  shipped in `content_zh_TW.json`; the `STEPS` map for that process is empty, so
  a rebuild cannot overwrite them.
* Every existing `name` / `shortName` / `description` / `definition` in the
  catalog is left alone — `apply()` only fills empty keys.
* The legacy generic citta-example template `生起于相应境遇中（...）` was not
  restored anywhere.

### Character-level QA

All 670 strings were run through OpenCC `s2t`. 0 unreviewed hits. Four
deliberate deviations from OpenCC, recorded so an automated checker can be
tuned rather than "fixed":

| OpenCC `s2t` wants | Kept | Why |
| --- | --- | --- |
| 佈施 | **布施** | 布施 is the universal Taiwan Buddhist rendering (CBETA, 大千, 佛光); 佈施 is a secular-Taiwan MOE preference that no Taiwan Buddhist publisher follows |
| 喫 | **吃** | 喫 is archaic in Taiwan |
| 纔 | **才** | 纔 is archaic in Taiwan |
| 慾（寡慾） | **寡欲** | Buddhist usage writes 欲 (chanda/kāma); 慾 is the desire-as-appetite variant |

---

## 4. Doctrinal notes on specific renderings

* **PC_17, 七禪支.** 葉均 glosses the seven as 尋、伺、喜（pīti）、一境性、喜
  （somanassa）、憂、捨. To keep the five feelings distinguishable in Taiwan
  usage I write 尋、伺、喜（pīti）、樂（sukha）、憂（domanassa）、捨（upekkhā）、
  一境性（ekaggatā）, with the Pāḷi in parentheses so the mapping to the
  English "rapture, pleasure, displeasure, equanimity" is unambiguous.
* **PC_16, 20 faculties.** The English says "five sensitive material faculties,
  the material life faculty, and fourteen mental faculties"; I expand the
  fourteen as 五受根 + 信、精進、念、定、慧 + 未知當知根、已知根、具知根 + 意根,
  which sums to 14 and matches the sutta/canonical count. The three
  "understanding faculties" are named from 葉均's 二十二根 list verbatim.
* **PD_01 description (existing, not mine).** The shipped zh_TW description
  reads 「不了知四聖諦、**三世因果**與十二緣起之愚癡蒙昧」. 「三世因果」 is a
  Chinese-Mahāyāna-flavoured phrase; the English is "kamma and its results"
  (業與業果). Flagged for correction; not changed here, because
  `description` is out of this batch's scope.
* **CS_CHANDA name.** The shipped zh_TW name is 「一欲」 (glossary zh_TW also
  「一欲」). This looks like a stray numeral: chanda is 「欲」/「欲作意願」 in
  Chinese Abhidhamma. `name` is out of scope for this batch — flagged for the
  glossary owner and the next batch.

---

## 5. Corrections proposed — kamma names are on the wrong IDs

`tool/content/data_priority_conditions.py` (`KAMMAS`) records
`KM_U_01 → "Janaka-kamma"`, but `assets/data/kammas.json` — the canonical
structural record the builder iterates over — has
`KM_U_01 → "Garuka-kamma"` and `KM_P_01 → "Janaka-kamma"`. **The `KM_P_*`
(function) and `KM_U_*` (priority) Pāḷi groups are transposed in the shared
source table**, so all seven priority locales shipped the wrong labels. zh_TW
shows it as:

| ID | `kammas.json` Pāḷi | shipped zh_TW | correct zh_TW |
| --- | --- | --- | --- |
| KM_P_01 | Janaka-kamma | 重業 ✗ | 令生業 |
| KM_P_02 | Upatthambhaka-kamma | 臨死業 ✗ | 支助業 |
| KM_P_03 | Upapīḷaka-kamma | 慣行業 ✗ | 妨害業 |
| KM_P_04 | Upaghātaka-kamma | 已作業 ✗ | 毀壞業 |
| KM_U_01 | Garuka-kamma | 生產業 ✗ | 重業 |
| KM_U_02 | Āsanna-kamma | 支持業 ✗ | 臨死業 |
| KM_U_03 | Āciṇṇa-kamma | 阻礙業 ✗ | 慣行業 |
| KM_U_04 | Kaṭattā-kamma | 毀壞業 ✗ | 累積業 |
| KM_R_04 | Lokuttara-kamma / Magga-kamma | 無色界善業 ✗ | 出世間業（道業） |

The corrected `name` / `shortName` are in
`KAMMA_NAME_CORRECTIONS_ZH_TW` and are applied **only** by the separate call
`apply_kamma_name_corrections(catalog)`, never by `apply()`. This is
deliberate: it is a shared-table data bug, so the integrator should decide
whether to fix `data_priority_conditions.py` for all seven locales (correct)
or apply the zh_TW-only patch (safe). **This batch does not edit the shared
table.**

Note the `KM_R_*` descriptions are also affected: KM_R_01 is shipped as
欲界不善業 where `kammas.json` has plain `Akusala-kamma` (不善業). Low impact;
flagged, not changed.

---

## 6. Gaps that should stay on English (or `zh`) fallback

| Gap | Size | Why it stays on fallback |
| --- | --- | --- |
| `studyModules` lesson content for 14 modules (all except M1_BASICS, M2_SI_PHAN, M11_BIET_CANH) | 81 lesson sections, 210 review cards, 205 quiz seeds | Far beyond one reviewable batch. Lessons must be translated whole-section with their review cards and quiz seeds, and every quiz item must be atomic. Deferred to batch 2 rather than shipped as fragments. |
| `cittas.examples` | 121 × 2 | 121 citta-specific examples need per-citta doctrinal checking; the legacy generic template must not be restored. Deferred to batch 2. |
| `cittas.shortName` | 71 | **Not consumed by the UI** (`grep -rn shortName lib/` shows only `cetasika.localizedShortName`). Per the "only translate UI-used fields" rule, leave it absent. |
| `paticcas.description` wording (三世因果) | 12 | Existing content; flagged in §4, left for a review pass. |
| `PC_12` name 習行緣 vs 數數修習緣 | 1 | Awaiting senior/native pick (§3). |
| `CS_CHANDA` name 一欲 | 1 | Awaiting glossary owner (§4). |
| `KM_P_*` / `KM_U_*` / `KM_R_04` names | 9 | Awaiting the integrator's decision on the shared table (§5). |
| Glossary zh_TW column: 12 Simplified-character rows + the 摂/攝 title | 13 | Shared table; flagged only (§1.1, §1.3). |

---

## 7. Integration notes for the coordinator

1. **Do not run `build_full_catalogs.py` on my behalf without the hook** — it
   rewrites all seven catalogs and currently has no code path for these fields,
   so the new prose would be dropped.
2. Minimal hook, in `tool/content/build_full_catalogs.py`, at the end of
   `build_catalog()`, immediately before `return out`:

   ```python
   if loc == "zh_TW":
       import tool.content.data_priority_zh_tw as dztw
       dztw.apply(out)
       # only after the KM_P_/KM_U_ id mismatch in §5 is resolved:
       # dztw.apply_kamma_name_corrections(out)
   ```

   `apply()` is idempotent and fills only empty keys, so existing zh_TW content
   and the preserved vithi steps survive a rebuild.
3. `VITHIS_ZH_TW[...]["STEPS"]` intentionally omits `VT_NGU_MON_RATLON`; the
   builder's existing `existing_vithi_step_translation()` preservation path
   keeps those eleven steps.
4. Suggested gates after integration:

   ```bash
   python3 tool/check_localizations.py
   python3 tool/content/check_content_locale.py zh_TW --glossary
   python3 tool/content/build_full_catalogs.py
   python3 tool/content/build_full_catalogs.py   # idempotence
   flutter analyze
   flutter test
   ```

   `check_content_locale.py --glossary` will compare against the zh_TW glossary
   column; expect it to raise the §1.3 Simplified-character rows and the §3
   variants (PC_12, PC_17, atimahanta/mahanta) — those are known and listed
   here, not new defects introduced by this batch.
5. Fonts: these strings add no glyphs outside the existing CJK set, but
   `tool/subset_fonts.py` should still be re-run after regeneration per the
   repo's own convention.

---

## 8. Honest status

* The zh_TW catalog remains **draft** and **partial**; English fallback stays
  on. `zh_TW → zh → en` ordering is untouched and must never reach Vietnamese.
* Nothing in this batch has been reviewed by a native/senior reader. The items
  in §3 marked "variant", the §4 flags, and the §5 corrections all need a
  qualified reviewer before any `reviewed` status is set.
* The three modules already marked `reviewed` (M1_BASICS, M2_SI_PHAN,
  M11_BIET_CANH) were set that way by an earlier pass, not by me, and I did not
  touch them; if the current policy is that AI-generated drafts may not be
  marked reviewed, the coordinator may want to revisit those three.
