# Thai (th) — terminology evidence ledger

Scope: the Thai rendering of every term authored in
`tool/content/data_priority_th.py` (batch 1: Nhân Duyên / Paṭiccasamuppāda,
24 paccayas, vīthis, plus high-confidence repairs of existing Thai entries).
Status of the whole batch: **draft — not reviewed**. Nothing here is a claim
of doctrinal approval; disputed or unavailable forms are marked below and the
corresponding field was left on English fallback where required.

Method
------
1. Terminology was taken first from the Thai column of `l10n_work/glossary.csv`
   (and the normalised `l10n_work/glossary.json`) — the agreed baseline named
   in the assignment (Thai Abhidhamma tradition, *Abhidhammattha Saṅgaha*,
   Thai script).
2. Every central or disputed form was then checked against a recognised Thai
   Theravāda teaching text (course material of อภิธรรมโชติกะวิทยาลัย,
   มหาวิทยาลัยมหาจุฬาลงกรณราชวิทยาลัย; the Thai study manual of the
   *Abhidhammattha Sangaha*; the Pāḷi–Thai dictionary of พระพรหมคุณาภรณ์).
   The source and the section are recorded per row. Page numbers are given
   only where the retrieved text itself carried them.
3. No citation was invented. Where only a course/site section (not a printed
   page) could be confirmed, the row says so.

Sources used (short keys)
-------------------------
| Key | Source |
| --- | --- |
| **S1** | *คู่มือพระอภิธัมมัตถสังคหะ* (Thai study manual of the Abhidhammattha Sangaha, หลักสูตรอภิธรรมโชติกะวิทยาลัย มจร) — ปริจเฉทที่ ๑, ๒, ๘ — thepathofpurity.com (paths `…/คู่มือพระอภิธัมมัตถสังคหะ/ปริจเฉทที่-๑/`, `-๒/`, `-๘/`) |
| **S2** | *ปัจจัย ๒๔* — เอกสารประกอบการศึกษาพระอภิธรรม ชั้นจูฬตรี–มหาเอก, thepathofpurity.com (index page `…/พระอภิธรรม/`) |
| **S3** | *ปัฏฐาน (ปัจจัย ๒๔)* lecture series, dhammahome.com — ตอนที่ 29 (ปัจฉาชาตปัจจัย) and มาติกานิกเขปวาระ ภาค ๑ (webboard topic 42186) |
| **S4** | *ปฏิจจสมุปบาท series* — Thai teaching notes on ปริจเฉทที่ ๘, prachaniyom.blogspot.com: post `blog-post_62` (อวิชฺชาปจฺจยา สงฺขารา) and `blog-post_968` (ชาติปจฺจยา ชรามรณํ …) |
| **S5** | *พจนานุกรมพุทธศาสตร์ ฉบับประมวลศัพท์*, พระพรหมคุณาภรณ์ (ป.อ. ปยุตฺโต), พิมพ์ครั้งที่ ๓๑ — book.watnyanaves.net (used for the standard Thai names of the 12 links and the vīthi moments; the assignment warns a dictionary alone is not sufficient — it is paired with S1/S4 here) |
| **S6** | *ศึกษาวิถีจิตในการพิจารณารูป-นามในปัจจยปริคคหญาณ*, มหาวิทยาลัยมหาจุฬาลงกรณราชวิทยาลัย (๒๕๖๒) — oldweb.mcu.ac.th PDF, plus dhammahome teaching posts on วิถีจิต ๑๗ ขณะ |
| **S7** | dhammahome.com teaching/forum threads in the Thai tradition of อาจารย์สุจินต์ บริหารวนเขตต์ (มูลนิธิศึกษาและเผยแพร่พระพุทธศาสนา): `webboard/topic/26149` (ปัจจุปัฏฐาน ปทัฏฐาน — วิเสสลักษณะ ๔ = ลักษณะ รสะ ปัจจุปัฏฐาน ปทัฏฐาน), `webboard/topic/24348`, `audio/topic/6745` (ลักขณาทิจตุกะ) |

---

## 1. The four aspects of a dhammas — ลักขณาทิจตุกะ

