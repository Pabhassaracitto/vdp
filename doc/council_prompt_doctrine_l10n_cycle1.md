PROMPT HỘI ĐỒNG ĐA AI — "KIỂM CHỨNG GIÁO LÝ & THUẬT NGỮ 7 NGÔN NGỮ" cho VDP (DOCTRINE-L10N-001)

    Cách dùng file này: Copy toàn bộ nội dung làm prompt khởi động cho từng
    thành viên hội đồng đa AI (Claude, ChatGPT, Gemini, Grok, Qwen, …). Mỗi vòng,
    từng AI trả lời bảng câu hỏi ở mục 4 theo đúng định dạng mục 6, kèm nguồn
    kiểm chứng được. Kết quả cuối là một "Phiếu phán quyết" (verdict sheet) để
    người duyệt giáo lý (trưởng lão) chỉ cần xác nhận/bác, không phải tra lại từ đầu.

    ⚠️ Lưu ý quản trị: hội đồng đa AI KHÔNG phải thẩm quyền giáo lý. Đầu ra là
    đề xuất có dẫn nguồn; quyết định cuối thuộc về người duyệt giáo lý được chủ
    dự án chỉ định, ghi lại trên Linear IN4-38. Không AI nào được tự "chốt" thay.

1. Bối cảnh dự án (sự thật trong repo — KHÔNG được bịa thêm)

VDP (Vi Diệu Pháp) là app Flutter học Abhidhamma Theravāda, offline, nguồn gốc
tiếng Việt (giáo trình Vi Diệu Pháp theo truyền thống Nam tông Việt Nam, sách
Tỳ-khưu Giác Chánh / Tịnh Sự, các PDF VDP-Tam, VDP-TamSo, VDP-Nghiep,
VDP-ToatYeuVeDuyen…). Dữ liệu gốc ở `assets/data/`:

Tệp dữ liệu              Thực thể                          Khóa Pāḷi chuẩn (nguồn sự thật)
cittas.json              121 tâm (CI_001…CI_121)           namePali, vedana
cetasikas.json           52 tâm sở (CS_*)                  namePali
rupas.json               28 sắc                            namePali
kammas.json              16 nghiệp (KM_T/P/U/R_01..04)     namePali
paccayas.json            24 duyên (PC_01…PC_24)            namePali, paliFormula, paccayaDhamma, paccayuppanna, operatesInPaticca, subdivisions
paticca.json             12 chi duyên khởi (PD_01…PD_12)   namePali
vithis.json              lộ trình tâm                      steps

Bảy locale đang được dịch (hi, zh, zh_TW, si, my, ja, th) đi qua glossary chung
`l10n_work/glossary.csv` (397 mục, cột: pali, category, vietnamese, english,
hi, zh, zh_TW, si, my, ja, th, refs). Header glossary ghi nguồn tham chiếu
dự kiến: hi = Rewata Dhamma, *Abhidharma Prakāśinī* (Varanasi 1967);
zh/zh_TW = 攝阿毘達磨義論 (bản dịch Hán Theravāda); si = truyền thống
Abhidharmārtha Saṅgraha Sinhala; ja = bản dịch アビダンマッタサンガハ của
ウ・ウェープッラ; my = truyền thống Miến; th = truyền thống Thái (อภิธัมมัตถสังคหะ).

Luật cứng của dự án (vi phạm = câu trả lời bị loại ngay vòng đó):

    Không bịa giáo lý. Mỗi phán quyết phải chỉ ra được đoạn kiểm chứng:
    Abhidhammatthasaṅgaha (chương/đoạn theo bản Bodhi *CMA* hoặc bản Pāḷi
    CST/VRI), Paṭṭhāna (Paccayaniddesa / Paccayuddesa), Aṭṭhasālinī,
    Vibhāvinī-ṭīkā, hoặc sách giáo khoa truyền thống của chính ngôn ngữ đích.
    Không có nguồn → ghi "KHÔNG XÁC MINH ĐƯỢC", không đoán.
    Giữ Pāḷi nguyên dạng (IAST có dấu). Một thuật ngữ = một cách dịch dùng nhất
    quán cho mỗi locale.
    Không mượn nghĩa Đại thừa/Sanskrit (Câu-xá, Duy thức, 俱舎/唯識) khi khác nghĩa
    với Theravāda; nếu dùng chung Hán tự phải ghi rõ nghĩa Theravāda.
    Không thay đổi tiếng Việt gốc trừ khi câu hỏi yêu cầu (Q1–Q4): tiếng Việt là
    nguồn, 7 ngôn ngữ kia là đích; English là fallback kỹ thuật, không phải nguồn.
    Trường còn nghi ngờ phải để trống (app tự fallback sang English) — không
    điền tạm.

