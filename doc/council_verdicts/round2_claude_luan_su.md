# DOCTRINE-L10N-001 — PHIẾU VÒNG 2
**AI-Luận sư (Claude)**

Tệp: `round2_claude_luan_su.md`
Ngày: 2026-10-21
Trạng thái: Đề xuất phản biện, chưa có hiệu lực giáo lý. Người duyệt trên IN4-38 quyết định cuối.

> Lưu nguyên văn từ phiên hội đồng do chủ dự án chạy (nhận ngày 2026-10-21, model Claude Sonnet 5).
> Advisory only — chưa áp dụng vào dữ liệu.

**Lời mở đầu (bắt buộc vì lý do minh bạch):** Tôi đã đọc nguyên văn 3 phiếu Vòng 1 của ChatGPT (G), Gemini (M), Red Team (R) và `round1_consensus.md`. Tôi KHÔNG đọc phiếu Vòng 2 của ba thành viên kia (không được cung cấp). Việc chấm điểm dưới đây áp dụng cùng một thước đo cho cả ba, kể cả khi điều đó có nghĩa là tôi phải tự phê bình chính câu trả lời Vòng 1 của mình — cụ thể ở **Q3, tôi đã sai** khi nói đạo tâm làm āsevana cho quả, và G/M/R đều đúng khi bác bỏ điều này. Tôi sửa ngay trong phiếu này, không chờ Vòng 3.

---

## 1. CHẤM RUBRIC — G / M / R (Vòng 1)

Quy ước cột: Nguồn(30) · Giáo lý(20) · Repo(20) · Việt(15) · Định dạng(10) · Bất định(5) · **Tổng**

### Q1 — Ārammaṇa-paccaya

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 20 | 20 | 20 | 14 | 9 | 5 | **88** |
| M | 23 | 20 | 20 | 14 | 10 | 3 | **90** |
| R | 22 | 20 | 20 | 14 | 10 | 2 | **88** |

*Trừ điểm:* Không ai trích được đoạn Pāḷi nguyên văn kèm số đoạn CST xác minh được — tất cả đều trừ ở cột Nguồn. M được cộng vì nêu số đoạn §13 cụ thể (dù chưa xác minh được tôi vẫn cho điểm cao hơn vì tăng khả năng tra cứu cho người duyệt). G được điểm "Bất định" cao nhất vì tự khai rõ nhất giới hạn kiểm chứng của chính mình.

### Q2 — Pacchājāta-paccaya

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 18 | 18 | 16 | 14 | 6 | 5 | **77** |
| M | 21 | 19 | 19 | 14 | 10 | 3 | **86** |
| R | 20 | 18 | 18 | 14 | 9 | 2 | **81** |

*Trừ điểm:* G đúng về nguyên tắc (phân biệt *sát-na* tục sinh với *loại* tâm tục sinh) nhưng từ chối chốt số 85 nên mất điểm "Repo" và "Định dạng" (dữ liệu JSON cần một con số, không phải một đoạn mô tả mở). M chốt số + giữ đúng lý do → điểm cao nhất nhóm này.

### Q3 — Āsevana-paccaya ⚠️ (nơi tôi tự sửa sai)

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 15 | 19 | 14 | 13 | 6 | 5 | **72** |
| M | 20 | 19 | 18 | 14 | 10 | 3 | **84** |
| R | 18 | 19 | 17 | 14 | 9 | 2 | **79** |

*Trừ điểm:* Cả ba đều đúng điểm mấu chốt mà **tôi sai ở Vòng 1**: đạo tâm KHÔNG làm āsevana-paccaya cho quả (phala sinh khởi do chính oai lực của đạo — magga-vīthi-vipāka —, không qua cơ chế trùng dụng, vì magga chỉ khởi một sát-na duy nhất rồi phala kế tục ngay, không phải "lặp lại đồng loại"). Tôi cho điểm Giáo lý cao cho cả ba (18–19/20) chính vì bắt đúng lỗi này. R bị trừ nhẹ vì gọi 18 tâm duy tác là "duy tác hữu nhân" — cách gọi mơ hồ, không tách rõ 8 đại duy tác + 9 duy tác đáo đại + 1 hasituppāda như yêu cầu của PM.

### Q4 — Adhipati-paccaya (cảnh trưởng)

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 12 | 14 | 12 | 13 | 9 | 5 | **65** |
| M | 24 | 18 | 19 | 14 | 10 | 2 | **87** |
| R | 12 | 10 | 14 | 13 | 5 | 1 | **55** |