The English entity fields `characteristic` / `function` / `manifestation` /
`proximateCause` are the four *visesalakkhaṇa* of the Thai Sangaha tradition,
known as **ลักขณาทิจตุกะ**. Thai renders them as follows (S1 ปริจเฉทที่ ๒
หน้า ๓ "ลักขณาทิจตุกะ"; corroborated by S7 `webboard/topic/26149` and
`audio/topic/6745`):

| English field | Pāḷi | Thai rendering | Form as used in the source | Confidence |
| --- | --- | --- | --- | --- |
| characteristic | lakkhaṇa | **ลักษณะ** | S1: "เจตสิกมี **ลักษณะ** ( คือคุณภาพหรือเครื่องแสดง )"; S7: "วิเสสลักษณะ … มี ๔ ประการ คือ ลักษณะ รสะ ปัจจุปัฏฐาน และ ปทัฏฐาน เรียกว่า **ลักขณาทิจตุกะ**" | high |
| function | rasa | **รสะ**, glossed **กิจ** | S1: "**รสะ** ( กิจการงาน หรือหน้าที่ )"; S7: "รสะ (กิจหน้าที่ของธรรม)"; the Thai teaching register reads "…เป็นกิจ" in the per-cetasika formulas | high |
| manifestation | paccupaṭṭhāna | **ปัจจุปัฏฐาน** | S1: "**ปัจจุปัฏฐาน** ( อาการปรากฏ หรือ ผล )"; S7: "ปัจจุปัฏฐาน (อาการปรากฏ)" | high |
| proximate cause | padaṭṭhāna | **ปทัฏฐาน** | S1: "**ปทัฏฐาน** ( เหตุใกล้ให้เกิด )"; S7: "ปทัฏฐาน (เหตุใกล้ให้เกิด)" | high |

Consequence for the Thai drafting: each aspect is written as
`「…」 + เป็นลักษณะ / เป็นกิจ / เป็นปัจจุปัฏฐาน / เป็นปทัฏฐาน`, which is the
register used in S1 and S4, e.g. S4 (อวิชชา): "อญาณลกฺขณา มีความไม่รู้เป็น
ลักษณะ", "สมฺโมหนรสา … เป็นกิจ", "ฉาทนปจฺจุปฏฺฐานา … เป็นอาการปรากฏ",
"อาสวปทฏฺฐานา มีอาสวะ ๓ เป็นเหตุใกล้".

## 2. Paṭiccasamuppāda — links and factors

| Concept (Pāḷi / English) | ID | Thai rendering used | Source & section | Confidence |
| --- | --- | --- | --- | --- |
| Avijjā / Ignorance | PD_01 | อวิชชา | S5 entry ปฏิจจสมุปบาท (`อวิชฺชาปจฺจยา สงฺขารา`); S4 blog-post_62 (วจนัตถะ อ+วิชฺชา; อาสวปทฏฺฐานา) | high |
| Saṅkhārā / Formations | PD_02 | สังขาร | S5; S4 blog-post_62 (อภิสงฺขรณลกฺขณา, อายูหนรสา, เจตนาปจฺจุปฺฏฺฐานา, อวิชฺชาปทฏฺฐานา) | high |
| Viññāṇa / Consciousness | PD_03 | วิญญาณ | S5; glossary th | high |
| Nāmarūpa / Mind-and-matter | PD_04 | นามรูป | S5; glossary th | high |
| Saḷāyatana / Six bases | PD_05 | สฬายตนะ | S5; glossary th | high |
| Phassa / Contact | PD_06 | ผัสสะ | S5 (`ผสฺสปจฺจยา เวทนา`); glossary th (CS_PHASSA) | high |
| Vedanā / Feeling | PD_07 | เวทนา | S5; glossary th | high |
| Taṇhā / Craving | PD_08 | ตัณหา | S5; glossary th | high |
| Upādāna / Clinging | PD_09 | อุปาทาน | S5; glossary th (`อุปาทาน 4`) | high |
| Bhava / Becoming | PD_10 | ภพ (กรรมภพ / อุปปัตติภพ) | S5; glossary th (Kammabhava = กรรมภพ, Upapattibhava = อุปปัตติภพ) | high |
| Jāti / Birth | PD_11 | ชาติ | S5; glossary th | high |
| Jarāmaraṇa / Ageing-and-death | PD_12 | ชรามรณะ (+ โสกะ ปริเทวะ ทุกขะ โทมนัส อุปายาส) | S5; S4 blog-post_968 (excerpt retrieved: "ชรา มรณะ และโสกะ ปริเทวะ ทุกขะ โทมนัส อุปายาส ทั้ง ๗ นี้ปรากฏเกิดขึ้น เพราะอาศัยชาติเป็นเหตุ"; ชรา — ขนฺธปริปากลกฺขณา / มรณูปนยนรสา = กิจ (กิจจรส); อุปายาสะ — จิตฺตปริทหนลกฺขโณ). The remaining per-item formulas in that post are excerpt-level only and must be re-verified before they are quoted in the app. | high for the term; **medium for the formulas** |

