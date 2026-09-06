# -*- coding: utf-8 -*-
"""Authored lesson content for M1-M5 and M7 (Vietnamese source)."""

TS = "VDP-TamSo.pdf"
TAM = "VDP-Tam.pdf"


def ref(file, page, note=None):
    d = {"file": file, "page": page}
    if note:
        d["note"] = note
    return d


M1_VI = {
    "title": "7 Tâm Sở Biến Hành (Sabbacittasādhāraṇa)",
    "description": "Bảy tâm sở có mặt trong mọi tâm — nền tảng bắt buộc trước khi học các module khác.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M1_S01",
            "title": "Tâm sở Tợ tha và nhóm Biến hành",
            "summary": "Aññasamāna: “chung với cái khác”. Trong đó Biến hành có 7, Biệt cảnh có 6.",
            "body": [
                "Aññasamāna: Añña là “một cái khác”, Samāna là “chung” — nghĩa là chung với cái khác. Tiếng Việt gọi là Tợ tha: tương tợ giống như cái khác; cái khác ra sao thì nó là như vậy.",
                "Nhóm Tợ tha chia làm 2: Tâm sở Biến hành (Sabbacittasādhāraṇa) có 7, và Tâm sở Biệt cảnh (Pakiṇṇaka) có 6.",
                "Bảy tâm sở Biến hành là: Xúc (Phassa), Thọ (Vedanā), Tưởng (Saññā), Tư (Cetanā), Nhất hành (Ekaggatā), Mạng quyền (Jīvitindriya), Tác ý (Manasikāra).",
                "Gọi là Biến hành vì cả 7 tâm sở này có mặt trong tất cả mọi tâm, không trừ tâm nào.",
            ],
            "keyTerms": [
                {"id": "TERM_ANNASAMANA", "term": "Tợ tha", "pali": "Aññasamāna", "meaning": "Chung với cái khác — thiện hay bất thiện tùy tâm đi kèm"},
                {"id": "TERM_SABBACITTA", "term": "Biến hành", "pali": "Sabbacittasādhāraṇa", "meaning": "7 tâm sở có mặt trong mọi tâm"},
                {"id": "TERM_PAKINNAKA", "term": "Biệt cảnh", "pali": "Pakiṇṇaka", "meaning": "6 tâm sở chỉ có mặt trong một số tâm"},
            ],
            "sourceRefs": [ref(TS, 3, "TÂM SỞ TỢ THA – AÑÑASAMĀNA; liệt kê Biến hành 7 và Biệt cảnh 6")],
        },
        {
            "id": "M1_S02",
            "title": "Xúc (Phassa) và Thọ (Vedanā)",
            "summary": "Xúc là sự tiếp chạm giữa Tâm và Cảnh; Thọ là sự hưởng cảnh.",
            "body": [
                "Phassa từ căn “Phas”: chạm vào, tiếp xúc, đụng cảnh. Khi nào có sự tiếp chạm giữa Tâm và Cảnh thì khi ấy có tâm sở Xúc.",
                "Trong cõi ngũ uẩn: khi có sự tiếp xúc giữa Căn (nhãn, nhĩ, tỷ, thiệt, thân), Cảnh (sắc, thinh, hương, vị, xúc) thì Thức sanh khởi — khi đó tâm sở Xúc có mặt. Mỗi căn xúc chỉ biết cảnh riêng của nó.",
                "Trong cõi tứ danh uẩn (cõi Vô sắc, không có Sắc uẩn): chỉ cần có Cảnh và Tâm xúc chạm nhau thì có tâm sở Xúc.",
                "Vedanā từ căn “vid” = hưởng cảnh. Khi có cảnh đến tiếp xúc vào dòng tâm thức thì tâm sở Thọ thọ lãnh và hưởng thọ cảnh đó.",
                "Quan hệ quan trọng: Xúc là vật thực cho Thọ — chính do có Xúc mới phát sanh Thọ; nên còn gọi là Xúc thực.",
            ],
            "keyTerms": [
                {"id": "TERM_PHASSA_M1", "term": "Xúc", "pali": "Phassa", "meaning": "Sự tiếp chạm giữa Tâm và Cảnh"},
                {"id": "TERM_VEDANA_M1", "term": "Thọ", "pali": "Vedanā", "meaning": "Sự hưởng cảnh"},
            ],
            "sourceRefs": [
                ref(TS, 4, "I.1/ TÂM SỞ XÚC – PHASSA"),
                ref(TS, 5, "Xúc phân theo cõi và theo hướng"),
                ref(TS, 6, "I.2/ TÂM SỞ THỌ – VEDANĀ; Xúc là vật thực cho Thọ"),
            ],
        },
        {
            "id": "M1_S03",
            "title": "Tưởng (Saññā) và Tư (Cetanā)",
            "summary": "Tưởng là nhớ lại qua dấu hiệu; Tư là tâm sở quan trọng nhất — tạo nghiệp.",
            "body": [
                "Saññā = saṃ + ñā: biết cái đã từng biết, nhớ lại, nhận ra vật gì đó, hay nhớ lại qua dấu hiệu đã từng biết.",
                "Tưởng phân theo giống có 3 loại: Tưởng bất thiện, Tưởng thiện, Tưởng vô ký. Theo cảnh có 6 (sắc tưởng, thinh tưởng…).",
                "Cetanā (Tư), Citta (Tâm) và Cetasika (Tâm sở) đều xuất nguyên từ căn “CIT”: suy gẫm, suy tư. Tư là tâm sở quan trọng nhất.",
                "Nhiệm vụ đặc biệt của Tư: tác hành nhiệm vụ của chính mình, đồng thời phối trí sinh hoạt của các tâm sở khác cùng phát sanh — và Tư chính là cái tạo nghiệp.",
            ],
            "keyTerms": [
                {"id": "TERM_SANNA_M1", "term": "Tưởng", "pali": "Saññā", "meaning": "Nhớ lại, nhận ra qua dấu hiệu đã biết"},
                {"id": "TERM_CETANA_M1", "term": "Tư", "pali": "Cetanā", "meaning": "Tâm sở quan trọng nhất — tạo nghiệp"},
            ],
            "sourceRefs": [
                ref(TS, 10, "I.3/ TÂM SỞ TƯỞNG – SAÑÑĀ"),
                ref(TS, 12, "I.4/ TÂM SỞ TƯ – CETANĀ, nhiệm vụ đặc biệt, tạo nghiệp"),
            ],
        },
        {
            "id": "M1_S04",
            "title": "Nhất hành, Mạng quyền, Tác ý",
            "summary": "Ekaggatā gom tâm về một điểm; Jīvitindriya bảo tồn danh pháp; Manasikāra hướng tâm đến cảnh.",
            "body": [
                "Ekaggatā: eka = một, agga = cao tột → điểm cao tột, nhứt điểm, nhất hành, định. Là sự gom Tâm và Tâm sở an trú vào một đối tượng, xâu kết các pháp cùng an trú trong cảnh, giữ tâm quân bình không lay động.",
                "Jīvitindriya: Jīvita là mạng (bảo tồn đời sống danh pháp), Indriya là quyền (khả năng cai quản, kiểm soát các pháp đồng sanh). Mạng quyền cai quản sự tồn tại của các pháp.",
                "Mạng quyền có 2 loại: Danh mạng quyền bảo tồn danh pháp tồn tại 3 sát-na tiểu (sanh, trụ, diệt); Sắc mạng quyền bảo tồn sắc pháp tồn tại 51 sát-na tiểu, tức 17 sát-na tâm × 3 sát-na tiểu.",
                "Manasikāra: Manasī là nơi tâm/nơi ý, Kāra là làm/tạo tác → tạo tác nơi ý, tức sự chú ý. Tác ý gom thâu đối tượng làm thành cảnh cho Tâm.",
                "Tứ ý nghĩa của Tác ý: trạng thái là hướng dẫn pháp tương ưng bắt cảnh trọn vẹn; phận sự là làm cho tâm và tâm sở đồng sanh phối hợp bắt níu lấy cảnh; sự thành tựu là hướng tâm đến cảnh; nhân cần thiết là phải có cảnh.",
            ],
            "keyTerms": [
                {"id": "TERM_EKAGGATA_M1", "term": "Nhất hành / Định", "pali": "Ekaggatā", "meaning": "Gom tâm an trú một điểm"},
                {"id": "TERM_JIVITINDRIYA_M1", "term": "Mạng quyền", "pali": "Jīvitindriya", "meaning": "Bảo tồn và cai quản sự tồn tại của danh pháp"},
                {"id": "TERM_MANASIKARA_M1", "term": "Tác ý", "pali": "Manasikāra", "meaning": "Gom thâu đối tượng làm cảnh cho tâm"},
            ],
            "sourceRefs": [
                ref(TS, 15, "I.5/ TÂM SỞ NHẤT HÀNH (ĐỊNH) – EKAGGATĀ"),
                ref(TS, 16, "I.6/ TÂM SỞ MẠNG QUYỀN – JĪVITINDRIYA; 3 và 51 sát na tiểu"),
                ref(TS, 18, "7/ TÂM SỞ TÁC Ý – MANASIKĀRA; tứ ý nghĩa"),
            ],
        },
    ],
    "reviewCards": [
        {"id": "M1_R01", "front": "Aññasamāna nghĩa là gì?", "back": "Añña: một cái khác; Samāna: chung → “chung với cái khác”, tiếng Việt gọi là Tợ tha.", "sourceRefs": [ref(TS, 3)]},
        {"id": "M1_R02", "front": "Kể đủ 7 tâm sở Biến hành.", "back": "Xúc, Thọ, Tưởng, Tư, Nhất hành, Mạng quyền, Tác ý.", "sourceRefs": [ref(TS, 3)]},
        {"id": "M1_R03", "front": "Vì sao gọi là “Biến hành”?", "back": "Vì cả 7 tâm sở này có mặt trong tất cả mọi tâm, không trừ tâm nào.", "sourceRefs": [ref(TS, 3)]},
        {"id": "M1_R04", "front": "Tâm sở Biệt cảnh (Pakiṇṇaka) có mấy?", "back": "6: Tầm, Tứ, Thắng giải, Cần, Hỷ, Dục.", "sourceRefs": [ref(TS, 3)]},
        {"id": "M1_R05", "front": "Phassa từ căn nào và nghĩa gì?", "back": "Căn “Phas”: chạm vào, tiếp xúc, đụng cảnh.", "sourceRefs": [ref(TS, 4)]},
        {"id": "M1_R06", "front": "Quan hệ giữa Xúc và Thọ?", "back": "Xúc là vật thực cho Thọ (Xúc thực) — do có Xúc mới phát sanh Thọ.", "sourceRefs": [ref(TS, 6)]},
        {"id": "M1_R07", "front": "Saññā được phân từ thế nào?", "back": "saññā = saṃ + ñā: biết cái đã từng biết, nhớ lại qua dấu hiệu đã từng biết.", "sourceRefs": [ref(TS, 10)]},
        {"id": "M1_R08", "front": "Cetanā, Citta, Cetasika cùng xuất từ căn nào?", "back": "Căn “CIT”: suy gẫm, suy tư.", "sourceRefs": [ref(TS, 12)]},
        {"id": "M1_R09", "front": "Vì sao Tư là tâm sở quan trọng nhất?", "back": "Vì Tư phối trí sinh hoạt của các tâm sở đồng sanh và chính Tư là cái tạo nghiệp.", "sourceRefs": [ref(TS, 12)]},
        {"id": "M1_R10", "front": "Ekaggatā được phân từ thế nào?", "back": "eka = một, agga = cao tột → nhứt điểm, nhất hành, định.", "sourceRefs": [ref(TS, 15)]},
        {"id": "M1_R11", "front": "Danh mạng quyền bảo tồn danh pháp bao lâu?", "back": "3 sát-na tiểu: sanh, trụ, diệt.", "sourceRefs": [ref(TS, 16)]},
        {"id": "M1_R12", "front": "Sắc mạng quyền bảo tồn sắc pháp bao lâu?", "back": "51 sát-na tiểu = 17 sát-na tâm × 3 sát-na tiểu.", "sourceRefs": [ref(TS, 16)]},
        {"id": "M1_R13", "front": "Manasikāra được phân từ thế nào?", "back": "Manasī: nơi tâm/nơi ý + Kāra: làm, tạo tác → tạo tác nơi ý, sự chú ý.", "sourceRefs": [ref(TS, 18)]},
        {"id": "M1_R14", "front": "Phận sự của Tác ý là gì?", "back": "Làm cho Tâm và Tâm sở sanh chung với nó phối hợp bắt níu lấy cảnh.", "sourceRefs": [ref(TS, 18)]},
    ],
    "quizSeeds": [
        {"id": "M1_Q01", "type": "mcq", "question": "Có bao nhiêu tâm sở Biến hành (Sabbacittasādhāraṇa)?", "correctAnswer": "7", "distractors": ["6", "13", "19"], "explanation": "Xúc, Thọ, Tưởng, Tư, Nhất hành, Mạng quyền, Tác ý = 7.", "sourceRefs": [ref(TS, 3)]},
        {"id": "M1_Q02", "type": "mcq", "question": "Tâm sở nào KHÔNG thuộc nhóm Biến hành?", "correctAnswer": "Tầm (Vitakka)", "distractors": ["Xúc (Phassa)", "Tác ý (Manasikāra)", "Mạng quyền (Jīvitindriya)"], "explanation": "Tầm thuộc nhóm Biệt cảnh (Pakiṇṇaka), không phải Biến hành.", "sourceRefs": [ref(TS, 3)]},
        {"id": "M1_Q03", "type": "mcq", "question": "Aññasamāna (Tợ tha) nghĩa là gì?", "correctAnswer": "Chung với cái khác — thiện/bất thiện tùy tâm đi kèm", "distractors": ["Luôn luôn thiện", "Luôn luôn bất thiện", "Chỉ có trong tâm siêu thế"], "explanation": "Añña: một cái khác; Samāna: chung. Cái khác ra sao thì nó là như vậy.", "sourceRefs": [ref(TS, 3)]},
        {"id": "M1_Q04", "type": "mcq", "question": "Xúc (Phassa) là gì?", "correctAnswer": "Sự tiếp chạm giữa Tâm và Cảnh", "distractors": ["Sự hưởng cảnh", "Sự nhớ lại cảnh", "Sự gom tâm về một điểm"], "explanation": "Phas: chạm vào, tiếp xúc, đụng cảnh.", "sourceRefs": [ref(TS, 4)]},
        {"id": "M1_Q05", "type": "mcq", "question": "“Xúc thực” nghĩa là gì?", "correctAnswer": "Xúc là vật thực (duyên) làm phát sanh Thọ", "distractors": ["Xúc là vật thực nuôi Sắc pháp", "Xúc là món ăn của Tưởng", "Xúc làm duyên cho Tư"], "explanation": "Chính do có sự xúc này mới phát sanh cái thọ — Xúc làm duyên cho Thọ.", "sourceRefs": [ref(TS, 6)]},
        {"id": "M1_Q06", "type": "mcq", "question": "Tâm sở Tưởng (Saññā) có phận sự chính là gì?", "correctAnswer": "Nhớ lại, nhận ra qua dấu hiệu đã từng biết", "distractors": ["Hưởng cảnh", "Tạo nghiệp", "Bảo tồn đời sống danh pháp"], "explanation": "saññā = saṃ + ñā: biết cái đã từng biết, nhớ lại qua dấu hiệu.", "sourceRefs": [ref(TS, 10)]},
        {"id": "M1_Q07", "type": "mcq", "question": "Tâm sở nào chính là cái tạo nghiệp?", "correctAnswer": "Tư (Cetanā)", "distractors": ["Tưởng (Saññā)", "Thọ (Vedanā)", "Tác ý (Manasikāra)"], "explanation": "Tư là tâm sở quan trọng nhất; nhiệm vụ đặc biệt của Tư là tạo nghiệp.", "sourceRefs": [ref(TS, 12)]},
        {"id": "M1_Q08", "type": "mcq", "question": "Ekaggatā được ghép từ hai chữ nào?", "correctAnswer": "eka (một) + agga (cao tột)", "distractors": ["eka (một) + gata (đi)", "esa (tìm) + agga (cao tột)", "eka (một) + ganthā (trói buộc)"], "explanation": "eka = một, agga = cao tột → nhứt điểm, nhất hành, định.", "sourceRefs": [ref(TS, 15)]},
        {"id": "M1_Q09", "type": "mcq", "question": "Sắc mạng quyền bảo tồn sắc pháp trong bao nhiêu sát-na tiểu?", "correctAnswer": "51 sát-na tiểu", "distractors": ["3 sát-na tiểu", "17 sát-na tiểu", "7 sát-na tiểu"], "explanation": "17 sát na tâm × 3 sát na tiểu = 51 sát na tiểu.", "sourceRefs": [ref(TS, 16)]},
        {"id": "M1_Q10", "type": "mcq", "question": "Danh mạng quyền bảo tồn danh pháp trong mấy sát-na?", "correctAnswer": "3 sát-na tiểu: sanh, trụ, diệt", "distractors": ["51 sát-na tiểu", "17 sát-na tâm", "7 sát-na đổng lực"], "explanation": "Danh mạng quyền bảo tồn đời sống danh pháp tồn tại 3 sát na tiểu.", "sourceRefs": [ref(TS, 16)]},
        {"id": "M1_Q11", "type": "mcq", "question": "Phận sự (kicca) của tâm sở Tác ý là gì?", "correctAnswer": "Làm cho tâm và tâm sở đồng sanh bắt níu lấy cảnh", "distractors": ["Hưởng thọ cảnh", "Ghi nhớ dấu hiệu của cảnh", "Cai quản sự tồn tại của các pháp"], "explanation": "Tứ ý nghĩa của Tác ý — phận sự: làm cho Tâm, Tâm sở sanh chung phối hợp bắt níu lấy cảnh.", "sourceRefs": [ref(TS, 18)]},
        {"id": "M1_Q12", "type": "mcq", "question": "Trong cõi Vô sắc (tứ danh uẩn), tâm sở Xúc sanh khởi thế nào?", "correctAnswer": "Chỉ cần Cảnh và Tâm xúc chạm nhau", "distractors": ["Cần đủ 6 căn và 6 cảnh", "Không có tâm sở Xúc", "Cần sắc thần kinh làm vật nương"], "explanation": "Cõi tứ danh uẩn không có Sắc uẩn; chỉ cần có Cảnh và Tâm xúc chạm nhau thì có tâm sở Xúc.", "sourceRefs": [ref(TS, 4)]},
    ],
}