*Trừ điểm:* M là người duy nhất trích được **số bảng cụ thể** (CMA VIII §14, Table 8.4) và đưa ra giả thuyết hoán đổi paccayaDhamma/paccayuppanna có thể kiểm định được — điểm Nguồn cao nhất toàn phiếu Vòng 1. R bị trừ nặng vì **tự mâu thuẫn**: chốt 28 ở phán quyết chính nhưng viết "chuẩn CMA là 52 cittas" ở đòn tấn công #5 — đây là lỗi nghiêm trọng về tính nhất quán nội bộ, trừ thẳng vào cả Nguồn, Giáo lý và Định dạng. G đúng khi từ chối đoán nhưng không đóng góp được hướng giải, nên điểm Repo thấp.

### Q5 — Hetu/Jhāna operatesInPaticca

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 14 | 15 | 20 | 13 | 8 | 5 | **75** |
| M | 16 | 17 | 20 | 14 | 10 | 2 | **79** |
| R | 8 | 10 | 10 | 12 | 8 | 1 | **49** |

*Trừ điểm:* R đề xuất thêm `[PD_01,PD_02][PD_02,PD_07]` nhưng **không có trang** cho "Toát Yếu Về Duyên (Giác Chánh)" — vi phạm trực tiếp luật cứng mục 1 ("Không có nguồn → ghi KHÔNG XÁC MINH ĐƯỢC"). Đây là lỗi nặng nhất của R trong toàn phiếu, trừ điểm ở cả 3 cột đầu.

### Q6 — zh_TW Āsevana

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 10 | 15 | 15 | 13 | 8 | 5 | **66** |
| M | 10 | 16 | 15 | 13 | 10 | 1 | **65** |
| R | 9 | 14 | 14 | 13 | 9 | 3 | **62** |

*Trừ điểm:* Không ai trích nguyên văn có trang. M ghi "cao" cho độ tin cậy dù chưa xác minh — đây là **lệch rubric nghiêm trọng** (khai báo không chắc = 5 điểm, M chỉ được 1 vì tự tin quá mức so với bằng chứng thực tế có). R đề xuất một đáp án thứ ba (習緣) không khớp cả hai phiếu kia, càng cho thấy chưa ai chạm được nguồn gốc.

### Q7 — 禪/禅

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 25 | 20 | 20 | 15 | 10 | 5 | **95** |
| M | 24 | 20 | 20 | 15 | 10 | 4 | **93** |
| R | 23 | 20 | 20 | 15 | 10 | 4 | **92** |

*Ghi chú:* Đây là câu duy nhất cả 4 thành viên (tính cả tôi) đồng thuận tuyệt đối ngay từ Vòng 1 — đúng với thực tế là đã được tích hợp cơ học `ce97b61`).

### Q8 — Chanda

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 18 | 20 | 18 | 14 | 9 | 5 | **84** |
| M | 17 | 17 | 17 | 14 | 10 | 3 | **78** |
| R | 5 | 15 | 15 | 12 | 5 | 2 | **54** |

*Trừ điểm:* G là người duy nhất ghi rõ một điểm giáo lý quan trọng — **chanda không phải tự tính bất thiện** (nó có mặt trong cả tâm thiện, không được dịch thành "tham ái" trong phần giải thích) — xứng đáng điểm Giáo lý cao nhất nhóm. R bị trừ nặng vì **thiếu hẳn trường NGUỒN** trong câu trả lời Q8 — vi phạm định dạng bắt buộc mục 6 và vi phạm thẳng luật cứng ("không có nguồn → không đoán").

### Q10 — ja: bộ 4 nghiệp

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 12 | 17 | 16 | 13 | 8 | 5 | **71** |
| M | 10 | 15 | 16 | 13 | 10 | 1 | **65** |
| R | 8 | 13 | 12 | 13 | 9 | 1 | **56** |

*Trừ điểm:* G là người duy nhất phát hiện lỗi chính tả hiện đại — 壓迫 (R dùng) không phải shinjitai chuẩn (phải là 圧迫) — cộng điểm Giáo lý/kỹ thuật. M tự tin "cao" cho toàn bộ bốn nghiệp dù không có trang sách Nhật nào được trích — lệch rubric "Bất định". R dùng cả kanji cũ (壞 thay vì 壊) và đề xuất 親因業 cho Janaka — một lựa chọn lệch khỏi mọi phiếu khác (生業) mà không giải thích tại sao.

