# Batch 3 (si) — study modules, trạng thái DRAFT

Phạm vi: dịch study modules (lessonSections, reviewCards, quizSeeds) sang Sinhala (si).
Trạng thái: **draft, chưa reviewed**. Không đưa vào builder, không sửa `content_si.json`,
không đánh dấu reviewed. Pāḷi (`id`, `pali`, `sourceRefs`, cấu trúc) giữ nguyên từ English.

Nguồn nghĩa: entity sections của `content_en.json` (không dịch lại từ tiếng Việt).
Thuật ngữ: `l10n_work/glossary.csv` trước, sau đó `content_si.json` đang dùng.

## 1. Trạng thái module

| Module | Tên | Sections / Cards / Quiz | Trạng thái | File | Commit | Ghi chú |
|---|---|---|---|---|---|---|
| M1 | BASICS | 4 / 14 / 12 | draft, đã sinh | `data_priority_si_study_m1.py` | a5c13fe | Pilot, theo bảng English |
| M2 | SI_PHAN | 3 / 10 / 10 | draft, đã sinh | `data_priority_si_study_m2.py` | 1009001 | Phassa `ඵස්ස` tạm (§4.5) |
| M3 | TINH_HAO_BIEN_HANH | 7 / 20 / 20 | draft, đã sinh | `data_priority_si_study_m3.py` | 027de49 | Còn mở: gộp TERM_PANNINDRIYA/TERM_TU_QUYEN_M3; TERM_BA_NHAN_THIEN_M3 có `pali` tiếng Việt; xung đột Sammā-… (§4.4) |
| M4 | AKUSALA | 8 / 20 / 20 | draft, đã sinh | `data_priority_si_study_m4.py` | 4449d2a | Không fallback. Các câu về ranking/định nghĩa chưa đối chiếu Saṅgaha Sinhala (§2) |
| M5 | SOBHANA | 3 / 10 / 10 | draft, đã sinh | `data_priority_si_study_m5.py` | a0d78da | Chưa kiểm Ñāṇasampayutta, Mahākiriya, Kāmāvacara. Glossary sai (xem §4.7) |
| M6 | NGHIEP | 8 / 20 / 18 | draft, đã sinh | `data_priority_si_study_m6.py` | 4153686 | 5 mục để English (§3). Đối chiếu Chandrikava 6-6, 6-7 |
| M7 | SIEU_THE | 3 / 12 / 12 | draft, đã sinh | `data_priority_si_study_m7.py` | c87c1dc | Lokuttara: xung đột `ලෝකොත්තර` / `ලෝකෝත්තර` |
| M8 | NHAN_DUYEN | 7 / 18 / 16 | draft, đã sinh | `data_priority_si_study_m8.py` | 25b8ec9 | Không fallback. Paṭṭhāna, Paṭicca chưa đối chiếu Sinhala |
| M9 | SAC_PHAP | 7 / 20 / 16 | draft, đã sinh | `data_priority_si_study_m9.py` | 428f03a | Gocara: "tangible" = ba đại chủng (§3). `ඕජා` thống nhất |
| M10 | LO_TRINH | 8 / 20 / 17 | draft, đã sinh | `data_priority_si_study_m10.py` | f08c774 | Không fallback. Tên giai đoạn bhavaṅga, kammanimitta/gatinimitta chưa có glossary |
| M11 | BIET_CANH | 5 / 12 / 12 | draft, đã sinh | `data_priority_si_study_m11.py` | 8dab796 | |
| M12 | VO_NHAN | 4 / 10 / 10 | draft, đã sinh | `data_priority_si_study_m12.py` | 845937b | |
| M13 | SAC_GIOI | 3 / 10 / 10 | draft, đã sinh | `data_priority_si_study_m13.py` | ac9515b | Đã sửa `ඉද්ධි` (ac9515b). Jhāna factors, kasiṇa, abhiññā, nirodha-samāpatti chưa có nguồn Sinhala riêng |
| M14 | VO_SAC_GIOI | 3 / 10 / 10 | draft, đã sinh | `data_priority_si_study_m14.py` | 8b63a1b | Tên arūpa jhāna dùng dạng glossary `-ය` (ca lỗi `-ය` đã sửa ở thẻ hỏi) |
| M15 | TAM_SO_PHOI_HOP | 6 / 12 / 12 | draft, đã sinh | `data_priority_si_study_m15.py` | 3f6abfd | 2 đoạn đếm + 1 card để English (xem §3) |
| M16 | NGUOI_VA_COI | 8 / 16 / 16 | draft, đã sinh | `data_priority_si_study_m16.py` | cc54c69 | Fallback: TERM_TUOI_THO_TROI_M16 |
| M17 | DUYEN_CHI_TIET | 6 / 12 / 12 | draft, đã sinh | `data_priority_si_study_m17.py` | c978dbf | 1 đoạn để English (xem §3) |

