# 🌐 KẾ HOẠCH NỘI DUNG ĐA NGÔN NGỮ — 5 NGÔN NGỮ ƯU TIÊN

**Phiên bản:** v1.0
**Ngày tạo:** 2026-09-08
**Phạm vi:** Hindi (hi), Chinese (zh + zh_TW), Sinhala (si), Myanmar (my), Japanese (ja)
**Nguyên tắc chi phối:** Accuracy-First > Offline-First > tốc độ

---

## 0. TÓM TẮT ĐIỀU HÀNH

| Hạng mục | Hiện trạng | Mục tiêu |
|---|---|---|
| **Giao diện (ARB)** | ✅ Đủ 26 locale × 267 key | Giữ nguyên |
| **Nội dung học** | Chỉ `vi` (nguồn) + `en` (một phần) | +5 ngôn ngữ ưu tiên |
| **Ngôn ngữ nội dung chọn được** | 2 (hardcode `vi`/`en`) | Điều khiển bằng registry |
| **Cổng kiểm tra bản dịch** | ❌ Không có | ✅ 6 hard + 5 soft rule |
| **Font cho nội dung** | ❌ Chỉ subset từ ARB | ✅ Subset cả từ nội dung |

**Khối lượng:** ~180.000 ký tự (~30.000 từ) mỗi ngôn ngữ = **2.974 ô dịch**.
Nhân 6 mục registry (zh và zh_TW tính riêng) ≈ **1,08 triệu ký tự**.

> ⚠️ Đây không phải khối lượng dịch thuật thông thường. Mỗi thuật ngữ Abhidhamma
> là một thuật ngữ kỹ thuật có nghĩa giáo lý cố định. Dịch sai → **dạy sai Pháp**.
> Vì vậy kế hoạch này đặt **glossary lên trước**, và chặn bản dịch chưa duyệt
> bằng công cụ, không dựa vào thiện chí.

---

## 1. TẠI SAO KHÔNG DỊCH THẲNG

Ba rủi ro đã được xác minh trên chính repo này:

**1.1 — Thuật ngữ có truyền thống sẵn, không được tự chế.**
Mỗi ngôn ngữ đích đã có truyền thống phiên dịch Abhidhamma hàng thế kỷ.
Dịch tự do sẽ tạo ra văn bản đọc trôi chảy nhưng dạy sai:

| Ngôn ngữ | Nguồn quy chiếu bắt buộc |
|---|---|
| `zh` / `zh_TW` | 摂阿毘達磨義論 — bản Hán cổ điển (触/受/想/思/一境性…) |
| `si` | Truyền thống giảng dạy Abhidhamma Sri Lanka (Sangaha, chữ Sinhala) |
| `my` | Hệ thống *let-than* Myanmar — trung tâm Abhidhamma quốc tế từ TK15 |
| `hi` | Rewata Dhamma, *Abhidharma Prakāśinī* (Varanasi, 1967) |
| `ja` | 南伝大蔵経 q.65 «摂阿毘達磨義論», dịch giả Mizuno Kōgen |

> **Cảnh báo riêng cho tiếng Nhật:** từ vựng Phật giáo Nhật gần như hoàn toàn
> theo hệ Đại thừa/Sanskrit. Một dịch giả không bám glossary sẽ vô thức nhập
> nghĩa Đại thừa vào thuật ngữ Theravāda. `ja` là ngôn ngữ rủi ro cao nhất
> trong 5 ngôn ngữ, dù nhìn bề ngoài có vẻ dễ nhất.

**1.2 — Bản dịch dở dang làm hỏng bài kiểm tra.**
Đã kiểm chứng: nếu `correctAnswer` được dịch mà `distractors` còn tiếng Việt,
đáp án đúng trở thành phương án *khác biệt duy nhất* → học viên đoán được mà
không cần hiểu. Đây là lỗi phổ biến nhất của bản dịch nửa chừng, nên nó được
nâng lên **hard rule H5**.

**1.3 — Font hiện tại không đủ glyph cho nội dung.**
`tool/subset_fonts.py` chỉ subset từ ARB. Kiểm tra thực tế trên một đoạn nội
dung ngắn: **thiếu 28 kanji (ja), 21 chữ Hán (zh), 4 (si), 4 (my), 3 (hi)** →
hiện ô vuông ☐. Đã sửa trong lần bàn giao này.

---

## 2. PHÂN TẦNG NỘI DUNG