Supporting forms used in the Thai text:

| Form | Thai | Source | Confidence |
| --- | --- | --- | --- |
| Ayoniso-manasikāra | อโยนิโสมนสิการ | glossary th (`Ayoniso manasikāra`); S1 ปริจเฉทที่ ๑ (อโยนิโสมนสิการ ปทฏฺฐานํ) | high |
| Anamatagga | อนมตัคคะ | Thai Pāḷi usage (อนมตัคฺค); retained only as the transliteration of the English gloss | medium |
| Puññābhisaṅkhāra / Apuññābhisaṅkhāra / Āneñjābhisaṅkhāra | ปุญญาภิสังขาร / อปุญญาภิสังขาร / อาเนญชาภิสังขาร | glossary th (all three entries); S4 blog-post_62 (อปุญญาภิสังขาร, อาเนญชาภิสังขาร) | high |
| Paṭisandhi-viññāṇa | ปฏิสนธิวิญญาณ | glossary th (`Paṭisandhi viññāṇa`) | high |
| Kamma-becoming / rebirth-becoming | กรรมภพ / อุปปัตติภพ | glossary th | high |
| Soka, Parideva, Dukkha, Domanassa, Upāyāsa (5 aspects of Jarāmaraṇa in the Pāḷi formula) | โสกะ ปริเทวะ ทุกขะ โทมนัส อุปายาส | S4 blog-post_968; S5 (Thai formula). **Note:** `glossary.csv` renders this row as "โศกะ ปริเทวะ ทุกขะ โทมนัสสะ อุปายาสะ" (Sanskritised โศก/สะ) — the Thai Pāḷi transliteration is โสกะ … โทมนัส; flagged below. | high for โสกะ/โทมนัส; see unresolved U-4 |
| Sahajāta-kamma / Nānākkhaṇika-kamma (used in PC_13) | กรรม … วิบาก … (translated descriptively) | S3 มาติกานิกเขปวาระ (กัมมปัจจัย wording) | medium |

## 3. The 24 paccayas

Thai names verified against S2 (the full list "ปัจจัย ๒๔" with Pāḷi headwords
เหตุปจฺจโย … อวิคตปจฺจโย) and S1 ปริจเฉทที่ ๘; the app's `name` / `shortName`
columns already carry the same forms and were kept unchanged.