M2_VI = {
    "title": "Si Phần (Mocatuka)",
    "description": "Bốn tâm sở Bất thiện Biến hành: Si, Vô tàm, Vô quý, Phóng dật.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M2_S01",
            "title": "Tâm sở Bất thiện và nhóm Si phần",
            "summary": "Akusala có 14 tâm sở; Si phần có 4, gọi là Bất thiện Biến hành.",
            "body": [
                "Nhóm Tâm sở Bất thiện (Akusala cetasika) có 14 tâm sở.",
                "Akusala — Bất thiện — có 5 nghĩa: (1) bệnh hoạn, đem đến đau khổ; (2) không tốt đẹp, xấu, dơ bẩn; (3) không khôn khéo, bị Tham Sân Si che mờ lý trí; (4) lầm lỗi; (5) tạo quả khổ.",
                "Tâm sở Si phần (Mocatuka cetasika) có 4: Si (Moha), Vô tàm (Ahirika), Vô quý (Anottappa), Phóng dật (Uddhacca).",
                "Bốn tâm sở này được gọi là Tâm sở Bất thiện Biến hành vì cả 4 đều có mặt trong tất cả các tâm Bất thiện. Chúng là khai cuộc dẫn đầu cho các tâm sở bất thiện và hiện hữu chung trong 12 tâm bất thiện.",
            ],
            "keyTerms": [
                {"id": "TERM_AKUSALA_CET", "term": "Tâm sở Bất thiện", "pali": "Akusala cetasika", "meaning": "14 tâm sở bất thiện"},
                {"id": "TERM_MOCATUKA", "term": "Si phần", "pali": "Mocatuka", "meaning": "4 tâm sở Bất thiện Biến hành"},
            ],
            "sourceRefs": [ref(TS, 31, "I/ TÂM SỞ SI PHẦN – MOCATUCACETASIKA; 5 nghĩa của Akusala")],
        },
        {
            "id": "M2_S02",
            "title": "Vô tàm và Vô quý",
            "summary": "Ahirika: không hổ thẹn tội lỗi. Anottappa: không ghê sợ tội lỗi. Hai tâm sở luôn đi chung.",
            "body": [
                "Vô tàm (Ahirika) là trạng thái không hổ thẹn với điều ác, không biết xấu hổ khi tạo tội.",
                "Vô quý (Anottappa) là trạng thái không ghê sợ, không e dè trước hậu quả của điều ác.",
                "Tài liệu nhấn mạnh: Vô tàm và Vô quý luôn đi chung — hễ có sự không e dè, không hổ thẹn thì cả hai cùng có mặt.",
                "Hai tâm sở này đối nghịch với Tàm (Hiri) và Quý (Ottappa) trong nhóm Tịnh hảo biến hành.",
            ],
            "keyTerms": [
                {"id": "TERM_AHIRIKA", "term": "Vô tàm", "pali": "Ahirika", "meaning": "Không hổ thẹn tội lỗi"},
                {"id": "TERM_ANOTTAPPA", "term": "Vô quý", "pali": "Anottappa", "meaning": "Không ghê sợ tội lỗi"},
            ],
            "sourceRefs": [
                ref(TS, 34, "I.2/ TÂM SỞ VÔ TÀM – AHIRIKA CETASIKA"),
                ref(TS, 35, "VÔ TÀM + VÔ QUÝ: cả 2 luôn đi chung"),
            ],
        },
        {
            "id": "M2_S03",
            "title": "Phóng dật (Uddhacca)",
            "summary": "Trạng thái chao động, không trụ vững; một trong năm triền cái.",
            "body": [
                "Uddhacca: U (trên) + căn Dhu (chao động, rung chuyển). Phóng dật là trạng thái chuyển động bên trên, không trụ vững, chập chờn, dao động, không định, phóng tâm.",
                "Tài liệu dùng nhiều ví dụ: như vó ngựa vừa chạm đất vội lìa ngay để chạm điểm khác; như cá bị vớt lên khỏi nước vùng vẫy; như tâm vừa bắt cảnh lại bị kéo rời sang cảnh khác; như mây vừa tụ bị gió thổi tan; như bụi thổi tung tóe.",
                "Những điều cần ghi nhớ: Phóng dật có mặt trong cả 12 tâm Bất thiện; tương ưng với Tứ danh uẩn; bất tương ưng với Sắc uẩn; thuộc giống Bất thiện; hiệp cùng thể tánh Bất thiện.",
                "Phóng dật là 1 trong 5 triền cái, đối nghịch với chi thiền Lạc.",
            ],
            "keyTerms": [
                {"id": "TERM_UDDHACCA", "term": "Phóng dật", "pali": "Uddhacca", "meaning": "Trạng thái chao động, không trụ vững"},
            ],
            "sourceRefs": [ref(TS, 36, "I.4 TÂM SỞ PHÓNG DẬT – UDDHACCA CETASIKA")],
        },
    ],
    "reviewCards": [
        {"id": "M2_R01", "front": "Nhóm tâm sở Bất thiện có bao nhiêu?", "back": "14 tâm sở bất thiện (Akusala cetasika).", "sourceRefs": [ref(TS, 31)]},
        {"id": "M2_R02", "front": "Akusala có mấy nghĩa? Kể ra.", "back": "5 nghĩa: bệnh hoạn; không tốt đẹp; không khôn khéo; lầm lỗi; tạo quả khổ.", "sourceRefs": [ref(TS, 31)]},
        {"id": "M2_R03", "front": "Si phần (Mocatuka) gồm những tâm sở nào?", "back": "Si (Moha), Vô tàm (Ahirika), Vô quý (Anottappa), Phóng dật (Uddhacca).", "sourceRefs": [ref(TS, 31)]},
        {"id": "M2_R04", "front": "Vì sao Si phần được gọi là “Bất thiện Biến hành”?", "back": "Vì cả 4 tâm sở này đều có mặt trong tất cả 12 tâm Bất thiện.", "sourceRefs": [ref(TS, 31), ref(TS, 36)]},
        {"id": "M2_R05", "front": "Vô tàm (Ahirika) là gì?", "back": "Không hổ thẹn với điều ác, không biết xấu hổ khi tạo tội.", "sourceRefs": [ref(TS, 34)]},
        {"id": "M2_R06", "front": "Vô quý (Anottappa) là gì?", "back": "Không ghê sợ, không e dè trước hậu quả của điều ác.", "sourceRefs": [ref(TS, 35)]},
        {"id": "M2_R07", "front": "Vô tàm và Vô quý có đi riêng lẻ được không?", "back": "Không. Cả 2 luôn đi chung — hễ có sự không e dè thì cũng có sự không hổ thẹn.", "sourceRefs": [ref(TS, 35)]},
        {"id": "M2_R08", "front": "Uddhacca được phân từ thế nào?", "back": "U (trên) + căn Dhu (chao động, rung chuyển) → chuyển động bên trên, không trụ vững.", "sourceRefs": [ref(TS, 36)]},
        {"id": "M2_R09", "front": "Nêu vài ví dụ tài liệu dùng cho Phóng dật.", "back": "Vó ngựa vừa chạm đất đã lìa; cá bị vớt lên khỏi nước vùng vẫy; mây vừa tụ bị gió thổi tan; bụi thổi tung tóe.", "sourceRefs": [ref(TS, 36)]},
        {"id": "M2_R10", "front": "Phóng dật là triền cái đối nghịch chi thiền nào?", "back": "Là 1 trong 5 triền cái, đối nghịch chi thiền Lạc.", "sourceRefs": [ref(TS, 36)]},
    ],
    "quizSeeds": [
        {"id": "M2_Q01", "type": "mcq", "question": "Tâm sở Si phần (Mocatuka) gồm mấy tâm sở?", "correctAnswer": "4", "distractors": ["3", "7", "14"], "explanation": "Si, Vô tàm, Vô quý, Phóng dật = 4.", "sourceRefs": [ref(TS, 31)]},
        {"id": "M2_Q02", "type": "mcq", "question": "Vì sao Si phần còn gọi là “Bất thiện Biến hành”?", "correctAnswer": "Vì có mặt trong tất cả 12 tâm Bất thiện", "distractors": ["Vì có mặt trong tất cả mọi tâm", "Vì chỉ có trong 2 tâm Si", "Vì có mặt trong tâm thiện lẫn bất thiện"], "explanation": "Cả 4 tâm sở này đều có mặt trong tất cả các Tâm Bất thiện.", "sourceRefs": [ref(TS, 31)]},
        {"id": "M2_Q03", "type": "mcq", "question": "Nhóm tâm sở Bất thiện (Akusala cetasika) có bao nhiêu?", "correctAnswer": "14", "distractors": ["12", "19", "25"], "explanation": "Nhóm 2: TÂM SỞ BẤT THIỆN – AKUSALA CETASIKA có 14.", "sourceRefs": [ref(TS, 31)]},
        {"id": "M2_Q04", "type": "mcq", "question": "Ahirika nghĩa là gì?", "correctAnswer": "Vô tàm — không hổ thẹn tội lỗi", "distractors": ["Vô quý — không ghê sợ tội lỗi", "Phóng dật — tâm chao động", "Si — mê mờ"], "explanation": "Ahirika là Vô tàm; Anottappa mới là Vô quý.", "sourceRefs": [ref(TS, 34)]},
        {"id": "M2_Q05", "type": "mcq", "question": "Quan hệ giữa Vô tàm và Vô quý?", "correctAnswer": "Luôn đi chung với nhau", "distractors": ["Không bao giờ đồng sanh", "Chỉ đồng sanh trong tâm Sân", "Chỉ đồng sanh trong tâm Si"], "explanation": "Cả 2 luôn đi chung: hễ có sự không e dè, không hổ thẹn thì cả hai cùng có.", "sourceRefs": [ref(TS, 35)]},
        {"id": "M2_Q06", "type": "mcq", "question": "Uddhacca (Phóng dật) là trạng thái gì?", "correctAnswer": "Chao động, không trụ vững, phóng tâm", "distractors": ["Bám chặt vào đối tượng", "Bực bội khó chịu", "Phân vân nghi ngờ"], "explanation": "U (trên) + Dhu (chao động) → trạng thái chuyển động, không trụ vững, dao động.", "sourceRefs": [ref(TS, 36)]},
        {"id": "M2_Q07", "type": "mcq", "question": "Phóng dật có mặt trong bao nhiêu tâm bất thiện?", "correctAnswer": "12 tâm Bất thiện", "distractors": ["8 tâm Tham", "2 tâm Si", "11 tâm Bất thiện"], "explanation": "Những điều cần ghi nhớ: Phóng dật có mặt trong 12 tâm Bất thiện.", "sourceRefs": [ref(TS, 36)]},
        {"id": "M2_Q08", "type": "mcq", "question": "Bất thiện (Akusala) có bao nhiêu nghĩa theo tài liệu?", "correctAnswer": "5 nghĩa", "distractors": ["3 nghĩa", "4 nghĩa", "7 nghĩa"], "explanation": "Bệnh hoạn, không tốt đẹp, không khôn khéo, lầm lỗi, tạo quả khổ.", "sourceRefs": [ref(TS, 31)]},
        {"id": "M2_Q09", "type": "mcq", "question": "Phóng dật đối nghịch với chi thiền nào?", "correctAnswer": "Chi thiền Lạc", "distractors": ["Chi thiền Tầm", "Chi thiền Định", "Chi thiền Hỷ"], "explanation": "Là 1 trong 5 triền cái đối nghịch chi thiền lạc.", "sourceRefs": [ref(TS, 36)]},
        {"id": "M2_Q10", "type": "mcq", "question": "Bốn tâm sở Si phần giữ vai trò gì với các tâm sở bất thiện khác?", "correctAnswer": "Là khai cuộc dẫn đầu cho các tâm sở bất thiện", "distractors": ["Là kết thúc của lộ bất thiện", "Chỉ hỗ trợ tâm Sân", "Không liên hệ gì"], "explanation": "Moha – Ahirika – Anottappa – Uddhacca là khai cuộc dẫn đầu cho các Tâm sở bất thiện.", "sourceRefs": [ref(TS, 36)]},
    ],
}


