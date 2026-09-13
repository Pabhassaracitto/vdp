# -*- coding: utf-8 -*-
"""Authored lesson content for M11–M14 (Vietnamese source).

M11  6 Tâm Sở Biệt Cảnh (Pakiṇṇaka)          — VDP-TamSo.pdf
M12  18 Tâm Vô Nhân (Ahetuka)                — VDP-Tam.pdf
M13  15 Tâm Sắc Giới (Rūpāvacara)            — VDP-Tam.pdf
M14  12 Tâm Vô Sắc Giới (Arūpāvacara)        — VDP-Tam.pdf

These modules close the study-tab coverage gap: together with M1–M10 every
one of the 52 cetasikas and 121 cittas in assets/data is now assigned to at
least one module (guarded by test/study_module_coverage_test.dart).
"""

TS = "VDP-TamSo.pdf"
TAM = "VDP-Tam.pdf"


def ref(file, page, note=None):
    d = {"file": file, "page": page}
    if note:
        d["note"] = note
    return d


M11_VI = {
    "title": "6 Tâm Sở Biệt Cảnh (Pakiṇṇaka)",
    "description": "Tầm, Tứ, Thắng Giải, Cần, Hỷ, Dục — nhóm Tợ tha chỉ có mặt trong một số tâm, thiện lẫn bất thiện.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M11_S01",
            "title": "Nhóm Biệt cảnh trong Tợ tha",
            "summary": "Aññasamāna chia 2: Biến hành 7 (M1) và Biệt cảnh 6 (module này).",
            "body": [
                "Nhóm Tâm sở Tợ tha (Aññasamāna) — chung với cái khác — chia làm 2 nhóm: Tâm sở Biến hành (Sabbacittasādhāraṇa) có 7 và Tâm sở Biệt cảnh (Pakiṇṇaka) có 6.",
                "Gọi là Biệt cảnh vì 6 tâm sở này chỉ có mặt trong MỘT SỐ tâm — rải rác theo từng tâm — khác hẳn Biến hành có mặt trong tất cả mọi tâm.",
                "Sáu tâm sở Biệt cảnh là: 1. Tầm (Vitakka), 2. Tứ (Vicāra), 3. Thắng giải (Adhimokkha), 4. Cần (Vīriya), 5. Hỷ (Pīti), 6. Dục (Chanda).",
                "Vì thuộc nhóm Tợ tha, 6 tâm sở này không chuyên thiện cũng không chuyên bất thiện: tâm đi kèm thiện thì chúng thành thiện, đi kèm bất thiện thì thành bất thiện.",
            ],
            "keyTerms": [
                {"id": "TERM_PAKINNAKA_M11", "term": "Biệt cảnh", "pali": "Pakiṇṇaka", "meaning": "Rải rác — chỉ có mặt trong một số tâm"},
                {"id": "TERM_ANNASAMANA_M11", "term": "Tợ tha", "pali": "Aññasamāna", "meaning": "Chung với cái khác (Biến hành + Biệt cảnh = 13)"},
            ],
            "sourceRefs": [ref(TS, 3, "II. TÂM SỞ BIỆT CẢNH – PAKIṆṆAKA CETASIKA, có 6: Tầm, Tứ, Thắng giải, Cần, Hỷ, Dục")],
        },
        {
            "id": "M11_S02",
            "title": "Tầm (Vitakka) và Tứ (Vicāra)",
            "summary": "Tầm đưa tâm sở lên cảnh; Tứ dán áp tâm liên tục trên cảnh — như ong áp đến hoa và ong lượn quanh hoa.",
            "body": [
                "Vitakka: “Vi” là đặc biệt, căn “takk” là suy gẫm, suy tư, ý niệm, tư duy — Vitakka là suy gẫm một cách đặc biệt.",
                "Đặc tính chánh yếu của Tầm: nâng cao các tâm sở đồng sanh chung đến đối tượng, áp đặt các tâm sở lên đối tượng — như quăng ném các tâm sở vào cảnh.",
                "Tứ ý nghĩa của Tầm: a) Trạng thái: đem các pháp đồng sanh đi đến cảnh; b) Phận sự: làm cho Tâm–Tâm sở tiếp xúc cảnh; c) Thành tựu: Tâm và Tâm sở đồng sanh gặp được cảnh; d) Nhân cần thiết: phải có cảnh và 3 uẩn ngoài ra.",
                "Vicāra: “Vi” đặc biệt, “Car” đi thênh thang, bất định — Tứ là suy xét trên đối tượng, quan sát đi quanh cảnh một cách đặc biệt, dán áp Tâm liên tục trên đối tượng, dò xét điều nghiên đối tượng một cách khắng khít chặt chẽ.",
                "Ví dụ phân biệt: Tầm như con ong bay áp đến hoa sen, như chim đang đập cánh bay lên, như đánh vào trống; Tứ như con ong bay lượn quanh hoa sen để quan sát, như chim bay lượn trên không trung, như âm vang.",
                "Tầm và Tứ không có mặt trong Ngũ song thức (10 tâm nhãn–nhĩ–tỷ–thiệt–thân thức), vì 5 đôi thức chỉ làm việc máy móc do cảnh tác động, không cần suy gẫm.",
            ],
            "keyTerms": [
                {"id": "TERM_VITAKKA", "term": "Tầm", "pali": "Vitakka", "meaning": "Suy gẫm đặc biệt — đưa các tâm sở lên đối tượng"},
                {"id": "TERM_VICARA", "term": "Tứ", "pali": "Vicāra", "meaning": "Quan sát đi quanh cảnh, dán áp tâm liên tục trên đối tượng"},
            ],
            "sourceRefs": [
                ref(TS, 20, "II.1 TÂM SỞ TẦM – VITAKKA CETASIKA; đặc tính chánh yếu và tứ ý nghĩa"),
                ref(TS, 23, "II.2 TÂM SỞ TỨ – VICĀRA CETASIKA; phân biệt Tầm–Tứ; không có trong Ngũ song thức"),
            ],
        },
        {
            "id": "M11_S03",
            "title": "Thắng giải (Adhimokkha)",
            "summary": "Adhi + Muc: phóng thích Tâm ra khỏi hoài nghi — quả quyết, khẳng định, phán quyết.",
            "body": [
                "Adhimokkha: “Adhi” + căn “Muc” (phóng thích) — phóng thích Tâm ra khỏi HOÀI NGHI để tiến đến đối tượng; nghĩa là quả quyết, khẳng định, phán quyết, thắng giải.",
                "Tứ ý nghĩa của Thắng giải: a) Trạng thái: quyết định phá tan trạng thái lưỡng lự; b) Phận sự: làm cho Tâm quyết chắc trong cảnh, không do dự; c) Thành tựu: đã có sự quyết đoán cảnh thực hiện; d) Nhân cần thiết: cần có cảnh để phân đoán, phán quyết hay quyết định.",
                "Phân loại phán quyết có 2: Tà quyết (đúng quyết sai, sai quyết đúng) và Chánh quyết (đúng quyết đúng, sai quyết sai).",
                "Thắng giải không có mặt trong Ngũ song thức (10 tâm) và tâm Si hoài nghi — tổng 11; có mặt trong 110 tâm (121 − 11).",
            ],
            "keyTerms": [
                {"id": "TERM_ADHIMOKKHA", "term": "Thắng giải", "pali": "Adhimokkha", "meaning": "Phóng thích tâm ra khỏi hoài nghi — quả quyết"},
            ],
            "sourceRefs": [
                ref(TS, 24, "II.3 TÂM SỞ THẮNG GIẢI – ADHIMOKKHO CETASIKA; tứ ý nghĩa; phán quyết tà/chánh; có mặt trong 110 tâm"),
            ],
        },
        {
            "id": "M11_S04",
            "title": "Cần (Vīriya)",
            "summary": "Trợ giúp các pháp đồng sanh không lui sụt — Tứ Chánh cần là mặt thiện của Cần.",
            "body": [
                "Vīriya: từ “Vīra” (người chuyên cần nỗ lực) — Cần là cố gắng, nỗ lực, trợ giúp, nâng đỡ, cần mẫn, siêng năng, chịu đựng.",
                "Tứ ý nghĩa của Cần: a) Trạng thái: cách siêng năng, chịu đựng; b) Phận sự: trợ giúp các pháp đồng sanh không lui sụt; c) Thành tựu: không lui sụt; d) Nhân cần thiết: có điều lo âu, điều làm rung động Tâm như cảnh già, đau, chết, cảnh khổ.",
                "Phân loại Cần có 2: Tà cần (siêng năng trong tà pháp, ví dụ tích cực làm ăn lừa gạt) và Chánh cần — Tứ Chánh cần.",
                "Tứ Chánh cần: Thần cần (gìn giữ cho ác pháp đừng sanh, cẩn thận chánh niệm), Trừ cần (ác pháp đã sanh thì nỗ lực diệt), Tu cần (thiện pháp chưa sanh thì nỗ lực cho phát sanh), Bảo cần (thiện pháp đã sanh thì bảo trì cho lớn mạnh).",
                "Bốn khía cạnh của Cần: Tấn quyền (điều hành cai quản), Tấn lực (sức mạnh không thối lui trước nghịch pháp), Cần giác chi (tinh cần đưa đến giác ngộ), Chánh tinh tấn (tích cực diệt nghiệp luân hồi để chứng đạt Niết Bàn).",
            ],
            "keyTerms": [
                {"id": "TERM_VIRIYA", "term": "Cần", "pali": "Vīriya", "meaning": "Nỗ lực, trợ giúp các pháp đồng sanh không lui sụt"},
                {"id": "TERM_SAMMAPADHANA", "term": "Tứ Chánh cần", "pali": "Sammāpadhāna", "meaning": "Thần cần, Trừ cần, Tu cần, Bảo cần"},
            ],
            "sourceRefs": [
                ref(TS, 25, "II.4 TÂM SỞ CẦN – VIRIYA CETASIKA; tứ ý nghĩa; Tứ Chánh cần; 4 khía cạnh"),
            ],
        },
        {
            "id": "M11_S05",
            "title": "Hỷ (Pīti) và Dục (Chanda)",
            "summary": "Hỷ có 5 loại, 3 thể tánh; Dục có 3 loại — không có trong 2 tâm Si và 18 tâm Vô nhân.",
            "body": [
                "Pīti: “Pī” là hân hoan, thích thú — Hỷ là hân hoan, vui thích, hứng thú, mừng, phấn khởi, sảng khoái, no lòng, phấn chấn, hài lòng.",
                "Hỷ có 5 loại: Tiểu hỷ (rờn rợn nổi da gà, không lâu), Sát na hỷ (thoáng qua như ánh chớp), Hải triều hỷ (từng lượn sóng dâng cao như thủy triều), Khinh hỷ (thân nhẹ nhàng như bốc lên cao), Sung mãn hỷ (no vui đượm nhuần khắp cơ thể, tồn tại lâu).",
                "Theo thể tánh, Hỷ có 3: Hỷ thiện (mừng với hạnh phúc người khác, hoan hỷ trong thiện nghiệp, hỷ trong thiền chi), Hỷ bất thiện (mừng vui thỏa thích trong các dục, hân hoan khi thắng kẻ thù), Hỷ vô ký (hỷ của các vị A-la-hán).",
                "Chanda: từ căn “Chad” — mong muốn, ước muốn; Dục là ý muốn làm, chưa pha thiện, bất thiện hay vô ký.",
                "Dục có 3 loại: Tham dục (khát vọng tầm cầu lục trần — một trong 5 triền cái, bất thiện), Pháp dục (ý muốn chân chánh, dục như ý túc — ước muốn làm thiện pháp như bố thí, hành thiền, giữ giới), Tác dục (mong muốn làm của các vị A-la-hán sống bằng tâm duy tác).",
                "Dục không có mặt trong 2 tâm Si (Hoài nghi, Phóng dật) và 18 Tâm Vô nhân — các tâm này làm việc máy móc do căn–cảnh tác động, không có mong muốn.",
            ],
            "keyTerms": [
                {"id": "TERM_PITI", "term": "Hỷ", "pali": "Pīti", "meaning": "Hân hoan, phấn khởi — 5 loại từ tiểu hỷ đến sung mãn hỷ"},
                {"id": "TERM_CHANDA", "term": "Dục", "pali": "Chanda", "meaning": "Ý muốn làm — 3 loại: tham dục, pháp dục, tác dục"},
            ],
            "sourceRefs": [
                ref(TS, 27, "II.5 TÂM SỞ HỶ – PĪTI CETASIKA; 5 loại hỷ; 3 thể tánh"),
                ref(TS, 29, "II.6. TÂM SỞ DỤC – CHANDA CETASIKA; 3 loại dục; không có trong 2 tâm Si và 18 tâm Vô nhân"),
            ],
        },
    ],
    "reviewCards": [
        {"id": "M11_R01", "front": "Biệt cảnh (Pakiṇṇaka) nghĩa là gì?", "back": "Tâm sở chỉ có mặt trong MỘT SỐ tâm — rải rác theo từng tâm, khác Biến hành có mặt trong mọi tâm.", "sourceRefs": [ref(TS, 3)]},
        {"id": "M11_R02", "front": "Sáu tâm sở Biệt cảnh là những gì?", "back": "Tầm (Vitakka), Tứ (Vicāra), Thắng giải (Adhimokkha), Cần (Vīriya), Hỷ (Pīti), Dục (Chanda).", "sourceRefs": [ref(TS, 3)]},
        {"id": "M11_R03", "front": "Vitakka có nghĩa là gì?", "back": "“Vi” đặc biệt + căn “takk” suy gẫm — suy gẫm, suy tư một cách đặc biệt.", "sourceRefs": [ref(TS, 20)]},
        {"id": "M11_R04", "front": "Đặc tính chánh yếu của Tầm (Vitakka)?", "back": "Nâng cao các tâm sở đồng sanh đến đối tượng — áp đặt, quăng ném các tâm sở vào cảnh.", "sourceRefs": [ref(TS, 20)]},
        {"id": "M11_R05", "front": "Vicāra có nghĩa là gì?", "back": "Suy xét trên đối tượng, quan sát đi quanh cảnh một cách đặc biệt, dán áp Tâm liên tục, dò xét khắng khít chặt chẽ.", "sourceRefs": [ref(TS, 23)]},
        {"id": "M11_R06", "front": "Ví dụ phân biệt Tầm và Tứ?", "back": "Tầm: ong bay áp đến hoa sen, chim đập cánh bay lên, đánh vào trống. Tứ: ong lượn quanh hoa để quan sát, chim bay lượn trên không trung, âm vang.", "sourceRefs": [ref(TS, 23)]},
        {"id": "M11_R07", "front": "Tầm–Tứ không có mặt trong nhóm tâm nào?", "back": "Ngũ song thức (10 tâm nhãn–nhĩ–tỷ–thiệt–thân thức): 5 đôi thức làm việc máy móc, không cần suy gẫm.", "sourceRefs": [ref(TS, 23)]},
        {"id": "M11_R08", "front": "Adhimokkha có nghĩa là gì?", "back": "Adhi + Muc (phóng thích): phóng thích Tâm ra khỏi hoài nghi để tiến đến đối tượng — quả quyết, khẳng định, phán quyết.", "sourceRefs": [ref(TS, 24)]},
        {"id": "M11_R09", "front": "Thắng giải có mặt trong bao nhiêu tâm?", "back": "110 tâm (121 − 10 Ngũ song thức − 1 tâm Si hoài nghi).", "sourceRefs": [ref(TS, 24)]},
        {"id": "M11_R10", "front": "Tứ ý nghĩa của Cần (Vīriya)?", "back": "Trạng thái: siêng năng chịu đựng. Phận sự: trợ giúp các pháp đồng sanh không lui sụt. Thành tựu: không lui sụt. Nhân cần thiết: có điều lo âu, cảnh làm rung động Tâm.", "sourceRefs": [ref(TS, 25)]},
        {"id": "M11_R11", "front": "Tứ Chánh Cần gồm những gì?", "back": "Thần cần (ác chưa sanh đừng cho sanh), Trừ cần (ác đã sanh nỗ lực diệt), Tu cần (thiện chưa sanh nỗ lực cho sanh), Bảo cần (thiện đã sanh bảo trì lớn mạnh).", "sourceRefs": [ref(TS, 25)]},
        {"id": "M11_R12", "front": "Ba loại Dục (Chanda)?", "back": "Tham dục (khát vọng lục trần), Pháp dục (ý muốn chân chánh làm thiện pháp), Tác dục (mong muốn làm của các vị A-la-hán).", "sourceRefs": [ref(TS, 29)]},
    ],
    "quizSeeds": [
        {"id": "M11_Q01", "type": "mcq", "question": "Tâm sở Biệt cảnh (Pakiṇṇaka) có bao nhiêu?", "correctAnswer": "6", "distractors": ["7", "13", "14"], "explanation": "Tầm, Tứ, Thắng giải, Cần, Hỷ, Dục — cộng với Biến hành 7 là đủ nhóm Tợ tha 13.", "sourceRefs": [ref(TS, 3)]},
        {"id": "M11_Q02", "type": "mcq", "question": "Tâm sở nào KHÔNG thuộc nhóm Biệt cảnh?", "correctAnswer": "Tác ý (Manasikāra)", "distractors": ["Tầm (Vitakka)", "Thắng giải (Adhimokkha)", "Dục (Chanda)"], "explanation": "Tác ý thuộc nhóm Biến hành 7 (module M1).", "sourceRefs": [ref(TS, 3)]},
        {"id": "M11_Q03", "type": "mcq", "question": "“Vitakka” có nghĩa là gì?", "correctAnswer": "Suy gẫm một cách đặc biệt", "distractors": ["Quan sát đi quanh cảnh", "Phóng thích tâm khỏi hoài nghi", "Hân hoan thích thú"], "explanation": "Vi (đặc biệt) + takk (suy gẫm) = Vitakka.", "sourceRefs": [ref(TS, 20)]},
        {"id": "M11_Q04", "type": "mcq", "question": "Ví dụ nào nói về Tứ (Vicāra)?", "correctAnswer": "Ong bay lượn quanh hoa sen để quan sát", "distractors": ["Ong bay áp đến hoa sen", "Chim đang đập cánh bay lên", "Đánh vào trống"], "explanation": "Tầm = ong áp đến hoa; Tứ = ong lượn quanh hoa quan sát.", "sourceRefs": [ref(TS, 23)]},
        {"id": "M11_Q05", "type": "mcq", "question": "Tầm và Tứ không có mặt trong nhóm tâm nào?", "correctAnswer": "Ngũ song thức", "distractors": ["Tâm Đại thiện", "Tâm Tham", "Tâm Sơ thiền"], "explanation": "5 đôi thức làm việc máy móc do cảnh tác động, không cần Tầm Tứ.", "sourceRefs": [ref(TS, 23)]},
        {"id": "M11_Q06", "type": "mcq", "question": "“Adhimokkha” có nghĩa là gì?", "correctAnswer": "Phóng thích Tâm ra khỏi hoài nghi", "distractors": ["Nâng cao tâm sở lên đối tượng", "Cố gắng nỗ lực không lui sụt", "Ý muốn làm"], "explanation": "Adhi + Muc: quả quyết, khẳng định, phán quyết.", "sourceRefs": [ref(TS, 24)]},
        {"id": "M11_Q07", "type": "mcq", "question": "Thắng giải (Adhimokkha) có mặt trong bao nhiêu tâm?", "correctAnswer": "110", "distractors": ["121", "100", "55"], "explanation": "121 − 11 (10 Ngũ song thức + 1 tâm Si hoài nghi) = 110.", "sourceRefs": [ref(TS, 24)]},
        {"id": "M11_Q08", "type": "mcq", "question": "Tứ Chánh Cần gồm những cần nào?", "correctAnswer": "Thần cần, Trừ cần, Tu cần, Bảo cần", "distractors": ["Thần cần, Trừ cần, Tu cần, Tấn cần", "Trừ cần, Tu cần, Bảo cần, Cẩn cần", "Thần cần, Bảo cần, Tấn lực, Tu cần"], "explanation": "4 phép tinh tấn: ác chưa sanh đừng sanh, ác sanh thì diệt, thiện chưa sanh cho sanh, thiện sanh thì giữ.", "sourceRefs": [ref(TS, 25)]},
        {"id": "M11_Q09", "type": "mcq", "question": "Hỷ (Pīti) có mấy loại theo mức độ?", "correctAnswer": "5 — từ Tiểu hỷ đến Sung mãn hỷ", "distractors": ["3 — thiện, bất thiện, vô ký", "2 — hỷ và xả", "6 — gồm cả Pháp hỷ"], "explanation": "Tiểu hỷ, Sát na hỷ, Hải triều hỷ, Khinh hỷ, Sung mãn hỷ.", "sourceRefs": [ref(TS, 27)]},
        {"id": "M11_Q10", "type": "mcq", "question": "Hỷ của các vị A-la-hán thuộc thể tánh nào?", "correctAnswer": "Hỷ vô ký", "distractors": ["Hỷ thiện", "Hỷ bất thiện", "Hỷ quả"], "explanation": "Theo thể tánh, Hỷ có 3: thiện, bất thiện và vô ký (hỷ của bậc A-la-hán).", "sourceRefs": [ref(TS, 27)]},
        {"id": "M11_Q11", "type": "mcq", "question": "Ý muốn làm của các vị A-la-hán gọi là gì?", "correctAnswer": "Tác dục", "distractors": ["Tham dục", "Pháp dục", "Tướng dục"], "explanation": "A-la-hán sống bằng tâm duy tác nên ý muốn của họ chỉ là tác dục.", "sourceRefs": [ref(TS, 29)]},
        {"id": "M11_Q12", "type": "mcq", "question": "Dục (Chanda) không có mặt trong những tâm nào?", "correctAnswer": "2 tâm Si và 18 tâm Vô nhân", "distractors": ["Chỉ 2 tâm Si", "18 tâm Vô nhân và 2 tâm Sân", "10 tâm Ngũ song thức"], "explanation": "Các tâm này làm việc máy móc, không có mong muốn.", "sourceRefs": [ref(TS, 29)]},
    ],
}