| ID | Pāḷi | Thai name | Thai short name | Confidence |
| --- | --- | --- | --- | --- |
| PC_01 | Hetu-paccaya | เหตุปัจจัย | เหตุ | high |
| PC_02 | Ārammaṇa-paccaya | อารัมมณปัจจัย | อารมณ์ | high |
| PC_03 | Adhipati-paccaya | อธิปติปัจจัย | อธิปติ | high |
| PC_04 | Anantara-paccaya | อนันตรปัจจัย | อนันตระ | high |
| PC_05 | Samanantara-paccaya | สมนันตรปัจจัย | สมนันตระ | high |
| PC_06 | Sahajāta-paccaya | สหชาตปัจจัย | สหชาตะ | high |
| PC_07 | Aññamañña-paccaya | อัญญมัญญปัจจัย | อัญญมัญญะ | high |
| PC_08 | Nissaya-paccaya | นิสสยปัจจัย | นิสสยะ | high |
| PC_09 | Upanissaya-paccaya | อุปนิสสยปัจจัย | อุปนิสสยะ | high |
| PC_10 | Purejāta-paccaya | ปุเรชาตปัจจัย | ปุเรชาตะ | high |
| PC_11 | Pacchājāta-paccaya | ปัจฉาชาตปัจจัย | ปัจฉาชาตะ | high |
| PC_12 | Āsevana-paccaya | อาเสวนปัจจัย | อาเสวนะ | high |
| PC_13 | Kamma-paccaya | กัมมปัจจัย | กรรม | high |
| PC_14 | Vipāka-paccaya | วิปากปัจจัย | วิปาก | high |
| PC_15 | Āhāra-paccaya | อาหารปัจจัย | อาหาร | high |
| PC_16 | Indriya-paccaya | อินทรียปัจจัย | อินทรีย์ | high |
| PC_17 | Jhāna-paccaya | ฌานปัจจัย | ฌาน | high |
| PC_18 | Magga-paccaya | มัคคปัจจัย | มรรค | high |
| PC_19 | Sampayutta-paccaya | สัมปยุตตปัจจัย | สัมปยุตต์ | high |
| PC_20 | Vippayutta-paccaya | วิปปยุตตปัจจัย | วิปปยุตต์ | high |
| PC_21 | Atthi-paccaya | อัตถิปัจจัย | อัตถิ | high |
| PC_22 | Natthi-paccaya | นัตถิปัจจัย | นัตถิ | high |
| PC_23 | Vigata-paccaya | วิคตปัจจัย | วิคตะ | high |
| PC_24 | Avigata-paccaya | อวิคตปัจจัย | อวิคตะ | high |

Field-level terms introduced by this batch:

| English field | Thai rendering | Source evidence | Confidence |
| --- | --- | --- | --- |
| `paccayaDhamma` | **ปัจจัยธรรม** (นิยมใช้คู่กับ **ปัจจยุปบันนธรรม**) | S3 ตอนที่ 29: "ปัจจัยธรรมได้แก่ จิต ๘๕ ดวง …"; S1 ปริจเฉทที่ ๘: "การอุปการะระหว่างปัจจัยและปัจจยุปบันนธรรม"; S4 blog-post_480 ("ปัจจัยธรรม … ปัจจยุปบันธรรม") | high |
| `paccayuppanna` | **ปัจจยุปบันนธรรม** | as above | high |
| `paccayuppanna` in the app UI | rendered in sentences as "สภาวธรรมที่ได้รับการอุปการะ …" where a prose clause reads better | drafting decision | n/a |
| `subdivisions` | **ชื่อและคำอธิบายของประเภทของปัจจัยนั้น** (e.g. สหชาตาธิปติ / อารัมมณาธิปติ) | S1 ปริจเฉทที่ ๘, S2 | medium-high |
| Sahajāt'ādhipati / Ārammaṇ'ādhipati | สหชาตาธิปติ / อารัมมณาธิปติ | S3 มาติกานิกเขปวาระ §๓ อธิปติปัจจัย: "อธิปติปัจจัยนั้นมี ๒ อย่างคือ **สหชาตาธิปติปัจจัย**และ**อารัมมณาธิปติปัจจัย**"; §๑๐ ปุเรชาตปัจจัย: "ปุเรชาตปัจจัย นั้น มี ๑๑ อย่าง ด้วยอำนาจวัตถุ อารมณ์ และหทัยวัตถุในปัญจทวาร" | high |
| Purejāta (11 kinds: วัตถุ/อารมณ์/หทัยวัตถุในปัญจทวาร) | วัตถุปุเรชาต / อารัมมณปุเรชาต (+ "ปุเรชาตปัจจัย นั้น มี ๑๑ อย่าง ด้วยอำนาจวัตถุ อารมณ์ และหทัยวัตถุในปัญจทวาร") | S3 มาติกานิกเขปวาระ ภาค ๑ | high |
| Pacchājāta "รูปทุกรูปที่เกิดเพราะทุกสมุฏฐาน" | กัมมชรูป/จิตตชรูป/อุตุชรูป/อาหารชรูป อุปการะโดยปัจฉาชาตปัจจัย | S3 ตอนที่ 29 | high (see unresolved U-2) |