| Tier | Nội dung | Số mục | Ký tự/ngôn ngữ | Ghi chú |
|---|---|---|---|---|
| **Tier A** | Tên + mô tả thực thể: 121 Tâm, 52 Tâm Sở, 28 Sắc, 16 Nghiệp, 12 Duyên, 4 Lộ | 233 thực thể | ~84.500 | Ngắn, lặp nhiều, bám glossary chặt |
| **Tier B** | Bài học: 50 lesson section, 150 review card, 135 quiz seed | 335 mục | ~96.300 | Văn xuôi, cần dịch giả am hiểu giáo lý |
| **Tổng** | | | **~180.800** | = 2.974 ô dịch |

**Thứ tự bắt buộc: Glossary → Tier A → Tier B.**
Tier A dùng lại đúng vốn từ của glossary; làm xong Tier A thì Tier B chỉ còn là
văn xuôi nối các thuật ngữ đã chốt. Làm ngược lại sẽ phải sửa hai lần.

---

## 3. LỘ TRÌNH 4 GIAI ĐOẠN (5 ngôn ngữ song song)

### GIAI ĐOẠN 0 — Hạ tầng ✅ **ĐÃ XONG trong lần bàn giao này**

| Task | Nội dung | Trạng thái |
|---|---|---|
| L10N-00 | Registry ngôn ngữ nội dung, bỏ hardcode `vi`/`en` | ✅ |
| L10N-01 | Bộ chọn ngôn ngữ nội dung đọc từ registry | ✅ |
| L10N-02 | Sinh worksheet dịch (`init_locale.py`) | ✅ |
| L10N-03 | Trình kiểm tra bản dịch (6 hard + 5 soft) | ✅ |
| L10N-04 | Sinh glossary Pāḷi 324 mục | ✅ |
| L10N-05 | Sửa pipeline font để subset cả nội dung | ✅ |
| L10N-06 | Nối kiểm tra vào `tool/check_localizations.py` | ✅ |
| L10N-07 | Test Dart cho registry + chuỗi fallback | ✅ |

### GIAI ĐOẠN 1 — Glossary (chặn tất cả phần sau)

| Task | Nội dung | Đầu ra |
|---|---|---|
| L10N-10 | Mỗi ngôn ngữ chốt **324 headword** theo nguồn quy chiếu ở §1.1 | `l10n_work/glossary.csv` |
| L10N-11 | Peer review glossary bởi người thứ hai biết Abhidhamma | Ký duyệt |
| L10N-12 | Senior approval — không được bỏ qua với `ja` và `hi` | Ký duyệt |

**Ưu tiên trong glossary** (thứ tự cột đã sắp sẵn trong CSV):
52 cetasika → 109 key term → 28 rūpa → 16 nghiệp → 10 duyên → 4 lộ → 105 citta.
*Tên citta là danh từ ghép* (vd. `Somanassa-sahagataṃ Diṭṭhigatasampayuttaṃ
Asaṅkhārikaṃ`) nên tự suy ra được từ các thành tố đã chốt — làm cuối cùng.

> **Tiêu chí ra khỏi giai đoạn:** `build_glossary.py --report` ≥ 95% cho ngôn
> ngữ đó. Chưa đạt thì **không** bắt đầu Tier A.

### GIAI ĐOẠN 2 — Tier A (thực thể)

| Task | Nội dung |
|---|---|
| L10N-20 | Dịch 52 tâm sở + 28 sắc + 16 nghiệp + 12 duyên + 4 lộ |
| L10N-21 | Dịch 121 tâm (ghép từ thành tố đã chốt, phần lớn cơ giới) |
| L10N-22 | `check_content_locale.py <loc> --glossary` sạch hard error |
| L10N-23 | Bật `status: draft` trong registry → ngôn ngữ xuất hiện trong app |

**Tiêu chí ra:** 0 hard error; coverage Tier A 100%; UI hiện nhãn `DRAFT`.

### GIAI ĐOẠN 3 — Tier B (bài học)

| Task | Nội dung |
|---|---|
| L10N-30 | 50 lesson section (giữ nguyên số đoạn `body` như bản gốc) |
| L10N-31 | 150 review card |
| L10N-32 | 135 quiz seed — **dịch trọn gói** câu hỏi + đáp án + nhiễu (rule H5) |
| L10N-33 | Đối chiếu `sourceRefs` — mọi khẳng định vẫn truy được về trang PDF |

### GIAI ĐOẠN 4 — Duyệt & phát hành