M12_VI = {
    "title": "18 Tâm Vô Nhân (Ahetuka Citta)",
    "description": "15 Tâm Quả Vô Nhân (7 quả bất thiện + 8 quả thiện) và 3 Tâm Duy Tác Vô Nhân — tâm không có nhân thiện/bất thiện đồng sanh.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M12_S01",
            "title": "Tâm Vô nhân là gì?",
            "summary": "Không có 6 nhân đồng sanh — nhưng vẫn có nhân dị thời (nghiệp quá khứ).",
            "body": [
                "Tâm Vô Nhân (Ahetuka Citta) là loại tâm khi sanh khởi, ngay trong bản thân của nó không có nhân chủng đồng sanh chung với nó.",
                "Nhân có 6: nhân bất thiện là Tham, Sân, Si; nhân thiện là Vô tham, Vô sân, Vô si. Tâm vô nhân là tâm không có 6 nhân này đồng sanh chung.",
                "Tuy không có nhân hiện tại, tâm vô nhân vẫn có nhân trong quá khứ — nhân dị thời, dị thục: là quả thành tựu do nghiệp thiện hoặc bất thiện đã tạo trước đó.",
                "18 Tâm Vô Nhân chia 2 loại: Tâm Quả Vô Nhân (Ahetuka Vipāka) có 15 — gồm 7 tâm quả bất thiện vô nhân và 8 tâm quả thiện vô nhân — và Tâm Duy Tác Vô Nhân (Ahetuka Kiriyā) có 3.",
            ],
            "keyTerms": [
                {"id": "TERM_AHETUKA", "term": "Vô nhân", "pali": "Ahetuka", "meaning": "Tâm không có 6 nhân thiện/bất thiện đồng sanh"},
                {"id": "TERM_NHAN_DI_THOI", "term": "Nhân dị thời", "pali": "Nānākālika hetu", "meaning": "Nhân ở thời khác — nghiệp quá khứ cho quả hiện tại"},
            ],
            "sourceRefs": [ref(TAM, 15, "B. TÂM VÔ NHÂN – AHETUKA CITTA gồm 18 Tâm; định nghĩa, 6 nhân, 2 loại")],
        },
        {
            "id": "M12_S02",
            "title": "Bảy Tâm quả bất thiện vô nhân",
            "summary": "Quả của nghiệp bất thiện quá khứ — mẹ đẻ của tâm quả vô nhân trong thời hiện tại.",
            "body": [
                "Tâm quả bất thiện vô nhân (Ahetuka Akusala Vipāka) là kết quả thành tựu do nhân bất thiện trong quá khứ (sát sanh, trộm cắp, tà hạnh…), có 7 tâm.",
                "5 tâm thức thọ xả: Nhãn thức, Nhĩ thức, Tỷ thức, Thiệt thức — thọ xả quả bất thiện vô nhân; và Thân thức thọ KHỔ quả bất thiện vô nhân (cái biết nương thần kinh thân phải chịu cảnh xấu, đau khổ).",
                "Tâm Tiếp thâu thọ xả quả bất thiện vô nhân (Sampaṭicchana) — nhận cảnh ở bên ngoài từ 5 thức.",
                "Tâm Quan sát thọ xả quả bất thiện vô nhân (Santīraṇa) — làm phận sự quan sát, điều nghiên đối tượng.",
            ],
            "keyTerms": [
                {"id": "TERM_AKUSALA_VIPAKA_M12", "term": "Quả bất thiện vô nhân", "pali": "Akusala-vipāka ahetuka", "meaning": "7 tâm quả do nghiệp bất thiện quá khứ"},
            ],
            "sourceRefs": [ref(TAM, 16, "a/ TÂM QUẢ BẤT THIỆN VÔ NHÂN: 7 tâm — 5 thức, tiếp thâu, quan sát")],
        },
        {
            "id": "M12_S03",
            "title": "Tám Tâm quả thiện vô nhân",
            "summary": "Quả của nghiệp thiện quá khứ — thân thức ở đây thọ LẠC, quan sát có cả thọ xả và thọ hỷ.",
            "body": [
                "Tâm quả thiện vô nhân (Ahetuka Kusala Vipāka) là kết quả do nhân thiện trong quá khứ, có 8 tâm.",
                "5 tâm thức: Nhãn thức, Nhĩ thức, Tỷ thức, Thiệt thức — thọ xả quả thiện vô nhân; và Thân thức thọ LẠC quả thiện vô nhân.",
                "Tâm Tiếp thâu thọ xả quả thiện vô nhân.",
                "Hai tâm Quan sát: Quan sát thọ xả quả thiện vô nhân, và Quan sát thọ hỷ quả thiện vô nhân (Somanassa-sahagataṃ Santīraṇa) — tâm quan sát duy nhất có thọ hỷ trong số tâm vô nhân.",
            ],
            "keyTerms": [
                {"id": "TERM_KUSALA_VIPAKA_M12", "term": "Quả thiện vô nhân", "pali": "Kusala-vipāka ahetuka", "meaning": "8 tâm quả do nghiệp thiện quá khứ"},
            ],
            "sourceRefs": [ref(TAM, 16, "b/ TÂM QUẢ THIỆN VÔ NHÂN: 8 tâm — 5 thức, tiếp thâu, 2 quan sát")],
        },
        {
            "id": "M12_S04",
            "title": "Ba Tâm duy tác vô nhân",
            "summary": "Khán ngũ môn, Khán ý môn và Ưng cúng vi tiếu — tâm duy tác không tạo nghiệp.",
            "body": [
                "Tâm duy tác vô nhân (Ahetuka Kiriyā) có 3: Tâm Khán ngũ môn, Tâm Khán ý môn và Tâm Ưng cúng vi tiếu thọ hỷ.",
                "Tâm Khán ngũ môn (Ngũ môn hướng tâm — Upekkhāsahagataṃ Pañcadvārāvajjana) thọ xả: khi cảnh sắc đi vào mắt, soi chiếu vào dòng tâm thức làm hộ kiếp rúng động, tâm khán ngũ môn sanh lên hướng về cửa nhãn rồi diệt đi để tâm nhãn thức sanh. Sanh lên nương ở Sắc ý vật, không có ở cõi vô sắc.",
                "Tâm Khán ý môn (Ý môn hướng tâm — Upekkhāsahagataṃ Manodvārāvajjana) thọ xả: làm phận sự xác định đối tượng (cảnh) từ ngoài đi vào trong và sanh lên tâm để tác thành nghiệp.",
                "Tâm Ưng cúng vi tiếu (Hasituppāda) thọ hỷ: tâm duy tác của bậc A-la-hán khi mỉm cười — không tạo nghiệp, không cho quả.",
            ],
            "keyTerms": [
                {"id": "TERM_AVJJANA", "term": "Hướng tâm", "pali": "Āvajjana", "meaning": "Tâm khán (quét) ngũ môn / ý môn"},
                {"id": "TERM_HASITUPPADA", "term": "Ưng cúng vi tiếu", "pali": "Hasituppāda", "meaning": "Tâm duy tác vô nhân thọ hỷ của bậc A-la-hán"},
            ],
            "sourceRefs": [
                ref(TAM, 15, "2. TÂM DUY TÁC VÔ NHÂN – AHETUKA KIRIYA CITTA: có 3"),
                ref(TAM, 17, "a/ TÂM KHÁN NGŨ MÔN; b/ TÂM KHÁN Ý MÔN — phận sự và 3 nhân sanh"),
            ],
        },
    ],
    "reviewCards": [
        {"id": "M12_R01", "front": "Tâm Vô nhân (Ahetuka) là gì?", "back": "Tâm khi sanh khởi không có 6 nhân (Tham, Sân, Si, Vô tham, Vô sân, Vô si) đồng sanh chung — nhưng vẫn có nhân dị thời (nghiệp quá khứ).", "sourceRefs": [ref(TAM, 15)]},
        {"id": "M12_R02", "front": "18 Tâm Vô nhân chia làm những loại nào?", "back": "2 loại: Tâm quả vô nhân 15 (7 quả bất thiện + 8 quả thiện) và Tâm duy tác vô nhân 3.", "sourceRefs": [ref(TAM, 15)]},
        {"id": "M12_R03", "front": "Bảy tâm quả bất thiện vô nhân gồm những gì?", "back": "Nhãn, Nhĩ, Tỷ, Thiệt thức thọ xả; Thân thức thọ khổ; Tiếp thâu thọ xả; Quan sát thọ xả.", "sourceRefs": [ref(TAM, 16)]},
        {"id": "M12_R04", "front": "Thân thức trong quả bất thiện và quả thiện khác nhau thế nào?", "back": "Quả bất thiện: thọ KHỔ. Quả thiện: thọ LẠC. (Bốn thức kia đều thọ xả.)", "sourceRefs": [ref(TAM, 16)]},
        {"id": "M12_R05", "front": "Tám tâm quả thiện vô nhân gồm những gì?", "back": "Nhãn, Nhĩ, Tỷ, Thiệt thức thọ xả; Thân thức thọ lạc; Tiếp thâu thọ xả; Quan sát thọ xả và Quan sát thọ hỷ.", "sourceRefs": [ref(TAM, 16)]},
        {"id": "M12_R06", "front": "Ba tâm duy tác vô nhân là gì?", "back": "Tâm Khán ngũ môn (ngũ môn hướng tâm), Tâm Khán ý môn (ý môn hướng tâm) — đều thọ xả — và Tâm Ưng cúng vi tiếu thọ hỷ.", "sourceRefs": [ref(TAM, 15), ref(TAM, 17)]},
        {"id": "M12_R07", "front": "Tâm Khán ngũ môn làm phận sự gì?", "back": "Khi cảnh đi vào căn làm hộ kiếp rúng động, tâm khán ngũ môn sanh lên hướng về cửa căn rồi diệt đi, để tâm thức (tiếp thâu) sanh tiếp theo.", "sourceRefs": [ref(TAM, 17)]},
        {"id": "M12_R08", "front": "Tâm Khán ý môn làm phận sự gì?", "back": "Xác định đối tượng (cảnh) từ ngoài đi vào trong và sanh lên tâm để tác thành nghiệp.", "sourceRefs": [ref(TAM, 17)]},
        {"id": "M12_R09", "front": "Tâm Ưng cúng vi tiếu là tâm của ai, thọ gì?", "back": "Tâm duy tác vô nhân thọ hỷ của bậc A-la-hán khi mỉm cười.", "sourceRefs": [ref(TAM, 15)]},
        {"id": "M12_R10", "front": "Vì sao gọi là “quả bất thiện vô nhân”?", "back": "Là kết quả thành tựu do nhân bất thiện trong quá khứ (đời này và đời trước) — mẹ đẻ của tâm quả vô nhân trong thời hiện tại.", "sourceRefs": [ref(TAM, 16)]},
    ],
    "quizSeeds": [
        {"id": "M12_Q01", "type": "mcq", "question": "Tâm Vô nhân không có những nhân nào đồng sanh?", "correctAnswer": "Tham, Sân, Si, Vô tham, Vô sân, Vô si", "distractors": ["Chỉ Tham, Sân, Si", "Chỉ Vô tham, Vô sân, Vô si", "Tầm, Tứ, Thắng giải"], "explanation": "6 nhân: 3 bất thiện + 3 thiện — tâm vô nhân không có nhân nào đồng sanh.", "sourceRefs": [ref(TAM, 15)]},
        {"id": "M12_Q02", "type": "mcq", "question": "18 Tâm Vô nhân gồm bao nhiêu tâm quả và bao nhiêu tâm duy tác?", "correctAnswer": "15 quả + 3 duy tác", "distractors": ["12 quả + 6 duy tác", "14 quả + 4 duy tác", "16 quả + 2 duy tác"], "explanation": "Quả vô nhân 15 (7 bất thiện + 8 thiện); duy tác vô nhân 3.", "sourceRefs": [ref(TAM, 15)]},
        {"id": "M12_Q03", "type": "mcq", "question": "Trong 7 tâm quả bất thiện vô nhân, tâm nào thọ KHỔ?", "correctAnswer": "Thân thức", "distractors": ["Nhãn thức", "Tiếp thâu", "Quan sát"], "explanation": "DUKKHASAHAGATAṀ AKUSALAVIPĀKAṀ KĀYA-VIÑÑĀṆAṀ — thân thức thọ khổ.", "sourceRefs": [ref(TAM, 16)]},
        {"id": "M12_Q04", "type": "mcq", "question": "Trong 8 tâm quả thiện vô nhân, tâm nào thọ LẠC?", "correctAnswer": "Thân thức", "distractors": ["Nhãn thức", "Quan sát", "Tiếp thâu"], "explanation": "SUKHASAHAGATAṀ KUSALAVIPĀKAṀ KĀYAVIÑÑĀṆAṀ — thân thức thọ lạc.", "sourceRefs": [ref(TAM, 16)]},
        {"id": "M12_Q05", "type": "mcq", "question": "Tâm Quan sát quả thiện vô nhân có những thọ nào?", "correctAnswer": "Thọ xả và thọ hỷ", "distractors": ["Chỉ thọ xả", "Thọ hỷ và thọ lạc", "Thọ khổ và thọ xả"], "explanation": "Có 2 tâm quan sát quả thiện: upekkhā-sahagataṃ và somanassa-sahagataṃ.", "sourceRefs": [ref(TAM, 16)]},
        {"id": "M12_Q06", "type": "mcq", "question": "Ngũ môn hướng tâm (tâm khán ngũ môn) thuộc loại nào?", "correctAnswer": "Duy tác vô nhân, thọ xả", "distractors": ["Quả bất thiện vô nhân", "Quả thiện vô nhân", "Đại duy tác"], "explanation": "Upekkhāsahagataṃ Pañcadvārāvajjana — 1 trong 3 tâm duy tác vô nhân.", "sourceRefs": [ref(TAM, 15), ref(TAM, 17)]},
        {"id": "M12_Q07", "type": "mcq", "question": "Tâm Ưng cúng vi tiếu thọ gì?", "correctAnswer": "Thọ hỷ", "distractors": ["Thọ xả", "Thọ lạc", "Thọ ưu"], "explanation": "Tâm duy tác vô nhân duy nhất có thọ hỷ — của bậc A-la-hán khi mỉm cười.", "sourceRefs": [ref(TAM, 15)]},
        {"id": "M12_Q08", "type": "mcq", "question": "Có bao nhiêu Tâm Vô nhân?", "correctAnswer": "18", "distractors": ["15", "12", "54"], "explanation": "AHETUKA CITTA gồm 18 tâm.", "sourceRefs": [ref(TAM, 15)]},
        {"id": "M12_Q09", "type": "mcq", "question": "“Nhân dị thời – dị thục” nghĩa là gì?", "correctAnswer": "Quả do nhân ở thời khác tạo — nghiệp quá khứ cho quả, không phải nhân hiện tại", "distractors": ["Nhân và quả cùng một sát-na", "Nhân thiện cho quả bất thiện", "Nhân do thần linh định đoạt"], "explanation": "Tâm vô nhân không có nhân hiện tại nhưng vẫn có nhân trong quá khứ.", "sourceRefs": [ref(TAM, 15)]},
        {"id": "M12_Q10", "type": "mcq", "question": "Ý môn hướng tâm làm phận sự gì?", "correctAnswer": "Xác định đối tượng đi vào ý môn để tâm tác thành nghiệp sanh", "distractors": ["Tiếp nhận cảnh từ 5 thức", "Quan sát điều nghiên đối tượng", "Hưởng thọ cảnh"], "explanation": "Manodvārāvajjana: xác định cảnh từ ngoài đi vào trong, sanh lên tâm để tác thành nghiệp.", "sourceRefs": [ref(TAM, 17)]},
    ],
}