### Q11 — hi: chính sách

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 12 | 19 | 19 | 14 | 9 | 5 | **78** |
| M | 14 | 19 | 20 | 15 | 10 | 2 | **80** |
| R | 10 | 19 | 19 | 15 | 10 | 2 | **75** |

*Ghi chú:* M dùng một kỹ thuật chứng cứ gián tiếp hợp lý — đối chiếu cách viết đã ổn định ở cột si/my/th để suy luận chính sách hi — tôi cộng điểm Nguồn cao hơn G/R vì đây là bằng chứng thực tế có thể kiểm tra ngay trong glossary, dù không thay thế được nguồn Hindi gốc.

### Q12 — hi: Puññābhisaṅkhāra

| AI | Nguồn | GL | Repo | Việt | ĐD | BĐ | **Tổng** |
|---|---|---|---|---|---|---|---|
| G | 15 | 20 | 20 | 15 | 10 | 5 | **85** |
| M | 13 | 20 | 20 | 15 | 10 | 2 | **80** |
| R | 10 | 14 | 12 | 14 | 7 | 1 | **58** |

*Trừ điểm:* R trả lời "अभिसंखार" — **thiếu tiền tố पुञ्ञा** — đây không phải cùng một mục từ đang được hỏi (glossary hỏi về *Puññābhisaṅkhāra*, không phải *abhisaṅkhāra* trần). Tôi trừ mạnh ở Giáo lý và Repo vì câu trả lời không giải quyết đúng vấn đề nêu ra.

---

## 2. TRẢ LỜI PHẢN BIỆN ĐỎ #1 — tái suy luận từ chuỗi JSON thô

Tôi đọc lại 4 chuỗi **không kèm khung dẫn dắt "?—chính xác:"** để tự kiểm tra xem phán quyết Vòng 1 của tôi có bị thiên lệch bởi cách đặt câu hỏi hay không.

**PC_02 paccayuppanna:** `"89 tâm và 52 tâm sở (trừ tâm không bắt cảnh)"`
**→ GIỮ phán quyết ĐỔI (xóa ngoặc).** Không cần khung dẫn dắt gốc mới thấy vấn đề: "tâm không bắt cảnh" là một phạm trù rỗng trong Abhidhamma — citta theo định nghĩa (*ārammaṇa-vijānana-lakkhaṇa*) luôn có cảnh. Mệnh đề này tự mâu thuẫn với chính định nghĩa citta, không phải lỗi do tôi bị dẫn dắt.

**PC_11 paccayaDhamma:** `"85 tâm (trừ 2 ngũ thức thân và tục sanh) và 52 tâm sở"`
**→ GIỮ phán quyết ĐỔI.** Đọc độc lập: "trừ 2 ngũ thức thân" sai vì ngũ song thức (10 tâm, không phải "2") vẫn sinh trong cõi ngũ uẩn, có sắc thân đang trụ trước đó, không có lý do giáo lý nào loại chúng khỏi hậu sanh duyên. Lỗi nằm ở chính nội dung, không phải ở cách đặt câu hỏi.

**PC_12 paccayaDhamma:** `"47 đổng lực hiệp thế và 52 tâm sở tương ưng"`
**→ ĐỔI (khác với những gì tôi tưởng ban đầu).** Đọc riêng câu này (không có khung "?"), tôi nhận ra bản thân con số "47" không sai, nhưng câu bị **thiếu điều kiện loại trừ đổng lực cuối** — nếu in nguyên văn này vào JSON, người đọc sẽ hiểu rằng toàn bộ 47 đổng lực đều làm paccayaDhamma trong mọi trường hợp, kể cả đổng lực cuối cùng của lộ — **sai**. Đây là điểm tôi suýt bỏ sót nếu không đọc lại bản "sạch". Phải thêm: "trừ đổng lực cuối cùng của mỗi lộ trình".