## 4. Vīthi — process and step names

| Pāḷi | Thai rendering used | Source & section | Confidence |
| --- | --- | --- | --- |
| Vīthi / vīthicitta | วิถีจิต | S6 | high |
| Atīta-bhavaṅga | อดีตภวังค์ | S5 entry วิถีจิต (อตีตภวังค์); S6 (อตีตภวังค์) | high |
| Bhavaṅga-calana | ภวังคจลนะ | S5 (ภวังคจลนะ); S6 | high |
| Bhavaṅga-upaccheda | ภวังคุปัจเฉทะ (S6 writes ภวังคุปัจเฉท) | S5 (ภวังคุปัจเฉท); S6 | high |
| Pañcadvāra-āvajjana | ปัญจทวาราวัชชนะ | S5 (ปัญจทวาราวัชชนะ); S6 | high |
| Dvi-pañcaviññāṇa | ทวิปัญจวิญญาณ | glossary th (`Dvipañcaviññāṇa = ทวิปัญจวิญญาณ 10`); S6 (ปัญจวิญญาณ) | high |
| Sampaṭicchana | สัมปฏิจฉันนะ | S5 (สัมปฏิจฉนะ, สัมปฏิจฉันนะ ก็เรียก); glossary th (สัมปฏิจฉันนจิต) | high |
| Santīraṇa | สันตีรณะ | S5; glossary th (สันตีรณจิต) | high |
| Voṭṭhabbana / voṭṭhapana | โวฏฐัพพนะ | S5 (โวฏฐัพพนะ); glossary th (โวฏฐัพพนะ) | high |
| Javana | ชวนะ | S5; glossary th (ชวนะ) | high |
| Tadārammaṇa / tadālambana | ตทาลัมพนะ (S5 also: ตทารมณ์) | S5; glossary th (ตทาลัมพนะ) | high |
| Manodvāra-āvajjana | มโนทวาราวัชชนะ | S5 entry (มโนทวารวัชชนะ), S2 | high |
| Paṭisandhi / Bhavaṅga / Cuti | ปฏิสนธิ(จิต) / ภวังคจิต / จุติจิต | glossary th (Bhavaṅga = ภวังคจิต); S5 | high |
| Vīthimutta | วิถีมุตตจิต | glossary th (`Vīthimutta = วิถีมุต`); the app's vīthi name | medium |
| Bhavaṅga-pāta (post-process bhavaṅga; named ภวังคปาตะ in the Thai vīthi steps) | ภวังคปาตะ | not found as a term in S3–S6; the descriptor "ลงสู่ภวังค์" (ตกภวังค์) is the wording used in S5 ("เกิดเป็นภวังคจิตขึ้นใหม่ (ตกภวังค์)") | **medium — flagged U-5** |

## 5. Repairs made to existing Thai entries (evidence)

