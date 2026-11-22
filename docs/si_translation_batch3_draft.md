# Batch 3 (si) — study modules, trạng thái DRAFT

Phạm vi: dịch study modules (lessonSections, reviewCards, quizSeeds) sang Sinhala (si).
Trạng thái: **draft, chưa reviewed**. Không đưa vào builder, không sửa `content_si.json`,
không đánh dấu reviewed. Pāḷi (`id`, `pali`, `sourceRefs`, cấu trúc) giữ nguyên từ English.

Nguồn nghĩa: entity sections của `content_en.json` (không dịch lại từ tiếng Việt).
Thuật ngữ: `l10n_work/glossary.csv` trước, sau đó `content_si.json` đang dùng.

## 1. Trạng thái module

| Module | Tên | Sections / Cards / Quiz | Trạng thái | File | Ghi chú |
|---|---|---|---|---|---|
| M5 | SOBHANA | 3 / 10 / 10 | draft, đã sinh | `tool/content/data_priority_si_study_m5.py` | Chưa kiểm và review thuật ngữ Ñāṇasampayutta, Mahākiriya, Kāmāvacara |
| M7 | SIEU_THE | 3 / 12 / 12 | draft, đã sinh | `data_priority_si_study_m7.py` | Lokuttara: xung đột `ලෝකොත්තර` / `ලෝකෝත්තර` |
| M11 | BIET_CANH | 5 / 12 / 12 | draft, đã sinh | `data_priority_si_study_m11.py` | |
| M12 | VO_NHAN | 4 / 10 / 10 | draft, đã sinh | `data_priority_si_study_m12.py` | |
| M13 | SAC_GIOI | 3 / 10 / 10 | draft, đã sinh | `data_priority_si_study_m13.py` | Đã sửa `ඉද්ධි` (ac9515b) |
| M14 | VO_SAC_GIOI | 3 / 10 / 10 | draft, đã sinh | `data_priority_si_study_m14.py` | |
| M15 | TAM_SO_PHOI_HOP | 6 / 12 / 12 | draft, đã sinh | `data_priority_si_study_m15.py` | 2 đoạn đếm + 1 card để English (xem §3) |
| M17 | DUYEN_CHI_TIET | 6 / 12 / 12 | draft, đã sinh | `data_priority_si_study_m17.py` | 1 đoạn để English (xem §3) |
| M4 | AKUSALA | 8 / 20 / 20 | **chưa làm** | — | |
| M6 | NGHIEP | 8 / 20 / 18 | **chưa làm** | — | |
| M8 | NHAN_DUYEN | 7 / 18 / 16 | **chưa làm** | — | |
| M9 | SAC_PHAP | 7 / 20 / 16 | **chưa làm** | — | |
| M10 | LO_TRINH | 8 / 20 / 17 | **chưa làm** | — | |
| M16 | NGUOI_VA_COI | 8 / 16 / 16 | **chưa làm** | — | |

Đã kiểm tự động cho 8 module đã sinh (5, 7, 11, 12, 13, 14, 15, 17): số section/card/quiz,
id section/card/quiz, sourceRefs của từng card khớp English; `translationStatus = draft`.
Generator (`gen_study.py`, ngoài repo) kiểm thêm id/pali/quiz 1-1; mọi module `errors []`.
Chưa chạy `check_content_locale.py` vì các file này chưa được builder đọc.

Ngoài ra, đối với M15/M17 đã sinh, đoạn để English vẫn giữ nguyên ký hiệu `[ENGLISH FALLBACK — review]`
trong file để reviewer nhận diện.

## 2. Ledger thuật ngữ (ID Pāḷi → cách gọi si → nguồn → độ tin cậy)

Độ tin cậy: **A** = có trong glossary và/hoặc content_si đã dùng nhất quán; **B** = dạng Sinhala hợp lý
nhưng chưa đối chiếu nguồn Sinhala; **C** = tạm, cần hội đồng chốt hoặc chưa xác minh.