**PC_03 paccayuppanna:** `"Các danh pháp câu sanh; với cảnh trưởng là 84 tâm (trừ tâm quả vô nhân...) và tâm sở tương ưng."`
**→ GIỮ phán quyết ĐỔI, nhưng hạ độ tin cậy.** Đọc độc lập, câu này bị cắt cụt bởi dấu "..." — không phải lỗi giáo lý mà là lỗi dữ liệu không hoàn chỉnh. Việc tôi đề xuất số thay thế (28/38) là suy luận thêm từ giáo lý bên ngoài, không phải chỉ "sửa theo gợi ý có sẵn" — tôi xác nhận tôi không bị dẫn dắt vào một con số cụ thể nào bởi câu hỏi gốc, vì câu hỏi gốc không gợi ý số nào cả.

**Kết luận về đòn tấn công #1 (leading question):** Tôi xác nhận lại rằng phán quyết của tôi cho Q1–Q4 không thay đổi khi tước bỏ khung dẫn dắt, **ngoại trừ việc tôi phát hiện thêm một lỗi ở Q3** (thiếu điều kiện loại trừ) mà bản có khung "?" (chỉ hỏi về con số 47 và việc đạo tâm) đã khiến tôi không chú ý đúng mức đến việc liệt kê điều kiện loại trừ trong chính câu paccayaDhamma. Đòn tấn công #1 của Red Team **có cơ sở một phần** — không phải vì nó làm tôi trả lời sai, mà vì nó làm tôi tập trung vào đúng câu hỏi được hỏi mà bỏ sót một lỗi liền kề không được hỏi tới.

---

## 3. SÁU ĐIỂM CÒN VÊNH

### a. Q4 — 84 có phải là paccayaDhamma bị ghi nhầm sang paccayuppanna?

**PHÁN QUYẾT:** **Có khả năng cao, nhưng KHÔNG XÁC MINH ĐƯỢC tuyệt đối.** Giữa ba phương án nêu (28/38/52):

- **Loại 52** ngay lập tức: đây là số tâm sở, không phải số tâm — đối chiếu với chính câu JSON ("...và tâm sở tương ưng" là mệnh đề riêng, tách khỏi "84 tâm"), 52 không thể là đáp án cho paccayuppanna *tâm*. **R phải rút con số này**, như chính quy tắc hội đồng yêu cầu khi có tự mâu thuẫn.
- **Giữa 28 và 38:** tôi rút lại con số 38 của chính mình ở Vòng 1. Lý do: 38 (giả thuyết của tôi) bao gồm cả 18 tâm đáo đại (mahaggata), nhưng ārammaṇa-paccayuppanna đòi hỏi tâm *coi trọng một cảnh bên ngoài* — các tâm đáo đại (thiền-na) lấy đề mục thiền (kasiṇa-nimitta) làm cảnh qua cơ chế sahajāta/upanissaya của chính thiền chi, không phải qua "coi trọng cảnh" theo nghĩa ārammaṇādhipati. Cấu trúc 28 = 8 tham + 8 đại thiện + 4 đại duy tác tương ưng trí + 8 siêu thế **khớp chặt hơn** với nguyên tắc "chỉ các pháp có đủ *chanda/viriya/citta/paññā* mạnh để coi trọng cảnh mới là paccayuppanna của ārammaṇādhipati", và phù hợp với con số M trích dẫn (CMA VIII §14, Table 8.4) cũng như con số ban đầu của R (trước khi tự mâu thuẫn).

**ĐỘ TIN CẬY:** Vừa (không phải Cao, vì tôi không tự tay kiểm tra được trang/bảng 8.4 trong bản in cụ thể — tôi chỉ có thể xác nhận tính nhất quán nội tại của số 28 với cấu trúc Abhidhamma, không phải xác nhận nó đúng với chữ in trong sách Bodhi).

**ĐỀ XUẤT CHO TRƯỞNG LÃO:** Hai phương án — (1) 28 tâm theo cấu trúc trên, nguồn CMA VIII §14/Table 8.4 (M), cần xác minh trang; (2) KHÔNG XÁC MINH ĐƯỢC, giữ nguyên trường trống để app fallback English, chờ người duyệt tự tra bản in.

### b. Q2/Q3 — có nên in con số hay chỉ ghi lý do?

**PHÁN QUYẾT: NÊN IN CON SỐ, kèm lý do loại trừ đầy đủ trong cùng câu** — không chọn một trong hai, chọn cả hai, vì:
- Con số trần không kèm lý do (như bản "sạch" PC_12 ở mục 2) gây hiểu nhầm (đã chứng minh ở mục 2).
- Lý do không kèm con số (như cách G trả lời) không thể dịch nhất quán sang 7 locale vì không có gì cụ thể để đối chiếu thuật ngữ.