2. Ba việc hội đồng phải làm (theo thứ tự ưu tiên)

    A. Phán quyết 4 chỗ mơ hồ trong NGUỒN TIẾNG VIỆT (Q1–Q4): tác giả gốc để
    lại dấu "? — chính xác:" và "..." trong `assets/data/paccayas.json`. Đây là
    đòn bẩy lớn nhất: sửa một lần, 7 locale hưởng.
    B. Phân xử 1 tranh chấp giữa hai agent dịch (Q5) về dữ liệu cấu trúc.
    C. Chốt 7 lựa chọn thuật ngữ theo ngôn ngữ đích (Q6–Q13) bằng cách tra
    thuật ngữ đang được dùng trong truyền thống Theravāda của chính ngôn ngữ đó.

    NGOÀI phạm vi (đã là bug dữ liệu đã xác minh, kỹ sư đang sửa ở IN4-72 —
    hội đồng KHÔNG cần bàn): tên 8 nghiệp KM_P_*/KM_U_* bị tráo trong bảng dịch
    7 locale; CI_026/CI_027 (quan sát thọ xả / thọ hỷ quả thiện) bị tráo
    hỷ↔xả trong 7 locale. Nếu hội đồng phát hiện thêm bug kiểu "tráo hàng"
    tương tự, báo riêng ở mục "Phát hiện ngoài lề".

3. Dữ liệu nguyên văn để hội đồng đối chiếu (trích đúng từ repo, 2026-10-09)

PC_02 Ārammaṇa-paccaya (Cảnh duyên)
  paccayaDhamma:  "6 cảnh: sắc, thinh, khí, vị, xúc, pháp (gồm cả Niết-bàn và chế định)."
  paccayuppanna:  "89 tâm (trừ 2 ngũ thức thân? — chính xác: trừ tâm không bắt cảnh) và 52 tâm sở."
  operatesInPaticca: [PD_01, PD_07]

PC_03 Adhipati-paccaya (Trưởng duyên)
  paccayaDhamma:  "4 trưởng câu sanh: dục (chanda), cần (viriya), tâm (citta), thẩm (vīmaṃsā = tuệ, paññā); và cảnh trưởng (cảnh được coi trọng)."
  paccayuppanna:  "Các danh pháp câu sanh; với cảnh trưởng là 84 tâm (trừ tâm quả vô nhân...) và tâm sở tương ưng."
  subdivisions:   Sahajāt'ādhipati (Câu sanh trưởng) · Ārammaṇ'ādhipati (Cảnh trưởng)
  operatesInPaticca: [PD_01]

PC_11 Pacchājāta-paccaya (Hậu sanh duyên)
  paccayaDhamma:  "85 tâm (trừ 2 ngũ thức thân và tâm tục sanh? — chính xác: 85 tâm dục, sắc, vô sắc, siêu thế trừ tục sanh) và 52 tâm sở."
  paccayuppanna:  "Thân sắc nghiệp sanh trước (sắc thân đang trụ)."
  operatesInPaticca: [PD_04]

PC_12 Āsevana-paccaya (Trùng dụng duyên)
  paccayaDhamma:  "Đổng lực tâm và tâm sở đi trước (trừ đổng lực thứ 7 và đổng lực siêu thế? — chính xác: trừ đổng lực cuối và đổng lực đạo)."
  paccayuppanna:  "Đổng lực tâm và tâm sở sanh liền sau."
  operatesInPaticca: [PD_01, PD_07]

PC_01 Hetu-paccaya (Nhân duyên)
  paccayaDhamma:  "6 nhân: tham, sân, si, vô tham, vô sân, vô si."
  paccayuppanna:  "Các danh pháp tương ưng nhân (citta + cetasika) và sắc do tâm ấy sanh (pavatti) hoặc sắc nghiệp lúc tục sanh."
  paliFormula:    "Hetu hetusampayuttakānaṃ dhammānaṃ taṃ samuṭṭhānānañca rūpānaṃ hetupaccayena paccayo."
  operatesInPaticca: (KHÔNG CÓ)

PC_17 Jhāna-paccaya (Thiền duyên)
  paccayaDhamma:  "7 chi thiền: tầm, tứ, hỷ, lạc, ưu, xả, nhất tâm."
  paccayuppanna:  "Tâm và tâm sở tương ưng (trừ 2 ngũ thức thân), và sắc do tâm ấy sanh."
  paliFormula:    (null)
  operatesInPaticca: (KHÔNG CÓ)