| Task | Nội dung |
|---|---|
| L10N-40 | Native doctrinal review toàn bộ theo Editorial Workflow (blueprint §I) |
| L10N-41 | `status: draft` → `reviewed`, gỡ nhãn DRAFT |
| L10N-42 | Chạy lại `subset_fonts.py`, kiểm ngân sách dung lượng (§6) |
| L10N-43 | QA thiết bị thật: đủ glyph, xuống dòng, text scale 80–150% |

---

## 4. QUY TRÌNH LÀM VIỆC

```bash
# 1. Chốt thuật ngữ trước (một lần cho cả 5 ngôn ngữ)
python3 tool/content/build_glossary.py
#    → điền cột hi/zh/zh_TW/si/my/ja trong l10n_work/glossary.csv
python3 tool/content/build_glossary.py --report

# 2. Sinh worksheet dịch (idempotent — chạy lại không mất bản dịch đã có)
python3 tool/content/init_locale.py hi zh zh_TW si my ja
python3 tool/content/init_locale.py my --tier a      # chỉ Tier A

# 3. Dịch: thay mọi "TODO" trong l10n_work/content_<loc>.worksheet.json
#    Mỗi trường có sẵn khối _src kèm nguyên bản vi + tham chiếu en.

# 4. Kiểm tra khi đang làm
python3 tool/content/check_content_locale.py hi \
    --file l10n_work/content_hi.worksheet.json --glossary

# 5. Đưa vào bản phát hành (bỏ _src và mọi TODO còn sót)
python3 tool/content/init_locale.py hi --strip

# 6. Cổng cuối
python3 tool/check_localizations.py
python3 tool/subset_fonts.py         # cần fonttools + gh CLI
flutter test
```

**Bật một ngôn ngữ trong app:** sửa đúng **một dòng** trong
`lib/core/localization/content_languages.dart` — đổi `status` từ `planned`
sang `draft`, rồi sang `reviewed`. Bộ chọn, chuỗi fallback, cảnh báo và
persistence tự động theo.

---

## 5. AN TOÀN GIÁO LÝ — CÁC LUẬT ĐƯỢC CÔNG CỤ ÉP

`tool/content/check_content_locale.py` là **Content Governance Lớp 2 cho bản
dịch**, song song với `data_validator.dart` (vốn chỉ gác dữ liệu cấu trúc).

### Hard — chặn phát hành (exit 1)

| Mã | Luật | Vì sao |
|---|---|---|
| **H1** | ID lạ, không có trong nguồn | Gõ sai → mục đó không bao giờ hiển thị |
| **H2** | Sửa `pali` / `type` / `sourceRefs` | Pāḷi là neo xuyên ngôn ngữ; đổi = mất dấu vết kiểm chứng |
| **H3** | Còn sót `TODO` | Không bao giờ để học viên thấy placeholder |
| **H4** | Nhiễu trùng đáp án / trùng nhau | Hai đáp án đúng |
| **H5** | Quiz lẫn ngôn ngữ | Đáp án đúng trở thành phương án khác biệt duy nhất → đoán được |
| **H6** | Vi phạm schema (card rỗng, thiếu đáp án) | Parser Dart sẽ **âm thầm bỏ** mục đó |

### Soft — cảnh báo cho người duyệt

| Mã | Luật |
|---|---|
| **S1** | Giống hệt nguyên bản tiếng Việt (chưa dịch) |
| **S2** | Còn dấu tiếng Việt trong locale khác |
| **S3** | Coverage dưới ngưỡng |
| **S4** | Số đoạn `body` khác bản gốc |
| **S5** | Không dùng đúng thuật ngữ đã chốt trong glossary |

### Bất biến không bao giờ được dịch

```
id  •  namePali / pali  •  type  •  sourceRefs
bhumiGroup, vedana, group, causes… (mọi trường quan hệ/cấu trúc)
```

Chỉ **văn bản hiển thị** được dịch. Dữ liệu cấu trúc ở `assets/data/*.json`
vẫn là nguồn chân lý duy nhất cho quan hệ và validation — không đụng tới.

---

## 6. NGÂN SÁCH DUNG LƯỢNG (Offline-First)

Font subset hiện tại: **4,06 MiB** tổng. Sau khi có nội dung:

| Subset | Hiện tại | Dự kiến | Ghi chú |
|---|---|---|---|
| `NotoSansJPApp` | 244 KiB | ~0,9–1,5 MiB | ja hiện chỉ có 101 chữ Hán; nội dung cần 1.200–2.000 |
| `NotoSansSCApp` | 188 KiB | ~0,9–1,5 MiB | tương tự |
| `NotoSansTCApp` | 192 KiB | ~0,9–1,5 MiB | tương tự |
| `NotoSansDevanagariApp` (hi) | 384 KiB | +50–100 KiB | hệ chữ cái, tăng ít |
| `NotoSansSinhalaApp` (si) | 713 KiB | +50–100 KiB | hệ chữ cái |
| `NotoSansMyanmarApp` (my) | 235 KiB | +50–100 KiB | hệ chữ cái |

**Dự phòng ~3–4 MiB tăng thêm, chủ yếu do 3 subset CJK.**
Nếu vượt ngân sách app: cân nhắc tách font CJK thành *deferred component*
(Android) / *on-demand resource* (iOS), tải khi người dùng thực sự chọn ngôn
ngữ đó. **Không** rơi về font hệ thống — sẽ phá vỡ nguyên tắc Offline-First.

JSON nội dung: mỗi locale ~250–600 KiB, 5 ngôn ngữ ≈ +2 MiB. Chấp nhận được.

---

## 7. RỦI RO

| Rủi ro | Mức | Giảm thiểu |
|---|---|---|
| Dịch giả nhập nghĩa Đại thừa vào thuật ngữ Theravāda (`ja`) | **Cao** | Glossary bắt buộc + S5 + senior review không được bỏ qua |
| Bản dịch nửa chừng làm hỏng quiz | Cao | H5 chặn cứng |
| Không tìm được người duyệt bản xứ | Cao | Trạng thái `draft` cho phép ship có cảnh báo, không phải chờ hoàn hảo |
| Dung lượng app phình vì CJK | Trung bình | §6; deferred component nếu cần |
| Nguồn Việt đổi sau khi đã dịch | Trung bình | ID ổn định + worksheet idempotent → chỉ dịch phần đổi |
| Nhầm zh vs zh_TW | Thấp | Tách registry; `zh_TW → zh → en → vi` |
| Chọn nhầm ngôn ngữ không đọc được | Thấp | Endonym + tag Latin; nhấn giữ để khôi phục ngôn ngữ hệ thống |

---

## 8. TIÊU CHÍ HOÀN THÀNH

Một ngôn ngữ được coi là **shipped (`reviewed`)** khi:

- [ ] Glossary ≥ 95% và đã có senior approval
- [ ] `check_content_locale.py <loc> --glossary` → **0 hard error**
- [ ] Coverage Tier A = 100%, Tier B ≥ 95%
- [ ] `check_localizations.py` sạch
- [ ] `flutter test` xanh
- [ ] Chạy lại `subset_fonts.py`, không còn ô vuông ☐ trên thiết bị thật
- [ ] Native doctrinal review xong theo Editorial Workflow
- [ ] Kiểm thử text scale 80–150%, không vỡ layout
- [ ] `status` = `reviewed` trong `content_languages.dart`

Chưa đủ thì để `draft`: người học vẫn dùng được, có cảnh báo, và mọi trường
chưa dịch **tự động rơi về `en` rồi `vi`** — không bao giờ trắng nội dung.

---

## 9. GHI CHÚ KIẾN TRÚC

**Ngôn ngữ giao diện và ngôn ngữ nội dung là hai trục độc lập.** Người Sri
Lanka có thể để giao diện tiếng Anh nhưng đọc nội dung tiếng Sinhala. Đây là
thiết kế có chủ đích, không phải thiếu sót — vì vậy có hai registry riêng:

| | Registry | Số lượng | Lý do khác nhau |
|---|---|---|---|
| Giao diện | `supportedAppLanguages` | 26 | Nhãn ngắn, dịch máy rồi rà là đủ |
| Nội dung | `kContentLanguages` | 8 (2 shipped) | Giáo lý — sai là dạy sai Pháp |

**Chuỗi fallback từng-trường**, không phải từng-file: một bản dịch làm dở sẽ
xuống cấp *từng trường một* về `en` rồi `vi`, nên không bao giờ có module trống.
`zh_TW` mượn `zh` trước khi mượn `en` (người đọc Hán phồn thể hiểu Hán giản thể
hơn tiếng Anh nhiều).

---

*Phù hợp `doc/blueprint.md` (Content Governance 2 lớp) và `doc/versioning_policy.md`.
Đề xuất: hoàn thành 5 ngôn ngữ = milestone MINOR (`v0.3.0`).*