| Pāḷi / English | Cách gọi si | Nguồn | Mục / module | Độ tin cậy | Ghi chú |
|---|---|---|---|---|---|
| Phassa | ඵස්ස | glossary keyTerm; quyết định tạm | M1/M2/M17 | C | Đổi đồng loạt khi hội đồng chốt. content_si PD_06 shortName vẫn `ස්පර්ශය` |
| Lokuttara | ලෝකොත්තර | glossary | M7, M15 | C | content_si dùng `ලෝකෝත්තර` (xem §4) |
| Magga citta / Phala citta | මාර්ග සිත / ඵල සිත | glossary | M7 | A | |
| Sotāpatti / Sakadāgāmi / Anāgāmi / Arahatta | සෝතාපත්ති / සකදාගාමී / අනාගාමී / අරහත් බව | glossary | M7 | A | |
| Sotāpattimagga / Arahattamagga | සෝතාපත්ති මාර්ගය / අරහත් මාර්ගය | glossary | M7 | A | |
| Sakkāyadiṭṭhi | සක්කායදිට්ඨිය | glossary | M7 | A | |
| Sīlabbataparāmāsa | සීලබ්බතපරාමාසය | glossary | M7 | A | |
| Vicikicchā | විචිකිච්ඡා | glossary | M7, M11, M15 | A | |
| Nibbāna | නිවන | content_si | M7 | A | Dùng nhất quán với content_si, không dùng `නිබ්බාන` |
| Ariyo aṭṭhaṅgiko maggo (8 path factors) | ආර්ය අෂ්ටාංගික මාර්ගය | chưa có trong glossary | M7 | B | |
| Yoniso manasikāra | යෝනිසෝ මනසිකාරය | glossary (`අයෝනිසෝ` dạng phủ định) | M7 | B | |
| Dhammānudhammapaṭipatti / Saddhammassavana / Sappurisasaṃseva | ධම්මානුධම්ම පටිපත්තිය / සද්ධම්ම ශ්‍රවණය / සත්පුරුෂ සේවනය | chưa có trong glossary | M7 | B | Cần xác minh (Chandrikava/Saṅgaha) |
| Satipaṭṭhāna | සතිපට්ඨාන | chưa có trong glossary | M7 | B | |
| Mahaggata / Mahaggatacitta | මහග්ගත / මහග්ගත සිත | glossary | M13, M15 | A | |
| Rūpāvacara / Arūpāvacara | රූපාවචර / අරූපාවචර | glossary | M13, M14 | A | |
| Arūpāvacara-kiriyā | අරූපාවචර ක්‍රියා | glossary (dạng `ක්‍රියා`) | M14 | A | |
| Jhāna | ධ්‍යාන | glossary | M13 | A | |
| Vitakka / Vicāra / Pīti / Ekaggatā | විතක්ක / විචාර / පීති / ඒකග්ගතා | glossary | M11, M13, M15 | A | M13 dùng `ඒකග්ගතා` (không `ඒකග්ගතාව`) |
| Upekkhā | උපෙක්ඛා | content_si (32 lần) | M13, M14, M12, M17 | A | |
| Abhiññā | අභිඥා | glossary | M13 | A | |
| Nirodha-samāpatti | නිරෝධ සමාපත්තිය | glossary | M13 | A | |
| Kasiṇa | කසිණ | **không có** trong glossary/content_si | M14 | B | Dạng phổ biến; cần xác nhận |
| Āyatana | ආයතන | glossary | M14 | A | |
| Ākāsānañcāyatana / Viññāṇañcāyatana / Ākiñcaññāyatana / Nevasaññānāsaññāyatana | ආකාසානඤ්චායතනය / විඤ්ඤාණඤ්චායතනය / ආකිඤ්චඤ්ඤායතනය / නෙවසඤ්ඤානාසඤ්ඤායතනය | glossary | M14 | A | |
| Ahetuka | අහේතුක | glossary | M12 | A | |
| Akusala-vipāka ahetuka / Kusala-vipāka ahetuka | අකුසල විපාක අහේතුක සිත / කුසල විපාක අහේතුක සිත | glossary | M12 | A | |
| Hasituppāda | හසිතොප්පාද සිත | glossary | M12, M15 | A | |
| Āvajjana / Pañcadvārāvajjana / Manodvārāvajjana | ආවජ්ජන / පංචද්වාරාවජ්ජන / මනෝද්වාරාවජ්ජන | glossary | M12 | A | |
| Santīraṇa / Sampaṭicchana | සන්තීරණ සිත / සම්පටිච්ඡන සිත | glossary | M12, M15 | A | |
| Voṭṭhapana | වොට්ඨපන | content_si (đã dùng) | M12 | C | Chandrikava dùng `වොත්‍ථපන` (xem §4) |
| Nānākālika hetu | නානාකාලික හේතුව | glossary (dạng `නානාකාලික හේතුව`) | M12 | A | |
| Aññasamāna / Pakiṇṇaka / Sabbacittasādhāraṇa | අඤ්ඤසමාන / පකිණ්ණක / සබ්බචිත්තසාධාරණ | glossary | M11, M15 | A | |
| Adhimokkha | අධිමොක්ඛ | glossary | M11 | A | |
| Vīriya | වීරිය | glossary | M11 | A | |
| Chanda | ඡන්ද | glossary | M11 | A | |
| Sammappadhāna | සතර සම්මප්පධාන | glossary | M11 | A | |
| Ahirika / Anottappa / Uddhacca / Moha | අහිරික / අනොත්තප්ප / උද්ධච්ච / මෝහ | glossary | M15 | A | Các mục M2/M3 chưa xác minh với Saṅgaha (xem §4) |
| Mocatuka / Dosatuka / Lobhatuka | මෝහ චතුක්ක / දෝස චතුක්ක / ලෝභ තික | glossary | M15 | A | |
| Diṭṭhi | දිට්ඨි | glossary | M15 | A | |
| Māna / Issā / Macchariya / Kukkucca | මාන / ඉස්සා / මච්ඡරිය / කුක්කුච්ච | glossary | M15 | A | |
| Thīna + Middha | ථීන මිද්ධ | glossary | M15 | A | |
| Sabbākusalasādhāraṇā | සබ්බාකුසල සාධාරණ | glossary | M15 | A | |
| Sobhana | සෝභන | glossary | M15 | A | |
| Cetasikasaṅgaha | චෛතසික සංග්‍රහය | glossary | M15 | A | |
| Paramatthasacca | පරමාර්ථ සත්‍යය | glossary | M15, M17 | A | |
| Nāma-khandha | නාමස්කන්ධ | glossary (`නාමස්කන්ධ 4`) | M15 | A | |
| Dvipañcaviññāṇa | ද්විපඤ්චවිඤ්ඤාණය | glossary | M11, M15 | A | |
| Kammaja-rūpa | කර්මජ රූප | glossary | M17 | A | |
| Viññāṇapaccayā nāmarūpaṁ | විඤ්ඤාණ පච්චයා නාමරූපං | glossary | M17 | A | Pāḷi giữ nguyên trong sutta-formula |
| Manāyatana | මනායතනය | glossary | M17 | A | |
| Saḷāyatana | සළායතන | glossary | M17 | A | |
| Manovedanā | මනෝ වේදනාව | glossary | M17 | A | |
| Vedanāpaccayā taṇhā | (giữ Pāḷi trong sutta-formula) | — | M17 | B | |
| Taṇhā / Upādāna / Bhava / Jāti | තණ්හා / උපාදාන / භව / ජාති | glossary / content_si | M17 | A | |
| Kammabhava / Upapattibhava | කර්ම භවය / උපපත්ති භවය | glossary | M17 | A | |
| Kāmupādāna / Diṭṭhupādāna / Sīlabbatupādāna / Attavādupādāna | කාමුපාදාන / දිට්ඨුපාදාන / සීලබ්බතුපාදාන / අත්තවාදුපාදාන | **chưa có** trong glossary; tự dựng theo mẫu `උපාදාන` | M17 | B | Cần xác nhận |
| Soka / Parideva / Dukkha / Domanassa / Upāyāsa | ශෝක / පරිදේව / දුක්ඛ / දෝමනස්සය / උපායාස | glossary (dòng 5 mục) | M17 | A/B | `පරිදේව` và `ශෝක` theo glossary |
| Addhā / Visākāra | තුන් කාලය / විසි ආකාරය | glossary | M17 | A | |
| Aṇḍaja / Jalābuja / Saṃsedaja / Opapātika (jāti) | අණ්ඩජ / ජලාබුජ / සංසේදජ / ඕපපාතික | **chưa có** trong glossary | M17 | B | Cần xác nhận |
| Cakkhāyatana / Sotāyatana / Ghānāyatana / Jivhāyatana / Kāyāyatana | (dạng theo mẫu `-ායතන`) | chưa có trong glossary | M17 | B | |
| Sammā-vācā / Sammā-kammanta / Sammā-ājīva | sửa theo CS: `සම්මාවාචා` / `සම්මාකම්මන්ත` / `සම්මාආජීව` | glossary (CS) — xung đột M3 | M15 | C | Xem §4 |
| Sammāsaddhā, Karuṇā, Muditā, Paññindriya | (không dùng trong Batch 3) | — | — | — | Đã xử lý ở M2/M3 |