Kiểm tự động (17 module): số section/card/quiz, id, sourceRefs của từng card khớp English; `translationStatus = draft`;
generator (`gen_study.py`, ngoài repo) báo `errors []`. Riêng M4, M6, M9, M10 và M16 có các mục fallback/English nêu ở §3.

Kiểm `check_content_locale.py` (ngày 2026-10-08, không chạy builder): xuất 17 module draft ra file tạm ngoài repo
(`/home/user/scratch_m2/check/si_study_draft.json`) và chạy `check_content_locale.py si --file <tạm> --glossary --strict`.
Kết quả: 0 lỗi cứng (H1–H6), 0 cảnh báo mềm (S1–S5), 3041/4312 slot (phần còn lại là entity chưa có trong file tạm, không phải lỗi).
Kiểm này không phản ánh bản đã build vì builder chưa chạy.


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
| Lobha / Dosa / Moha | ලෝභ / දෝස / මෝහ | glossary | M4, M15 | A | |
| Diṭṭhi / Sakkāyadiṭṭhi / Māna | දිට්ඨි / සක්කායදිට්ඨිය / මාන | glossary | M4 | A | |
| Issā / Macchariya / Kukkucca / Paṭigha / Domanassa | ඉස්සා / මච්ඡරිය / කුක්කුච්ච / පටිඝය / දෝමනස්සය | glossary | M4 | A | |
| Thīna / Middha / Vicikicchā / Uddhacca | ථීන / මිද්ධ / විචිකිච්ඡා / උද්ධච්ච | glossary | M4 | A | |
| Ayoniso manasikāra | අයෝනිසෝ මනසිකාරය | glossary | M4 | A | |
| Asaṅkhārika / Sasaṅkhārika / Diṭṭhigatasampayutta | අසංඛාරික / සසංඛාරික / දිට්ඨිගත සම්පයුත්ත | glossary | M4, M5 | A | |
| Kusala-kamma / Akusala-kamma (kāma) | කාමාවචර කුසල් කර්ම / කාමාවචර අකුසල් කර්ම | content_si KM_R_01/02 | M4, M6 | A | |
| Kamma / Cetanā | කර්මය / චේතනාව | glossary / content_si (`චේතනාව`) | M6, M4 | A | |
| Kāya / Vacī / Mano-kamma | කාය කර්මය / වචී කර්මය / මනෝ කර්මය | glossary | M6 | A | |
| Janaka / Upatthambhaka / Upapīḷaka / Upaghātaka | ජනක / උපත්ථම්භක / උපපීළක / උපඝාතක කර්ම | content_si KM_U_01–04; Chandrikava 6-6 xác nhận | M6 | A | Chandrikava dùng `උපත්ථම්භක` (khớp) |
| Garuka / Āsanna / Āciṇṇa / Kaṭattā | ගරුක / ආසන්න / ආචිණ්ණ / කටත්තා කර්ම | content_si KM_P_01–04; Chandrikava 6-7 xác nhận nghĩa | M6 | A/B | Chính tả `ආචිණ්ණ` vs Chandrikava `ආචීර්ණ` (§4.8) |
| Diṭṭhadhamma / Upapajja / Aparāpariya / Ahosi | දිට්ඨධම්මවේදනීය / උපපජ්ජවේදනීය / අපරාපරියවේදනීය / අහෝසි කර්ම | content_si KM_T_01–04 | M6 | A/B | Chính tả `අහෝසි` vs Chandrikava `අහොසි` (§4.9) |
| Ānantariya | ආනන්තර්ය කර්ම | glossary | M6 | A | |
| Javana | ජවන | glossary | M6, M10 | A | Chandrikava `ජවන්` (không ảnh hưởng nghĩa) |
| Pāṇātipāta / Musāvāda / Abhijjhā / Sammādiṭṭhi | ප්‍රාණඝාතය / මුසාවාදය / අභිධ්‍යාව / සම්මා දිට්ඨිය | glossary | M6 | A | |
| Adinnādāna / Kāmesumicchācāra / Pisuṇavācā / Pharusavācā / Samphappalāpa / Byāpāda / Micchādiṭṭhi / Anabhijjhā / Abyāpāda | (dạng Pāḷi phiên âm Sinhala) | **chưa có** trong glossary | M6 | B | Chưa đối chiếu Chandrikava |
| Tihetuka / Dvihetuka | ත්‍රිහේතුක පුද්ගලයා / ද්විහේතුක පුද්ගලයා | glossary | M6 | A | |
| Paṭisandhi viññāṇa | පටිසන්ධි විඤ්ඤාණය | glossary | M6 | A | Chandrikava `ප්‍රතිසන්ධි` (§4.10) |
| Kammaja-rūpa | කර්මජ රූප | glossary; Chandrikava 6-6 | M6, M17 | A | |
| Kāmāvacara / Rūpāvacara / Arūpāvacara kusala | කාමාවචර / රූපාවචර / අරූපාවචර කුසල් කර්ම | content_si | M6 | A | |
| Paṭicca-samuppāda / Paṭṭhāna / Paccaya | පටිච්චසමුප්පාදය / පට්ඨානය / ප්‍රත්‍යය | glossary | M8 | A | |
| Avijjā / Saṅkhārā / Viññāṇa / Nāmarūpa / Saḷāyatana / Jarāmaraṇa | අවිද්‍යාව / සංස්කාර / විඤ්ඤාණය / නාම-රූප / සළායතන / ජරා-මරණ | glossary | M8 | A | |
| Tayo addhā / Vīsatākārā / Tisandhi / Catusaṅkhepa / Vaṭṭa / Mūla | තුන් කාලය / විසි ආකාර / ත්‍රි සන්ධිය / චතු සංඛේප / වට්ටය / මුල් | glossary (một phần); còn lại theo mẫu | M8 | A/B | |
| Apuññābhisaṅkhāra / Puññābhisaṅkhāra / Āneñjābhisaṅkhāra | අපුණ්‍යාභිසංඛාර / පුණ්‍යාභිසංඛාර / ආනෙඤ්ජාභිසංඛාර | glossary | M8 | A | |
| Nipphanna / Anipphanna / Mahābhūta / Upādāya / Pasāda / Gocara / Bhāva / Hadaya / Viññatti / Vikāra / Lakkhaṇa | නිෂ්පන්න / අනිෂ්පන්න / සතර මහා ධාතු / උපාදාය රූප / ප්‍රසාද රූප / ගෝචර රූප / භාව රූප / හදයවත්ථු / විඤ්ඤත්ති රූප / විකාර රූප / ලක්ෂණ රූප | glossary (phần lớn) | M9 | A/B | Nipphanna chưa áp dụng vào module (kế hoạch) |
| Ojā / Utu | ඕජා / උතු | glossary | M9 | A | Thay `ආහාර රසය` ở M9 |
| Vīthi / Dvāra / Vatthu / Bhavaṅga / Vīthimutta / Tadālambana | චිත්ත වීථිය / ද්වාරය / වස්තුව / භවංග සිත / වීථිමුත්ත / තදාලම්බන | glossary | M10 | A | `තදාරම්මණ` đang dùng ở M10/M8, cần thống nhất (§4.11) |
| Ahetuka / Bhūmi / Suddhāvāsā / Puggala | අහේතුක / භූමිය / සුද්ධාවාස / පුද්ගලයා | glossary | M16 | A | Địa danh/cõi trời chưa có glossary: để English (§3) |
| Sammāsaddhā, Karuṇā, Muditā, Paññindriya | (không dùng trong Batch 3) | — | — | — | Đã xử lý ở M2/M3 |