Chi duyên khởi (để hiểu operatesInPaticca): PD_01 Avijjā → PD_02 Saṅkhāra →
PD_03 Viññāṇa → PD_04 Nāmarūpa → PD_05 Saḷāyatana → PD_06 Phassa → PD_07 Vedanā
→ PD_08 Taṇhā → PD_09 Upādāna → PD_10 Bhava → PD_11 Jāti → PD_12 Jarāmaraṇa.
Trong 24 duyên hiện tại, chỉ PC_01 và PC_17 không có mảng này; `check_paccaya_data.py`
báo PASS 24/24, 52 liên kết.

Glossary — các dòng đang tranh luận (cột: pali | vi | zh | zh_TW | ja | hi):
  Chanda          | Dục | 一欲 | 一欲 | 意欲 | छन्द
  Āsevana-paccaya | Trùng dụng duyên | (zh_TW agent đề xuất 重複緣 vs 習行緣)
  Voṭṭhapana      | Xác định | 确定心 (分界) | 確定心 (分界) | 決定心 | व्यवस्थान
  Upapīḷaka-kamma    | Cản Trở Nghiệp (keyTerm: Chướng nghiệp) | ja: 障害業 (keyTerm) — agent ja hỏi 妨害業 vs 壓迫業
  Upatthambhaka-kamma| Bổ Trợ Nghiệp (keyTerm: Trì nghiệp)     | ja: 支助業 (keyTerm) — agent ja hỏi 支持業 vs 補助業
  Puññābhisaṅkhāra   | hi có hai dạng viết trong glossary: अभिसंस्कार / अभिसंखार
  Aparāpariyavedanīya| trùng 2 khóa: "Aparāpariyavedanīya-kamma" (kammas) và "Aparāpariyavedanīyakamma" (keyTerm)
  Header glossary dòng 4: "摂阿毘達磨義論" — 摂 là shinjitai Nhật, zh/zh_TW phải là 攝.
  Cột zh_TW còn 67 dòng chứa chữ giản thể (55 dòng là 禅 thay vì 禪).

4. BẢNG CÂU HỎI hội đồng PHẢI trả lời (không được né)

Nhóm A — Nguồn tiếng Việt (ảnh hưởng 7 locale)

  Q1  PC_02 paccayuppanna. Theo Paṭṭhāna, ārammaṇa-paccaya có paccayuppanna là
      TẤT CẢ 89 tâm + 52 tâm sở (mọi tâm đều bắt cảnh). Vậy phần ngoặc "(trừ 2
      ngũ thức thân? — chính xác: trừ tâm không bắt cảnh)" có nên XÓA hẳn không?
      Nếu giữ, câu đúng là gì? Dẫn: CMA VIII §§13–17 / Paṭṭhāna Paccayaniddesa.
  Q2  PC_11 paccayaDhamma. Pacchājāta: danh pháp sanh sau làm duyên cho sắc
      thân sanh trước. Con số đúng là 85 tâm (89 − 4 vô sắc quả) hay 85 tâm
      (trừ 2 ngũ thức + tục sanh)? Tục sanh (paṭisandhi) bị loại thế nào — loại
      "tâm tục sanh" như một loại tâm hay loại "sát-na tục sanh" của mọi tâm quả?
      Hãy viết lại câu tiếng Việt hoàn chỉnh. Dẫn nguồn.
  Q3  PC_12 paccayaDhamma. Āsevana: 47 đổng lực hiệp thế (12 bất thiện + 8 đại
      thiện + 9 thiện đáo đại + 18 duy tác hữu nhân… tuỳ cách đếm) trừ đổng lực
      cuối của mỗi lộ; đạo tâm có làm āsevana cho quả không? Hãy viết lại câu
      tiếng Việt hoàn chỉnh, nêu rõ con số đổng lực và loại trừ. Dẫn nguồn.
  Q4  PC_03 paccayuppanna với cảnh trưởng: danh sách sau "trừ tâm quả vô nhân..."
      bị cụt. Theo truyền thống: 8 tham + 8 đại thiện + 4 đại duy tác tương
      ưng trí + 8 siêu thế = 28 tâm? Hay cách đếm khác của sách Việt? Hoàn
      thiện câu. Dẫn nguồn. (Lưu ý sách gốc ghi "84 tâm" — hội đồng kiểm tra
      số này có hợp lý không.)