M3_VI = {
    "title": "Tịnh Hảo Biến Hành (Sobhanasādhāraṇa)",
    "description": "19 tâm sở Tịnh hảo có mặt trong mọi tâm tịnh hảo.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M3_S01",
            "title": "Nhóm Tâm sở Tịnh hảo",
            "summary": "Sobhana: chói sáng, rực rỡ. Có 25 tâm sở, chia 4 nhóm.",
            "body": [
                "Sobhana nghĩa là Chói sáng, Rực rỡ, Tịnh hảo. “Tịnh” là sạch, tinh nguyên, thanh tịnh; “Hảo” là tốt, lành, đẹp, hay, giỏi, khéo, đúng.",
                "Nhóm Tâm sở Tịnh hảo có 25 tâm sở, chia làm 4 nhóm.",
                "Nhóm thứ nhất là Sobhanasādhāraṇā — Tâm sở Tịnh hảo Biến hành, có 19.",
                "Nhóm thứ hai là Viratiyo — Giới phần, có 3: Chánh ngữ (Sammāvācā), Chánh nghiệp (Sammākammanto), Chánh mạng (Sammā-ājīvo).",
            ],
            "keyTerms": [
                {"id": "TERM_SOBHANA", "term": "Tịnh hảo", "pali": "Sobhana", "meaning": "Chói sáng, rực rỡ, tốt đẹp"},
                {"id": "TERM_VIRATI", "term": "Giới phần", "pali": "Viratiyo", "meaning": "3 tâm sở ngăn trừ: Chánh ngữ, Chánh nghiệp, Chánh mạng"},
            ],
            "sourceRefs": [ref(TS, 55, "Nhóm 3: TÂM SỞ TỊNH HẢO – SOBHANA CETASIKA, có 25 tâm, chia 4 nhóm")],
        },
        {
            "id": "M3_S02",
            "title": "Danh sách 19 Tịnh hảo Biến hành",
            "summary": "Từ Tín và Niệm, qua Tàm–Quý, Vô tham–Vô sân–Hành xả, đến 6 cặp Thân–Tâm.",
            "body": [
                "1. Tín (Saddhā). 2. Niệm (Sati). 3. Tàm (Hiri). 4. Quý (Ottappa). 5. Vô tham (Alobha). 6. Vô sân (Adosa). 7. Hành xả (Tatramajjhattatā).",
                "8. Tịnh thân (Kāyapassaddhi). 9. Tịnh tâm (Cittapassaddhi).",
                "10. Khinh thân (Kāyalahutā). 11. Khinh tâm (Cittalahutā). 12. Nhu thân (Kāyamudutā). 13. Nhu tâm (Cittamudutā).",
                "14. Thích thân (Kāyakammaññatā). 15. Thích tâm (Cittakammaññatā). 16. Thuần thân (Kāyapāguññatā). 17. Thuần tâm (Cittapāguññatā).",
                "18. Chánh thân (Kāyujjukatā). 19. Chánh tâm (Cittujjukatā).",
                "Lưu ý cấu trúc: từ số 8 đến 19 là 6 cặp song đôi Thân–Tâm (Kāya–Citta): Tịnh, Khinh, Nhu, Thích, Thuần, Chánh.",
            ],
            "keyTerms": [
                {"id": "TERM_SADDHA_M3", "term": "Tín", "pali": "Saddhā", "meaning": "Đức tin trong sạch"},
                {"id": "TERM_SATI_M3", "term": "Niệm", "pali": "Sati", "meaning": "Ghi nhớ, không quên cảnh thiện"},
                {"id": "TERM_HIRI_M3", "term": "Tàm", "pali": "Hiri", "meaning": "Hổ thẹn tội lỗi"},
                {"id": "TERM_OTTAPPA_M3", "term": "Quý", "pali": "Ottappa", "meaning": "Ghê sợ tội lỗi"},
                {"id": "TERM_TATRAMAJJHATTATA_M3", "term": "Hành xả", "pali": "Tatramajjhattatā", "meaning": "Quân bình các pháp đồng sanh"},
            ],
            "sourceRefs": [ref(TS, 55, "I. SOBHANASĀDHĀRAṆĀ – TÂM SỞ TỊNH HẢO BIẾN HÀNH, có 19: danh sách đầy đủ")],
        },
        {
            "id": "M3_S03",
            "title": "Hai nhóm còn lại: Vô lượng phần và Tuệ quyền",
            "summary": "19 + 3 + 2 + 1 = 25 tâm sở Tịnh hảo.",
            "body": [
                "Nhóm thứ ba là Appamaññā — Vô lượng phần, có 2 tâm sở: Tâm Bi (Karunā) và Tâm Hỷ / Tùy hỷ (Muditā).",
                "Nhóm thứ tư là Paññindriya — Tuệ quyền, có 1 tâm sở.",
                "Cộng đủ 4 nhóm: Tịnh hảo Biến hành 19 + Giới phần 3 + Vô lượng phần 2 + Tuệ quyền 1 = 25 tâm sở Tịnh hảo.",
                "Khác biệt cần nhớ: chỉ nhóm 19 là “biến hành” — có mặt trong mọi tâm tịnh hảo. Ba nhóm còn lại (Giới phần, Vô lượng phần, Tuệ quyền) chỉ có mặt tùy trường hợp.",
            ],
            "keyTerms": [
                {"id": "TERM_APPAMANNA", "term": "Vô lượng phần", "pali": "Appamaññā", "meaning": "2 tâm sở: Bi và Tùy hỷ"},
                {"id": "TERM_KARUNA_M3", "term": "Bi", "pali": "Karunā", "meaning": "Thương xót chúng sanh đang khổ"},
                {"id": "TERM_MUDITA_M3", "term": "Tùy hỷ", "pali": "Muditā", "meaning": "Vui theo hạnh phúc của người khác"},
                {"id": "TERM_PANNINDRIYA", "term": "Tuệ quyền", "pali": "Paññindriya", "meaning": "1 tâm sở trí tuệ"},
            ],
            "sourceRefs": [
                ref(TS, 55, "III. APPAMAÑÑĀ – VÔ LƯỢNG PHẦN, có 2 tâm; IV. PAÑÑINDRIYA – TUỆ QUYỀN, có 1 tâm"),
                ref(TS, 84, "III/ TÂM SỞ VÔ LƯỢNG PHẦN – APPAMAÑÑĀYACETASIKA"),
            ],
        },
    ],
    "reviewCards": [
        {"id": "M3_R01", "front": "Sobhana nghĩa là gì?", "back": "Chói sáng, Rực rỡ, Tịnh hảo. Tịnh: sạch, thanh tịnh; Hảo: tốt, đẹp, khéo, đúng.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R02", "front": "Nhóm Tâm sở Tịnh hảo có bao nhiêu tâm sở?", "back": "25 tâm sở, chia làm 4 nhóm.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R03", "front": "Tịnh hảo Biến hành có bao nhiêu?", "back": "19 tâm sở.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R04", "front": "Bốn tâm sở đầu của nhóm 19 là gì?", "back": "Tín (Saddhā), Niệm (Sati), Tàm (Hiri), Quý (Ottappa).", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R05", "front": "Tâm sở thứ 5, 6, 7 trong nhóm 19?", "back": "Vô tham (Alobha), Vô sân (Adosa), Hành xả (Tatramajjhattatā).", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R06", "front": "Sáu cặp song đôi Thân–Tâm gồm những gì?", "back": "Tịnh, Khinh, Nhu, Thích, Thuần, Chánh — mỗi thứ có một cặp Kāya (thân) và Citta (tâm).", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R07", "front": "Tàm và Quý đối nghịch với tâm sở nào?", "back": "Tàm (Hiri) đối nghịch Vô tàm (Ahirika); Quý (Ottappa) đối nghịch Vô quý (Anottappa).", "sourceRefs": [ref(TS, 55), ref(TS, 35)]},
        {"id": "M3_R08", "front": "Nhóm Giới phần (Viratiyo) gồm những gì?", "back": "3 tâm sở: Chánh ngữ (Sammāvācā), Chánh nghiệp (Sammākammanto), Chánh mạng (Sammā-ājīvo).", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R09", "front": "Kāyapassaddhi và Cittapassaddhi là gì?", "back": "Tịnh thân và Tịnh tâm — cặp thứ nhất trong 6 cặp song đôi.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R10", "front": "Hai tâm sở cuối cùng của nhóm 19?", "back": "Chánh thân (Kāyujjukatā) và Chánh tâm (Cittujjukatā).", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R11", "front": "Bốn nhóm của 25 tâm sở Tịnh hảo là gì?", "back": "Tịnh hảo Biến hành 19 + Giới phần 3 + Vô lượng phần 2 + Tuệ quyền 1 = 25.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_R12", "front": "Vô lượng phần (Appamaññā) gồm những tâm sở nào?", "back": "2 tâm sở: Bi (Karunā) và Tùy hỷ (Muditā).", "sourceRefs": [ref(TS, 55), ref(TS, 84)]},
    ],
    "quizSeeds": [
        {"id": "M3_Q01", "type": "mcq", "question": "Tâm sở Tịnh hảo Biến hành có bao nhiêu?", "correctAnswer": "19", "distractors": ["25", "14", "7"], "explanation": "Sobhanasādhāraṇā có 19; toàn bộ nhóm Tịnh hảo mới là 25.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q02", "type": "mcq", "question": "Toàn bộ nhóm Tâm sở Tịnh hảo có bao nhiêu tâm sở?", "correctAnswer": "25, chia 4 nhóm", "distractors": ["19, chia 2 nhóm", "14, chia 3 nhóm", "52, chia 4 nhóm"], "explanation": "Sobhana cetasika có 25 tâm, chia làm 4 nhóm.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q03", "type": "mcq", "question": "Sobhana nghĩa là gì?", "correctAnswer": "Chói sáng, rực rỡ, tịnh hảo", "distractors": ["Mê mờ, tối tăm", "Chung với cái khác", "Bám chặt, dính mắc"], "explanation": "Sobhana: Chói sáng, Rực rỡ, Tịnh hảo.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q04", "type": "mcq", "question": "Tâm sở nào đứng đầu danh sách 19 Tịnh hảo Biến hành?", "correctAnswer": "Tín (Saddhā)", "distractors": ["Niệm (Sati)", "Tàm (Hiri)", "Vô tham (Alobha)"], "explanation": "Thứ tự: 1. Tín – 2. Niệm – 3. Tàm – 4. Quý…", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q05", "type": "mcq", "question": "Tatramajjhattatā là tâm sở nào?", "correctAnswer": "Hành xả", "distractors": ["Vô sân", "Tịnh tâm", "Niệm"], "explanation": "7. HÀNH XẢ – TATRAMAJJHATTATĀ.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q06", "type": "mcq", "question": "Nhóm Giới phần (Viratiyo) gồm mấy tâm sở?", "correctAnswer": "3", "distractors": ["2", "4", "19"], "explanation": "Chánh ngữ, Chánh nghiệp, Chánh mạng = 3.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q07", "type": "mcq", "question": "Tâm sở nào KHÔNG thuộc nhóm Giới phần?", "correctAnswer": "Chánh niệm (Sammāsati)", "distractors": ["Chánh ngữ (Sammāvācā)", "Chánh nghiệp (Sammākammanto)", "Chánh mạng (Sammā-ājīvo)"], "explanation": "Viratiyo chỉ có 3: Chánh ngữ, Chánh nghiệp, Chánh mạng.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q08", "type": "mcq", "question": "Kāyalahutā và Cittalahutā là cặp tâm sở nào?", "correctAnswer": "Khinh thân và Khinh tâm", "distractors": ["Tịnh thân và Tịnh tâm", "Nhu thân và Nhu tâm", "Chánh thân và Chánh tâm"], "explanation": "10. KHINH THÂN – KĀYALAHUTĀ; 11. KHINH TÂM – CITTALAHUTĀ.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q09", "type": "mcq", "question": "Trong 19 Tịnh hảo Biến hành có bao nhiêu cặp song đôi Thân–Tâm?", "correctAnswer": "6 cặp", "distractors": ["3 cặp", "4 cặp", "12 cặp"], "explanation": "Tịnh, Khinh, Nhu, Thích, Thuần, Chánh — mỗi thứ một cặp Kāya/Citta (số 8 đến 19).", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q10", "type": "mcq", "question": "Tàm (Hiri) đối nghịch với tâm sở nào?", "correctAnswer": "Vô tàm (Ahirika)", "distractors": ["Vô quý (Anottappa)", "Phóng dật (Uddhacca)", "Si (Moha)"], "explanation": "Hiri ↔ Ahirika; Ottappa ↔ Anottappa.", "sourceRefs": [ref(TS, 55), ref(TS, 34)]},
        {"id": "M3_Q11", "type": "mcq", "question": "Vô lượng phần (Appamaññā) gồm mấy tâm sở?", "correctAnswer": "2 — Bi và Tùy hỷ", "distractors": ["4 — Từ, Bi, Hỷ, Xả", "3 — Bi, Tùy hỷ, Hành xả", "1 — chỉ có Bi"], "explanation": "III. APPAMAÑÑĀ – VÔ LƯỢNG PHẦN, có 2 tâm: Karunā và Muditā.", "sourceRefs": [ref(TS, 55)]},
        {"id": "M3_Q12", "type": "mcq", "question": "Tuệ quyền (Paññindriya) gồm mấy tâm sở?", "correctAnswer": "1", "distractors": ["2", "3", "19"], "explanation": "IV. PAÑÑINDRIYA – TUỆ QUYỀN, có 1 tâm.", "sourceRefs": [ref(TS, 55)]},
    ],
}