Mục M5 (chưa review): Ñāṇasampayutta `ඥාන සම්පයුත්ත`, Ñāṇavippayutta `ඥාන විප්පයුත්ත` (glossary), Mahākiriya `මහා ක්‍රියා සිත`, Kāmāvacara `කාමාවචර` (glossary), Puññakiriyavatthu `පුණ්‍ය ක්‍රියා වස්තු දහය` (M5 dùng, chưa xác minh) — **độ tin cậy C**.

## 3. Field coverage và phần để English

Trong mọi module đã sinh: `lessonSections.title/summary/body`, `keyTerms.term/meaning`,
`reviewCards.front/back`, `quizSeeds.question/correctAnswer/distractors/explanation` đều được dịch,
trừ các mục dưới đây (giữ English, đánh dấu trong file):

| Module | Field | Lý do |
|---|---|---|
| M15 | S04 body[3] — hatred-rooted citta 20/22 factors | English nội bộ mâu thuẫn: ghi "one of envy, avarice or worry" nhưng đếm 4 dosa-catukka; không khớp tổng 20/22 |
| M15 | S05 body[2] — receiving citta 10 factors | Nghi English sai (quy tắc chung: sampaṭicchana có 7 sabbacitta); cần Saṅgaha xác nhận |
| M15 | R08 — prompted hatred 22 | Cùng lý do với S04 body[3] |
| M17 | S01 body[4] — 51 × 3 = 153 groups | Số học và danh sách decad cần kiểm với nguồn trước |