| Entry | Current th | Corrected th | Evidence | Confidence |
| --- | --- | --- | --- | --- |
| cittas.CI_026.name | โสมนัสสสหคตัง สันตีรณจิตตัง (กุศลวิบาก) | **อุเบกขาสหคตัง สันตีรณจิตตัง (กุศลวิบาก)** | `content_en.json` canonical Pāḷi for CI_026 = `Upekkhā-sahagataṃ kusalavipākaṃ santīraṇa-cittaṃ` (Pāḷi is the cross-language anchor; the pair CI_026/CI_027 was swapped) | high |
| cittas.CI_027.name | อุเบกขาสหคตัง สันตีรณจิตตัง (กุศลวิบาก) | **โสมนัสสสหคตัง สันตีรณจิตตัง (กุศลวิบาก)** | canonical Pāḷi for CI_027 = `Somanassa-sahagataṃ kusalavipākaṃ santīraṇa-cittaṃ` | high |
| cittas.CI_028.name | อุเบกขาสหคตัง ปัญจทวาราว**ជ្**ชนจิตตัง (Khmer-script `ជ` + coeng `្` inside a Thai word) | **อุเบกขาสหคตัง ปัญจทวาราวัชชนจิตตัง** | canonical Pāḷi = `Upekkhā-sahagataṃ pañcadvārāvajjana-cittaṃ`; Thai ปัญจทวาราวัชชนะ (S5/S6). Same string also sits in `l10n_work/glossary.csv` rows 392–393 (`th` column) | high |
| cittas.CI_029.name | อุเบกขาสหคตัง มโนทวาราว**ជ្**ชนจิตตัง | **อุเบกขาสหคตัง มโนทวาราวัชชนจิตตัง** | canonical Pāḷi = `… manodvārāvajjana-cittaṃ` | high |
| kammas.KM_P_01…KM_U_04 name/shortName/description | attached by-priority names (ครุกรรม ฯลฯ) to the by-function ids and vice versa | ชนกกรรม / อุปัตถัมภกกรรม / อุปปีฬกกรรม / อุปฆาตกรรม, ครุกรรม / อาสันนกรรม / อาจิณณกรรม / กตัตตากรรม | `assets/data/kammas.json` (`namePali`, `group`) + `content_en.json` names ("Reproductive kamma" = ชนกกรรม, "Weighty kamma" = ครุกรรม, …) | high for the pairing; see U-3 for spelling variants |

## 6. Unresolved forms and items requiring qualified review

| # | Item | Where | Note for the reviewer |
| --- | --- | --- | --- |
| U-1 | PC_03 `paccayuppanna` — "จิต 84 ดวง (เว้นจิตวิบากอเหตุกะ)" | PC_03 | The English figure (84) and its parenthetical do not reconcile arithmetically with the 89/121 schemes (excluding the 15 rootless resultants gives 74). The Thai follows the English verbatim; the correct count/gloss for **อารัมมณาธิปติ** should be confirmed from a Thai Pāḷi source (S1 ปริจเฉทที่ ๘ discusses อธิปติปัจจัย but the retrieved portion did not give the count). |
| U-2 | PC_11 `paccayaDhamma` — "จิต 85 ดวง … (เว้นปฏิสนธิจิต)" | PC_11 | The English sentence is loose ("all consciousness except the rebirth-linking cittas"). The Thai Patthāna lecture (S3 ตอนที่ 29) is precise: 85 = 89 minus the 4 **อรูปาวจรวิปากจิต**, and all ปฏิสนธิจิต are additionally excluded; the conditioned state is *every* rūpa born of any of the four origins (กรรม/จิต/อุตุ/อาหาร) that has arisen and not ceased — the English restricts it to kamma-born rūpa. Thai translation keeps the English meaning; **doctrinal decision needed** before changing the English side. |
| U-3 | Spelling variants: อุปฆาตกรรม vs **อุปฆาตกกรรม**; อาจิณณกรรม vs **อาจิณกรรม** | kammas corrections | The batch keeps the forms already used in the app/Thai tables (อุปฆาตกรรม, อาจิณณกรรม). The glossary itself carries both: keyTerm line **211** `Upaghātakakamma` = อุปฆาตกกรรม and line **237** `Āciṇṇakamma` = อาจิณกรรม, against the `kammas` rows **294** / **298** this batch proposes as อุปฆาตกรรม / อาจิณณกรรม. One form per term should be agreed, then the pairs normalised. |
| U-4 | "โสกะ ปริเทวะ ทุกขะ โทมนัส อุปายาส" vs glossary "โศกะ … โทมนัสสะ" | PD_12 | The `glossary.csv` th cell for `Soka, Parideva, …` (line **198**, keyTerm, feeds `M17_DUYEN_CHI_TIET/M17_S05`) is Sanskritised (โศก/สะ); the Thai Pāḷi transliteration is โสกะ … โทมนัส (S4 blog-post_968, S5). The batch does not change the shared file — the row is proposed in `l10n_work/th/glossary_th_corrections.csv` and needs doctrinal sign-off. |
| U-5 | ภวังคปาตะ (post-process bhavaṅga step in the Thai vīthi lists) | VT_* steps | Not attested in the retrieved Thai sources (S3–S6); the wording used for this moment in S5 is "เกิดเป็นภวังคจิตขึ้นใหม่ (ตกภวังค์)". The existing Thai `VT_NGU_MON_RATLON` text already used ภวังคปาตะ, so the same word is kept for the other processes to stay consistent with existing Thai content; ลงสู่ภวังค์ is the safer plain-Thai alternative if the reviewer prefers it. |
| U-6 | "อินทรีย์ที่เกี่ยวกับการรู้แจ้งอีก 3" (PC_16, English "the three understanding faculties") | PC_16 | A descriptive rendering was used to avoid coining a Thai term. Thai canonical forms are อนัญญตัญญัสสามีตินทรีย์ / อัญญินทรีย์ / อัญญาตาวินทรีย์ — to be confirmed; note the English list of the 20 faculties itself should be reviewed (it should be 22 minus 2). |
| U-7 | อนมตัคคะ / อโนมตัคคะ | PD_01 note | Only the transliteration of the English gloss is given; confirm the Thai standard form if the field is to be kept. |
| U-8 | "วิสุทธิมรรค ปริจเฉทที่ 17" and "(SN 12.63)" inside translated prose | PC_02, PC_15 | Citations were carried over from the English source unchanged (no Thai edition page verified). |
| U-9 | Pāḷi compounds สหชาตาธิปติ / อารัมมณาธิปติ / วัตถารัมมณปุเรชาตนิสสยะ … | paccaya subdivisions | Compound Thai-Pāḷi spellings are regular but no printed Thai page was retrieved for each; low doctrinal risk, still worth a native check. |

