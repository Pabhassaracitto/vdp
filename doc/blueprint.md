BLUEPRINT HOÀN CHỈNH: ỨNG DỤNG VI DIỆU PHÁP (VDP)
Phiên bản Cuối — Chắt lọc từ 12 vòng, 9 AI
TUYÊN NGÔN THIẾT KẾ (Design Manifesto)
"Ứng dụng VDP không phải là từ điển số hóa.
Đây là không gian để người học THẤY bằng mắt, HIỂU bằng tim,
và TỰ MÌNH khám phá cấu trúc của Tâm — đúng như cách giảng sư King Milanda A đã dạy."

Ba nguyên tắc bất biến:

Offline-First: Hoạt động 100% không cần internet. Data bundle trong app.
Accuracy-First: Không bao giờ hiển thị dữ liệu sai giáo lý. Validation trước load.
Accessibility-First: Mọi người học đều được phục vụ, không phân biệt khả năng thể chất.
I. KIẾN TRÚC DỮ LIỆU & QUẢN TRỊ (Data & Governance)
Content Governance System (Hai lớp bảo vệ):

Lớp 1 — Editorial Workflow (Con người):

text

Soạn dữ liệu → Peer Review → Senior Approval → Merge vào bundle
(Người học)     (Người thạo)  (Thẩm quyền)     (Release)
Lớp 2 — Continuous Data Integrity (Kỹ thuật):

Hard Rules → Vi phạm → Refuse to load + Log chi tiết
Tâm Siêu Thế ≠ Tạo sắc
Nghiệp Dục giới ≠ Tạo Tâm Quả Sắc/Vô Sắc giới
Tâm Sở Tịnh Hảo ≠ Phối hợp với Tâm Bất Thiện
Soft Rules → Vi phạm → Warning + Cho phép load
Tâm Sở Bất Định (Tật/Lận/Hối) trong Tâm Sân: Cảnh báo nếu thiếu ghi chú "sometimes"
Data Model (Khái niệm — không phải code):

Citta: Định danh, Tên, Nhóm cõi, Thọ, Bản đồ phối hợp (always/sometimes/never), Liên kết Nghiệp (N-M), Liên kết Sắc (Vatthu + Tạo sắc), Module thuộc về, Tham chiếu ví dụ.
Cetasika: Định danh, Tên, Nhóm, Nhóm xung đột (Pair/Triple/Bhumi/Duyên).
Flow Nodes: Nghiệp (16 loại) + Nhân Duyên (12 chi) với ánh xạ N-M đến Tâm.
Study Graph: Mạng lưới module với prerequisite edges.
User Progress: Module completions, quiz scores, last studied (local storage).
II. GIAO DIỆN & ĐIỀU HƯỚNG (UI & Navigation)
Luồng chính — 3 tầng:

text

TẦNG 1: KHỞI ĐẦU
├─ Lần đầu → Onboarding ngắn (3 màn hình) → Chọn: Study Path hoặc Explore
└─ Lần sau → Tiếp tục từ điểm dừng

TẦNG 2: KHÔNG GIAN CHÍNH (Unified Exploration Space)
├─ [Matrix Layer - Mặc định]
│   ├─ Panel Trên (Cố định): 52 Tâm Sở, 3 khu vực màu+hình
│   └─ Panel Dưới (Cuộn): 121 Tâm, mã màu+hình theo Thọ
│
├─ [Flow Layer - Context-driven]
│   └─ Kích hoạt từ: Kamma Trace ⬿ | Study Path | Menu
│       → Flowchart: 12 Nhân Duyên / Nghiệp 16 loại
│
└─ [Kamma Trace - Cầu nối N-M]
    Matrix Tâm → Flow Nghiệp (nhiều-nhiều, có chú thích "tùy duyên")
    Flow Nghiệp → Matrix Tâm (danh sách quả có thể có)

TẦNG 3: HỌC TẬP
├─ Adaptive Study Engine (Graph-based modules)
├─ Quiz (Rule-based, 3 cấp)
└─ Blur/Reveal (Active Recall)
Hero Transition: Map → Matrix (nhánh cây phóng to thành lưới).

III. HỆ THỐNG TƯƠNG TÁC (Interaction System)
A. AssociationType — Dual Encoding (Màu + Hình + Text):

Trạng thái	Màu	Hình	Label	Nghĩa
always	🔆 Sáng	✦ Solid	"Cố định"	Luôn phối hợp
sometimes	💛 Vàng	◎ Dashed	"Bất định"	Có thể có
never	⬛ Mờ	✕	"Không có"	Không phối hợp
B. Proactive Conflict Guard (4 tầng):