Các mục khác:
- Quiz: không có mục nào để English do thiếu bản dịch. Q04 của M15 (hatred 20) đã dịch theo số English, bị flag cùng §3 dòng 1.
- Không dịch: Pāḷi trong `id`, `pali`, `sourceRefs`, cấu trúc; các câu Pāḷi công thức (Viññāṇapaccayā nāmarūpaṁ, Vedanāpaccayā taṇhā) giữ nguyên.

## 4. Xung đột chưa giải quyết (để hội đồng/coordinator quyết)

1. **Lokuttara**: glossary `ලෝකොත්තර` vs content_si `ලෝකෝත්තර` (đang dùng trong nhiều mục). Module chọn glossary.
2. **Nibbāna**: content_si `නිවන`; glossary không có Sinhala. Module dùng `නිවන`.
3. **Voṭṭhapana**: content_si/M12 `වොට්ඨපන` vs Chandrikava `වොත්‍ථපන` (ghi nhận từ pitaka.lk 5-series). Module dùng `වොට්ඨපන`.
4. **Sammā-…**: glossary CS `සම්මාකම්මන්ත`, `සම්මාවාචා`, `සම්මාආජීව`; M3 dùng `සම්මා කම්මන්තය`, `සම්මා වාචා`, `සම්මා ආජීවය`. Batch 3 (M15) dùng dạng glossary CS. Cần thống nhất giữa M3 và CS.
5. **Phassa**: `ඵස්ස` tạm (đã được người dùng đồng ý). `ස්පර්ශය` vẫn trong PD_06 shortName và một số câu content_si khác.
6. **Mocatuka/Uddhacca**: `මෝහ` / `උද්ධච්ච` — chưa đối chiếu Chandrikava hay Saṅgaha.

## 5. Câu hỏi cho người review bản ngữ

1. Phassa: chốt `ඵස්ස` hay `ස්පර්ශය` cho toàn bộ? (Hiện draft dùng `ඵස්ස`.)
2. Lokuttara: `ලෝකොත්තර` (glossary) hay `ලෝකෝත්තර` (content_si)?
3. Sammā-vācā/kammanta/ājīva: dạng liền (`සම්මාවාචා`) hay tách (`සම්මා වාචා`)?
4. Kasiṇa: `කසිණ` có đúng với dạng Sri Lanka trong sách giáo khoa không?
5. Kāmupādāna / Diṭṭhupādāna / Sīlabbatupādāna / Attavādupādāna: dạng Sinhala đã dùng trong sách nào?
6. Jāti bốn loại (aṇḍaja, jalābuja, saṃsedaja, opapātika): dạng Sinhala chuẩn?
7. Ariyo aṭṭhaṅgiko maggo, sammāsati, sammāsamādhi: dạng `ආර්ය අෂ්ටාංගික මාර්ගය` có đúng không?
8. M15: đếm cetasika cho sân (dosamūla) và tiếp nhận (sampaṭicchana) — English có đúng theo Abhidhammattha Saṅgaha không?
9. M17: 51 × 3 = 153 groups — đúng theo nguồn không?
10. Voṭṭhapana (`වොට්ඨපන` hay `වොත්‍ථපන`)?

## 6. Việc chưa làm

- M4, M6, M8, M9, M10, M16 (6 module còn lại trong Batch 3).
- Kiểm `check_content_locale.py` khi tích hợp; coordinator quyết định.
- Thống nhất các xung đột §4 với M2/M3/M1.