## 7. Thai glossary cells that must be corrected with this batch

`l10n_work/glossary.csv`, `th` column (shared file — corrections are supplied
in `l10n_work/th/glossary_th_corrections.csv` for the integrator):

1. rows 392–393 (`Upekkhā-sahagataṃ manodvārāvajjana-cittaṃ` and
   `… pañcadvārāvajjana-cittaṃ`): the Khmer-contaminated strings must be
   replaced with `อุเบกขาสหคตัง มโนทวาราวัชชนจิตตัง` /
   `อุเบกขาสหคตัง ปัญจทวาราวัชชนจิตตัง` **before** regenerating
   `l10n_work/glossary.json` (which also feeds the `S5` glossary drift check).
2. lines **147** / **166** (`Manodvārāvajjana` / `Pañcadvārāvajjana`, keyTerm):
   the `th` cells read "มโนทวาราวชัชชน" / "ปัญจทวาราวชัชชน" — should be
   "มโนทวาราวัชชนะ" / "ปัญจทวาราวัชชนะ" (S5/S6).
3. the eight hyphenated kamma rows, lines **288–299** (`Garuka-kamma` …
   `Kaṭattā-kamma`): the `th` column is rotated relative to the Pāḷi column
   (Garuka→ชนกกรรม, Janaka→ครุกรรม, …). This rotation is what makes
   `check_content_locale.py th --glossary` report `S5` warnings against the
   *corrected* Thai kamma names in this batch.
4. line **198** (`Soka, Parideva, Dukkha, Domanassa, Upāyāsa`, keyTerm): the
   `th` cell is Sanskritised — โศกะ … โทมนัสสะ อุปายาสะ; proposed
   โสกะ ปริเทวะ ทุกขะ โทมนัส อุปายาส (U-4, needs sign-off).
5. lines **211** / **237** (keyTerm `Upaghātakakamma` = อุปฆาตกกรรม,
   `Āciṇṇakamma` = อาจิณกรรม) disagree in spelling with the `kammas` rows
   **294** / **298** proposed above (อุปฆาตกรรม, อาจิณณกรรม). Not a rotation —
   a variant-spelling decision (U-3); the reviewer should pick one form per
   term and the two pairs should then be normalised together.