Nhóm B — Tranh chấp dữ liệu cấu trúc

  Q5  PC_01 Hetu và PC_17 Jhāna không có `operatesInPaticca`. Agent zh nói
      hợp lệ (hai duyên này không được sách Việt gắn vào chi duyên khởi nào);
      agent my nói thiếu dữ liệu. Hội đồng kiểm tra: theo cách trình bày
      "duyên hệ áp dụng vào Paṭiccasamuppāda" trong CMA VIII §§ 11–28 (và sách
      Toát yếu về Duyên của truyền thống Việt), Hetu/Jhāna có được gán vào chi
      nào không (ví dụ Hetu → PD_01→PD_02 avijjā→saṅkhāra; Jhāna → PD_02)?
      Trả lời: GIỮ TRỐNG / THÊM [danh sách PD_xx] + nguồn.

Nhóm C — Thuật ngữ theo ngôn ngữ đích (mỗi câu trả lời: thuật ngữ chốt + ví dụ
sách Theravāda bản ngữ đang dùng đúng thuật ngữ đó)

  Q6  zh_TW: PC_12 Āsevana — 重複緣 hay 習行緣? (Tra 攝阿毘達磨義論 bản 葉均/
      尋法比丘, 菩提比丘《阿毘達摩概要精解》bản Hoa ngữ.)
  Q7  zh_TW: 55 dòng glossary liên quan thiền — dùng 禪 thống nhất (CBETA) hay
      giữ 禅 ở chỗ nào? (Kỳ vọng: 禪 toàn bộ; xác nhận ngoại lệ nếu có.)
  Q8  zh_TW/zh: chanda hiện 一欲 — đổi thành 欲 trơn, hay 欲 (chanda) để tránh
      lẫn với 欲 = kāma/rāga? Đề xuất cách viết nhất quán cho cả zh và zh_TW.
  Q9  (ĐÃ RÚT — là bug dữ liệu IN4-72, không phải câu hỏi giáo lý.)
  Q10 ja: Upatthambhaka → 支持業 / 支助業 / 補助業? Upapīḷaka → 妨害業 / 障害業 /
      壓迫業? (Tra bản ウ・ウェープッラ『アビダンマッタサンガハ』, 水野弘元
      『パーリ仏教を中心とした仏教の心識論』.) Chọn một bộ nhất quán cho cả 4
      nghiệp theo phận sự (Janaka/Upatthambhaka/Upapīḷaka/Upaghātaka).
  Q11 hi: chính sách chọn dạng Sanskrit hoá (रूपावचर, व्यवस्थान, अभिसंस्कार)
      hay dạng chuyển tự Pāḷi (रूपावचर giữ, वोट्ठपन, अभिसंखार)? Đây là quyết
      định chính sách một lần cho cả cột hi — đối chiếu bản Rewata Dhamma 1967
      và bản Hindi của Bhikkhu Dharmarakshita (अभिधम्मत्थसंगहो). Nêu rõ ngoại lệ.
  Q12 hi: Puññābhisaṅkhāra — chốt một cách viết theo chính sách Q11.
  Q13 my: 8 câu hỏi của agent Miến (sẽ được agent đó dán vào IN4-38 dưới mã
      Q13a–h). Nếu chưa có khi hội đồng họp, bỏ qua và ghi "chờ".

5. Tiêu chí chấm mỗi câu trả lời (rubric 100 điểm / câu)

Tiêu chí                         Điểm  Câu hỏi chấm
Có nguồn kiểm chứng được          30   Trích đúng chương/đoạn; người duyệt mở ra tìm thấy được. Nguồn "theo tôi nhớ" = 0 điểm.
Đúng Theravāda, không lẫn tông    20   Có lẫn Câu-xá/Duy thức/Sanskrit không? Có đúng cách đếm tâm của Saṅgaha không?
Nhất quán với dữ liệu repo         20   Có tôn trọng khóa Pāḷi, cách đếm 89/121 tâm, 24 duyên, 12 chi như repo không? Có đề xuất sửa chỗ không được hỏi không?
Tôn trọng truyền thống Việt gốc    15   Khi sửa tiếng Việt (Q1–Q4), có giữ thuật ngữ Việt của sách gốc (đổng lực, tục sanh, ngũ thức thân…) không?
Trả lời dứt khoát, định dạng đúng  10   Có đưa ra MỘT câu trả lời + độ tin cậy, hay né bằng "tuỳ truyền thống"?
Khai báo không chắc                 5   Chỗ không xác minh được có ghi rõ không?