**Với Q3, liệt kê tường minh 18 duy tác:**

| Nhóm | Số lượng |
|---|---:|
| Bất thiện | 12 |
| Đại thiện | 8 |
| Thiện đáo đại | 9 |
| Đại duy tác | 8 |
| Duy tác đáo đại | 9 |
| Tiếu sinh (hasituppāda) | 1 |
| **Tổng** | **47** |

**Hasituppāda CÓ thuộc āsevana-paccaya.** Lý do: trong lộ tâm tiếu sinh của bậc A-la-hán, hasituppāda khởi lặp lại nhiều sát-na liên tiếp (giống như mọi đổng lực khác lặp 7 sát-na), nên các sát-na hasituppāda trước làm āsevana cho sát-na hasituppāda sau trong cùng chuỗi — đúng công thức Paṭṭhāna "kiriyābyākatā dhammā kiriyābyākatānaṃ dhammānaṃ āsevanapaccayena paccayo" (pháp duy tác vô ký làm āsevana cho pháp duy tác vô ký kế tiếp). Hasituppāda là duy tác vô nhân nhưng vẫn thuộc nhóm kiriyābyākata.

**NGUỒN:** Paṭṭhāna, Paccayaniddesa, Āsevanapaccaya (công thức kiriyābyākata); CMA Chương I (phân loại hasituppāda trong nhóm duy tác vô nhân) + Chương VIII (Āsevana).

**ĐỘ TIN CẬY:** Vừa — tôi tự tin về mặt cấu trúc số học (12+8+9+8+9+1=47 khớp), nhưng không có trang CST cụ thể xác nhận hasituppāda được liệt kê minh thị trong danh sách Āsevana của Paṭṭhāna (có thể nó chỉ được ngầm hiểu qua công thức chung "kiriyābyākata").

### c. Q5 — yêu cầu Red Team cung cấp trang hoặc rút đề xuất

**PHÁN QUYẾT: GIỮ TRỐNG — không đổi.** Red Team chưa cung cấp trang/đoạn cụ thể trong "Toát Yếu Về Duyên (Giác Chánh)" ở cả Vòng 1 lẫn phần trích dẫn tôi được đọc. Theo đúng luật cứng của hội đồng ("Không có nguồn → ghi KHÔNG XÁC MINH ĐƯỢC, không đoán"), đề xuất ADD của Red Team phải được coi là **chưa đủ điều kiện**, không phải vì nó sai về giáo lý (thực ra việc Hetu liên hệ avijjā→saṅkhāra là hợp lý trực giác — vô minh/si chính là một trong 6 nhân), mà vì **chưa có bằng chứng văn bản cho cách gán cụ thể** mà cách trình bày của VDP yêu cầu.

**Nếu Red Team ở Vòng 3 cung cấp được trang cụ thể, tôi sẽ đổi phán quyết** — đây không phải lập trường cố định, mà là lập trường có điều kiện: "GIỮ TRỐNG cho đến khi có trang."

### d. Q6 — 習行緣 / 習緣 / chưa xác minh

**PHÁN QUYẾT (SỬA LẠI SO VỚI VÒNG 1 của chính tôi): KHÔNG XÁC MINH ĐƯỢC.**

Ở Vòng 1 tôi và Gemini cùng chọn 習行緣 với độ tin cậy "Vừa"/"Cao". Sau khi đọc kỹ cả 4 phiếu, tôi nhận thấy **không ai trong bốn thành viên — kể cả tôi — thực sự trích được nguyên văn có số trang** từ 尋法比丘《阿毘達摩概要精解》 chương VIII hay 葉均《攝阿毘達磨義論》 phần 緣攝. "Vừa"/"Cao" của tôi và Gemini ở Vòng 1 là **quá tự tin so với bằng chứng thực có** — đây chính là loại lỗi tôi vừa trừ điểm nặng ở M tại mục 1 (Q6, Q10), nên công bằng mà nói tôi phải tự áp dụng cùng tiêu chuẩn cho chính mình.

**Tôi hạ phán quyết xuống KHÔNG XÁC MINH ĐƯỢC**, dù vẫn giữ nhận định cá nhân (không phải phán quyết chính thức) rằng 習行緣 có vẻ hợp lý về ngữ nghĩa hơn 習緣 hay 重複緣.

**ĐỘ TIN CẬY:** Thấp.

