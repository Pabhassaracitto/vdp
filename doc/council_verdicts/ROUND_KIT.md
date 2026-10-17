# Bộ công cụ chạy vòng lặp hội đồng — DOCTRINE-L10N-001

Trạng thái 2026-10-17: Vòng 1 mới có **1/4** phiếu (Claude). Claude từ chối
đóng giả 3 thành viên khác — đúng luật "không bịa". Chọn **Phương án B**:
chạy thật trên 3 model còn lại. Tuyệt đối không nhận phiếu mô phỏng.

## Bước 1 — Thu 3 phiếu Vòng 1 còn thiếu (3 phiên chat MỚI, độc lập)

Với mỗi model dưới đây mở **một phiên chat mới, trống** (không có lịch sử,
không dán bài Claude), dán nguyên văn `doc/council_prompt_doctrine_l10n_cycle1.md`
rồi dán thêm tin nhắn giao vai tương ứng:

### ChatGPT — AI-Ngữ văn Hán–Nhật
```
Bạn là AI-Ngữ văn Hán–Nhật của hội đồng (mục 7). Vòng 1: trả lời ĐỘC LẬP toàn bộ
Q1–Q13 theo đúng định dạng mục 6, ưu tiên chiều sâu cho Q6, Q7, Q8, Q10 và rà
cột zh_TW theo "Phát hiện ngoài lề". Yêu cầu bắt buộc cho phần của bạn:
- Q6/Q8: trích đúng tên sách + chương/trang của 葉均《攝阿毘達磨義論》 hoặc
  尋法比丘 dịch《阿毘達摩概要精解》 nơi thuật ngữ xuất hiện; nếu không mở được
  sách, ghi "KHÔNG XÁC MINH ĐƯỢC" chứ không suy đoán.
- Q10: dẫn ウ・ウェープッラ『アビダンマッタサンガハ』 hoặc 水野弘元 với số trang,
  và cho một BỘ 4 thuật ngữ nhất quán (Janaka/Upatthambhaka/Upapīḷaka/Upaghātaka).
- Không xem/đoán bài của AI khác. Không mô phỏng thành viên khác.
Kết thúc bằng bảng tổng hợp Q · phán quyết · tin cậy · locale ảnh hưởng.
```

### Gemini — AI-Ngữ văn Ấn–Tích Lan
```
Bạn là AI-Ngữ văn Ấn–Tích Lan của hội đồng (mục 7). Vòng 1: trả lời ĐỘC LẬP
toàn bộ Q1–Q13 theo định dạng mục 6, ưu tiên chiều sâu cho Q11, Q12 và kiểm
cột si/my/th cho các dòng bị động chạm (Chanda, Voṭṭhapana, Āsevana, 4 nghiệp
theo phận sự, Puññābhisaṅkhāra). Yêu cầu bắt buộc:
- Q11: đối chiếu Rewata Dhamma, Abhidharma Prakāśinī (Varanasi 1967) và bản
  Hindi अभिधम्मत्थसंगहो của Bhikkhu Dharmarakshita: mỗi bản dùng dạng nào cho
  abhisaṅkhāra / voṭṭhapana / rūpāvacara? Nếu không mở được, ghi
  "KHÔNG XÁC MINH ĐƯỢC".
- Nêu rõ chính sách một lần cho cả cột hi + danh sách ngoại lệ.
- Không xem/đoán bài của AI khác. Không mô phỏng thành viên khác.
Kết thúc bằng bảng tổng hợp Q · phán quyết · tin cậy · locale ảnh hưởng.
```

### Grok hoặc Qwen — AI-Phản biện đỏ
```
Bạn là AI-Phản biện đỏ của hội đồng (mục 7). Vòng 1: (a) trả lời ngắn gọn
Q1–Q13 theo định dạng mục 6 (được phép ghi "không có ý kiến độc lập" ở các câu
ngoài chuyên môn), và (b) nộp ≥ 5 ĐÒN TẤN CÔNG vào chính bảng câu hỏi và dữ
liệu ở mục 3: nguồn gợi ý trong câu hỏi có sai/không tồn tại không, câu hỏi
nào dẫn dắt đáp án, con số nào trong mục 3 đáng ngờ, bug tráo hàng nào chưa
ai thấy trong assets/data. Mỗi đòn: mức nghiêm trọng (nghiêm trọng / vừa / nhẹ)
+ bằng chứng. Không xem/đoán bài của AI khác. Không mô phỏng thành viên khác.
```