M4_VI = {
    "title": "12 Tâm Bất Thiện (Akusala Citta)",
    "description": "8 tâm Tham, 2 tâm Sân, 2 tâm Si — nguyên nhân của Khổ.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M4_S01",
            "title": "Vị trí của Tâm Bất thiện trong 121 tâm",
            "summary": "Tâm Dục giới 54, trong đó Bất thiện 12, Vô nhân 18, Dục giới Tịnh hảo 24.",
            "body": [
                "Tâm (Citta) có 121 tâm, chia thành: Tâm Dục giới 54, Tâm Sắc giới 15, Tâm Vô sắc giới 12, Tâm Siêu thế 40 (tính rộng).",
                "Tâm Dục giới 54 gồm 3 nhóm: Tâm Bất thiện 12, Tâm Vô nhân 18 (15 tâm Quả + 3 tâm Duy tác), Tâm Dục giới Tịnh hảo 24.",
                "Tâm Bất thiện 12 gồm: Tham (Lobha) 8 tâm, Sân (Dosa) 2 tâm, Si (Moha) 2 tâm.",
                "Tứ ý nghĩa của Tâm: trạng thái là biết cảnh; phận sự là dẫn dắt sở hữu tâm; sự thành tựu là nối liền không gián đoạn; nhân cần thiết là Danh, Sắc và Cảnh.",
                "Bốn nhân sanh Tâm: do nghiệp quá khứ; có cảnh duyên; có sở hữu tâm; có vật nương.",
            ],
            "keyTerms": [
                {"id": "TERM_CITTA_M4", "term": "Tâm", "pali": "Citta", "meaning": "Cái biết cảnh"},
                {"id": "TERM_AKUSALACITTA", "term": "Tâm Bất thiện", "pali": "Akusala citta", "meaning": "12 tâm: 8 Tham + 2 Sân + 2 Si"},
            ],
            "sourceRefs": [ref(TAM, 9, "Phân loại TÂM – 121 tâm; Tâm Dục giới 54; tứ ý nghĩa; bốn nhân sanh tâm")],
        },
        {
            "id": "M4_S02",
            "title": "Tám tâm Tham (Lobhamūla citta)",
            "summary": "Phân theo Thọ (hỷ/xả), Tà kiến (hợp/ly) và Trợ (vô/hữu): 2×2×2 = 8.",
            "body": [
                "Tâm Tham là sự ham muốn, dính mắc đối tượng. Căn gốc Lobha, từ căn “Lub”: bám chặt vào, cột lại, bám níu, khát vọng, ái luyến.",
                "Tám tâm tham được phân theo ba cặp đối: Thọ hỷ (somanassa) / Thọ xả (upekkhā); Hợp tà kiến (diṭṭhigatasampayutta) / Ly tà kiến (diṭṭhigatavippayutta); Vô trợ (asaṅkhārika) / Hữu trợ (sasaṅkhārika).",
                "Ví dụ tâm số 1: “Somanassa-sahagataṃ diṭṭhigatasampayuttaṃ asaṅkhārikaṃ” — Tâm tham thọ hỷ, hợp tà, vô trợ.",
                "Cách gom nhóm: 1+2+3+4 là tâm tham thọ hỷ; 5+6+7+8 là tâm tham thọ xả; 1+2+5+6 hợp tà kiến; 3+4+7+8 ly tà; 1+3+5+7 vô trợ; 2+4+6+8 hữu trợ.",
                "Về mức độ cho quả khác biệt: Hỷ cho quả hơn Xả; Vô trợ hơn Hữu trợ; Tà kiến hơn Ly tà.",
            ],
            "keyTerms": [
                {"id": "TERM_LOBHA_M4", "term": "Tham", "pali": "Lobha", "meaning": "Bám chặt, dính mắc đối tượng"},
                {"id": "TERM_ASANKHARIKA", "term": "Vô trợ", "pali": "Asaṅkhārika", "meaning": "Không cần sự xúi giục"},
                {"id": "TERM_SASANKHARIKA", "term": "Hữu trợ", "pali": "Sasaṅkhārika", "meaning": "Có sự xúi giục, thúc đẩy"},
                {"id": "TERM_DITTHIGATA", "term": "Hợp tà kiến", "pali": "Diṭṭhigatasampayutta", "meaning": "Tương ưng với tà kiến"},
            ],
            "sourceRefs": [
                ref(TAM, 10, "TÂM THAM – LOBHAMŪLA CITTA có 8: danh sách Pāli đầy đủ"),
                ref(TAM, 11, "Cho quả khác biệt; cách gom nhóm 8 tâm tham"),
            ],
        },
        {
            "id": "M4_S03",
            "title": "Hai tâm Sân (Dosamūla citta)",
            "summary": "Thọ ưu, hợp phẫn; khác nhau ở Vô trợ và Hữu trợ.",
            "body": [
                "Tâm Sân có căn gốc là Sân, thực tính bực bội, khó chịu, không hài lòng, bất toại nguyện; nặng hơn là hận, phẫn nộ, ác độc.",
                "Tâm sân 1: “Domanassa-sahagataṃ paṭighasampayuttaṃ asaṅkhārikaṃ” — Thọ ưu, hợp phẫn, vô trợ. Trạng thái tâm sân có Thọ ưu đồng sanh, tương ưng một sự phẫn nộ khởi lên nhanh chóng.",
                "Tâm sân 2: cùng như trên nhưng “sasaṅkhārikaṃ” — hữu trợ, khởi lên chậm hơn.",
                "Thọ ưu (domanassa) thuộc thọ uẩn: cảm giác bất an, bức xúc, khó chịu.",
                "Bốn nhân sanh tâm Sân: tánh nết quen sân; không suy xét sâu xa; thiếu kiến thức học hiểu; thường gặp cảnh xấu.",
            ],
            "keyTerms": [
                {"id": "TERM_DOSA_M4", "term": "Sân", "pali": "Dosa", "meaning": "Bực bội, không hài lòng"},
                {"id": "TERM_PATIGHA", "term": "Phẫn", "pali": "Paṭigha", "meaning": "Sự tức giận, bực bội, phẫn nộ"},
                {"id": "TERM_DOMANASSA", "term": "Thọ ưu", "pali": "Domanassa", "meaning": "Cảm giác bất an, khó chịu"},
            ],
            "sourceRefs": [ref(TAM, 14, "TÂM SÂN – DOSAMŪLACITTA có 2; 4 nhân sanh tâm sân")],
        },
        {
            "id": "M4_S04",
            "title": "Hai tâm Si (Mohamūla citta)",
            "summary": "Si thọ xả Hoài nghi và Si thọ xả Phóng dật.",
            "body": [
                "Tâm si 1: “Upekkhā-sahagataṃ vicikicchāsampayuttaṃ” — Si thọ xả Hoài nghi, có trạng thái phân vân.",
                "Hoài nghi có 2 mức: Si hoài nghi thông thường; và Si hoài nghi đặc biệt — nghi về Phật, Pháp, Tăng, Tam học (giới, định, tuệ), quá khứ, vị lai, hiện tại, và duyên sinh.",
                "Tâm si 2: “Upekkhā-sahagataṃ uddhaccasampayuttaṃ” — Si thọ xả Phóng dật: tâm chao đảo, loạng choạng.",
                "Hai nhân sanh tâm Si: (1) Phi như lý tác ý — không đúng pháp, không đúng sự thật, khiến tâm mê muội; (2) Pháp lậu làm nền tảng — Dục lậu, Hữu lậu, Kiến lậu, Vô minh lậu.",
            ],
            "keyTerms": [
                {"id": "TERM_MOHA_M4", "term": "Si", "pali": "Moha", "meaning": "Mê mờ, lầm lạc"},
                {"id": "TERM_VICIKICCHA", "term": "Hoài nghi", "pali": "Vicikicchā", "meaning": "Trạng thái phân vân, nghi ngờ"},
                {"id": "TERM_AYONISO", "term": "Phi như lý tác ý", "pali": "Ayoniso manasikāra", "meaning": "Tác ý không đúng sự thật"},
            ],
            "sourceRefs": [ref(TAM, 14, "TÂM SI – MOHAMŪLA CITTA có 2; 2 nhân sanh tâm si")],
        },
    ],
    "reviewCards": [
        {"id": "M4_R01", "front": "Tâm Bất thiện có bao nhiêu và phân thế nào?", "back": "12 tâm: 8 tâm Tham (Lobha), 2 tâm Sân (Dosa), 2 tâm Si (Moha).", "sourceRefs": [ref(TAM, 9)]},
        {"id": "M4_R02", "front": "Tâm Dục giới có bao nhiêu và gồm những nhóm nào?", "back": "54 tâm: 12 Bất thiện + 18 Vô nhân + 24 Dục giới Tịnh hảo.", "sourceRefs": [ref(TAM, 9)]},
        {"id": "M4_R03", "front": "Tứ ý nghĩa của Tâm?", "back": "Trạng thái: biết cảnh. Phận sự: dẫn dắt sở hữu tâm. Thành tựu: nối liền không gián đoạn. Nhân cần thiết: Danh, Sắc và Cảnh.", "sourceRefs": [ref(TAM, 9)]},
        {"id": "M4_R04", "front": "Bốn nhân sanh Tâm?", "back": "Nghiệp quá khứ; cảnh duyên; sở hữu tâm; vật nương.", "sourceRefs": [ref(TAM, 9)]},
        {"id": "M4_R05", "front": "8 tâm Tham phân theo mấy cặp đối?", "back": "Ba cặp: Thọ hỷ/xả, Hợp tà/Ly tà, Vô trợ/Hữu trợ → 2×2×2 = 8.", "sourceRefs": [ref(TAM, 10)]},
        {"id": "M4_R06", "front": "Lobha từ căn nào?", "back": "Căn “Lub”: bám chặt vào, cột lại, bám níu, khát vọng, ái luyến.", "sourceRefs": [ref(TAM, 10)]},
        {"id": "M4_R07", "front": "Về mức cho quả, tâm tham nào mạnh hơn?", "back": "Hỷ hơn Xả; Vô trợ hơn Hữu trợ; Tà kiến hơn Ly tà.", "sourceRefs": [ref(TAM, 11)]},
        {"id": "M4_R08", "front": "Asaṅkhārika và Sasaṅkhārika nghĩa là gì?", "back": "Asaṅkhārika: vô trợ (không cần xúi giục). Sasaṅkhārika: hữu trợ (có sự xúi giục).", "sourceRefs": [ref(TAM, 10)]},
        {"id": "M4_R09", "front": "Hai tâm Sân khác nhau ở điểm nào?", "back": "Cả hai đều Thọ ưu, hợp phẫn; khác ở Vô trợ (khởi nhanh) và Hữu trợ (khởi chậm hơn).", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_R10", "front": "Bốn nhân sanh tâm Sân?", "back": "Tánh nết quen sân; không suy xét sâu xa; thiếu kiến thức học hiểu; thường gặp cảnh xấu.", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_R11", "front": "Hai tâm Si tên là gì?", "back": "Si thọ xả Hoài nghi (vicikicchā) và Si thọ xả Phóng dật (uddhacca).", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_R12", "front": "Si hoài nghi đặc biệt là nghi về những gì?", "back": "Phật, Pháp, Tăng, Tam học (giới–định–tuệ), quá khứ, vị lai, hiện tại và duyên sinh.", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_R13", "front": "Hai nhân sanh tâm Si?", "back": "Phi như lý tác ý; và Pháp lậu làm nền tảng (Dục lậu, Hữu lậu, Kiến lậu, Vô minh lậu).", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_R14", "front": "Cả 2 tâm Si có thọ gì?", "back": "Đều là Thọ xả (upekkhā-sahagataṃ).", "sourceRefs": [ref(TAM, 14)]},
    ],
    "quizSeeds": [
        {"id": "M4_Q01", "type": "mcq", "question": "12 tâm Bất thiện được phân thế nào?", "correctAnswer": "8 Tham + 2 Sân + 2 Si", "distractors": ["6 Tham + 4 Sân + 2 Si", "8 Tham + 2 Si + 2 Hoài nghi", "4 Tham + 4 Sân + 4 Si"], "explanation": "Akusala citta 12: Lobha 8, Dosa 2, Moha 2.", "sourceRefs": [ref(TAM, 9)]},
        {"id": "M4_Q02", "type": "mcq", "question": "Tâm Dục giới có bao nhiêu tâm?", "correctAnswer": "54", "distractors": ["12", "24", "121"], "explanation": "Kāmāvacaracitta có 54 tâm: 12 Bất thiện + 18 Vô nhân + 24 Dục giới Tịnh hảo.", "sourceRefs": [ref(TAM, 9)]},
        {"id": "M4_Q03", "type": "mcq", "question": "Tám tâm Tham được phân theo ba cặp đối nào?", "correctAnswer": "Thọ hỷ/xả — Hợp tà/Ly tà — Vô trợ/Hữu trợ", "distractors": ["Thiện/Bất thiện — Nhân/Quả — Nội/Ngoại", "Hỷ/Ưu — Hợp trí/Ly trí — Nhanh/Chậm", "Dục giới/Sắc giới — Nhân/Quả — Vô trợ/Hữu trợ"], "explanation": "2 × 2 × 2 = 8 tâm tham.", "sourceRefs": [ref(TAM, 10)]},
        {"id": "M4_Q04", "type": "mcq", "question": "“Asaṅkhārikaṃ” nghĩa là gì?", "correctAnswer": "Vô trợ — không cần sự xúi giục", "distractors": ["Hữu trợ — có sự xúi giục", "Hợp tà kiến", "Thọ hỷ"], "explanation": "Asaṅkhārika: vô trợ; Sasaṅkhārika: hữu trợ.", "sourceRefs": [ref(TAM, 10)]},
        {"id": "M4_Q05", "type": "mcq", "question": "Lobha xuất từ căn nào?", "correctAnswer": "Căn “Lub” — bám chặt vào", "distractors": ["Căn “Muh” — mê mờ", "Căn “Ju” — chạy nhanh", "Căn “Rup” — tan vỡ"], "explanation": "“lubhatīti = lobha: Bám chặt vào, gọi là Tham”.", "sourceRefs": [ref(TAM, 10)]},
        {"id": "M4_Q06", "type": "mcq", "question": "Tâm Sân có thọ gì?", "correctAnswer": "Thọ ưu (domanassa)", "distractors": ["Thọ hỷ (somanassa)", "Thọ xả (upekkhā)", "Thọ khổ (dukkha)"], "explanation": "Cả 2 tâm sân đều là Domanassa-sahagataṃ paṭighasampayuttaṃ.", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_Q07", "type": "mcq", "question": "Có bao nhiêu tâm Sân?", "correctAnswer": "2", "distractors": ["1", "4", "8"], "explanation": "Dosamūlacitta có 2: vô trợ và hữu trợ.", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_Q08", "type": "mcq", "question": "Hai tâm Si có thọ gì?", "correctAnswer": "Thọ xả (upekkhā)", "distractors": ["Thọ ưu", "Thọ hỷ", "Một tâm thọ hỷ, một tâm thọ xả"], "explanation": "Cả hai đều Upekkhā-sahagataṃ: Si thọ xả Hoài nghi và Si thọ xả Phóng dật.", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_Q09", "type": "mcq", "question": "Tâm si nào tương ưng với Vicikicchā?", "correctAnswer": "Tâm si thọ xả Hoài nghi", "distractors": ["Tâm si thọ xả Phóng dật", "Tâm tham thọ xả hợp tà", "Tâm sân thọ ưu hợp phẫn"], "explanation": "Upekkhāsahagataṃ vicikicchāsampayuttaṃ — trạng thái phân vân.", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_Q10", "type": "mcq", "question": "Hai nhân sanh tâm Si là gì?", "correctAnswer": "Phi như lý tác ý và Pháp lậu làm nền tảng", "distractors": ["Tánh quen sân và gặp cảnh xấu", "Nghiệp quá khứ và cảnh duyên", "Vô tàm và Vô quý"], "explanation": "1. Phi như lý tác ý; 2. Pháp lậu (Dục lậu, Hữu lậu, Kiến lậu, Vô minh lậu).", "sourceRefs": [ref(TAM, 14)]},
        {"id": "M4_Q11", "type": "mcq", "question": "Theo tài liệu, tâm tham nào cho quả mạnh hơn?", "correctAnswer": "Thọ hỷ mạnh hơn thọ xả", "distractors": ["Thọ xả mạnh hơn thọ hỷ", "Hữu trợ mạnh hơn vô trợ", "Ly tà mạnh hơn hợp tà"], "explanation": "Cho quả khác biệt: 1. HỶ hơn XẢ; 2. VÔ TRỢ hơn HỮU TRỢ; 3. TÀ KIẾN hơn LY TÀ.", "sourceRefs": [ref(TAM, 11)]},
        {"id": "M4_Q12", "type": "mcq", "question": "Trạng thái (lakkhaṇa) của Tâm là gì?", "correctAnswer": "Biết cảnh", "distractors": ["Hưởng cảnh", "Nhớ cảnh", "Tạo nghiệp"], "explanation": "Tứ ý nghĩa của Tâm — a. TRẠNG THÁI: biết cảnh.", "sourceRefs": [ref(TAM, 9)]},
    ],
}