Mục M5 (chưa review): Ñāṇasampayutta `ඥාන සම්පයුත්ත`, Ñāṇavippayutta `ඥාන විප්පයුත්ත` (glossary), Mahākiriya `මහා ක්‍රියා සිත`, Kāmāvacara `කාමාවචර` (glossary), Puññakiriyavatthu `පුණ්‍ය ක්‍රියා වස්තු දහය` (M5 dùng, chưa xác minh) — **độ tin cậy C**.

## 3. Field coverage và phần để English

Trong mọi module đã sinh: `lessonSections.title/summary/body`, `keyTerms.term/meaning`,
`reviewCards.front/back`, `quizSeeds.question/correctAnswer/distractors/explanation` đều được dịch,
trừ các mục dưới đây (giữ English, đánh dấu trong file):

| Module | Field | Lý do |
|---|---|---|
| M4 | Không có mục để English | Dịch theo English. Các thuật ngữ chính đối chiếu glossary; định nghĩa và số đếm chưa đối chiếu Saṅgaha Sinhala |
| M6 | S03 body[2] — câu "obstructive kamma does not occur in form and formless realms" | Chandrikava 6-6 không có; để English trong đoạn |
| M6 | S04 body[1] — thứ tự nặng của nghiệp nghịch (tà kiến cố định > phá Tăng > làm chảy máu Phật > giết cha mẹ) | Chandrikava 6-7 không xếp hạng; để English trong đoạn |
| M6 | S05 body[3] — "javana thứ tư mạnh nhất" | Chandrikava 6-7 không chỉ đích; để English trong đoạn |
| M6 | Card R07, R10; Quiz Q06, Q08, Q13 — để English | Cùng lý do với các mục M6 phía trên (cõi, thứ tự nghiệp nghịch, javana thứ tư) |
| M9 | S05 body[1]/TERM_GOCARA — "ස්පර්ශ (පඨවි, තේජෝ, වායෝ ධාතු)" | English liệt kê tangibility trong gocara; tiêu chuẩn thường chỉ 4. Dịch theo English, đã báo admin (B3-1) |
| M15 | S04 body[3] — hatred-rooted citta 20/22 factors | English nội bộ mâu thuẫn: ghi "one of envy, avarice or worry" nhưng đếm 4 dosa-catukka; không khớp tổng 20/22 |
| M15 | S05 body[2] — receiving citta 10 factors | Nghi English sai (quy tắc chung: sampaṭicchana có 7 sabbacitta); cần Saṅgaha xác nhận |
| M15 | R08 — prompted hatred 22 | Cùng lý do với S04 body[3] |
| M16 | S07 TERM_TUOI_THO_TROI_M16 — fallback | Tên cõi trời chưa có glossary |
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
7. **Glossary sai (M5)**: dòng glossary cho Mahākusala ghi `මහා ක්‍රියා සිත` (cột si); M5 đã dùng `මහා කුසල් සිත`. Glossary cần sửa, không sửa trong batch này.
8. **Āciṇṇa**: glossary/content_si `ආචිණ්ණ` vs Chandrikava 6-7 `ආචීර්ණ`. Module dùng `ආචිණ්ණ`.
9. **Ahosi**: content_si `අහෝසි` vs Chandrikava 6-7 `අහොසි`. Module dùng `අහෝසි`.
10. **Paṭisandhi**: glossary `පටිසන්ධි` vs Chandrikava 6-6/6-7 `ප්‍රතිසන්ධි`. Module dùng `පටිසන්ධි` (theo glossary).
11. **Tadālambana**: glossary `තදාලම්බන` vs `තදාරම්මණ` (đang dùng ở M8/M10). Module M10 dùng `තදාරම්මණ`; cần thống nhất.

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
11. Āciṇṇa (`ආචිණ්ණ` hay `ආචීර්ණ`), Ahosi (`අහෝසි` hay `අහොසි`), Paṭisandhi (`පටිසන්ධි` hay `ප්‍රතිසන්ධි`)?
12. Javana (`ජවන`) và Tadālambana (`තදාලම්බන` hay `තදාරම්මණ`)?
13. M6: các cách gọi phiên âm Pāḷi cho akusala ngoài glossary (pisuṇavācā, pharusavācā, samphappalāpa, byāpāda, micchādiṭṭhi, anabhijjhā, abyāpāda)?
14. M6: thứ tự nặng của nghiệp nghịch và "javana thứ tư mạnh nhất" có trong nguồn Sinhala nào không?

## 6. Việc còn mở

- Tất cả 17 module đã có bản draft (không reviewed). Không đánh dấu reviewed, không đưa vào builder.
- Xử lý các mục §3 (English) và xung đột §4 khi hội đồng chốt.
- M3: gộp TERM_PANNINDRIYA/TERM_TU_QUYEN_M3; sửa TERM_BA_NHAN_THIEN_M3 (`pali` đang là tiếng Việt).
- M5: kiểm Ñāṇasampayutta, Ñāṇavippayutta, Mahākiriya, Kāmāvacara, Puññakiriyavatthu với Saṅgaha/Chandrikava.
- M13/M14: jhāna factors, kasiṇa, abhiññā, nirodha-samāpatti cần nguồn Sinhala.
- M6: các câu chưa đối chiếu được (§3 M6).
- Chạy lại `check_content_locale.py` sau khi builder (coordinator) đọc các file này.