M13_VI = {
    "title": "15 Tâm Sắc Giới (Rūpāvacara Citta)",
    "description": "Tâm Thiện, Tâm Quả và Tâm Duy Tác Sắc giới qua 5 tầng Thiền — tâm lưu chuyển trong Sắc giới.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M13_S01",
            "title": "Tâm Đáo đại và vị trí của Tâm Sắc giới",
            "summary": "Mahaggata: tâm đi đến sự an tịnh rộng lớn — 27 tâm gồm Sắc giới 15 + Vô sắc giới 12.",
            "body": [
                "Tâm Đáo đại (Mahaggata Citta): MAHA là lớn, GATA là đi đến — tâm nào đi vào sự an tịnh rộng lớn gọi là Tâm Đáo đại; còn gọi là Tâm đại hành, Tâm cao thượng. Đáo: đi (đáo bỉ ngạn — đi đến bờ kia).",
                "Tâm Đáo đại có 27, chia 2 nhóm loại: Tâm Sắc giới (Rūpāvacara) 15 và Tâm Vô Sắc giới (Arūpāvacara) 12.",
                "RŪPA là Sắc; AVACARA là linh động, di chuyển, đi tới — Rūpāvacaracitta là những tâm thường lưu chuyển, hiện hữu trong Sắc giới.",
                "Tâm Sắc giới có 3 nhóm: Tâm Thiện Sắc giới (Rūpāvacara Kusala), Tâm Quả Sắc giới (Rūpāvacara Vipāka) và Tâm Duy Tác Sắc giới (Rūpāvacara Kiriyā).",
            ],
            "keyTerms": [
                {"id": "TERM_MAHAGGATA", "term": "Đáo đại", "pali": "Mahaggata", "meaning": "Tâm đi đến sự rộng lớn — 27 tâm Sắc + Vô sắc"},
                {"id": "TERM_RUPAVACARA", "term": "Sắc giới", "pali": "Rūpāvacara", "meaning": "Cõi còn có sắc pháp; tâm lưu chuyển trong đó"},
            ],
            "sourceRefs": [ref(TAM, 35, "II. TÂM ĐÁO ĐẠI – MAHAGGATACITTA 27 Tâm; II.1 TÂM SẮC GIỚI – RŪPĀVACARACITTA: 3 nhóm")],
        },
        {
            "id": "M13_S02",
            "title": "Ba nhóm × năm tầng Thiền",
            "summary": "Thiện 5 + Quả 5 + Duy tác 5 = 15 tâm, khác nhau theo các chi thiền.",
            "body": [
                "Tâm Sắc giới có 3 nhóm, gồm 15 tâm: Tâm Thiện Sắc giới có 5, Tâm Quả Sắc giới có 5, Tâm Duy Tác Sắc giới có 5 — mỗi nhóm trải đủ 5 tầng Thiền.",
                "Năm tầng Thiền khác biệt nhau do các chi thiền (tâm sở tương ưng): Sơ thiền, Nhị thiền, Tam thiền, Tứ thiền, Ngũ thiền.",
                "Sơ thiền: Vitakka – Vicāra – Pīti – Sukha – Ekaggatā (Tầm, Tứ, Hỷ, Lạc, Nhất hành).",
                "Nhị thiền: Vicāra – Pīti – Sukha – Ekaggatā (bỏ Tầm). Tam thiền: Pīti – Sukha – Ekaggatā (bỏ Tầm Tứ). Tứ thiền: Sukha – Ekaggatā (bỏ Hỷ). Ngũ thiền: Upekkhā – Ekaggatā (thọ xả).",
                "Ba nhóm chỉ khác về thể tánh: Tâm Thiện là nhân tạo nghiệp thiền; Tâm Quả là quả của nghiệp thiền ấy; Tâm Duy Tác không tạo nghiệp, không cho quả (tâm thiền của bậc A-la-hán).",
            ],
            "keyTerms": [
                {"id": "TERM_JHANA_M13", "term": "Thiền", "pali": "Jhāna", "meaning": "Trạng thái tâm an trú bền vững trên đề mục"},
                {"id": "TERM_EKAGGATA_M13", "term": "Nhất hành", "pali": "Ekaggatā", "meaning": "Định — tâm gom về một điểm, chi thiền có mặt đủ 5 tầng"},
            ],
            "sourceRefs": [
                ref(TAM, 36, "II.1 TÂM SẮC GIỚI – RŪPĀVACARACITTA: 3 nhóm, gồm 15 tâm; danh sách Pāli 1.1–1.5, 2.1–2.5, 3.1–3.5"),
                ref(TAM, 37, "RŪPĀVACARA-KUSALA — danh sách 5 tầng thiền thiện"),
            ],
        },
        {
            "id": "M13_S03",
            "title": "Lợi ích của tu Thiền chỉ",
            "summary": "Hiện tại lạc trú, nền tảng thiền Quán, thắng trí thần thông, sanh Phạm thiên, nhập Diệt thọ tưởng định.",
            "body": [
                "Sự lợi ích của tu Thiền chỉ có 5:",
                "1/ Hiện tại lạc trú — tâm an tịnh, vắng lặng, an lạc. 2/ Làm nền tảng cho thiền Quán (cận định và định).",
                "3/ Thành tựu thắng trí và thần thông: khi đạt ngũ thiền sắc giới sẽ đạt được 5 thông — Thiên nhãn thông, Túc mạng thông, Thiên nhĩ thông, Thần túc thông và Tha tâm thông.",
                "4/ Sanh về Phạm thiên Sắc giới / Vô sắc giới theo tầng thiền đã đắc.",
                "5/ Nhập được Diệt – Thọ – Tưởng – Định: bậc Thánh A Na Hàm hay A La Hán chứng đạt 8 thiền chứng mới có thể an trú vào trạng thái vô dư niết bàn tạm thời.",
            ],
            "keyTerms": [
                {"id": "TERM_ABHINNA", "term": "Thắng trí", "pali": "Abhiññā", "meaning": "5 thông: thiên nhãn, túc mạng, thiên nhĩ, thần túc, tha tâm"},
                {"id": "TERM_NIRODHA", "term": "Diệt thọ tưởng định", "pali": "Nirodha-samāpatti", "meaning": "Định diệt thọ tưởng — cần đủ 8 thiền chứng"},
            ],
            "sourceRefs": [ref(TAM, 50, "SỰ LỢI ÍCH CỦA TU THIỀN CHỈ có 5")],
        },
    ],
    "reviewCards": [
        {"id": "M13_R01", "front": "Tâm Đáo đại (Mahaggata) là gì?", "back": "MAHA: lớn, GATA: đi đến — tâm đi vào sự an tịnh rộng lớn; có 27 tâm (Sắc giới 15 + Vô sắc giới 12).", "sourceRefs": [ref(TAM, 35)]},
        {"id": "M13_R02", "front": "Tâm Sắc giới (Rūpāvacara) là gì?", "back": "Những tâm thường lưu chuyển, hiện hữu trong Sắc giới.", "sourceRefs": [ref(TAM, 35)]},
        {"id": "M13_R03", "front": "15 Tâm Sắc giới chia làm mấy nhóm?", "back": "3 nhóm: Tâm Thiện, Tâm Quả, Tâm Duy Tác — mỗi nhóm 5 tầng Thiền.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_R04", "front": "Sơ thiền tương ưng những chi thiền nào?", "back": "Tầm (Vitakka), Tứ (Vicāra), Hỷ (Pīti), Lạc (Sukha), Nhất hành (Ekaggatā).", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_R05", "front": "Nhị thiền khác Sơ thiền ở điểm nào?", "back": "Bỏ Tầm — còn Tứ, Hỷ, Lạc, Nhất hành.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_R06", "front": "Tam thiền còn những chi thiền nào?", "back": "Hỷ, Lạc, Nhất hành (đã bỏ Tầm và Tứ).", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_R07", "front": "Tứ thiền và Ngũ thiền tương ưng gì?", "back": "Tứ thiền: Lạc + Nhất hành (bỏ Hỷ). Ngũ thiền: Xả + Nhất hành (thọ xả).", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_R08", "front": "Tâm Quả Sắc giới do đâu mà có?", "back": "Do nghiệp thiền thiện Sắc giới quá khứ cho quả — tâm thiện làm nhân cho tâm quả.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_R09", "front": "Tâm Duy Tác Sắc giới khác Tâm Thiện ở điểm nào?", "back": "Duy tác không tạo nghiệp, không cho quả — là tâm thiền của bậc A-la-hán.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_R10", "front": "Năm lợi ích của tu Thiền chỉ?", "back": "Hiện tại lạc trú; nền tảng thiền Quán; thắng trí thần thông (5 thông); sanh Phạm thiên Sắc/Vô sắc; nhập Diệt thọ tưởng định.", "sourceRefs": [ref(TAM, 50)]},
    ],
    "quizSeeds": [
        {"id": "M13_Q01", "type": "mcq", "question": "Tâm Đáo đại (Mahaggata) có bao nhiêu tâm?", "correctAnswer": "27", "distractors": ["15", "12", "40"], "explanation": "Sắc giới 15 + Vô sắc giới 12 = 27.", "sourceRefs": [ref(TAM, 35)]},
        {"id": "M13_Q02", "type": "mcq", "question": "“Rūpāvacaracitta” nghĩa là gì?", "correctAnswer": "Tâm thường lưu chuyển, hiện hữu trong Sắc giới", "distractors": ["Tâm không có sắc làm đối tượng", "Tâm chỉ có trong cõi Dục giới", "Tâm thoát khỏi luân hồi"], "explanation": "RŪPA: sắc; AVACARA: linh động, di chuyển, đi tới.", "sourceRefs": [ref(TAM, 35)]},
        {"id": "M13_Q03", "type": "mcq", "question": "15 Tâm Sắc giới được chia theo cấu trúc nào?", "correctAnswer": "3 nhóm (Thiện, Quả, Duy tác) × 5 tầng Thiền", "distractors": ["5 nhóm × 3 tầng Thiền", "2 nhóm × 5 tầng Thiền + 5 tâm riêng", "1 nhóm duy nhất qua 15 tầng"], "explanation": "Kusala 5 + Vipāka 5 + Kiriyā 5 = 15.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_Q04", "type": "mcq", "question": "Sơ thiền (Paṭhamajjhāna) tương ưng những tâm sở nào?", "correctAnswer": "Tầm – Tứ – Hỷ – Lạc – Nhất hành", "distractors": ["Tứ – Hỷ – Lạc – Nhất hành", "Hỷ – Lạc – Nhất hành", "Xả – Nhất hành"], "explanation": "Vitakka-Vicāra-Pīti-Sukha-Ekaggatā sahitaṃ.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_Q05", "type": "mcq", "question": "Nhị thiền (Dutiyajjhāna) bỏ đi chi thiền nào?", "correctAnswer": "Tầm (Vitakka)", "distractors": ["Tứ (Vicāra)", "Hỷ (Pīti)", "Nhất hành (Ekaggatā)"], "explanation": "Nhị thiền: Vicāra-Pīti-Sukha-Ekaggatā.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_Q06", "type": "mcq", "question": "Tâm Thiện Sắc giới Ngũ thiền có thọ gì?", "correctAnswer": "Thọ xả (Upekkhā)", "distractors": ["Thọ hỷ", "Thọ lạc", "Thọ ưu"], "explanation": "Upekkhā – Ekaggatā sahitaṃ Pañcamajjhāna.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_Q07", "type": "mcq", "question": "Tâm Quả Sắc giới (Rūpāvacara Vipāka) là gì?", "correctAnswer": "Quả của nghiệp thiền thiện Sắc giới đã tạo", "distractors": ["Quả của nghiệp bất thiện", "Nhân tạo nghiệp thiền hiện tại", "Tâm của bậc A-la-hán"], "explanation": "Tâm thiện làm nhân cho tâm quả — tục sinh, hộ kiếp, tử bằng tâm quả ấy.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M13_Q08", "type": "mcq", "question": "Điểm khác nhau căn bản giữa 5 tầng Thiền Sắc giới là gì?", "correctAnswer": "Các chi thiền tương ưng (bỏ dần Tầm, Tứ, Hỷ, đổi Lạc thành Xả)", "distractors": ["Đề mục thiền khác nhau hoàn toàn", "Cõi sanh khác nhau về sắc pháp", "Thể tánh thiện/bất thiện khác nhau"], "explanation": "5 tầng thiền sắc giới khác biệt nhau do các chi thiền.", "sourceRefs": [ref(TAM, 36), ref(TAM, 50)]},
        {"id": "M13_Q09", "type": "mcq", "question": "Khi đạt ngũ thiền Sắc giới, hành giả có thể thành tựu mấy pháp thông?", "correctAnswer": "5 thông", "distractors": ["3 thông", "6 thông", "8 thông"], "explanation": "Thiên nhãn, Túc mạng, Thiên nhĩ, Thần túc, Tha tâm.", "sourceRefs": [ref(TAM, 50)]},
        {"id": "M13_Q10", "type": "mcq", "question": "Muốn nhập Diệt – Thọ – Tưởng – Định cần gì?", "correctAnswer": "Bậc A Na Hàm/A La Hán chứng đủ 8 thiền chứng", "distractors": ["Chỉ cần đắc Sơ thiền", "Bất cứ ai có thiền sắc giới", "Đạt 4 tầng Vô sắc là đủ"], "explanation": "Đó là an trú vào trạng thái vô dư niết bàn tạm thời.", "sourceRefs": [ref(TAM, 50)]},
    ],
}