6. Định dạng trả lời bắt buộc (mỗi câu một khối)

  Q<n> — <tên duyên/thuật ngữ>
  PHÁN QUYẾT: <một câu trả lời duy nhất; với Q1–Q4 là câu tiếng Việt hoàn chỉnh để dán thẳng vào JSON>
  ĐỘ TIN CẬY: cao / vừa / thấp
  NGUỒN: <tác phẩm, chương/đoạn, trang hoặc số đoạn CST; tối thiểu 1, tốt nhất 2 độc lập>
  LÝ DO (≤ 5 dòng):
  TÁC ĐỘNG LOCALE: <locale nào phải đổi gì sau phán quyết này; "không" nếu không>
  BẤT ĐỒNG VỚI AI KHÁC (từ vòng 2): <nêu tên AI + điểm khác + vì sao mình giữ/đổi>

Cuối phiếu: mục "PHÁT HIỆN NGOÀI LỀ" (bug dữ liệu, tráo hàng, lỗi chính tả
Pāḷi) — mỗi dòng: tệp · id · vấn đề · bằng chứng.

7. Vai trò từng thành viên hội đồng

    AI-Luận sư (Claude đề xuất): giữ Nhóm A + Q5; đối chiếu Paṭṭhāna và CMA
    chương VIII; soạn câu tiếng Việt hoàn chỉnh cho Q1–Q4.
    AI-Ngữ văn Hán–Nhật (ChatGPT đề xuất): giữ Q6–Q8, Q10; tra 攝阿毘達磨義論,
    CBETA, bản dịch Nhật; rà 67 dòng giản/phồn.
    AI-Ngữ văn Ấn–Tích Lan (Gemini đề xuất): giữ Q11–Q12 + kiểm cột si/my/th
    cho các dòng bị động chạm; đối chiếu bản Hindi/Sinhala của Saṅgaha.
    AI-Phản biện đỏ (Grok/Qwen đề xuất): mỗi vòng nộp ≥ 5 đòn tấn công: (a)
    nguồn dẫn sai/không tồn tại, (b) lẫn tông phái, (c) phán quyết làm vỡ nhất
    quán với mục khác trong glossary 397, (d) sửa tiếng Việt làm lệch sách gốc,
    (e) tráo hàng/bug dữ liệu chưa ai thấy. Kèm mức nghiêm trọng.

8. Giao thức vòng lặp

    Vòng 1: mỗi AI trả lời độc lập toàn bộ Q1–Q13 theo mục 6 (không xem bài
    AI khác).
    Vòng 2: mỗi AI đọc 3 bài còn lại, chấm rubric mục 5 cho từng câu, nộp bảng
    điểm + cập nhật phán quyết của mình (ghi rõ đổi vì ai).
    Vòng 3 (nếu còn câu nào bất đồng): AI-Phản biện đỏ tổng hợp điểm bất đồng;
    các AI chỉ tranh luận đúng những câu đó.
    Điều kiện dừng: mỗi câu đạt ≥ 3/4 AI đồng thuận với điểm trung bình ≥ 85, hoặc
    hết 3 vòng → câu còn bất đồng được đánh dấu "TRÌNH TRƯỞNG LÃO, KHÔNG ĐỒNG THUẬN"
    kèm 2 phương án + nguồn mỗi phương án.
    Đầu ra cuối: một "Phiếu phán quyết" Markdown, mỗi Q một khối theo mục 6 +
    bảng tổng hợp (Q · phán quyết · tin cậy · đồng thuận n/4 · locale ảnh hưởng).
    Chủ dự án chuyển cho người duyệt giáo lý; sau khi được xác nhận mới ghi vào
    `assets/data/paccayas.json` / glossary / module locale, qua đúng quy trình
    IN4-38 → IN4-72/IN4-49.

9. Điều hội đồng KHÔNG được làm

    Không dịch lại hàng loạt; chỉ trả lời câu hỏi được nêu.
    Không đề xuất đổi cấu trúc dữ liệu (schema) — đó là IN4-55.
    Không "làm tròn" bằng tiếng Anh: nguồn là tiếng Việt + Pāḷi.
    Không viện dẫn website tổng hợp vô danh làm nguồn duy nhất; ưu tiên văn bản
    Pāḷi, chú giải, CMA (Bodhi 1993/2000), sách giáo khoa truyền thống bản ngữ.

Soạn ngày 2026-10-09 từ: (a) 6 handoff của agent dịch hi/zh/zh_TW/si/my/ja trên
Linear IN4-42…47, (b) hàng đợi giáo lý IN4-38, (c) đối chiếu trực tiếp
`assets/data/*.json`, `l10n_work/glossary.csv`, `assets/content/content_*.json`
trong repo Pabhassaracitto/vdp @ main 630186d. File này là prompt đầu vào cho
hội đồng — không phải phán quyết giáo lý.