### e. Q10 — chốt bộ 4 cùng lúc, shinjitai hiện đại

**PHÁN QUYẾT (đề xuất bộ 4, chưa chốt cuối):**

| Pāḷi | Đề xuất | Shinjitai kiểm tra | Đồng thuận hiện tại |
|---|---|---|---|
| Janaka-kamma | 生業 | ✓ (không có vấn đề tự dạng) | C, M đồng ý; G/R khác |
| Upatthambhaka-kamma | 支持業 | ✓ | 3-4/4 |
| Upapīḷaka-kamma | 妨害業 | ✓ | 3-4/4 |
| Upaghātaka-kamma | 破壊業 | ✓ (壊 không phải 壞) | Phân tán nhất: C ban đầu (壊業), M (殺害業), R (摧壞業 — sai tự dạng) |

**LÝ DO chọn 破壊業 thay vì 殺害業 (của M) cho Upaghātaka:** 殺害 nghĩa hẹp là "giết hại sinh mạng" — đúng với VÍ DỤ kinh điển thường nêu (nghiệp đoạn mạng sống) nhưng KHÔNG bao trùm được định nghĩa rộng hơn của upaghātaka: "nghiệp cắt đứt/triệt tiêu HIỆU LỰC của nghiệp khác", áp dụng cả cho trường hợp không liên quan đến sinh mạng (ví dụ một nghiệp thiện mạnh làm triệt tiêu quả của nghiệp bất thiện yếu hơn). 破壊 (phá hoại, hủy hoại) giữ được nghĩa rộng này.

**ĐỘ TIN CẬY:** Vừa cho 2 mục giữa (支持業/妨害業); Thấp cho Janaka/Upaghātaka — **KHÔNG XÁC MINH ĐƯỢC** bằng trang sách Nhật cụ thể cho cả bốn. Không AI nào trong 4 phiếu đã làm được việc này.

**ĐỀ XUẤT:** Trình trưởng lão với candidate set trên, rõ ràng ghi "chưa xác minh trang ウ・ウェープッラ hoặc 水野弘元".

### f. Q11 — hợp nhất chính sách

**PHÁN QUYẾT: ĐỒNG Ý với dự thảo PM, với một sửa nhỏ.**

Dự thảo PM:
> Cột `hi` dùng Pāḷi chuyển tự Devanāgarī làm mặc định... Chỉ dùng dạng Sanskrit khi (a) thuật ngữ đó đã được một giáo trình Theravāda Hindi được chỉ định dùng ổn định, và (b) không gây lẫn với nghĩa Sarvāstivāda/Mahāyāna. Mọi ngoại lệ ghi vào ledger `doc/l10n_evidence/hi/` kèm trang.

**Sửa nhỏ đề xuất (hợp nhất với lập trường của G):** Thêm điều kiện (c): *"Khi cả hai dạng (Pāḷi-Devanāgarī và Sanskrit) đều được chứng thực trong tài liệu Theravāda Hindi, ưu tiên dạng phản ánh trực tiếp khóa Pāḷi nguồn để giữ nhất quán tra cứu giữa các cột ngôn ngữ."* — điều này dung hòa được cách diễn đạt khác của G ("thuật ngữ Theravāda-Hindi đã chứng thực đi trước") mà không mâu thuẫn với 3 phiếu kia, vì G không hề đề xuất Sanskrit hóa tự động — G chỉ nhấn mạnh ưu tiên bằng chứng thực tế hơn là suy luận máy móc.

**ĐỘ TIN CẬY:** Cao cho nguyên tắc; Vừa cho khả năng áp dụng (vì chưa ai trong 4 phiếu có bản in Rewata Dhamma 1967 trước mắt).

---

## 4. BẤT ĐỒNG VỚI AI KHÁC — TOÀN BỘ Q

