# Báo cáo phân tích coverage chi tiết

**Ngày:** 2026-10-08  
**Công cụ:** tool/check_coverage_detailed.py

## Kết quả chính

### ✅ Coverage slot: 100% (572/572)

**TẤT CẢ 17 modules đều có đủ:**
- ✅ lessonSections
- ✅ reviewCards  
- ✅ quizSeeds

### ⚠️ Đoạn văn nhiều hơn nguồn

Một số module có nhiều đoạn văn hơn nguồn trong cùng slot:

| Module | Nguồn | Đích | Chênh lệch |
|--------|-------|------|------------|
| M4_AKUSALA | 52 đoạn | 56 đoạn | +4 |
| M5_SOBHANA | 14 đoạn | 19 đoạn | +5 |
| M12_VO_NHAN | 16 đoạn | 30 đoạn | +14 |
| M13_SAC_GIOI | 14 đoạn | 21 đoạn | +7 |

## Giải thích

### Coverage 103.2% không có nghĩa là slot thừa

Công cụ `check_content_locale.py` đếm **tất cả các trường dữ liệu** (fields), bao gồm:
- Số đoạn văn trong body
- Số keyTerms trong mỗi section
- Số paragraph trong mỗi section

**Ví dụ:** Một slot có 5 đoạn nguồn nhưng 9 đoạn đích = 9 fields thay vì 5 fields.

### Đoạn văn nhiều hơn là hợp lý

Tiếng Nhật thường tách đoạn ngắn hơn tiếng Việt. Điều này là:
- ✅ **Hợp lý** nếu đoạn bổ sung giải thích rõ hơn
- ⚠️ **Cần rà soát** nếu đoạn trùng lặp hoặc không cần thiết

## Chi tiết từng module

### M5_SOBHANA (+5 đoạn)

```
Section 1 (M5_S01): ✅ 5/5 đoạn
Section 2 (M5_S02): ⚠️ 9/5 đoạn (+4)
Section 3 (M5_S03): ⚠️ 5/4 đoạn (+1)
```

**Phân tích:**
- Section 2 giải thích chi tiết về 8 đại thiện tâm và phân loại theo 3 cặp
- Đoạn bổ sung có thể là giải thích rõ hơn về từng cặp phân loại
- **Cần rà soát:** Xác định đoạn nào là bổ sung hợp lý

### M12_VO_NHAN (+14 đoạn)

```
Section 1 (M12_S01): ⚠️ 6/4 đoạn (+2)
Section 2 (M12_S02): ⚠️ 8/4 đoạn (+4)
Section 3 (M12_S03): ⚠️ 9/4 đoạn (+5)
Section 4 (M12_S04): ⚠️ 7/4 đoạn (+3)
```

**Phân tích:**
- Module này giải thích về 18 tâm vô nhân
- Có nhiều ví dụ và giải thích chi tiết
- **Cần rà soát:** Xác định đoạn nào là bổ sung hợp lý

### M13_SAC_GIOI (+7 đoạn)

```
Section 1 (M13_S01): ⚠️ 6/4 đoạn (+2)
Section 2 (M13_S02): ⚠️ 8/5 đoạn (+3)
Section 3 (M13_S03): ⚠️ 7/5 đoạn (+2)
```

**Phân tích:**
- Module này giải thích về 15 tâm sắc giới
- Có nhiều chi tiết về thiền na và lợi ích
- **Cần rà soát:** Xác định đoạn nào là bổ sung hợp lý

## Khuyến nghị

### 1. Không ép buộc 1:1 đoạn văn

Theo ý kiến ChatGPT (lượt 3):
> "Cho phép một slot có nhiều đoạn nếu hệ thống hỗ trợ; không ép số đoạn 1:1."

### 2. Rà soát nội dung bổ sung

Cần kiểm tra từng đoạn bổ sung để xác định:
- ✅ **Hợp lý**: Giải thích rõ hơn, ví dụ minh họa
- ⚠️ **Trùng lặp**: Nội dung lặp lại không cần thiết
- ❌ **Không cần thiết**: Thông tin ngoài phạm vi

### 3. Cập nhật trạng thái

**Trạng thái đúng:**
> "Đã dịch đủ theo kiểm tra tự động hiện tại (100% slot coverage); đối soát nội dung bổ sung đang chờ"

## Kết luận

✅ **Coverage slot: 100%** - TẤT CẢ modules đều đầy đủ  
⚠️ **Đoạn văn: 103.2%** - Có đoạn bổ sung, cần rà soát nội dung  
📝 **Trạng thái:** Sẵn sàng để người bản ngữ review chi tiết