M5_VI = {
    "title": "Tâm Dục Giới Tịnh Hảo (Sobhaṇa Kāmāvacara)",
    "description": "24 tâm: 8 Đại thiện, 8 Đại quả, 8 Đại duy tác.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M5_S01",
            "title": "Ba nhóm của 24 tâm Dục giới Tịnh hảo",
            "summary": "Đại thiện 8 (nhân), Đại quả 8 (quả), Đại duy tác 8 (hạnh).",
            "body": [
                "Kāmāvacara: là tâm tốt đẹp thường hiện hữu, lui tới, xuất hiện trong cõi Dục giới. Sobhaṇa: Tịnh hảo, tốt đẹp, tịnh quang.",
                "Tâm Dục giới Tịnh hảo có 3 loại, gồm 24 tâm: Tâm Đại thiện (Mahākusala) 8; Tâm Đại quả (Mahāvipāka) 8; Tâm Đại hạnh / Duy tác (Mahākiriya) 8.",
                "Tâm Đại thiện là nhân lành sẽ sanh quả tốt, tức nhân thành tựu làm người và trời cõi Dục giới. Gọi là “Đại” vì những tâm này làm được rất nhiều phước thiện — Thập hạnh phúc (10 phước thiện).",
                "Tâm Đại quả là kết quả thành tựu của những nhân Thiện.",
                "Tâm Đại duy tác dành cho bậc A-la-hán: các Ngài không còn tạo nhân nên dùng tâm Duy tác thay cho tâm Đại thiện.",
            ],
            "keyTerms": [
                {"id": "TERM_MAHAKUSALA", "term": "Tâm Đại thiện", "pali": "Mahākusala citta", "meaning": "8 tâm thiện Dục giới Tịnh hảo"},
                {"id": "TERM_MAHAVIPAKA", "term": "Tâm Đại quả", "pali": "Mahāvipāka citta", "meaning": "8 tâm quả của Đại thiện"},
                {"id": "TERM_MAHAKIRIYA", "term": "Tâm Đại duy tác", "pali": "Mahākiriya citta", "meaning": "8 tâm hạnh của bậc A-la-hán"},
            ],
            "sourceRefs": [ref(TAM, 18, "C. TÂM DỤC GIỚI TỊNH HẢO – 3 loại, gồm 24 Tâm")],
        },
        {
            "id": "M5_S02",
            "title": "Tám tâm Đại thiện",
            "summary": "Phân theo Thọ (hỷ/xả), Trí (hợp/ly) và Trợ (vô/hữu): 2×2×2 = 8.",
            "body": [
                "Tám tâm Đại thiện được phân theo ba cặp đối: Thọ hỷ (somanassa) / Thọ xả (upekkhā); Hợp trí (ñāṇasampayutta) / Ly trí (ñāṇavippayutta); Vô trợ (asaṅkhārika) / Hữu trợ (sasaṅkhārika).",
                "Tâm 1: “Somanassa-sahagataṁ ñāṇasampayuttaṁ asaṅkhārikaṁ ekaṁ” — Tâm Đại thiện thọ hỷ, hợp trí, vô trợ.",
                "Tâm 2: thọ hỷ, hợp trí, hữu trợ. Tâm 3: thọ hỷ, ly trí, vô trợ. Tâm 4: thọ hỷ, ly trí, hữu trợ.",
                "Tâm 5: thọ xả, hợp trí, vô trợ. Tâm 6: thọ xả, hợp trí, hữu trợ. Tâm 7: thọ xả, ly trí, vô trợ. Tâm 8: thọ xả, ly trí, hữu trợ.",
                "Điểm khác biệt then chốt so với 8 tâm Tham: tâm Tham phân theo Tà kiến (hợp tà / ly tà), còn tâm Đại thiện phân theo Trí (hợp trí / ly trí).",
            ],
            "keyTerms": [
                {"id": "TERM_NANASAMPAYUTTA", "term": "Hợp trí", "pali": "Ñāṇasampayutta", "meaning": "Tương ưng với trí tuệ"},
                {"id": "TERM_NANAVIPPAYUTTA", "term": "Ly trí", "pali": "Ñāṇavippayutta", "meaning": "Không tương ưng với trí tuệ"},
            ],
            "sourceRefs": [ref(TAM, 19, "I. TÂM ĐẠI THIỆN DỤC GIỚI TỊNH HẢO – danh sách 8 tâm Pāli")],
        },
        {
            "id": "M5_S03",
            "title": "Phạm vi xuất hiện của tâm Dục giới Tịnh hảo",
            "summary": "Có mặt trong nhiều loại chúng sanh và nhiều cõi, trừ bậc A-la-hán dùng Duy tác.",
            "body": [
                "Tâm Đại thiện làm được 10 phước thiện (Thập hạnh phúc).",
                "Tâm này có mặt trong nhiều loại chúng sanh: ngạ quỷ, bàng sanh, địa ngục, nhân loại, chư thiên, phạm thiên và các bậc thánh hữu học.",
                "Trừ bậc A-la-hán — các Ngài dùng Tâm Duy tác thay vì Tâm Đại thiện.",
                "Tuy gọi là Kāmāvacara, các tâm này vẫn có mặt trong cõi Sắc giới và Vô sắc giới, nhưng không thường xuyên như ở cõi Dục giới.",
            ],
            "keyTerms": [
                {"id": "TERM_KAMAVACARA_M5", "term": "Dục giới", "pali": "Kāmāvacara", "meaning": "Thuộc phạm vi cõi Dục"},
            ],
            "sourceRefs": [ref(TAM, 18, "a/ Làm được 10 phước thiện; b/ Có mặt trong nhiều loại chúng sanh")],
        },
    ],
    "reviewCards": [
        {"id": "M5_R01", "front": "Tâm Dục giới Tịnh hảo có bao nhiêu tâm, chia mấy nhóm?", "back": "24 tâm, 3 nhóm: 8 Đại thiện, 8 Đại quả, 8 Đại duy tác.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_R02", "front": "Vì sao gọi là “Đại thiện”?", "back": "Vì những tâm này làm được rất nhiều phước thiện — Thập hạnh phúc (10 phước thiện).", "sourceRefs": [ref(TAM, 18), ref(TAM, 19)]},
        {"id": "M5_R03", "front": "Tâm Đại quả (Mahāvipāka) là gì?", "back": "Là kết quả thành tựu của những nhân Thiện.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_R04", "front": "Bậc A-la-hán dùng tâm nào thay cho Đại thiện?", "back": "Tâm Đại duy tác (Mahākiriya) — vì các Ngài không còn tạo nhân.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_R05", "front": "8 tâm Đại thiện phân theo ba cặp đối nào?", "back": "Thọ hỷ/Thọ xả; Hợp trí/Ly trí; Vô trợ/Hữu trợ.", "sourceRefs": [ref(TAM, 19)]},
        {"id": "M5_R06", "front": "Khác biệt then chốt giữa 8 tâm Tham và 8 tâm Đại thiện?", "back": "Tâm Tham phân theo Tà kiến (hợp tà/ly tà); tâm Đại thiện phân theo Trí (hợp trí/ly trí).", "sourceRefs": [ref(TAM, 10), ref(TAM, 19)]},
        {"id": "M5_R07", "front": "Ñāṇasampayutta nghĩa là gì?", "back": "Hợp trí — tương ưng với trí tuệ.", "sourceRefs": [ref(TAM, 19)]},
        {"id": "M5_R08", "front": "Sobhaṇa và Kāmāvacara nghĩa là gì?", "back": "Sobhaṇa: Tịnh hảo, tốt đẹp, tịnh quang. Kāmāvacara: thường hiện hữu, lui tới trong cõi Dục giới.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_R09", "front": "Tâm Đại thiện có mặt ở những chúng sanh nào?", "back": "Ngạ quỷ, bàng sanh, địa ngục, nhân loại, chư thiên, phạm thiên và các bậc thánh hữu học — trừ A-la-hán.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_R10", "front": "Tâm Đại thiện thứ nhất có tên Pāli đầy đủ là gì?", "back": "Somanassa-sahagataṁ ñāṇasampayuttaṁ asaṅkhārikaṁ ekaṁ — thọ hỷ, hợp trí, vô trợ.", "sourceRefs": [ref(TAM, 19)]},
    ],
    "quizSeeds": [
        {"id": "M5_Q01", "type": "mcq", "question": "Tâm Dục giới Tịnh hảo có bao nhiêu tâm?", "correctAnswer": "24", "distractors": ["8", "12", "54"], "explanation": "8 Đại thiện + 8 Đại quả + 8 Đại duy tác = 24.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_Q02", "type": "mcq", "question": "Tâm Đại duy tác (Mahākiriya) dành cho hạng người nào?", "correctAnswer": "Bậc A-la-hán", "distractors": ["Người phàm tam nhân", "Bậc Tu-đà-hoàn", "Chư thiên Dục giới"], "explanation": "Trừ bậc A la hán – dùng Tâm Duy tác thay cho Đại thiện.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_Q03", "type": "mcq", "question": "8 tâm Đại thiện phân theo yếu tố nào (khác với tâm Tham)?", "correctAnswer": "Hợp trí / Ly trí (ñāṇa)", "distractors": ["Hợp tà / Ly tà (diṭṭhi)", "Hợp phẫn / Ly phẫn (paṭigha)", "Hoài nghi / Phóng dật"], "explanation": "Tâm Đại thiện dùng ñāṇasampayutta/ñāṇavippayutta; tâm Tham dùng diṭṭhigata.", "sourceRefs": [ref(TAM, 19)]},
        {"id": "M5_Q04", "type": "mcq", "question": "Tâm Đại quả (Mahāvipāka) là gì?", "correctAnswer": "Kết quả thành tựu của những nhân Thiện", "distractors": ["Nhân lành tạo phước", "Tâm hạnh của A-la-hán", "Tâm bắt cảnh Niết-bàn"], "explanation": "II. TÂM ĐẠI QUẢ – MAHĀVIPĀKACITTA: là kết quả thành tựu của những nhân Thiện.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_Q05", "type": "mcq", "question": "“Đại” trong Đại thiện hàm ý gì?", "correctAnswer": "Làm được rất nhiều phước thiện — Thập hạnh phúc", "distractors": ["Có nhiều tâm sở nhất", "Cho quả trong cõi Sắc giới", "Là tâm siêu thế"], "explanation": "ĐẠI THIỆN: Là những thiện pháp to lớn, vì những Tâm này sẽ làm được rất nhiều phước thiện.", "sourceRefs": [ref(TAM, 19)]},
        {"id": "M5_Q06", "type": "mcq", "question": "Tâm Đại thiện số 1 có đặc điểm gì?", "correctAnswer": "Thọ hỷ, hợp trí, vô trợ", "distractors": ["Thọ xả, ly trí, hữu trợ", "Thọ hỷ, hợp tà, vô trợ", "Thọ ưu, hợp phẫn, vô trợ"], "explanation": "Somanassa-sahagataṁ ñāṇasampayuttaṁ asaṅkhārikaṁ.", "sourceRefs": [ref(TAM, 19)]},
        {"id": "M5_Q07", "type": "mcq", "question": "Mỗi nhóm trong Tâm Dục giới Tịnh hảo có bao nhiêu tâm?", "correctAnswer": "8 tâm mỗi nhóm", "distractors": ["12 tâm mỗi nhóm", "4 tâm mỗi nhóm", "6 tâm mỗi nhóm"], "explanation": "8 Đại thiện + 8 Đại quả + 8 Đại duy tác.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_Q08", "type": "mcq", "question": "Sobhaṇa nghĩa là gì?", "correctAnswer": "Tịnh hảo, tốt đẹp, tịnh quang", "distractors": ["Thuộc cõi Dục", "Vượt ngoài thế gian", "Không có nhân"], "explanation": "SOBHAṆA: Tịnh hảo, Tốt đẹp, Tịnh quang.", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_Q09", "type": "mcq", "question": "Tâm Đại thiện KHÔNG có mặt ở hạng người nào?", "correctAnswer": "Bậc A-la-hán", "distractors": ["Chư thiên", "Phạm thiên", "Bậc thánh hữu học"], "explanation": "Có mặt trong nhiều loại chúng sanh… (Trừ bậc A la hán – dùng Tâm Duy tác).", "sourceRefs": [ref(TAM, 18)]},
        {"id": "M5_Q10", "type": "mcq", "question": "Ñāṇavippayutta nghĩa là gì?", "correctAnswer": "Ly trí — không tương ưng trí tuệ", "distractors": ["Hợp trí — tương ưng trí tuệ", "Vô trợ", "Hữu trợ"], "explanation": "Vippayutta: bất tương ưng → ly trí.", "sourceRefs": [ref(TAM, 19)]},
    ],
}