Lưu từng phiếu nguyên văn vào:
- `doc/council_verdicts/round1_chatgpt_han_nhat.md`
- `doc/council_verdicts/round1_gemini_an_tich.md`
- `doc/council_verdicts/round1_red_team.md`

(Có thể dán thẳng vào chat với PM agent; PM agent sẽ lưu file + cập nhật README.)

## Bước 2 — Vòng 2 (chấm chéo), làm trong 4 phiên ĐÃ CÓ của bước 1

Dán vào **mỗi** phiên tin nhắn sau, kèm **3 phiếu của 3 thành viên kia**
(nguyên văn, có tiêu đề rõ tên thành viên) và `pm_notes_round1.md`:

```
VÒNG 2. Dưới đây là 3 phiếu Vòng 1 THẬT của 3 thành viên còn lại (không phải
mô phỏng) và ghi chú kiểm chéo của quản trị dự án (PM notes). Hãy:
1. Chấm rubric mục 5 cho TỪNG câu của TỪNG thành viên (bảng: Q × thành viên ×
   6 tiêu chí × tổng/100), chỉ rõ dòng nào bị trừ điểm vì sao.
2. Cập nhật phán quyết của chính bạn cho từng Q theo định dạng mục 6, điền mục
   "BẤT ĐỒNG VỚI AI KHÁC": giữ hay đổi, vì ai, vì nguồn nào.
3. Trả lời các cờ của PM notes (Q2 lý do loại trừ, Q3 nhãn "18 duy tác đáo
   đại", Q4 mahaggata có làm ārammaṇādhipati-paccayuppanna không).
4. Kết thúc bằng bảng: Q · phán quyết của bạn · tin cậy · đồng thuận ước tính n/4.
```

Lưu thành `round2_<thanhvien>.md`.

## Bước 3 — Vòng 3 (chỉ câu còn bất đồng)

Sau Vòng 2, PM agent lập bảng đồng thuận. Chỉ các Q chưa đạt ≥ 3/4 đồng thuận
với điểm TB ≥ 85 được đưa vào Vòng 3. Dán cho AI-Phản biện đỏ trước để tổng hợp
điểm bất đồng, rồi dán bản tổng hợp đó cho 3 thành viên kia.

## Bước 4 — Phiếu phán quyết cuối → trưởng lão

PM agent gộp thành `doc/council_verdicts/FINAL_verdict_sheet.md` + comment trên
Linear IN4-38. Các Q không đồng thuận được ghi "TRÌNH TRƯỞNG LÃO, KHÔNG ĐỒNG
THUẬN" kèm 2 phương án + nguồn. Chỉ sau chữ ký trưởng lão mới sửa
`assets/data/paccayas.json` / glossary / module locale.

## Những gì KHÔNG làm trong lúc chờ

- Không sửa Q1–Q4 trong `paccayas.json` dù Claude đã cho câu "dán thẳng".
- Không đổi 一欲 → 欲 / 習行緣 cho tới khi có ≥ 2 phiếu nữa đồng ý.
- Việc mechanical (禅→禪, 摂→攝, trùng khóa Aparāpariya) vẫn đi đường
  integrator (IN4-49 §5), không chờ hội đồng.

## Bổ sung thông tin cho hội đồng nếu được hỏi

| Câu hỏi hội đồng có thể đặt | Trả lời sẵn |
|---|---|
| Repo dùng hệ 89 hay 121 tâm? | `cittas.json` liệt kê 121; `paccayas.json` viết số theo hệ 89 (theo sách gốc). Giữ số như sách gốc, không quy đổi. |
| Trang sách Việt gốc của PC_03 "84 tâm"? | Nguồn: `VDP-ToatYeuVeDuyen.pdf` (xem `docs/study-content-sources.md`, M8_NHAN_DUYEN / M17_DUYEN_CHI_TIET). PM chưa trích được trang chính xác — nếu hội đồng cần, chủ dự án mở PDF và dán đoạn. |
| Q13 của agent Miến? | Chưa được dán lên IN4-38. Hội đồng ghi "chờ". |
| IN4-72 đã sửa chưa? | Đã sửa trên nhánh `arena/74183d76-vdp` @ `c526dc1`, chờ ff vào main. |