Tầng 1: Cặp đôi (Tham ↔ Vô Tham)
Tầng 2: Bộ 3 (Tham + Sân + Tà Kiến)
Tầng 3: Bhumi (Tâm Siêu Thế + Sở Dục giới)
Tầng 4: Duyên xung đột (Vô Minh + Trí Tuệ trong Nhân Duyên)
→ Khi phát hiện: Dim ngay (không đợi chọn xong) + Tooltip giải thích
C. Multi-Modal Guidance:

Proactive Dimming: Tức thì khi bắt đầu xung đột
Smart Hints: Dwell > 3s hoặc error > 2 lần → Banner gợi ý ví dụ
Pali Pronunciation: Long press → IPA + Audio
Virtual Teacher: Optional, Pha 3, tắt được
IV. ACCESSIBILITY-FIRST DESIGN SYSTEM
Nguyên tắc bất biến:

Dual Encoding: Thông tin màu = màu + hình + text (không ai bị bỏ lại vì mù màu)
Dynamic Type: Scale theo system font (hỗ trợ người cao tuổi)
Screen Reader: semanticsLabel đầy đủ cho mọi widget
High Contrast Mode: Toggle trong Setting
Minimum touch target: 48×48dp (WCAG 2.1 AA)
V. ADAPTIVE STUDY ENGINE (Graph-based)
Không tuyến tính — Mạng lưới module:

text

         [M1: 7 Biến Hành] ← Bắt buộc đầu tiên
               ↓
    ┌─────────┴──────────┐
    ↓                    ↓
[M2: Si Phần]      [M3: Tịnh Hảo Biến Hành]
    ↓                    ↓
[M4: 12 Bất Thiện] [M5: Tịnh Hảo Dục Giới]
    ↓         ↘   ↙      ↓
[M6: Nghiệp]  [M7: Tâm Siêu Thế]
    ↓
[M8: 12 Nhân Duyên]
    ↓
[M9: Sắc Pháp]
    ↓
[M10: Lộ trình Tâm 17 sát-na]
Progress Tracking:

Visual % hoàn thành từng nhánh
Smart Recommendation: "Bạn đã hiểu M1+M2, nên học M4 tiếp"
Non-linear allowed: Tự do khám phá, progress vẫn được ghi nhận
VI. LỘ TRÌNH TRIỂN KHAI (3 Pha với Gating Criteria)
Pha	Tên	Core Features	Gating Criteria
1	Foundation	Matrix + Dual Encoding + Offline + Content Governance + Accessibility Base	Validation toàn bộ data ✓ + 121 Tâm hiển thị đúng + Screen reader pass ✓
2	Causality	Flow + Kamma Trace N-M + Adaptive Study Engine (Graph) + Proactive Conflict Guard 4 tầng	Matrix↔Flow navigation ✓ + Progress tracking ✓ + Conflict detection ✓
3	Mastery	Advanced Quiz + Lộ trình 17 sát-na + Pali Pronunciation + Smart Hints + Virtual Teacher (Optional)	Full study path ✓ + Quiz complete ✓ + Accessibility audit pass ✓
VII. BẢN TÓM TẮT EXECUTIVE (Dành cho Dev Team & Stakeholders)
Bài toán: Học Vi Diệu Pháp (Abhidhamma) theo giáo trình King Milanda A là khó do: lượng thông tin khổng lồ (121×52 quan hệ), ngôn ngữ Pali trừu tượng, thiếu công cụ trực quan.

Giải pháp: Ứng dụng Flutter với:

Matrix Focus Lens: Trực quan hóa quan hệ Tâm-Tâm Sở bằng "đèn sáng" 3 trạng thái.
Flow Layer: Trực quan hóa Nghiệp-Nhân Duyên bằng flowchart tương tác.
Kamma Trace: Cầu nối N-M giữa hai chiều học.
Adaptive Study Engine: Lộ trình học phi tuyến theo tiến độ cá nhân.
Content Governance: Đảm bảo toàn vẹn giáo lý từ con người đến kỹ thuật.
Accessibility-First: Phục vụ toàn bộ cộng đồng học Phật pháp.
Công nghệ: Flutter (cross-platform), Riverpod (state), JSON Assets (offline data), Dart Semantics (accessibility).

Thời gian ước tính: Pha 1: 3-4 tháng | Pha 2: 2-3 tháng | Pha 3: 2-3 tháng.