M7_VI = {
    "title": "Tâm Siêu Thế (Lokuttara Citta)",
    "description": "4 Tâm Đạo và 4 Tâm Quả Siêu thế; tính rộng thành 40 tâm.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M7_S01",
            "title": "Tâm Siêu thế là gì?",
            "summary": "Tâm hữu vi nhưng bắt đối tượng vô vi (Niết-bàn).",
            "body": [
                "Lokuttara citta — Tâm Siêu thế — là Tâm biết cảnh ngoài thế gian.",
                "Điểm đặc thù: đây là Tâm hữu vi nhưng bắt đối tượng vô vi. Pháp hữu vi là pháp có sanh có diệt; Vô vi là trạng thái Vô sanh bất diệt (Niết-bàn).",
                "Tâm Siêu thế tính rộng có 40 tâm; tính theo hai nhóm căn bản thì có 4 Tâm Đạo và 4 Tâm Quả.",
                "Hai nhóm: A/ Lokuttara Magga Cittāni — Tâm Đạo Siêu thế, có 4. B/ Lokuttara Phala Cittāni — Tâm Quả Siêu thế, có 4.",
            ],
            "keyTerms": [
                {"id": "TERM_LOKUTTARA", "term": "Siêu thế", "pali": "Lokuttara", "meaning": "Vượt ngoài thế gian"},
                {"id": "TERM_MAGGACITTA", "term": "Tâm Đạo", "pali": "Magga citta", "meaning": "Tâm sát trừ phiền não"},
                {"id": "TERM_PHALACITTA", "term": "Tâm Quả", "pali": "Phala citta", "meaning": "Tâm quả của Đạo"},
            ],
            "sourceRefs": [ref(TAM, 51, "III. LOKUTTARA CITTĀNI – TÂM SIÊU THẾ, có 40 tâm; 2 nhóm")],
        },
        {
            "id": "M7_S02",
            "title": "Bốn Tâm Đạo và bốn Tâm Quả",
            "summary": "Sơ – Nhị – Tam – Tứ Đạo, và Sơ – Nhị – Tam – Tứ Quả.",
            "body": [
                "Tâm Đạo: 1/ Sotāpattimaggacittaṁ — Nhập lưu đạo tâm, Sơ Đạo. 2/ Sakadāgāmimaggacittaṁ — Nhứt lai đạo tâm, Nhị Đạo. 3/ Anāgāmimaggacittaṁ — Bất lai đạo tâm, Tam Đạo. 4/ Arahattamaggacittaṁ — Vô sanh đạo tâm, Tứ Đạo.",
                "Tâm Quả: 1/ Sotāpattiphalacittaṁ — Sơ Quả. 2/ Sakadāgāmiphalacittaṁ — Nhị Quả. 3/ Anāgāmiphalacittaṁ — Tam Quả. 4/ Arahattaphalacittaṁ — Tứ Quả.",
                "Sotāpattimagga được phân từ: Sota là dòng nước; Āpatti là nhập vào; Magga là Đạo, Thánh đạo → Tâm bước vào dòng nước Thánh đạo.",
                "Mỗi Tâm Đạo có 8 chi đạo đồng sanh, tức Bát Chánh Đạo: Chánh Kiến, Chánh Tư Duy, Chánh Ngữ, Chánh Nghiệp, Chánh Mạng, Chánh Tinh Tấn, Chánh Niệm, Chánh Định — tất cả đồng sanh một lượt.",
            ],
            "keyTerms": [
                {"id": "TERM_SOTAPATTI", "term": "Nhập lưu / Tu-đà-hoàn", "pali": "Sotāpatti", "meaning": "Bước vào dòng Thánh đạo"},
                {"id": "TERM_SAKADAGAMI", "term": "Nhứt lai / Tư-đà-hàm", "pali": "Sakadāgāmi", "meaning": "Còn trở lại một lần"},
                {"id": "TERM_ANAGAMI", "term": "Bất lai / A-na-hàm", "pali": "Anāgāmi", "meaning": "Không trở lại cõi Dục"},
                {"id": "TERM_ARAHATTA", "term": "Vô sanh / A-la-hán", "pali": "Arahatta", "meaning": "Đoạn tận mọi phiền não"},
            ],
            "sourceRefs": [
                ref(TAM, 51, "Danh sách 4 Tâm Đạo và 4 Tâm Quả kèm tên Việt"),
                ref(TAM, 53, "8 chi đạo đồng sanh — Bát Chánh Đạo"),
            ],
        },
        {
            "id": "M7_S03",
            "title": "Tâm Sơ Đạo (Sotāpattimagga)",
            "summary": "Sát trừ 3 phiền não; chứng ngộ Niết-bàn lần thứ nhất.",
            "body": [
                "Tâm Sơ Đạo có 8 chi đạo, là bước vào dòng suối thánh đạo lần đầu tiên.",
                "Sát trừ 3 phiền não: Thân kiến (chấp thân là ta), Hoài nghi (nghi ngờ Phật Pháp Tăng), và Giới cấm thủ (lễ nghi, mê tín, giới cấm không đem đến giải thoát).",
                "Trí tuệ làm chủ lực để phá tan màn Vô minh. Đây là lần chứng ngộ Niết-bàn thứ nhất.",
                "Kết quả: bậc Sơ Đạo không còn rơi xuống cảnh khổ.",
                "Bốn nhân sanh Tâm Đạo: (1) Gặp được bậc chân nhân — người nói đúng theo Pháp, theo Chánh tạng, không nói theo tư kiến; (2) Được nghe Chánh pháp; (3) Tác ý khéo — tác ý hướng đến Niết-bàn, đưa đến giải thoát; (4) Hành trì theo Chánh pháp đặc biệt đến đạo quả, tức hành theo Tứ niệm xứ, theo thiền quán chứ không theo thiền chỉ.",
                "Chú ý: Tâm Sơ Đạo không sanh ở cõi Vô sắc, vì không đủ 4 nhân sanh (không đủ hình tướng, không thể nghe).",
            ],
            "keyTerms": [
                {"id": "TERM_SAKKAYADITTHI", "term": "Thân kiến", "pali": "Sakkāyadiṭṭhi", "meaning": "Chấp thân là ta"},
                {"id": "TERM_SILABBATA", "term": "Giới cấm thủ", "pali": "Sīlabbataparāmāsa", "meaning": "Chấp lễ nghi, giới cấm sai"},
            ],
            "sourceRefs": [
                ref(TAM, 51, "Sơ Đạo: 8 chi đạo, sát trừ 3 phiền não, không còn rơi cảnh khổ"),
                ref(TAM, 52, "NHÂN SANH TÂM ĐẠO, có 4; chú ý cõi Vô sắc"),
            ],
        },
    ],
    "reviewCards": [
        {"id": "M7_R01", "front": "Tâm Siêu thế là gì?", "back": "Tâm biết cảnh ngoài thế gian — tâm hữu vi nhưng bắt đối tượng vô vi (Niết-bàn).", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_R02", "front": "Tâm Siêu thế tính rộng có bao nhiêu tâm?", "back": "40 tâm. Tính căn bản thì có 4 Tâm Đạo và 4 Tâm Quả.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_R03", "front": "Kể 4 Tâm Đạo Siêu thế.", "back": "Sotāpattimagga (Sơ Đạo), Sakadāgāmimagga (Nhị Đạo), Anāgāmimagga (Tam Đạo), Arahattamagga (Tứ Đạo).", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_R04", "front": "Kể 4 Tâm Quả Siêu thế.", "back": "Sotāpattiphala, Sakadāgāmiphala, Anāgāmiphala, Arahattaphala — Sơ, Nhị, Tam, Tứ Quả.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_R05", "front": "Sotāpatti được phân từ thế nào?", "back": "Sota: dòng nước; Āpatti: nhập vào → bước vào dòng nước Thánh đạo.", "sourceRefs": [ref(TAM, 52)]},
        {"id": "M7_R06", "front": "Mỗi Tâm Đạo có bao nhiêu chi đạo đồng sanh?", "back": "8 chi — Bát Chánh Đạo, đồng sanh một lượt.", "sourceRefs": [ref(TAM, 51), ref(TAM, 53)]},
        {"id": "M7_R07", "front": "Tâm Sơ Đạo sát trừ những phiền não nào?", "back": "Ba: Thân kiến, Hoài nghi, Giới cấm thủ.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_R08", "front": "Kết quả của bậc Sơ Đạo?", "back": "Không còn rơi xuống cảnh khổ; chứng ngộ Niết-bàn lần thứ nhất.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_R09", "front": "Bốn nhân sanh Tâm Đạo?", "back": "Gặp bậc chân nhân; được nghe Chánh pháp; tác ý khéo; hành trì theo Chánh pháp (Tứ niệm xứ, thiền quán).", "sourceRefs": [ref(TAM, 52)]},
        {"id": "M7_R10", "front": "Vì sao Tâm Sơ Đạo không sanh ở cõi Vô sắc?", "back": "Vì không đủ 4 nhân sanh — không đủ hình tướng, không thể nghe.", "sourceRefs": [ref(TAM, 52)]},
        {"id": "M7_R11", "front": "Arahattamagga còn gọi là gì?", "back": "Vô sanh đạo tâm — Tứ Đạo.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_R12", "front": "Tâm Tam Đạo (Anāgāmimagga) chứng ngộ Niết-bàn lần thứ mấy?", "back": "Lần thứ 3 (lần 1 là Sơ Đạo, lần 2 là Nhị Đạo).", "sourceRefs": [ref(TAM, 53)]},
    ],
    "quizSeeds": [
        {"id": "M7_Q01", "type": "mcq", "question": "Đặc điểm độc nhất của Tâm Siêu thế là gì?", "correctAnswer": "Tâm hữu vi nhưng bắt đối tượng vô vi", "distractors": ["Tâm vô vi bắt đối tượng hữu vi", "Tâm vô vi bắt đối tượng vô vi", "Tâm hữu vi bắt đối tượng hữu vi"], "explanation": "Là Tâm Hữu vi nhưng bắt đối tượng vô vi (Niết-bàn — Vô sanh bất diệt).", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_Q02", "type": "mcq", "question": "Tâm Siêu thế tính rộng có bao nhiêu tâm?", "correctAnswer": "40", "distractors": ["8", "24", "121"], "explanation": "III. LOKUTTARA CITTĀNI – TÂM SIÊU THẾ có 40 tâm.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_Q03", "type": "mcq", "question": "Sotāpattimagga còn gọi là gì?", "correctAnswer": "Nhập lưu đạo tâm — Sơ Đạo", "distractors": ["Nhứt lai đạo tâm — Nhị Đạo", "Bất lai đạo tâm — Tam Đạo", "Vô sanh đạo tâm — Tứ Đạo"], "explanation": "1/ SOTĀPATTIMAGGACITTAṀ nhập lưu đạo tâm: SƠ ĐẠO.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_Q04", "type": "mcq", "question": "Tâm Sơ Đạo sát trừ mấy phiền não?", "correctAnswer": "3: Thân kiến, Hoài nghi, Giới cấm thủ", "distractors": ["2: Tham và Sân", "5: năm triền cái", "10: mười kiết sử"], "explanation": "Sát trừ 3 phiền não: Thân kiến, Hoài nghi, Giới cấm thủ.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_Q05", "type": "mcq", "question": "Mỗi Tâm Đạo có bao nhiêu chi đạo đồng sanh?", "correctAnswer": "8 chi (Bát Chánh Đạo)", "distractors": ["4 chi", "5 chi", "7 chi"], "explanation": "Có 8 chi đạo đồng sanh: Chánh Kiến, Chánh Tư Duy, Chánh Ngữ, Chánh Nghiệp, Chánh Mạng, Chánh Tinh Tấn, Chánh Niệm, Chánh Định.", "sourceRefs": [ref(TAM, 53)]},
        {"id": "M7_Q06", "type": "mcq", "question": "Sota + Āpatti nghĩa là gì?", "correctAnswer": "Nhập vào dòng nước (Thánh đạo)", "distractors": ["Vượt qua bờ kia", "Cắt đứt phiền não", "Không còn trở lại"], "explanation": "SOTA: dòng nước; APATTI: nhập vào; MAGGA: Thánh đạo.", "sourceRefs": [ref(TAM, 52)]},
        {"id": "M7_Q07", "type": "mcq", "question": "Bậc chứng Sơ Đạo có đặc điểm gì?", "correctAnswer": "Không còn rơi xuống cảnh khổ", "distractors": ["Đoạn tận mọi phiền não", "Không còn trở lại cõi Dục", "Còn trở lại một lần"], "explanation": "=> KHÔNG CÒN RƠI XUỐNG CẢNH KHỔ.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_Q08", "type": "mcq", "question": "Điều nào KHÔNG thuộc bốn nhân sanh Tâm Đạo?", "correctAnswer": "Đắc đủ năm bậc thiền Sắc giới", "distractors": ["Gặp được bậc chân nhân", "Được nghe Chánh pháp", "Tác ý khéo"], "explanation": "Bốn nhân: gặp bậc chân nhân, nghe Chánh pháp, tác ý khéo, hành trì Chánh pháp (Tứ niệm xứ/thiền quán).", "sourceRefs": [ref(TAM, 52)]},
        {"id": "M7_Q09", "type": "mcq", "question": "Vì sao Tâm Sơ Đạo không sanh ở cõi Vô sắc?", "correctAnswer": "Vì không đủ 4 nhân sanh — không đủ hình tướng, không thể nghe", "distractors": ["Vì cõi Vô sắc không có tâm", "Vì cõi Vô sắc chỉ có tâm Quả", "Vì Niết-bàn không có ở cõi Vô sắc"], "explanation": "CHÚ Ý: TÂM SƠ ĐẠO không sanh ở cõi Vô Sắc vì không đủ 4 nhân sanh.", "sourceRefs": [ref(TAM, 52)]},
        {"id": "M7_Q10", "type": "mcq", "question": "Arahattaphalacittaṁ là tâm gì?", "correctAnswer": "Vô sanh quả tâm — Tứ Quả", "distractors": ["Vô sanh đạo tâm — Tứ Đạo", "Bất lai quả tâm — Tam Quả", "Nhập lưu quả tâm — Sơ Quả"], "explanation": "4/ ARAHATTAPHALACITTAṀ vô sanh quả tâm: TỨ QUẢ.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_Q11", "type": "mcq", "question": "Tâm Đạo Siêu thế có mấy loại (không tính rộng theo thiền)?", "correctAnswer": "4", "distractors": ["8", "40", "2"], "explanation": "A/ LOKUTTARA MAGGA CITTĀNI – Tâm Đạo Siêu Thế, có 4.", "sourceRefs": [ref(TAM, 51)]},
        {"id": "M7_Q12", "type": "mcq", "question": "Trong Tâm Sơ Đạo, pháp nào làm chủ lực?", "correctAnswer": "Trí tuệ — để phá tan màn Vô minh", "distractors": ["Tín — đức tin trong sạch", "Định — sự an trú", "Cần — tinh tấn"], "explanation": "Trí tuệ làm chủ lực: để phá tan màn Vô minh.", "sourceRefs": [ref(TAM, 51)]},
    ],
}