| Q | Bất đồng còn lại sau Vòng 2 |
|---|---|
| Q1 | Không còn bất đồng nội dung với G/M/R. |
| Q2 | G chưa chốt số 85 (chỉ mô tả điều kiện); tôi giữ 85 vì cần một con số cụ thể để 7 locale dịch nhất quán — khác biệt về mức độ "dám chốt", không phải về giáo lý. |
| Q3 | **Tôi đã sửa sai, nay đồng thuận với G/M/R** về việc đạo không āsevana cho quả. Còn khác M/R ở chỗ liệt kê tường minh 18 duy tác (họ gộp chung). |
| Q4 | Tôi chuyển từ 38 → nghiêng về 28 (gần với M, R-ban đầu); vẫn **không chốt cứng** như M vì chưa tự kiểm tra được Table 8.4. Bác bỏ hẳn số 52 của R (tự mâu thuẫn). |
| Q5 | Đồng thuận G/M (giữ trống); không đồng ý R trừ khi có trang sách. |
| Q6 | **Tự hạ cấp độ tin cậy của chính mình** từ "Vừa" (ủng hộ 習行緣) xuống "Thấp/Không xác minh được" — cùng vị trí thận trọng với G, khác với lập trường quá tự tin của M, khác đáp án của R. |
| Q7 | Đồng thuận tuyệt đối 4/4, không bất đồng. |
| Q8 | Đồng thuận bỏ "一"; khác R ở việc R thiếu hẳn trường NGUỒN — không phải bất đồng nội dung mà là bất đồng về tính hợp lệ của câu trả lời. |
| Q10 | Đồng ý G/M ở 支持業/妨害業; khác cả ba ở Janaka/Upaghātaka — chọn 生業/破壊業, bác bỏ 殺害業 (M, quá hẹp nghĩa) và 親因業/摧壞業 (R, lệch quy ước + sai tự dạng). |
| Q11 | Đồng thuận hướng với cả ba; đề xuất thêm điều kiện (c) để hợp nhất với cách diễn đạt riêng của G. |
| Q12 | Đồng ý G/M (पुञ्ञाभिसंखार); bác bỏ đáp án của R (अभिसंखार — thiếu tiền tố, trả lời sai mục từ được hỏi). |

---

## 5. BẢNG CUỐI VÒNG 2 — AI-Luận sư (Claude)

| Q | Phán quyết của tôi sau Vòng 2 | Tin cậy | Đồng thuận ước tính | Sẵn sàng trình trưởng lão? |
|---|---|---|---|---|
| Q1 | 89 tâm + 52 tâm sở; xóa ngoặc | Cao | 4/4 | **Có** |
| Q2 | 85 tâm (trừ 4 quả vô sắc) + trừ sát-na tục sinh | Cao/Vừa | 3/4 (G chưa chốt số) | **Có** |
| Q3 | 47 đổng lực (liệt kê đủ 6 nhóm) trừ cuối lộ; đạo KHÔNG āsevana cho quả | Cao *(tự sửa)* | 4/4 về nguyên tắc loại trừ đạo→quả | **Có** |
| Q4 | Nghiêng 28, KHÔNG chốt cứng; loại hẳn 52 | Vừa | 2/4 rõ ràng (M + tôi-nghiêng); R tự mâu thuẫn, G từ chối | **Không** — trình 2 phương án |
| Q5 | GIỮ TRỐNG | Cao | 3/4 | **Có** |
| Q6 | KHÔNG XÁC MINH ĐƯỢC *(tự hạ so với Vòng 1)* | Thấp | 0/4 rõ ràng | **Không** |
| Q7 | 禪 thống nhất zh_TW | Cao | 4/4 | **Có** (đã landed) |
| Q8 | 欲, bỏ "一" | Cao | 4/4 (trừ R thiếu nguồn) | **Có** (đã landed) |
| Q10 | 生業/支持業/妨害業/破壊業 — chưa xác minh sách Nhật | Vừa/Thấp | 1–2/4 rõ ràng mỗi mục | **Không** |
| Q11 | Pāḷi-Devanāgarī mặc định + điều kiện (c) | Cao | 4/4 về nguyên tắc | **Có** |
| Q12 | पुञ्ञाभिसंखार | Cao | 3/4 (R trả lời sai mục từ) | **Có** |

**Q13:** Không trả lời theo yêu cầu của tin nhắn Vòng 2.

---

**Tự kiểm điểm cuối phiếu:** Việc tôi phải sửa Q3 và hạ cấp Q6 so với chính Vòng 1 của mình không phải là dấu hiệu hội đồng thất bại — đó chính xác là lý do giao thức này có Vòng 2. Tôi đề nghị PM ghi rõ trong `round2_consensus.md` rằng **cả bốn thành viên, kể cả thành viên viết lại phiếu này, đều có ít nhất một điểm bị chấm dưới 70/100 ở Vòng 1** — không có AI nào "thắng" tuyệt đối, đúng tinh thần mục 1: hội đồng đa AI không phải thẩm quyền giáo lý.