M14_VI = {
    "title": "12 Tâm Vô Sắc Giới (Arūpāvacara Citta)",
    "description": "Tâm Thiện, Tâm Quả và Tâm Duy Tác Vô Sắc giới qua 4 xứ thiền: Không Vô Biên, Thức Vô Biên, Vô Sở Hữu, Phi Tưởng Phi Phi Tưởng.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M14_S01",
            "title": "Tâm Vô sắc là gì?",
            "summary": "Ba nghĩa: bắt đề mục Vô sắc làm đối tượng; quả cho sanh cõi thiền Vô sắc; lưu chuyển trong Vô sắc giới.",
            "body": [
                "Tâm Vô Sắc (Arūpa) theo 3 nghĩa: 1/ Là tâm bắt đề mục Vô sắc làm đối tượng — không phải sắc pháp; 2/ Là có quả cho sanh về cõi Thiền Vô sắc; 3/ Là tâm nào lưu chuyển trong Vô sắc giới gọi là Tâm vô sắc.",
                "Cõi vô sắc không có sắc, chỉ có tâm — cõi này không có hình tướng, không có sắc pháp.",
                "Tâm Vô Sắc giới có 3 nhóm: Tâm Thiện Vô Sắc giới (4), Tâm Quả Vô Sắc giới (4) và Tâm Duy Tác Vô Sắc giới (4) — cộng đủ 12 tâm.",
                "Về công tác (phận sự) tâm quả vô sắc cũng có 3: Tục sinh, Hộ kiếp, Tử — ví dụ tu bằng tâm thiện Không vô biên xứ thì tục sinh bằng tâm quả Không vô biên xứ, và kiếp sống ấy được hộ kiếp cho đến khi tử cũng bằng tâm quả ấy.",
            ],
            "keyTerms": [
                {"id": "TERM_ARUPAVACARA", "term": "Vô sắc giới", "pali": "Arūpāvacara", "meaning": "Cõi không có sắc pháp, chỉ có tâm"},
                {"id": "TERM_AYATANA_M14", "term": "Xứ", "pali": "Āyatana", "meaning": "Trú xứ, nơi chỗ của các tầng thiền vô sắc"},
            ],
            "sourceRefs": [ref(TAM, 48, "II.2 TÂM VÔ SẮC GIỚI – ARŪPĀVACARACITTA: 3 nghĩa của Tâm Vô sắc; 4 loại")],
        },
        {
            "id": "M14_S02",
            "title": "Bốn xứ thiền Vô sắc",
            "summary": "Không Vô Biên, Thức Vô Biên, Vô Sở Hữu, Phi Tưởng Phi Phi Tưởng — khác nhau do đề mục gom tâm.",
            "body": [
                "1/ KHÔNG VÔ BIÊN XỨ (Ākāsānañcāyatana): Ākāsa là không gian, Anañtā là rộng lớn, Āyatana là trú xứ — trú xứ không gian bao la vô tận. Muốn tu đạt phải thấy nguy hiểm trong các Sắc, mong mỏi tách ly Sắc: nhập ngũ thiền sắc với 1 trong 9 Kasina (trừ hư không), xả thiền, bỏ ấn tướng Kasina, tác ý hư không vô tận cho đến khi đắc định.",
                "2/ THỨC VÔ BIÊN XỨ (Viññāṇañcāyatana): trú xứ vô tận rộng lớn của Thức — suy xét Không vô biên xứ không bền vững dễ rơi về thiền sắc, nên lấy tâm Không vô biên xứ làm đối tượng tu tập, niệm “thức vô tận”.",
                "3/ VÔ SỞ HỮU XỨ (Ākiñcaññāyatana): lấy Không vô biên xứ hoặc Thức vô biên xứ đã diệt làm đối tượng và niệm “không có gì hết”.",
                "4/ PHI TƯỞNG PHI PHI TƯỞNG XỨ (Nevasaññā-nāsaññāyatana): lấy Vô sở hữu xứ làm đối tượng — tâm quá vi tế, không phải tưởng cũng không phải không tưởng.",
                "Thiền vô sắc có 2 chi là Xả và Định, càng lên cao càng vi tế; 4 tầng khác nhau do đề mục gom tâm (vượt qua áng xứ), không vượt qua thiền chi như thiền sắc giới.",
            ],
            "keyTerms": [
                {"id": "TERM_AKASANANCAYATANA", "term": "Không Vô Biên Xứ", "pali": "Ākāsānañcāyatana", "meaning": "Trú xứ không gian bao la vô tận"},
                {"id": "TERM_VINNANANCAYATANA", "term": "Thức Vô Biên Xứ", "pali": "Viññāṇañcāyatana", "meaning": "Trú xứ của thức vô tận"},
                {"id": "TERM_AKINCANNAYATANA", "term": "Vô Sở Hữu Xứ", "pali": "Ākiñcaññāyatana", "meaning": "Trú xứ “không có gì hết”"},
                {"id": "TERM_NEVASANNANASANNAYATANA", "term": "Phi Tưởng Phi Phi Tưởng Xứ", "pali": "Nevasaññā-nāsaññāyatana", "meaning": "Từng bậc quá vi tế — không phải tưởng, không phải không tưởng"},
            ],
            "sourceRefs": [
                ref(TAM, 48, "1/ KHÔNG VÔ BIÊN XỨ – ĀKĀSĀNAÑCĀYAṬANA; 2/ THỨC VÔ BIÊN XỨ — cách tu tập"),
                ref(TAM, 50, "TÓM LẠI: đối tượng của 4 Tâm thiền Vô sắc; thiền vô sắc có 2 chi Xả và Định"),
            ],
        },
        {
            "id": "M14_S03",
            "title": "Ba nhóm × bốn xứ",
            "summary": "Thiện 4 + Quả 4 + Duy tác 4 = 12 tâm; duy tác là tâm thiền vô sắc của bậc A-la-hán.",
            "body": [
                "Tâm Vô Sắc giới có 3 nhóm, gồm 12 tâm: Tâm Thiện Vô Sắc giới có 4 (Không vô biên, Thức vô biên, Vô sở hữu, Phi tưởng phi phi tưởng), Tâm Quả có 4 như 4 tâm thiện ấy, Tâm Duy Tác có 4.",
                "Tâm Quả Vô Sắc giới là tâm được thành tựu do bởi Tâm thiện vô sắc giới — tâm thiện làm nhân cho tâm quả.",
                "Tâm Duy Tác Vô Sắc giới là tâm của bậc A-la-hán tu chứng các tầng thiền vô sắc này.",
                "Cảnh giới (cõi tái sanh) tương ưng theo các tầng thiền đã đắc: tu tâm thiện xứ nào thì tục sinh vào cõi thiền vô sắc tương ứng.",
            ],
            "keyTerms": [
                {"id": "TERM_ARUPA_KIRIYA", "term": "Duy tác vô sắc", "pali": "Arūpāvacara-kiriyā", "meaning": "Tâm thiền vô sắc của bậc A-la-hán — không tạo nghiệp"},
            ],
            "sourceRefs": [
                ref(TAM, 36, "II.2 TÂM VÔ SẮC GIỚI – ARŪPĀVACARACITTA, 3 nhóm, gồm 12 tâm"),
                ref(TAM, 51, "1/ TÂM THIỆN VÔ SẮC GIỚI có 4; 2/ TÂM QUẢ VÔ SẮC GIỚI; 3/ TÂM DUY TÁC VÔ SẮC GIỚI — tâm của bậc A la hán"),
            ],
        },
    ],
    "reviewCards": [
        {"id": "M14_R01", "front": "Tâm Vô sắc theo 3 nghĩa là gì?", "back": "1/ Bắt đề mục Vô sắc làm đối tượng (không phải sắc pháp); 2/ Có quả cho sanh về cõi Thiền Vô sắc; 3/ Lưu chuyển trong Vô sắc giới.", "sourceRefs": [ref(TAM, 48)]},
        {"id": "M14_R02", "front": "Bốn xứ thiền Vô sắc là gì?", "back": "Không Vô Biên Xứ, Thức Vô Biên Xứ, Vô Sở Hữu Xứ, Phi Tưởng Phi Phi Tưởng Xứ.", "sourceRefs": [ref(TAM, 48), ref(TAM, 50)]},
        {"id": "M14_R03", "front": "Không Vô Biên Xứ (Ākāsānañcāyatana) nghĩa là gì?", "back": "Ākāsa (không gian) + Anañtā (rộng lớn) + Āyatana (trú xứ) — trú xứ không gian bao la vô tận.", "sourceRefs": [ref(TAM, 48)]},
        {"id": "M14_R04", "front": "Muốn đắc Không Vô Biên Xứ phải tu thế nào?", "back": "Thấy nguy hiểm trong các Sắc, mong tách ly Sắc; nhập ngũ thiền sắc với 1 trong 9 Kasina (trừ hư không); xả thiền, bỏ ấn tướng Kasina, tác ý hư không vô tận cho đến đắc định.", "sourceRefs": [ref(TAM, 48)]},
        {"id": "M14_R05", "front": "Thức Vô Biên Xứ lấy gì làm đối tượng?", "back": "Lấy tâm Không Vô Biên Xứ làm đối tượng tu tập, niệm “thức vô tận”.", "sourceRefs": [ref(TAM, 48), ref(TAM, 50)]},
        {"id": "M14_R06", "front": "Vô Sở Hữu Xứ lấy gì làm đối tượng?", "back": "Không Vô Biên Xứ hoặc Thức Vô Biên Xứ đã diệt — niệm “không có gì hết”.", "sourceRefs": [ref(TAM, 50)]},
        {"id": "M14_R07", "front": "Phi Tưởng Phi Phi Tưởng Xứ đặc biệt ở điểm nào?", "back": "Lấy Vô Sở Hữu Xứ làm đối tượng; tâm quá vi tế — không phải tưởng, cũng không phải không tưởng.", "sourceRefs": [ref(TAM, 50)]},
        {"id": "M14_R08", "front": "Thiền Vô sắc có những chi thiền nào?", "back": "Chỉ 2 chi: Xả và Định — càng lên cao càng vi tế; 4 tầng khác nhau do đề mục gom tâm.", "sourceRefs": [ref(TAM, 50)]},
        {"id": "M14_R09", "front": "12 Tâm Vô sắc chia làm mấy nhóm?", "back": "3 nhóm: Tâm Thiện 4, Tâm Quả 4, Tâm Duy Tác 4 — theo 4 xứ thiền.", "sourceRefs": [ref(TAM, 36), ref(TAM, 51)]},
        {"id": "M14_R10", "front": "Tâm Duy Tác Vô Sắc giới là tâm của ai?", "back": "Của bậc A-la-hán tu chứng các tầng thiền vô sắc — không tạo nghiệp, không cho quả.", "sourceRefs": [ref(TAM, 51)]},
    ],
    "quizSeeds": [
        {"id": "M14_Q01", "type": "mcq", "question": "Tâm Vô Sắc giới có bao nhiêu tâm?", "correctAnswer": "12", "distractors": ["15", "27", "8"], "explanation": "3 nhóm × 4 xứ thiền = 12 tâm.", "sourceRefs": [ref(TAM, 36)]},
        {"id": "M14_Q02", "type": "mcq", "question": "Bốn xứ thiền Vô sắc là gì?", "correctAnswer": "Không Vô Biên, Thức Vô Biên, Vô Sở Hữu, Phi Tưởng Phi Phi Tưởng", "distractors": ["Sơ, Nhị, Tam, Tứ thiền", "Không, Thức, Tưởng, Xả", "Không Vô Biên, Hỷ Vô Biên, Vô Sở Hữu, Phi Tưởng"], "explanation": "Ākāsānañcāyatana, Viññāṇañcāyatana, Ākiñcaññāyatana, Nevasaññā-nāsaññāyatana.", "sourceRefs": [ref(TAM, 48)]},
        {"id": "M14_Q03", "type": "mcq", "question": "“Ākāsānañcāyatana” là xứ nào?", "correctAnswer": "Không Vô Biên Xứ", "distractors": ["Thức Vô Biên Xứ", "Vô Sở Hữu Xứ", "Phi Tưởng Phi Phi Tưởng Xứ"], "explanation": "Ākāsa: không gian; anañta: rộng lớn; āyatana: trú xứ.", "sourceRefs": [ref(TAM, 48)]},
        {"id": "M14_Q04", "type": "mcq", "question": "Muốn tu thiền Vô sắc, trước hết hành giả phải thế nào?", "correctAnswer": "Thấy nguy hiểm trong các Sắc, mong mỏi tách ly Sắc", "distractors": ["Từ chối mọi thiện nghiệp Dục giới", "Đắc Sơ thiền là đủ", "Bỏ thiền, chỉ niệm Phật"], "explanation": "Xuất phát từ ngũ thiền Sắc giới (Kasina), xả thiền rồi chuyển đối tượng.", "sourceRefs": [ref(TAM, 48)]},
        {"id": "M14_Q05", "type": "mcq", "question": "Thức Vô Biên Xứ lấy gì làm đối tượng?", "correctAnswer": "Tâm Không Vô Biên Xứ", "distractors": ["Quang tướng Kasina", "Hư không vô tận", "Sắc pháp Phạm thiên"], "explanation": "Suy xét Không vô biên xứ không bền vững, nên lấy tâm ấy làm đối tượng.", "sourceRefs": [ref(TAM, 48), ref(TAM, 50)]},
        {"id": "M14_Q06", "type": "mcq", "question": "Thiền Vô sắc có mấy chi thiền?", "correctAnswer": "2 — Xả và Định", "distractors": ["5 — Tầm Tứ Hỷ Lạc Định", "3 — Hỷ Lạc Định", "1 — chỉ Định"], "explanation": "Thiền vô sắc có 2 chi: Xả và Định, càng lên cao càng vi tế.", "sourceRefs": [ref(TAM, 50)]},
        {"id": "M14_Q07", "type": "mcq", "question": "“Nevasaññā-nāsaññāyatana” là xứ nào?", "correctAnswer": "Phi Tưởng Phi Phi Tưởng Xứ", "distractors": ["Vô Sở Hữu Xứ", "Thức Vô Biên Xứ", "Không Vô Biên Xứ"], "explanation": "Từng bậc quá vi tế — không phải tưởng, không phải không tưởng.", "sourceRefs": [ref(TAM, 50)]},
        {"id": "M14_Q08", "type": "mcq", "question": "Tâm Vô sắc bắt cái gì làm đối tượng?", "correctAnswer": "Đề mục Vô sắc — không phải sắc pháp", "distractors": ["Sắc pháp Kasina", "Cảnh ngũ (sắc, thinh, hương, vị, xúc)", "Quang tướng của thân"], "explanation": "Tâm nào bắt không phải sắc pháp làm đối tượng gọi là Tâm Vô Sắc.", "sourceRefs": [ref(TAM, 48)]},
        {"id": "M14_Q09", "type": "mcq", "question": "Quả của nghiệp thiền thiện Vô sắc là gì?", "correctAnswer": "Tái sanh về cõi Thiền Vô Sắc tương ứng", "distractors": ["Tái sanh Phạm thiên Sắc giới", "Tái sanh cõi trời Dục giới", "Chứng quả A-la-hán"], "explanation": "Có quả cho sanh về cõi Thiền Vô sắc — tâm quả vô sắc làm tục sinh, hộ kiếp, tử.", "sourceRefs": [ref(TAM, 48), ref(TAM, 51)]},
        {"id": "M14_Q10", "type": "mcq", "question": "Tâm Duy Tác Vô Sắc giới là tâm của ai?", "correctAnswer": "Bậc A-la-hán tu chứng thiền vô sắc", "distractors": ["Bậc Tu đà hườn", "Phàm phu đắc thiền", "Chúng sanh cõi vô sắc"], "explanation": "ARŪPĀVACARAKIRIYĀCITTA — tâm của bậc A la hán tu chứng các tầng thiền vô sắc.", "sourceRefs": [ref(TAM, 51)]},
    ],
}
