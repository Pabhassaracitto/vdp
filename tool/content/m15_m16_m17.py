# -*- coding: utf-8 -*-
"""Authored lesson content for M15-M17 (Vietnamese source).

M15_TAM_SO_PHOI_HOP  — VDP-TamSoPhoiHop.pdf (Cetasikasaṅgaha)
M16_NGUOI_VA_COI     — VDP-NguoiVaCoi.pdf (Puggala-bheda & 31 bhūmi)
M17_DUYEN_CHI_TIET   — VDP-ToatYeuVeDuyen.pdf (links 3-12 of paṭiccasamuppāda)
"""

TSPh = "VDP-TamSoPhoiHop.pdf"
NC = "VDP-NguoiVaCoi.pdf"
TYD = "VDP-ToatYeuVeDuyen.pdf"
TAM = "VDP-Tam.pdf"


def ref(file, page, note=None):
    d = {"file": file, "page": page}
    if note:
        d["note"] = note
    return d


M15_VI = {
    "title": "Tâm Sở Phối Hợp (Cetasikasaṅgaha)",
    "description": "Cách 52 tâm sở phối hợp vào từng loại tâm: Bất thiện, Vô nhân, Dục giới Tịnh hảo, Thiền tâm và Siêu thế — 13 Tợ tha, 14 Bất thiện, 25 Tịnh hảo.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M15_S01",
            "title": "Cetasikasaṅgaha — cách đọc tâm sở phối hợp",
            "summary": "Bảy tâm sở có trong mọi tâm; Sáu biệt cảnh tùy trường hợp; Mười bốn chỉ trong tâm Bất thiện; Mười chín chỉ trong tâm Đẹp.",
            "body": [
                "Cetasikasaṅgaha — Tâm sở phối hợp — trả lời câu hỏi: 52 tâm sở này kết hợp với nhau và với tâm như thế nào trong từng loại tâm.",
                "Bài kệ tóm tắt: “Bảy, liên hợp với tất cả các loại tâm. Sáu tâm sở Riêng Biệt (Biệt cảnh) liên hợp tùy trường hợp. Mười Bốn chỉ liên hợp với các loại tâm Bất Thiện. Mười Chín tâm sở Đẹp chỉ phát sanh trong tâm Đẹp.”",
                "Nhóm Tợ tha có 13 tâm sở = 7 Biến hành + 6 Biệt cảnh. “Tợ tha” vì nhóm này có mặt cả trong tâm thiện lẫn bất thiện, tùy trường hợp.",
                "Phạm vi hiện hữu của Biệt cảnh (tính theo 121 tâm): Tầm có trong 55 tâm, Tứ 66 tâm, Hỷ 51 tâm, Dục 101 tâm (tính theo 89 tâm thì Dục 69 tâm); riêng Cần có 105 tâm (tính 121) hoặc 73 tâm (tính 89) — trừ 16 tâm: 10 tâm Ngũ song thức, Khán ngũ môn, 2 Tiếp thâu và 3 Quan sát.",
                "Theo chứng thiền, các chi phối hợp: Sơ thiền có 5 gồm Tầm, Tứ, Hỷ, Lạc, Định; Nhị thiền có 4 gồm Tứ, Hỷ, Lạc, Định; Tam thiền có 3 gồm Hỷ, Lạc, Định; Tứ thiền có 2 gồm Lạc, Định; Ngũ thiền có Xả, Định.",
            ],
            "keyTerms": [
                {"id": "TERM_CETASIKASANGAHA_M15", "term": "Tâm sở phối hợp", "pali": "Cetasikasaṅgaha", "meaning": "Sự kết hợp của 52 tâm sở trong từng loại tâm"},
                {"id": "TERM_TO_THA_13_M15", "term": "13 Tâm sở Tợ tha", "pali": "Aññasamāna", "meaning": "7 Biến hành + 6 Biệt cảnh — chung cả thiện lẫn bất thiện"},
            ],
            "sourceRefs": [
                ref(TSPh, 2, "CETASIKASANGAHA – TÂM SỞ PHỐI HỢP: bài kệ 7 / 6 tùy trường hợp / 14 bất thiện / 19 đẹp"),
                ref(TSPh, 4, "13 TÂM SỞ TỢ THA + 6 BIỆT CẢNH: Tầm 55, Tứ 66, Hỷ 51, Dục 101 (69 theo 89 tâm); Cần 105 hoặc 73; chứng thiền 5/4/3/2/Xả-Định"),
            ],
        },
        {
            "id": "M15_S02",
            "title": "14 tâm sở Bất thiện phối hợp",
            "summary": "Si phần trong cả 12 tâm; Tham 8; Tà kiến 4 hợp tà; Ngã mạn 4 ly tà; Sân phần 2; Hôn phần 5 hữu trợ; Hoài nghi 1.",
            "body": [
                "Bốn tâm sở Si phần — Si, Vô tàm, Vô quý, Phóng dật — là Tâm sở Bất thiện Biến hành: nằm trong tất cả 12 tâm Bất thiện.",
                "Tham chỉ nằm trong 8 loại tâm Tham. Tà kiến nằm trong 4 tâm Tham hợp tà. Ngã mạn nằm trong 4 tâm Tham ly tà.",
                "Sân, Tật, Lận và Hối nằm trong 2 tâm Sân. Trong đó Tật, Lận, Hối sanh chung với Sân theo từng loại — không cùng lúc cả ba.",
                "Hôn trầm và Thụy miên sanh với các tâm Bất thiện hữu trợ — 5 tâm: 4 tâm Tham hữu trợ và 1 tâm Sân hữu trợ.",
                "Hoài nghi chỉ nằm trong tâm Si hợp Hoài nghi (1 tâm).",
                "Những tâm sở phát sanh trong các tâm nhất định: 3 Giới phần (Chánh ngữ, Chánh nghiệp, Chánh mạng) sanh tùy theo Tâm thiện Dục giới Tịnh hảo hoặc Siêu thế; Bi – Tùy hỷ tùy theo Thiền tâm Sắc giới hoặc Tâm thiện, Duy tác Dục giới.",
                "Tổng kết số tâm sở theo loại tâm: Tâm Bất thiện 27 tâm sở (13 Tợ tha + 14 Bất thiện); Tâm Dục giới Tịnh hảo 38 tâm sở (13 + 25); Tâm thiền 35 tâm sở (13 + 22, trừ 3 Giới phần); Tâm Siêu thế 36 tâm sở (13 + 23, trừ 2 Vô lượng phần).",
            ],
            "keyTerms": [
                {"id": "TERM_BAT_THIEN_BIEN_HANH_M15", "term": "Bất thiện Biến hành (4)", "pali": "Sabbākusalasādhāraṇā", "meaning": "Si, Vô tàm, Vô quý, Phóng dật — có trong cả 12 tâm Bất thiện"},
                {"id": "TERM_TONG_SO_TS_M15", "term": "Tổng số tâm sở", "pali": "—", "meaning": "Bất thiện 27 · Dục giới tịnh hảo 38 · Thiền 35 · Siêu thế 36"},
            ],
            "sourceRefs": [
                ref(TSPh, 5, "AKUSALA SANGAHA: Si phần trong 12 tâm; Tham trong 8; Tà kiến 4 hợp tà; Ngã mạn 4 ly tà; Sân phần trong 2 tâm Sân"),
                ref(TSPh, 7, "Tật–Lận–Hối sanh với Sân theo từng loại; Hôn trầm–Thụy miên với tâm hữu trợ; Giới phần và Bi–Tùy hỷ tùy tâm; tổng kết 27/38/35/36"),
            ],
        },
        {
            "id": "M15_S03",
            "title": "Tâm – Tâm sở đồng sanh: Tứ danh uẩn bất khả phân ly",
            "summary": "Tâm và tâm sở đồng sanh, đồng diệt, đồng cảnh — 4 pháp Thức, Thọ, Tưởng, Hành không thể tách rời.",
            "body": [
                "Paramatthasacca — Đệ nhất Nghĩa đế, Chân đế, Thực tính pháp: Parama là cùng tột, không thể biến đổi, không thể biến sang dạng khác; Attha là điều, vật. Paramattha là điều không thể thay đổi nhưng vẫn sanh diệt — sự thật tuyệt đối vì không thể biến đổi, chân như (trạng thái như thế nào thì như thế ấy, chứ không có nghĩa là thường hằng).",
                "Bản thể hay thực tính của Tâm có 3 khía cạnh: chính nó có bản chất biết cảnh; nó làm nhân cho các sở hữu cùng biết cảnh như nó; nó làm cho sinh vật và các vật vô tri trở nên sai biệt đa dạng.",
                "Danh và Sắc là 2 thành phần riêng biệt nhưng được sanh khởi từ Thức. Danh gồm Thọ (tâm sở Thọ), Tưởng (tâm sở Tưởng), Hành (50 tâm sở còn lại) đồng hiện khởi với Thức.",
                "Thức có mặt thì Danh có mặt: 4 pháp này là 4 pháp BẤT KHẢ PHÂN LY, còn được gọi là TỨ DANH UẨN — Thọ, Tưởng, Hành, Thức.",
                "Tâm và tâm sở đồng sanh, đồng diệt, cùng biết một cảnh, cùng một vật nương — vì vậy sự phối hợp giữa chúng là quy luật của pháp chân đế, không phải tùy ý sắp đặt.",
            ],
            "keyTerms": [
                {"id": "TERM_PARAMATTHA_M15", "term": "Đệ nhất nghĩa đế", "pali": "Paramatthasacca", "meaning": "Sự thật tuyệt đối — không thể biến đổi nhưng vẫn sanh diệt"},
                {"id": "TERM_TU_DANH_UAN_M15", "term": "Tứ danh uẩn", "pali": "Nāma-khandha", "meaning": "Thức + Thọ + Tưởng + Hành (50 tâm sở còn lại) — bất khả phân ly"},
            ],
            "sourceRefs": [
                ref(TSPh, 10, "CITTA-CETASIKA SANGAHO: Paramatthasacca; bản thể tâm 3 khía cạnh"),
                ref(TYD, 12, "Danh và Sắc sanh khởi do Thức; Tứ danh uẩn bất khả phân ly"),
            ],
        },
        {
            "id": "M15_S04",
            "title": "Tâm Bất thiện phối hợp: 8 Tham, 2 Sân, 2 Si",
            "summary": "Tâm Tham 19–21 tâm sở (hỷ) hoặc 18–20 (xả); tâm Sân 20–22; mỗi tâm Si 15.",
            "body": [
                "8 tâm Tham: mỗi tâm = 13 tâm sở Tợ tha + 4 tâm sở Si phần + Tham, cộng Tà kiến (hợp tà) hoặc Ngã mạn (ly tà).",
                "Tâm Tham thọ hỷ hợp tà: vô trợ 19 tâm sở; hữu trợ thêm 2 Hôn phần (Hôn trầm, Thụy miên) = 21 tâm sở. Ly tà thay Tà kiến bằng Ngã mạn, số đếm giữ nguyên: 19 và 21.",
                "Tâm Tham thọ xả: trừ tâm sở Hỷ — hợp tà vô trợ 18, hợp tà hữu trợ 20, ly tà vô trợ 18, ly tà hữu trợ 20 tâm sở.",
                "2 tâm Sân (thọ Ưu, không có Hỷ): vô trợ 20 tâm sở = 12 Tợ tha (13 trừ Hỷ) + 4 Si phần + Sân + Tật, Lận, Hối (sanh theo từng loại, mỗi loại 1); hữu trợ thêm 2 Hôn phần = 22 tâm sở.",
                "2 tâm Si (thọ xả, không có Hỷ): mỗi tâm 15 tâm sở = 7 Biến hành + Tầm, Tứ, Thắng giải + 4 Si phần + Hoài nghi (tâm 1) hoặc Phóng dật làm tâm căn (tâm 2).",
            ],
            "keyTerms": [
                {"id": "TERM_THAM_19_21_M15", "term": "Tâm Tham (số tâm sở)", "pali": "Lobhamūla", "meaning": "Hỷ: 19 vô trợ / 21 hữu trợ; Xả: 18 / 20"},
                {"id": "TERM_SAN_20_22_M15", "term": "Tâm Sân (số tâm sở)", "pali": "Dosamūla", "meaning": "20 vô trợ / 22 hữu trợ — Tật, Lận, Hối tùy từng loại"},
            ],
            "sourceRefs": [
                ref(TSPh, 12, "TÂM BẤT THIỆN PHỐI HỢP – AKUSALACITTA SANGAHO: 8 tâm Tham với 13 TSTT + Si phần + Tham + Tà kiến/Ngã mạn + Hôn phần (hữu trợ)"),
            ],
        },
        {
            "id": "M15_S05",
            "title": "Tâm Vô nhân phối hợp (18 tâm)",
            "summary": "Ngũ song thức 7; Tiếp thâu 10; Quan sát 10–11; Khán ngũ môn – Khán ý môn 11; Ưng cúng vi tiếu 12.",
            "body": [
                "Tâm Vô nhân là tâm không có 6 nhân, có 18 gồm: 7 Tâm Quả Bất thiện, 8 Tâm Quả Thiện, 3 Tâm Duy tác.",
                "5 đôi Ngũ song thức (Nhãn, Nhĩ, Tỷ, Thiệt, Thân thức — thiện và bất thiện): chỉ có 7 tâm sở Biến hành, vì đây là QUY LUẬT CỦA PHÁP CHÂN ĐẾ — tối thiểu phải có 8 thành tố phối hợp chung (8 danh bất ly) mới tạo thành một pháp sanh; Sắc pháp cũng có 8 sắc bất ly. Không có Tâm sở Biệt cảnh đi theo vì ngũ song thức làm phận sự đơn giản theo chức năng của nó, không cần sự hỗ trợ nào khác.",
                "2 tâm Tiếp thâu: 10 tâm sở — 7 Biến hành + Tầm, Tứ, Thắng giải.",
                "2 tâm Quan sát thọ xả (quả thiện, quả bất thiện): 10 tâm sở — 7 Biến hành + Tầm, Tứ, Thắng giải (trừ Cần, Hỷ, Dục); chỉ quan sát cảnh đơn thuần. Tâm Quan sát thọ hỷ (quả thiện): 11 tâm sở, thêm Hỷ — vì đối tượng đẹp và sáng chói hơn.",
                "Khán ngũ môn và Khán ý môn: 11 tâm sở — 7 Biến hành + Tầm, Tứ, Thắng giải, Cần (vì làm phận sự đoán cảnh, xác định cảnh trong lộ tâm).",
                "Tâm Ưng cúng vi tiếu (Duy tác, thọ hỷ): 12 tâm sở — 13 Tợ tha trừ Dục, vì tâm sinh tiếu của bậc A la hán không phát sanh do thích dục.",
            ],
            "keyTerms": [
                {"id": "TERM_NGU_song_THUC_M15", "term": "Ngũ song thức (7 ts)", "pali": "Dvipañcaviññāṇa", "meaning": "10 tâm thức chỉ có 7 Biến hành — 8 danh bất ly"},
                {"id": "TERM_VI_TIEU_M15", "term": "Ưng cúng vi tiếu (12 ts)", "pali": "Hasanacitta", "meaning": "13 Tợ tha trừ Dục — tâm sinh tiếu của bậc A la hán"},
            ],
            "sourceRefs": [
                ref(TSPh, 13, "TÂM VÔ NHÂN PHỐI HỢP: tâm vi tiếu có 12 Tờ tha trừ Dục (chanda vajjitā aññasamānā dvādasa dhammā)"),
                ref(TSPh, 14, "Ngũ song thức chỉ 7 Biến hành (8 danh bất ly); 2 Tiếp thâu; Khán ngũ môn"),
                ref(TSPh, 15, "2 Quan sát thọ xả 10 ts; Quan sát thọ hỷ 11 ts; Khán ý môn"),
            ],
        },
        {
            "id": "M15_S06",
            "title": "Tâm Tịnh hảo, Thiền tâm và Siêu thế phối hợp",
            "summary": "Đại thiện Dục giới 38–36 tâm sở; Thiền tâm 35–30; Siêu thế 36–33 — Giới phần và Vô lượng phần tùy đối tượng.",
            "body": [
                "8 tâm Đại thiện Dục giới: thọ hỷ hợp trí (vô trợ và hữu trợ) = 13 Tợ tha + 25 Tịnh hảo = 38 tâm sở. Thọ hỷ ly trí: trừ Tuệ quyền = 37. Thọ xả hợp trí: Tợ tha trừ Hỷ (12) + 25 = 37. Thọ xả ly trí = 36. Tâm Quả và Tâm Duy tác Dục giới tịnh hảo phối hợp tương tự.",
                "Trong tâm thiện không có 14 tâm sở Bất thiện. 19 Tâm sở Tịnh hảo Biến hành luôn có mặt trong tất cả Tâm tịnh hảo.",
                "3 Giới phần (Chánh ngữ, Chánh nghiệp, Chánh mạng) có mặt KHÔNG cùng lúc — mỗi giới có 1 đối tượng riêng biệt: khi gặp trường hợp phải giữ Chánh ngữ thì tâm sở Chánh ngữ mới sanh khởi; tương tự với Chánh nghiệp (hành động chân chánh) và Chánh mạng.",
                "Tâm thiền (Đáo đại): Sơ thiền = 13 Tợ tha + 22 Tịnh hảo (25 trừ 3 Giới phần) = 35 tâm sở. Không có 3 Giới phần vì đối tượng của thiền là Kasina, không phải đối tượng của giới — tuy nhiên người không có giới cũng không thể chứng đắc thiền.",
                "Tâm sở Vô lượng phần (Bi, Tùy hỷ) không có mặt trong những tâm thiền lấy đối tượng là Kasina; nếu lấy đối tượng chúng sanh đang đau khổ để tu tập tâm Bi thì khi đắc sơ thiền chỉ có tâm sở Bi xuất hiện; lấy đối tượng chúng sanh hạnh phúc thì chỉ có Tùy hỷ — khi đắc thiền chỉ 1 trong 2 tâm sở này phát sanh.",
                "Các tầng thiền cao bớt dần chi thiền: Nhị thiền 34 (bớt Tầm), Tam thiền 33 (bớt Tứ), Tứ thiền 32 (bớt Hỷ), Ngũ thiền 30 tâm sở. Tâm Quả sắc giới: 33, 32, 31, 30, 30.",
                "Tâm Siêu thế (4 Đạo, 4 Quả): Sơ thiền Đạo = 13 Tợ tha + 23 Tịnh hảo (25 trừ 2 Vô lượng phần) = 36 tâm sở — có đủ 3 Giới phần vì đối tượng của Đạo tâm là Niết bàn; Nhị thiền Đạo 35, Tam 34, Tứ 33.",
            ],
            "keyTerms": [
                {"id": "TERM_DAI_THIEN_38_M15", "term": "Đại thiện (38 ts)", "pali": "Mahākusala", "meaning": "Hỷ hợp trí 38 · hỷ ly trí 37 · xả hợp trí 37 · xả ly trí 36"},
                {"id": "TERM_THIEN_TAM_35_M15", "term": "Thiền tâm (35 ts)", "pali": "Mahaggatacitta", "meaning": "Sơ thiền 35 — không Giới phần; Bi/Tùy hỷ chỉ 1 trong 2"},
                {"id": "TERM_SIEU_THE_36_M15", "term": "Siêu thế (36 ts)", "pali": "Lokuttaracitta", "meaning": "Sơ thiền Đạo 36 — có 3 Giới phần, không Vô lượng phần"},
            ],
            "sourceRefs": [
                ref(TSPh, 17, "TÂM DỤC GIỚI TỊNH HẢO PHỐI HỢP: hỷ hợp trí 38, hỷ ly trí 37, xả hợp trí 37, xả ly trí 36"),
                ref(TSPh, 18, "Không có 14 ts Bất thiện; 19 ts tịnh hảo biến hành luôn có; 3 Giới phần không cùng lúc"),
                ref(TSPh, 21, "TÂM ĐÁO ĐẠI PHỐI HỢP: Sơ thiền 13 TSTT + 22 TSTH = 35; chi thiền Tầm Tứ Hỷ Lạc Định"),
                ref(TSPh, 22, "Thiền tâm không có 3 Giới phần (đối tượng Kasina); Bi–Tùy hỷ chỉ 1 trong 2 khi đắc thiền"),
                ref(TSPh, 24, "TÂM SIÊU THẾ PHỐI HỢP: Sơ thiền 13 + 23 = 36; có 3 Giới phần; Nhị thiền 35"),
            ],
        },
    ],
    "reviewCards": [
        {"id": "M15_R01", "front": "Bốn nhóm tâm sở phối hợp theo bài kệ Cetasikasaṅgaha?", "back": "7 Biến hành — mọi tâm; 6 Biệt cảnh — tùy trường hợp; 14 — chỉ tâm Bất thiện; 19 — chỉ tâm Đẹp (Tịnh hảo).", "sourceRefs": [ref(TSPh, 2)]},
        {"id": "M15_R02", "front": "13 Tâm sở Tợ tha gồm những gì?", "back": "7 Biến hành + 6 Biệt cảnh.", "sourceRefs": [ref(TSPh, 4)]},
        {"id": "M15_R03", "front": "Tâm Bất thiện có bao nhiêu tâm sở phối hợp?", "back": "27 = 13 Tợ tha + 14 Bất thiện.", "sourceRefs": [ref(TSPh, 7)]},
        {"id": "M15_R04", "front": "Tâm Dục giới Tịnh hảo và Tâm thiền có bao nhiêu tâm sở?", "back": "Dục giới Tịnh hảo 38 (13+25); Thiền tâm 35 (13+22, trừ 3 Giới phần).", "sourceRefs": [ref(TSPh, 7), ref(TSPh, 21)]},
        {"id": "M15_R05", "front": "Tâm Siêu thế có bao nhiêu tâm sở? Vì sao?", "back": "36 = 13 Tợ tha + 23 Tịnh hảo (trừ 2 Vô lượng phần); có đủ 3 Giới phần vì đối tượng là Niết bàn.", "sourceRefs": [ref(TSPh, 7), ref(TSPh, 24)]},
        {"id": "M15_R06", "front": "Tứ danh uẩn là gì? Vì sao bất khả phân ly?", "back": "Thức, Thọ, Tưởng, Hành (50 tâm sở còn lại) — đồng hiện khởi, cùng biết cảnh; Thức có mặt thì Danh có mặt.", "sourceRefs": [ref(TYD, 12)]},
        {"id": "M15_R07", "front": "Tâm Tham thọ hỷ hợp tà vô trợ có bao nhiêu tâm sở?", "back": "19 = 13 Tợ tha + 4 Si phần + Tham + Tà kiến. Hữu trợ thêm 2 Hôn phần = 21.", "sourceRefs": [ref(TSPh, 12)]},
        {"id": "M15_R08", "front": "Tâm Sân hữu trợ có bao nhiêu tâm sở?", "back": "22 = 12 Tợ tha (trừ Hỷ) + 4 Si phần + Sân + Tật/Lận/Hối (từng loại) + 2 Hôn phần.", "sourceRefs": [ref(TSPh, 12)]},
        {"id": "M15_R09", "front": "Ngũ song thức có mấy tâm sở? Vì sao?", "back": "7 Biến hành — quy luật pháp chân đế: tối thiểu 8 danh bất ly; phận sự đơn giản nên không cần Biệt cảnh.", "sourceRefs": [ref(TSPh, 14)]},
        {"id": "M15_R10", "front": "Tâm Ưng cúng vi tiếu có bao nhiêu tâm sở? Trừ tâm sở nào?", "back": "12 = 13 Tợ tha trừ Dục — tâm sinh tiếu của bậc A la hán không phát sanh do thích dục.", "sourceRefs": [ref(TSPh, 13)]},
        {"id": "M15_R11", "front": "Tại sao thiền tâm không có 3 Giới phần?", "back": "Vì đối tượng của thiền là Kasina, không phải đối tượng của giới — nhưng không có giới thì cũng không chứng đắc thiền.", "sourceRefs": [ref(TSPh, 22)]},
        {"id": "M15_R12", "front": "Tại sao thiền tâm chỉ có 1 trong 2 tâm sở Bi hoặc Tùy hỷ?", "back": "Tùy đối tượng tu tập: lấy chúng sanh đau khổ thì có Bi; lấy chúng sanh hạnh phúc thì có Tùy hỷ — không phát sanh cả hai cùng lúc.", "sourceRefs": [ref(TSPh, 22)]},
    ],
    "quizSeeds": [
        {"id": "M15_Q01", "type": "mcq", "question": "Bao nhiêu tâm sở có mặt trong MỌI tâm?", "correctAnswer": "7 (Biến hành)", "distractors": ["6 (Biệt cảnh)", "13 (Tợ tha)", "19 (Tịnh hảo biến hành)"], "explanation": "7 Biến hành liên hợp với tất cả các loại tâm; 6 Biệt cảnh chỉ tùy trường hợp.", "sourceRefs": [ref(TSPh, 2)]},
        {"id": "M15_Q02", "type": "mcq", "question": "14 tâm sở Bất thiện phối hợp vào tâm nào?", "correctAnswer": "Chỉ các tâm Bất thiện", "distractors": ["Mọi tâm", "Chỉ tâm Tham", "Tâm thiện và bất thiện"], "explanation": "14 tâm sở Bất thiện chỉ liên hợp với các loại tâm Bất thiện.", "sourceRefs": [ref(TSPh, 2)]},
        {"id": "M15_Q03", "type": "mcq", "question": "Tâm Tham thọ hỷ hợp tà HỮU TRỢ có bao nhiêu tâm sở?", "correctAnswer": "21", "distractors": ["19", "20", "18"], "explanation": "19 (vô trợ) + 2 Hôn phần (Hôn trầm, Thụy miên) = 21.", "sourceRefs": [ref(TSPh, 12)]},
        {"id": "M15_Q04", "type": "mcq", "question": "Tâm Sân vô trợ có bao nhiêu tâm sở?", "correctAnswer": "20", "distractors": ["17", "19", "22"], "explanation": "12 Tợ tha (trừ Hỷ) + 4 Si phần + Sân + 3 (Tật/Lận/Hối tùy từng loại) = 20; hữu trợ = 22.", "sourceRefs": [ref(TSPh, 12)]},
        {"id": "M15_Q05", "type": "mcq", "question": "Ngũ song thức chỉ có 7 tâm sở Biến hành vì nguyên tắc nào?", "correctAnswer": "8 danh bất ly — quy luật của pháp chân đế", "distractors": ["Vì là tâm quả", "Vì không có đối tượng", "Vì là tâm vô nhân"], "explanation": "Tối thiểu 8 thành tố phối hợp mới thành một pháp sanh; Sắc pháp cũng có 8 sắc bất ly.", "sourceRefs": [ref(TSPh, 14)]},
        {"id": "M15_Q06", "type": "mcq", "question": "Tâm Ưng cúng vi tiếu trừ tâm sở nào khỏi 13 Tợ tha?", "correctAnswer": "Dục (Chanda)", "distractors": ["Hỷ (Pīti)", "Tầm (Vitakka)", "Cần (Vīriya)"], "explanation": "Hasanacitte chanda vajjitā — trừ Dục, còn 12 tâm sở.", "sourceRefs": [ref(TSPh, 13)]},
        {"id": "M15_Q07", "type": "mcq", "question": "Tâm Đại thiện Dục giới thọ hỷ HỢP TRÍ có bao nhiêu tâm sở?", "correctAnswer": "38", "distractors": ["37", "36", "35"], "explanation": "13 Tợ tha + 25 Tịnh hảo = 38.", "sourceRefs": [ref(TSPh, 17)]},
        {"id": "M15_Q08", "type": "mcq", "question": "3 Giới phần có mặt cùng lúc trong một tâm thiện không?", "correctAnswer": "Không — mỗi giới có một đối tượng riêng biệt", "distractors": ["Có, luôn đủ cả ba", "Có, trong tâm hợp trí", "Chỉ có trong tâm thiền"], "explanation": "Khi gặp trường hợp giữ Chánh ngữ thì Chánh ngữ mới sanh; tương tự Chánh nghiệp, Chánh mạng.", "sourceRefs": [ref(TSPh, 18)]},
        {"id": "M15_Q09", "type": "mcq", "question": "Thiền tâm Sơ thiền có bao nhiêu tâm sở?", "correctAnswer": "35", "distractors": ["36", "38", "34"], "explanation": "13 Tợ tha + 22 Tịnh hảo (25 trừ 3 Giới phần) = 35.", "sourceRefs": [ref(TSPh, 21)]},
        {"id": "M15_Q10", "type": "mcq", "question": "Tâm Siêu thế Sơ thiền có 36 tâm sở vì lý do gì?", "correctAnswer": "Có đủ 3 Giới phần, chỉ trừ 2 Vô lượng phần", "distractors": ["Có đủ 2 Vô lượng phần, trừ 3 Giới phần", "Thêm 2 Hôn phần", "Thêm Tà kiến và Ngã mạn"], "explanation": "13 + 23 (25 − 2 Vô lượng phần) = 36; Đạo tâm lấy Niết bàn làm đối tượng nên có Giới phần.", "sourceRefs": [ref(TSPh, 24)]},
        {"id": "M15_Q11", "type": "mcq", "question": "Tứ danh uẩn gồm những pháp nào?", "correctAnswer": "Thức, Thọ, Tưởng, Hành", "distractors": ["Sắc, Thọ, Tưởng, Thức", "Thức, Tầm, Tứ, Hỷ", "Tâm, Tâm sở, Sắc, Niết bàn"], "explanation": "Thức + Thọ + Tưởng + 50 tâm sở còn lại (Hành) — 4 pháp bất khả phân ly.", "sourceRefs": [ref(TYD, 12)]},
        {"id": "M15_Q12", "type": "mcq", "question": "Tầm và Tứ hiện hữu trong bao nhiêu tâm (tính theo 121)?", "correctAnswer": "Tầm 55, Tứ 66", "distractors": ["Tầm 66, Tứ 55", "Tầm 51, Tứ 101", "Tầm 73, Tứ 78"], "explanation": "Tầm 55 tâm, Tứ 66 tâm; Hỷ 51, Dục 101.", "sourceRefs": [ref(TSPh, 4)]},
    ],
}


M16_VI = {
    "title": "Người và Cõi (Puggala – Bhūmi)",
    "description": "12 loại người và 31 cõi sinh tồn: 4 cảnh giới — Bất hạnh, Dục giới hữu phước, Sắc giới 16 cõi, Vô sắc 4 cõi.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M16_S01",
            "title": "12 loại người — Puggala",
            "summary": "Phàm nhân 4 loại và Thánh nhân 8 loại — người là chúng sanh có Danh và Sắc do nghiệp lực chi phối.",
            "body": [
                "Puggala từ căn “Pun + gala”: người. Người là chúng sanh có Danh và Sắc, hoặc Danh hoặc Sắc, do nghiệp lực chi phối tác thành.",
                "Phân loại có 12 loại người, chia 2 nhóm. Nhóm A — Phàm nhân: 1/ Người Khổ vô nhân (Ahetuka puggala); 2/ Người Lạc vô nhân (Sugati ahetuka puggala); 3/ Người Nhị nhân (Dvihetuka puggala); 4/ Người Tam nhân (Tihetuka puggala).",
                "Nhóm B — Thánh nhân: Người Đạo và Quả của 4 bậc — Nhập lưu (Sotāpatti), Nhất lai (Sakadāgāmi), Bất lai (Anāgāmi), Vô sanh (Arahatta) — 4 Đạo + 4 Quả = 8 loại.",
                "Xét theo Tục đế: người, nhân loại, chư thiên, phạm thiên… Xét theo Chân đế: chỉ có Danh và Sắc, không có một “người” thường hằng.",
            ],
            "keyTerms": [
                {"id": "TERM_PUGGALA_M16", "term": "Người", "pali": "Puggala", "meaning": "Chúng sanh có Danh và Sắc do nghiệp lực chi phối tác thành"},
                {"id": "TERM_PHAM_THANH_M16", "term": "2 nhóm người", "pali": "Puggala-bheda", "meaning": "Phàm nhân 4 loại + Thánh nhân 8 loại = 12"},
            ],
            "sourceRefs": [
                ref(NC, 3, "CÁC LOẠI NGƯỜI – PUGGALA-BHEDA: 12 loại chia 2 nhóm A phàm nhân / B thánh nhân"),
            ],
        },
        {
            "id": "M16_S02",
            "title": "Người Khổ vô nhân và Người Lạc vô nhân",
            "summary": "Tâm tục sinh của người khổ là Quan sát thọ xả quả bất thiện; của người lạc là Quan sát thọ xả quả thiện — 11 loại lạc vô nhân.",
            "body": [
                "Người Khổ vô nhân (Ahctuka puggala): có 4 loại trong đời sống bình nhật — chúng sanh đa khổ thiểu lạc; chúng sanh toàn khổ; chúng sanh khổ thân đói khát; chúng sanh vất vả khổ sở luôn lo sợ — khó được sanh tâm thiện.",
                "Tâm tục sinh của người khổ vô nhân là TÂM QUAN SÁT THỌ XẢ QUẢ BẤT THIỆN VÔ NHÂN — quả của 11 tâm Bất thiện (8 tâm Tham + 2 tâm Sân + 1 tâm Si hoài nghi). Tâm Si phóng dật không thể cho quả tục sinh vì nó loạn động, yếu đuối — chỉ cho quả trong đời sống bình nhật.",
                "Đời sống bình nhật của người khổ vô nhân: 37 tâm — 12 tâm Bất thiện + 17 tâm Vô nhân (18 trừ Ưng cúng vi tiếu) + 8 tâm Thiện Dục giới Tịnh hảo (4 hợp trí, 4 ly trí); 52 tâm sở.",
                "Người Lạc vô nhân (Sugati ahetuka puggala): người có nhiều an lạc hơn người khổ, không bị chịu những thống khổ như người khổ. Tâm tục sinh là TÂM QUAN SÁT THỌ XẢ QUẢ THIỆN VÔ NHÂN, làm phận sự tục sinh, hộ kiếp, tử. Trú xứ: cõi Nhân loại và cõi Tứ thiên vương bậc thấp.",
                "Có 3 loại sanh người lạc vô nhân: thai sanh (cõi nhân loại); hóa sanh (cõi Tứ thiên vương — không qua thai bào, biến hiện có liền); sắc hóa sanh (cõi vô tưởng — tái tục chỉ có Sắc: sắc mạng quyền, sắc nghiệp, sắc âm dương).",
                "Có 11 loại người lạc vô nhân: mù bẩm sinh (Jaccandha — khi sinh ra không có hệ thần kinh nhãn, trong vòng 3 tháng đầu thai kỳ không sanh sắc thần kinh nhãn); điếc bẩm sinh; không có thần kinh tỷ bẩm sinh; đần độn bẩm sinh; câm bẩm sinh; điên bẩm sinh; vô tính (Paṇḍaka — không có bộ phận sinh dục nam hay nữ); lưỡng tính (Ubhatobyañjana)…",
            ],
            "keyTerms": [
                {"id": "TERM_KHO_VO_NHAN_M16", "term": "Người khổ vô nhân", "pali": "Ahetuka puggala", "meaning": "Tục sinh bằng Tâm quan sát thọ xả quả bất thiện vô nhân"},
                {"id": "TERM_LAC_VO_NHAN_M16", "term": "Người lạc vô nhân", "pali": "Sugati ahetuka puggala", "meaning": "11 loại bẩm khuyết; tục sinh bằng Tâm quan sát thọ xả quả thiện"},
            ],
            "sourceRefs": [
                ref(NC, 4, "4 loại người khổ trong đời sống bình nhật; 37 tâm; tâm tục sinh là Quan sát thọ xả quả bất thiện"),
                ref(NC, 5, "NGƯỜI LẠC VÔ NHÂN – SUGATI AHETUKA PUGGALA: tâm tục sinh Quan sát thọ xả quả thiện; 3 loại sanh"),
                ref(NC, 6, "11 loại người lạc vô nhân: mù, điếc, câm, đần độn, điên bẩm sinh, vô tính, lưỡng tính…"),
            ],
        },
        {
            "id": "M16_S03",
            "title": "8 bậc Thánh nhân — từ Nhập lưu đến Vô sanh",
            "summary": "Đạo nhập lưu sát trừ 3 kiết sử, diệt 2 tâm sở và 5 tâm; A la hán đạo tuyệt trừ tất cả chủng tái tục.",
            "body": [
                "Người Đạo Nhập lưu — Sơ đạo (Sotāpattimagga puggala): người ĐANG sát trừ 3 kiết sử phiền não là Thân kiến, Hoài nghi, Giới cấm thủ; chứng ngộ Niết bàn lần đầu tiên, được tính ngay sát na Tâm đạo đang sanh với 3 sát na tiểu (sanh, trụ, diệt).",
                "Ở bậc Sơ đạo, tâm sở diệt trừ 2: Tà kiến và Hoài nghi. Tâm diệt trừ 5: 4 tâm Tham hợp tà (2 thọ hỷ, 2 thọ xả) và Tâm Si hoài nghi.",
                "Người Quả Nhập lưu — Sơ quả (Sotāpattiphala puggala): bậc đã chứng đắc Đạo Nhập lưu; còn gọi Sơ Quả, Quả Dự lưu, Tu đà hườn quả — được tính từ Tâm Sơ quả phát sanh lần thứ 1 cho đến sát na diệt của Tâm Dũ Tịnh trong lộ đắc Nhị đạo.",
                "Tiếp theo: Người Đạo Nhất lai — Nhị đạo (Sakadāgāmimagga) và Người Quả Nhất lai — Nhị quả, bậc Thánh thứ 2; Người Đạo Bất lai — Tam đạo (Anāgāmimagga) và Quả Bất lai.",
                "Người Đạo Vô sanh — Tứ đạo (Arahattamagga puggala): người ĐANG TUYỆT TRỪ tất cả chủng từ tái tục (vô sanh); hoàn tất với Người Quả Vô sanh — A la hán quả, bậc Thánh thứ 4.",
            ],
            "keyTerms": [
                {"id": "TERM_SO_DAO_M16", "term": "Sơ đạo", "pali": "Sotāpattimagga", "meaning": "Sát trừ Thân kiến, Hoài nghi, Giới cấm thủ — diệt 2 tâm sở, 5 tâm"},
                {"id": "TERM_TU_DAO_M16", "term": "Tứ đạo", "pali": "Arahattamagga", "meaning": "Tuyệt trừ tất cả chủng tái tục — Vô sanh"},
            ],
            "sourceRefs": [
                ref(NC, 9, "5. NGƯỜI ĐẠO NHẬP LƯU – SƠ ĐẠO: sát trừ 3 kiết sử; diệt 2 tâm sở, 5 tâm; 6. QUẢ NHẬP LƯU"),
                ref(NC, 10, "7. NGƯỜI ĐẠO NHẤT LAI / QUẢ NHẤT LAI — bậc Thánh thứ 2"),
                ref(NC, 11, "11. NGƯỜI ĐẠO VÔ SANH – TỨ ĐẠO: đang tuyệt trừ tất cả chủng từ tái tục"),
            ],
        },
        {
            "id": "M16_S04",
            "title": "Bốn cảnh giới sinh tồn — 31 cõi",
            "summary": "Bất hạnh 4, Dục giới hữu phước 7, Sắc giới 16, Vô sắc 4 — bậc Thánh không sanh ác cảnh và cõi vô tưởng.",
            "body": [
                "Bốn cảnh giới sinh tồn (Bhūmi): 1/ Cảnh bất hạnh (Apāyabhūmi); 2/ Cảnh hữu phước của Dục giới (Kāmasugatibhūmi); 3/ Cảnh Sắc giới (Rūpāvacarabhūmi); 4/ Cảnh Vô sắc giới (Arūpāvacarabhūmi).",
                "Cảnh bất hạnh có 4: cảnh Khổ (địa ngục), cảnh Thú (bàng sanh), cảnh Ngạ quỷ, cảnh Atula.",
                "Cảnh hữu phước của Dục giới có 7: cảnh người, cảnh Tứ Đại Thiên Vương, cảnh Tam Thập Tam Thiên, cảnh Dạ Ma Thiên, cảnh Đấu Xuất Đà Thiên, cảnh Hóa Lạc Thiên, cảnh Tha Hóa Tự Tại Thiên.",
                "Cảnh Sắc giới có 16 cõi chia 4 nhóm theo các tầng thiền: Sơ thiền 3 (Phạm Chúng, Phạm Phụ, Đại Phạm Thiên); Nhị thiền 3; Tam thiền 3; Tứ thiền 7.",
                "Cảnh Vô sắc giới có 4: Không Vô Biên Xứ Thiên, Thức Vô Biên Xứ Thiên, Vô Sở Hữu Xứ Thiên, Phi Tưởng Phi Phi Tưởng Thiên.",
                "Ghi nhớ: các bậc Nhất lai, Dự lưu và hạng phàm nhân không tái sanh vào cảnh Phước Sanh Thiên (Suddhāvāsā — Ngũ Tịnh Cư); bậc Thánh không sanh vào cõi vô tưởng và các ác cảnh.",
            ],
            "keyTerms": [
                {"id": "TERM_BHUMI_M16", "term": "Cảnh giới sinh tồn", "pali": "Bhūmi", "meaning": "4 cảnh: bất hạnh, dục giới hữu phước, sắc giới, vô sắc giới"},
                {"id": "TERM_NGU_TINH_CU_M16", "term": "Ngũ Tịnh Cư", "pali": "Suddhāvāsā", "meaning": "5 cõi Phước sanh — chỉ bậc Bất lai và A la hán"},
            ],
            "sourceRefs": [
                ref(NC, 12, "Bốn cảnh giới sinh tồn; cảnh bất hạnh 4; dục giới hữu phước 7 (Pāli gatha)"),
                ref(NC, 13, "Cảnh vô sắc 4; phàm nhân, dự lưu, nhất lai không sanh Ngũ Tịnh Cư; Thánh không sanh vô tưởng và ác cảnh"),
                ref(NC, 14, "Sơ đồ 31 cõi: ác cảnh 4, cõi người 4 châu, 6 cõi trời dục giới, sơ thiền 3 cõi"),
            ],
        },
        {
            "id": "M16_S05",
            "title": "Bốn ác cảnh — Địa ngục, Bàng sanh, Ngạ quỷ, Atula",
            "summary": "8 đại địa ngục cách nhau 1500 do tuần; mỗi đại có 4 cửa, 16 tiểu địa ngục; Atula tục sinh bằng tâm.",
            "body": [
                "Cõi Địa ngục có 8 Đại địa ngục: 1/ Sañjīva (hồi sinh), 2/ Kālasutta (thuyền đen), 3/ Saṅghāta (đè nát), 4/ Roriva, 5/ Mahāroriva, 6/ Tāpana, 7/ Mahātāpana, 8/ Avīci (vô gián).",
                "Vị trí: nằm sâu trong lòng địa cầu. Khoảng cách: mỗi Đại địa ngục cách nhau 1500 do tuần (1 do tuần = 20km), nằm chồng lên nhau theo thứ tự.",
                "Mỗi Đại địa ngục có 4 cửa (8 × 4 = 32 cửa); mỗi cửa có 4 hầm địa ngục (32 × 4 = 128 hầm) và 1 vị Diêm Vương cai quản (32 vị); mỗi Đại địa ngục có 16 tiểu địa ngục gọi là Đa khổ địa ngục (Ussada).",
                "Cõi Bàng sanh (thú) và cõi Ngạ quỷ: hai ác cảnh này trải khắp, có 2 mặt đời sống — như cõi Tứ thiên vương có mặt hưởng cảnh Trời và mặt khổ cảnh Địa ngục.",
                "Atula (Asura): loại Deva Asura — Atula chư thiên tục sinh bằng tâm; là những vị thuộc hạ tầng của chư thiên, không ưa ánh sáng.",
            ],
            "keyTerms": [
                {"id": "TERM_DAI_DIA_NGUC_M16", "term": "8 Đại địa ngục", "pali": "Aṭṭha mahāniraya", "meaning": "Sañjīva → Avīci, cách nhau 1500 do tuần"},
                {"id": "TERM_ATULA_M16", "term": "Atula", "pali": "Asura", "meaning": "Ác cảnh thứ 4 — Deva Asura tục sinh bằng tâm"},
            ],
            "sourceRefs": [
                ref(NC, 16, "8 ĐẠI ĐỊA NGỤC: Sañjīva…Avīci; vị trí, khoảng cách 1500 do tuần; 4 cửa, 128 hầm, 32 Diêm Vương, 16 tiểu địa ngục"),
                ref(NC, 17, "2 mặt đời sống: vui hưởng cảnh Trời, khổ cảnh Địa ngục"),
                ref(NC, 20, "Loại 1 – DEVA ASURA: ATULA CHƯ THIÊN — tục sinh bằng tâm"),
            ],
        },
        {
            "id": "M16_S06",
            "title": "Cõi người — bốn châu",
            "summary": "Manussā: chúng sanh có tâm sáng chói và dũng cảm; Nam Thiện Bộ Châu khổ hơn nhưng dễ tu và có Chư Phật ra đời.",
            "body": [
                "Kāmasugati — căn SU + GATI: thiện thú, trú xứ tái sanh tốt đẹp; cõi vui nào có sự tương hợp, câu hữu với dục ái (sắc ái, thinh ái, khí ái, vị ái, xúc ái, pháp ái) gọi là Cõi vui Dục giới.",
                "Cõi người (Manussabhūmi): Manussannaṃ etesanti = Manussā — các chúng sanh được gọi là người, do có tâm sáng chói và dũng cảm. Phân loại có 4 hạng người sống theo 4 châu.",
                "1/ Nam Thiện Bộ Châu (Jambūdīpa): người đang sống thuộc nhân loại như chúng ta (Jambū: cây dâm bụt nhiều ở Ấn Độ xưa). Tâm người nơi đây khác 3 châu kia: dũng cảm sáng chói phần thiện và dữ dằn phần ác.",
                "Cõi này kém hơn 3 châu kia vì dân chúng phải làm lụng vất vả hơn, có nhiều sự khổ hơn — nhưng DỄ TU hơn và có Chư Phật ra đời. Về phần thiện: có khả năng tu tiến thành bậc Chánh Đẳng Giác, Độc Giác, Thượng Thủ Thinh Văn, Đại Thinh Văn, Thường Thinh Văn, Chuyển Luân Vương, chứng thiền, thắng trí thông. Về phần ác: giết cha, giết mẹ, giết A la hán, làm chảy máu Phật, chia rẽ Tăng.",
                "2/ Bắc Câu Lưu Châu (Uttarakurudīpa); 3/ Đông Thắng Thần Châu (Pubbavidehadīpa — có khuôn mặt tròn vì địa hình cũng tròn); 4/ Tây Ngưu Hóa Châu (Aparagoyānadīpa).",
            ],
            "keyTerms": [
                {"id": "TERM_JAMBU_M16", "term": "Nam Thiện Bộ Châu", "pali": "Jambūdīpa", "meaning": "Cõi người của chúng ta — khổ nhưng dễ tu, Chư Phật ra đời"},
                {"id": "TERM_MANUSSA_M16", "term": "Người", "pali": "Manussā", "meaning": "Chúng sanh có tâm sáng chói và dũng cảm"},
            ],
            "sourceRefs": [
                ref(NC, 21, "II/ CÕI VUI DỤC GIỚI – KĀMASUGATI: căn SU + GATI; 7 cõi; cõi người 4 châu"),
                ref(NC, 22, "1/ NGƯỜI NAM THIỆN BỘ CHÂU – JAMBŪDĪPA: tâm dũng cảm sáng chói; kém hơn 3 châu nhưng dễ tu, có Chư Phật ra đời"),
                ref(NC, 23, "3/ NGƯỜI ĐÔNG THẮNG THẦN CHÂU – PUBBAVIDEHA: mặt tròn vì địa hình tròn"),
            ],
        },
        {
            "id": "M16_S07",
            "title": "Sáu cõi trời Dục giới",
            "summary": "Tứ thiên vương 500 năm tới Tha hóa tự tại 16.000 năm — tuổi thọ gấp đôi mỗi tầng, Ma vương ở cõi cao nhất.",
            "body": [
                "Chư thiên trong 6 cõi trời Dục giới là Uppattideva — chư thiên sinh lên để hưởng quả nghiệp đã tạo (khác Phạm thiên nhập định).",
                "1/ Tứ Đại Thiên Vương (Cātummahārājika): tên lấy từ 4 vị Thiên vương cai trị thiên chúng; vị trí giữa núi Sineru (Tudi), cách xa nhân loại 42.000 do tuần. Tuổi thọ 500 năm cõi trời, 1 ngày cõi trời = 50 năm cõi người — tổng 9.125.000 năm người. Chư thiên cõi này có nhiều nhóm: Địa cư thiên, Càn thác bà (Gandhabba — sống dựa cây cối có hương), La sát (Kumbhaṇḍa)…",
                "2/ Tam Thập Tam Thiên (Tāvatiṃsa — Đao lợi): nằm trên đỉnh núi Tudi; thành phố Sudassana giữa đỉnh núi hình tròn, cấu tạo bằng 7 báu; cung điện Vejayanta của Vua trời Đế Thích. Tuổi thọ 1000 năm, 1 ngày đêm = 100 năm cõi người. Thiên nam dung sắc như thanh niên 20 tuổi, thiên nữ như gái 16; không lão hóa, không bệnh, thực phẩm tinh khiết.",
                "3/ Dạ Ma Thiên (Yāma): vị chúa cõi này tên Suyāma; nằm trong hư không; tuổi thọ 2000 năm, 1 ngày = 200 năm người — tổng 146.000.000 năm người.",
                "4/ Đấu Xuất Đà Thiên (Tusita): trú xứ của những người sống với hạnh lành với tâm mát mẻ; Bồ tát Thượng thủ thinh văn cũng ở cõi này. Tuổi thọ 4000 năm, 1 ngày = 400 năm người.",
                "5/ Hóa Lạc Thiên (Nimmānarati): tuổi thọ 8000 năm, 1 ngày = 800 năm người. 6/ Tha Hóa Tự Tại Thiên (Paranimmitavasavattī): tuổi thọ 16.000 năm, 1 ngày = 1.600 năm người — cõi này là trú xứ của Ma vương Māra.",
                "Hóa Lạc và Tha Hóa Tự Tại không có tình nhân như 4 cõi dưới (Tứ thiên vương, Tam thập tam, Dạ ma, Đấu suất — chư thiên 4 cõi này đều có tình nhân): thiên nam thiên nữ khi muốn dục thì hóa hiện ra tình nhân.",
            ],
            "keyTerms": [
                {"id": "TERM_UPPATTIDEVA_M16", "term": "Chư thiên dục giới", "pali": "Uppattideva", "meaning": "Sinh lên để hưởng quả nghiệp đã tạo"},
                {"id": "TERM_TUOI_THO_TROI_M16", "term": "Tuổi thọ 6 cõi trời", "pali": "—", "meaning": "500 → 1000 → 2000 → 4000 → 8000 → 16.000 năm (1 ngày = 50→1.600 năm người)"},
            ],
            "sourceRefs": [
                ref(NC, 24, "6 cõi trời dục giới; Tứ thiên vương: 500 năm, 1 ngày = 50 năm; cách 42.000 do tuần"),
                ref(NC, 26, "Nhóm 2 GANDHABBO; nhóm 3 KUMBHAṆḌA – RAKKHASA"),
                ref(NC, 28, "Tam thập tam: núi Tudi, Sudassana, Vejayanta"),
                ref(NC, 29, "Thiên nam 20 tuổi, thiên nữ 16; không lão hóa, không bệnh"),
                ref(NC, 30, "Tam thập tam: 1000 năm, 1 ngày = 100 năm; cách cõi người 84.000 do tuần"),
                ref(NC, 31, "Dạ ma: Suyāma, 2000 năm; Đấu suất: 4000 năm, Bồ tát Thượng thủ thinh văn ở cõi này"),
                ref(NC, 32, "Hóa lạc 8000 năm; Tha hóa 16.000 năm, trú xứ Ma vương Māra; 4 cõi dưới có tình nhân"),
            ],
        },
        {
            "id": "M16_S08",
            "title": "16 cõi Sắc giới và 4 cõi Vô sắc",
            "summary": "Sắc giới chia 4 nhóm theo tầng thiền; Ngũ Tịnh Cư chỉ dành cho Bất lai và A la hán; Vô sắc chỉ có Tứ danh uẩn.",
            "body": [
                "Cõi Sắc giới (Rūpāvacarabhūmi) có 16 cõi chia 4 nhóm theo các tầng thiền, nằm trên hư không với 3 khu vực riêng, cấu tạo bằng 7 báu, luôn sáng chói hào quang.",
                "Nhóm 1 — cõi Sơ thiền có 3: Phạm Chúng Thiên (Brahmapārisajjā — đồ chúng, tùy tùng của Đại Phạm Thiên); Phạm Phụ Thiên (Brahmapurohitā — hạng Phạm thiên làm cố vấn); Đại Phạm Thiên (Mahābrahmā — vị Phạm thiên tối thắng, có mặt đầu tiên khi vũ trụ hình thành).",
                "Nhóm 2 — cõi Nhị thiền có 3: Thiểu Quang Thiên, Vô Lượng Quang Thiên, Quang Âm Thiên (Ābhassarā — hào quang phóng tủa từ thân; theo kinh Khởi Thế Nhân Bản, thủy tổ loài người là các vị Phạm thiên cõi Quang Âm). Nhóm 3 — cõi Tam thiền có 3: Thiểu Tịnh Thiên, Vô Lượng Tịnh Thiên, Biến Tịnh Thiên.",
                "Nhóm 4 — cõi Tứ thiền có 7: Quảng Quả Thiên (Vehapphala), Vô Tưởng Thiên (Asaññasatta — chỉ có Sắc) và 5 cõi Tịnh Cư Thiên (Suddhāvāsā): Vô Phiền Thiên (Avihā), Vô Nhiệt Thiên (Atappā), Thiện Kiến Thiên (Sudassā), Thiện Hiện Thiên (Sudassī), Sắc Cứu Cánh Thiên (Akaṇiṭṭhā).",
                "Tịnh Cư Thiên là trú xứ thanh tịnh của bậc A na hàm và A la hán — Phạm thiên chứng Ngũ thiền Sắc giới nhưng phải là bậc Thánh Tam quả trở lên; 5 cõi được xếp chồng từ thấp đến cao; Sắc Cứu Cạnh có Ân đức Giới Định Tuệ cao nhất trong Sắc giới.",
                "Tâm tục sinh 9 cõi thiền: 3 cõi Sơ thiền do mãnh lực Thiện Sơ thiền; 3 cõi Nhị thiền và 3 cõi Tam thiền do mãnh lực thiền các tầng tương ứng.",
                "Cõi Vô sắc (Arūpabhūmi) có 4: Không Vô Biên Xứ, Thức Vô Biên Xứ, Vô Sở Hữu Xứ, Phi Tưởng Phi Phi Tưởng Xứ. Cõi chỉ có Tứ Danh uẩn (Thọ, Tưởng, Hành, Thức), không có Sắc uẩn; Danh uẩn sanh diệt theo Vô Gián duyên từ Tâm tục sinh. Phạm thiên Vô sắc sanh lên do mãnh lực thiền Ly Tham — tu tiến ly tham, chán ngán Sắc.",
                "Đời sống Phạm thiên: không hiện bày nam tướng nữ tướng nhưng Sắc tướng giống nam nhân; hoan hỷ với thiên cung vườn hoa nhưng không có tham dục triền cái vì khi còn nhân loại đã tu tập pháp ly tham dục; các bậc Thánh Phạm thiên nhập Thiền quả.",
            ],
            "keyTerms": [
                {"id": "TERM_SAC_GIOI_16_M16", "term": "16 cõi Sắc giới", "pali": "Rūpāvacarabhūmi", "meaning": "Sơ 3 + Nhị 3 + Tam 3 + Tứ 7 (Quảng quả, Vô tưởng, 5 Tịnh cư)"},
                {"id": "TERM_VO_SAC_4_M16", "term": "4 cõi Vô sắc", "pali": "Arūpabhūmi", "meaning": "Chỉ Tứ danh uẩn, không Sắc uẩn — sanh do thiền ly tham Sắc"},
            ],
            "sourceRefs": [
                ref(NC, 33, "LUẬN VỀ CÕI SẮC GIỚI: 16 cõi chia 4 nhóm; Sơ thiền 3 cõi: Phạm Chúng, Phạm Phụ, Đại Phạm"),
                ref(NC, 35, "3/ CÕI QUANG ÂM THIÊN – ĀBHASSARĀ: thủy tổ loài người theo kinh Khởi Thế Nhân Bản"),
                ref(NC, 36, "NHÓM 3: CÕI TAM THIỀN: Thiểu Tịnh, Vô Lượng Tịnh, Biến Tịnh"),
                ref(NC, 37, "NHÓM 4: CÕI TỨ THIỀN 7 cõi; tâm tục sinh 9 cõi thiền"),
                ref(NC, 38, "5 cõi Tịnh Cư Thiên – SUDDHĀVĀSĀ: trú xứ A na hàm, A la hán"),
                ref(NC, 39, "4/ CÕI THIỆN HIỆN THIÊN – SUDASSĪ"),
                ref(NC, 40, "5/ CÕI SẮC CỨU CÁNH THIÊN – AKANIṬṬHĀ"),
                ref(NC, 42, "Đời sống vị Phạm thiên; THIÊN SẢN các cõi"),
                ref(NC, 43, "IV/ CÕI VÔ SẮC: chỉ Tứ danh uẩn; sanh do thiền ly tham Sắc"),
            ],
        },
    ],
    "reviewCards": [
        {"id": "M16_R01", "front": "Puggala nghĩa là gì? Có mấy loại người?", "back": "Người — chúng sanh có Danh và Sắc (hoặc Danh hoặc Sắc) do nghiệp lực chi phối; 12 loại: Phàm nhân 4 + Thánh nhân 8.", "sourceRefs": [ref(NC, 3)]},
        {"id": "M16_R02", "front": "Bốn loại Phàm nhân?", "back": "Người Khổ vô nhân, Người Lạc vô nhân, Người Nhị nhân, Người Tam nhân.", "sourceRefs": [ref(NC, 3)]},
        {"id": "M16_R03", "front": "Tâm tục sinh của người Khổ vô nhân?", "back": "Tâm Quan sát thọ xả Quả Bất thiện Vô nhân — quả của 11 tâm Bất thiện (8 Tham + 2 Sân + 1 Si hoài nghi).", "sourceRefs": [ref(NC, 4)]},
        {"id": "M16_R04", "front": "Vì sao tâm Si phóng dật không cho quả tục sinh?", "back": "Vì nó loạn động, yếu đuối — chỉ cho quả trong đời sống bình nhật.", "sourceRefs": [ref(NC, 4)]},
        {"id": "M16_R05", "front": "Tâm tục sinh của người Lạc vô nhân?", "back": "Tâm Quan sát thọ xả Quả Thiện Vô nhân — làm phận sự tục sinh, hộ kiếp, tử.", "sourceRefs": [ref(NC, 5)]},
        {"id": "M16_R06", "front": "Sơ đạo diệt trừ những tâm sở và tâm nào?", "back": "2 tâm sở: Tà kiến, Hoài nghi. 5 tâm: 4 tâm Tham hợp tà + Tâm Si hoài nghi.", "sourceRefs": [ref(NC, 9)]},
        {"id": "M16_R07", "front": "Bốn cảnh giới sinh tồn?", "back": "1/ Bất hạnh; 2/ Dục giới hữu phước; 3/ Sắc giới; 4/ Vô sắc giới.", "sourceRefs": [ref(NC, 12)]},
        {"id": "M16_R08", "front": "Bốn ác cảnh là gì?", "back": "Địa ngục (Khổ), Bàng sanh (Thú), Ngạ quỷ, Atula.", "sourceRefs": [ref(NC, 12)]},
        {"id": "M16_R09", "front": "8 Đại địa ngục tên gì?", "back": "1 Sañjīva, 2 Kālasutta, 3 Saṅghāta, 4 Roriva, 5 Mahāroriva, 6 Tāpana, 7 Mahātāpana, 8 Avīci.", "sourceRefs": [ref(NC, 16)]},
        {"id": "M16_R10", "front": "Vì sao Nam Thiện Bộ Châu được coi là dễ tu?", "back": "Tâm người nơi đây dũng cảm sáng chói phần thiện (tu thành Chánh Đẳng Giác, Độc Giác, Thinh Văn, Chuyển Luân Vương…) và có Chư Phật ra đời — dù khổ hơn 3 châu kia.", "sourceRefs": [ref(NC, 22)]},
        {"id": "M16_R11", "front": "Bốn châu của cõi người?", "back": "Nam Thiện Bộ (Jambūdīpa), Bắc Câu Lưu (Uttarakuru), Đông Thắng Thần (Pubbavideha), Tây Ngưu Hóa (Aparagoyāna).", "sourceRefs": [ref(NC, 21)]},
        {"id": "M16_R12", "front": "Tuổi thọ 6 cõi trời Dục giới?", "back": "Tứ thiên vương 500; Tam thập tam 1000; Dạ ma 2000; Đấu suất 4000; Hóa lạc 8000; Tha hóa tự tại 16.000 năm.", "sourceRefs": [ref(NC, 24), ref(NC, 30), ref(NC, 31), ref(NC, 32)]},
        {"id": "M16_R13", "front": "Ma vương Māra trú ở cõi nào?", "back": "Tha Hóa Tự Tại Thiên (Paranimmitavasavattī) — cõi cao nhất Dục giới.", "sourceRefs": [ref(NC, 32)]},
        {"id": "M16_R14", "front": "5 cõi Tịnh Cư Thiên là gì? Ai được sanh?", "back": "Vô Phiền, Vô Nhiệt, Thiện Kiến, Thiện Hiện, Sắc Cứu Cạnh — trú xứ của bậc A na hàm và A la hán.", "sourceRefs": [ref(NC, 38), ref(NC, 13)]},
        {"id": "M16_R15", "front": "Cõi Vô sắc có Sắc uẩn không?", "back": "Không — chỉ có Tứ Danh uẩn (Thọ, Tưởng, Hành, Thức); sanh lên do mãnh lực thiền ly tham Sắc.", "sourceRefs": [ref(NC, 43)]},
        {"id": "M16_R16", "front": "Phạm thiên có tham dục không?", "back": "Không có tham dục triền cái — khi còn nhân loại đã tu tập pháp ly tham dục; vẫn hoan hỷ với thiên cung, vườn hoa.", "sourceRefs": [ref(NC, 42)]},
    ],
    "quizSeeds": [
        {"id": "M16_Q01", "type": "mcq", "question": "Có bao nhiêu loại người (Puggala)?", "correctAnswer": "12 — 4 phàm nhân + 8 thánh nhân", "distractors": ["8 — chỉ 8 thánh nhân", "4 — chỉ 4 phàm nhân", "31 — theo số cõi"], "explanation": "Phàm nhân: khổ vô nhân, lạc vô nhân, nhị nhân, tam nhân. Thánh nhân: 4 Đạo + 4 Quả.", "sourceRefs": [ref(NC, 3)]},
        {"id": "M16_Q02", "type": "mcq", "question": "Tâm tục sinh của người Khổ vô nhân là tâm nào?", "correctAnswer": "Tâm Quan sát thọ xả Quả Bất thiện Vô nhân", "distractors": ["Tâm Quan sát thọ xả Quả Thiện Vô nhân", "Tâm Tiếp thâu", "Tâm Khán ngũ môn"], "explanation": "Quả của 11 tâm Bất thiện; tâm Si phóng dật không cho quả tục sinh vì loạn động yếu đuối.", "sourceRefs": [ref(NC, 4)]},
        {"id": "M16_Q03", "type": "mcq", "question": "Sơ đạo sát trừ 3 kiết sử nào?", "correctAnswer": "Thân kiến, Hoài nghi, Giới cấm thủ", "distractors": ["Tham, Sân, Si", "Thân kiến, Ngã mạn, Tật", "Hoài nghi, Phóng dật, Hôn trầm"], "explanation": "Đồng thời diệt 2 tâm sở (Tà kiến, Hoài nghi) và 5 tâm (4 Tham hợp tà + Si hoài nghi).", "sourceRefs": [ref(NC, 9)]},
        {"id": "M16_Q04", "type": "mcq", "question": "Cảnh bất hạnh (Apāya) gồm những cõi nào?", "correctAnswer": "Địa ngục, Bàng sanh, Ngạ quỷ, Atula", "distractors": ["Địa ngục, Ngạ quỷ, Thú, Người", "Địa ngục, Atula, Dạ ma, Tusita", "Ngạ quỷ, Bàng sanh, Vô tưởng, Vô sắc"], "explanation": "4 ác cảnh trong 4 cảnh giới sinh tồn.", "sourceRefs": [ref(NC, 12)]},
        {"id": "M16_Q05", "type": "mcq", "question": "Cảnh hữu phước của Dục giới có mấy cõi?", "correctAnswer": "7", "distractors": ["4", "6", "11"], "explanation": "Người + 6 cõi trời Dục giới = 7.", "sourceRefs": [ref(NC, 12)]},
        {"id": "M16_Q06", "type": "mcq", "question": "8 Đại địa ngục cách nhau bao nhiêu do tuần?", "correctAnswer": "1500 do tuần", "distractors": ["42.000 do tuần", "1000 do tuần", "84.000 do tuần"], "explanation": "Nằm chồng lên nhau theo thứ tự, sâu trong lòng địa cầu; 1 do tuần = 20km.", "sourceRefs": [ref(NC, 16)]},
        {"id": "M16_Q07", "type": "mcq", "question": "Cõi nào DỄ tu và có Chư Phật ra đời?", "correctAnswer": "Nam Thiện Bộ Châu (Jambūdīpa)", "distractors": ["Bắc Câu Lưu Châu", "Đông Thắng Thần Châu", "Tây Ngưu Hóa Châu"], "explanation": "Khổ hơn 3 châu kia nhưng tâm dũng cảm sáng chói; tu được Chánh Đẳng Giác, Độc Giác…", "sourceRefs": [ref(NC, 22)]},
        {"id": "M16_Q08", "type": "mcq", "question": "1 ngày cõi Tứ thiên vương bằng bao nhiêu năm cõi người?", "correctAnswer": "50 năm", "distractors": ["100 năm", "200 năm", "400 năm"], "explanation": "500 năm cõi trời × 18.250 năm người = 9.125.000 năm người.", "sourceRefs": [ref(NC, 24)]},
        {"id": "M16_Q09", "type": "mcq", "question": "Vua trời Đế Thích ngự tại cõi nào?", "correctAnswer": "Tam Thập Tam Thiên (Đao lợi)", "distractors": ["Tứ Đại Thiên Vương", "Dạ Ma Thiên", "Hóa Lạc Thiên"], "explanation": "Trên đỉnh núi Tudi, kinh thành Sudassana, lâu đài Vejayanta.", "sourceRefs": [ref(NC, 28)]},
        {"id": "M16_Q10", "type": "mcq", "question": "Cõi nào là trú xứ của Ma vương Māra?", "correctAnswer": "Tha Hóa Tự Tại Thiên", "distractors": ["Hóa Lạc Thiên", "Đấu Xuất Đà Thiên", "Quang Âm Thiên"], "explanation": "Cõi cao nhất Dục giới, tuổi thọ 16.000 năm.", "sourceRefs": [ref(NC, 32)]},
        {"id": "M16_Q11", "type": "mcq", "question": "Cõi Sắc giới có bao nhiêu cõi, chia làm mấy nhóm?", "correctAnswer": "16 cõi, 4 nhóm theo tầng thiền", "distractors": ["15 cõi, 3 nhóm", "12 cõi, 4 nhóm", "16 cõi, 2 nhóm"], "explanation": "Sơ thiền 3, Nhị thiền 3, Tam thiền 3, Tứ thiền 7.", "sourceRefs": [ref(NC, 33)]},
        {"id": "M16_Q12", "type": "mcq", "question": "Ai được tái sanh vào 5 cõi Tịnh Cư Thiên?", "correctAnswer": "Bậc A na hàm (Bất lai) và A la hán trở lên", "distractors": ["Mọi bậc Thánh", "Phàm nhân tu ngũ thiền", "Chỉ bậc Sơ quả"], "explanation": "Suddhāvāsā — trú xứ thanh tịnh; phàm nhân, dự lưu, nhất lai không sanh nơi đây.", "sourceRefs": [ref(NC, 38), ref(NC, 13)]},
        {"id": "M16_Q13", "type": "mcq", "question": "Cõi Vô tưởng (Asaññasatta) đặc biệt ở điểm nào?", "correctAnswer": "Chỉ có Sắc, không có Danh", "distractors": ["Chỉ có Danh, không có Sắc", "Có cả Danh và Sắc", "Không có cả Danh lẫn Sắc"], "explanation": "Tái tục chỉ có Sắc: sắc mạng quyền, sắc nghiệp, sắc âm dương; bậc Thánh không sanh cõi này.", "sourceRefs": [ref(NC, 5), ref(NC, 13)]},
        {"id": "M16_Q14", "type": "mcq", "question": "Thủy tổ loài người theo kinh Khởi Thế Nhân Bản là ai?", "correctAnswer": "Các vị Phạm thiên cõi Quang Âm", "distractors": ["Vua Manu", "Đại Phạm Thiên", "Chư thiên Tứ thiên vương"], "explanation": "Sau khi thế giới tiêu hoại, Phạm thiên Quang Âm xuống đời sống bằng vị đất.", "sourceRefs": [ref(NC, 35)]},
        {"id": "M16_Q15", "type": "mcq", "question": "Phạm thiên Vô sắc sanh lên do mãnh lực gì?", "correctAnswer": "Thiền ly tham — chán ngán Sắc", "distractors": ["Thiền từ bi", "Nghiệp bố thí", "Tâm định Sơ thiền"], "explanation": "Virāgabhāvanā — tu tiến ly tham trong Sắc nên không hoan hỷ trong Sắc.", "sourceRefs": [ref(NC, 43)]},
        {"id": "M16_Q16", "type": "mcq", "question": "Cõi Sắc cứu cánh (Akaṇiṭṭhā) đặc trưng gì?", "correctAnswer": "Ân đức Giới Định Tuệ cao nhất trong Sắc giới", "distractors": ["Cõi thấp nhất Tứ thiền", "Nơi Ma vương trú ngụ", "Cõi không có hào quang"], "explanation": "Cao nhất trong 5 Tịnh Cư, xếp chồng từ thấp đến cao.", "sourceRefs": [ref(NC, 40)]},
    ],
}


M17_VI = {
    "title": "Duyên Khởi: Các Chi 3–12 (Chi Tiết)",
    "description": "Từ Thức duyên Danh–Sắc đến Sinh duyên Lão Tử — chi tiết 10 chi còn lại của Thập nhị Duyên khởi, kèm ba thời và 20 hành tướng.",
    "translationStatus": "reviewed",
    "lessonSections": [
        {
            "id": "M17_S01",
            "title": "Chi 3: Thức duyên Danh – Sắc",
            "summary": "Danh và Sắc sanh khởi do Thức; tùy cõi mà Thức duyên Danh, duyên Sắc hay duyên cả hai.",
            "body": [
                "VIÑÑĀṆAPACCAYĀ NĀMARŪPAṀ — Thức duyên Danh–Sắc. Nāma là Danh, Rūpa là Sắc, Paṭicca là duyên, Viññāṇa là Thức.",
                "Danh và Sắc là 2 thành phần riêng biệt nhưng được sanh khởi do từ Thức. Danh gồm Thọ (tâm sở Thọ), Tưởng (tâm sở Tưởng), Hành (50 tâm sở còn lại) đồng hiện khởi với Thức — 4 pháp này bất khả phân ly, gọi là Tứ danh uẩn.",
                "Các tâm Quả hiệp thế phối hợp với các tâm sở Tợ tha và Tịnh hảo (không có 14 tâm sở Bất thiện).",
                "Thức duyên cho Danh tùy cõi: cõi Vô sắc — Thức duyên Danh; cõi Vô tưởng — Thức duyên cho Sắc; cõi Sắc giới và Dục giới — Thức duyên đủ cả 2 Danh và Sắc.",
                "Thức duyên cho Sắc: Thức tục sinh duyên 3 nhóm sắc 10 pháp. Mỗi sát na tâm chia làm 3 sát na tiểu (Sanh, Trụ, Diệt); 17 sát na tâm × 3 = 51 sát na tiểu; 51 × 3 nhóm = 153 nhóm (sắc Thần kinh, sắc Tính, sắc Ý vật).",
                "3 nhóm Sắc này là Sắc nghiệp được hiện khởi ngay SÁT NA SINH của Tâm tục sinh, nên gọi là Sắc nghiệp tục sinh — tổng số 30 sắc đồng sanh khởi. Nhóm sắc Thần kinh Thân gồm 8 sắc bất ly (tứ đại: đất nước lửa gió; sắc cảnh sắc; sắc cảnh khí; sắc cảnh vị; sắc vật thực) cộng sắc Mạng quyền…",
            ],
            "keyTerms": [
                {"id": "TERM_THUC_DUYEN_M17", "term": "Thức duyên Danh–Sắc", "pali": "Viññāṇapaccayā nāmarūpaṁ", "meaning": "Danh và Sắc sanh khởi do Thức tục sinh"},
                {"id": "TERM_SAC_NGHIEP_TUC_SINH_M17", "term": "Sắc nghiệp tục sinh", "pali": "Kammaja-rūpa", "meaning": "3 nhóm sắc 10 pháp hiện khởi ngay sát na sinh của tâm tục sinh"},
            ],
            "sourceRefs": [
                ref(TYD, 12, "III/ THỨC DUYÊN DANH – SẮC: danh và sắc sanh khởi do Thức; tứ danh uẩn; tùy cõi; 35 tâm sở phối hợp tâm quả hiệp thế"),
                ref(TYD, 14, "III.2/ THỨC DUYÊN CHO SẮC: 17 sát na × 3 sát na tiểu × 3 nhóm = 153; sắc nghiệp tục sinh 30 sắc"),
            ],
        },
        {
            "id": "M17_S02",
            "title": "Chi 4–5: Danh sắc duyên Lục nhập; Lục nhập duyên Xúc",
            "summary": "5 nhập đầu là 5 sắc Thần kinh, Ý nhập là 32 tâm Quả hiệp thế; 6 xúc là tâm sở Xúc trong các tâm thức.",
            "body": [
                "NĀMARŪPAPACCAYĀ SALĀYATANAṀ — Danh sắc duyên Lục nhập. Danh duyên: 5 nhập đầu tiên chính là 5 sắc Thần kinh — Nhãn nhập (Cakkhāyatana: mắt hay thần kinh Nhãn, giác quan nhìn cảnh sắc), Nhĩ nhập (Sotāyatana), Tỷ nhập (Ghānāyatana), Thiệt nhập (Jivhāyatana), Thân nhập (Kāyāyatana).",
                "Ý nhập (Mānāyatana) bao gồm 32 tâm Quả hiệp thế: 15 tâm Quả Vô nhân + 8 tâm Đại Quả Dục giới Hữu nhân + 5 tâm Quả Sắc giới + 4 tâm Quả Vô sắc giới. Đối với cõi Vô sắc, Danh làm duyên — Ý xứ.",
                "SALĀYATANAPACCAYĀ PHASSO — Lục nhập duyên Xúc. Do 6 nội nhập tiếp xúc với 6 ngoại xứ duyên cho Xúc. Xúc do 6 nội-ngoại xúc tạo, có 6: Nhãn xúc chính là tâm sở Xúc đồng sanh trong cặp Nhãn thức; Nhĩ xúc, Tỷ xúc, Thiệt xúc, Thân xúc cũng vậy; Ý xúc là tâm sở Xúc đồng sanh trong 22 tâm Quả hiệp thế (trừ cặp Ngũ song thức).",
                "Xúc tùy cõi: Phạm thiên Vô sắc chỉ có Ý xúc; Phạm thiên Sắc giới hữu tưởng có Nhãn xúc, Nhĩ xúc và Ý xúc; Phạm thiên Vô tưởng không có Xúc; chúng sanh cõi Dục giới có đủ 6 (tùy lúc).",
            ],
            "keyTerms": [
                {"id": "TERM_Y_NHAP_M17", "term": "Ý nhập", "pali": "Mānāyatana", "meaning": "32 tâm Quả hiệp thế (15+8+5+4)"},
                {"id": "TERM_LUC_XUC_M17", "term": "6 Xúc", "pali": "Phassa", "meaning": "Tâm sở Xúc đồng sanh trong các tâm thức tương ứng"},
            ],
            "sourceRefs": [
                ref(TYD, 15, "IV/ DANH SẮC DUYÊN LỤC NHẬP: 5 nhập là 5 sắc thần kinh; Ý nhập 32 tâm quả hiệp thế"),
                ref(TYD, 16, "V/ LỤC NHẬP DUYÊN XÚC: 6 xúc; tùy cõi — vô tưởng không có Xúc"),
            ],
        },
        {
            "id": "M17_S03",
            "title": "Chi 6–7: Xúc duyên Thọ; Thọ duyên Ái",
            "summary": "Thọ sanh do 6 Xúc trong 32 tâm Quả hiệp thế; Ái là tâm sở Tham, duyên theo cả 3 thọ Khổ, Lạc, Xả.",
            "body": [
                "PHASSAPACCAYĀ VEDANĀ — Xúc duyên Thọ. Do duyên 6 Xúc (Nhãn, Nhĩ, Tỷ, Thiệt, Thân, Ý) — tức tâm sở Xúc hợp trong 32 tâm Quả hiệp thế — duyên cho 6 Thọ sanh.",
                "Ngũ song thức: 4 cặp đầu (Nhãn, Nhĩ, Tỷ, Thiệt) chỉ là Thọ xả; Thân thọ có 2: Khổ và Lạc. Ý thọ có 2: Hỷ và Xả — thuộc 22 tâm Quả hiệp thế (2 tâm quả bất thiện, 3 tâm quả thiện [vô nhân], 8 tâm quả Dục giới tịnh hảo, 9 tâm quả Đáo đại).",
                "6 Thọ có mặt trong các cõi: cõi Vô sắc có 1 (Ý thọ); cõi Sắc giới hữu tưởng có 3 (Nhãn, Nhĩ, Ý thọ); cõi Vô tưởng không có Thọ (vì không có Xúc); cõi Dục giới có đủ 6 thọ; cõi Địa ngục, Ngạ quỷ, Atula có đủ 6 thọ.",
                "VEDANĀPACCAYĀ TAṆHĀ — Thọ duyên Ái. Thọ duyên Ái lấy cả 3 Thọ: Khổ, Lạc và Xả. Ái là tâm sở Tham (Lobha); các tên gọi cùng họ: Ái (Taṇhā), Dục (Kāma), ô nhiễm (Rāga).",
                "Khổ duyên Ái là do khao khát được thoát Khổ; Lạc duyên Ái và Xả duyên Ái là do ham muốn được tiếp tục hưởng. Tâm sở Thọ đồng sanh trong 32 tâm Quả hiệp thế trợ duyên cho Ái sanh.",
            ],
            "keyTerms": [
                {"id": "TERM_Y_THO_M17", "term": "Ý thọ", "pali": "Manovedanā", "meaning": "Hỷ và Xả — trong 22 tâm quả hiệp thế"},
                {"id": "TERM_THO_DUYEN_AI_M17", "term": "Thọ duyên Ái", "pali": "Vedanāpaccayā taṇhā", "meaning": "Cả 3 thọ khổ–lạc–xả đều làm duyên cho Ái (tâm sở Tham)"},
            ],
            "sourceRefs": [
                ref(TYD, 17, "VI/ XÚC DUYÊN THỌ: ngũ song thức 4 cặp xả, thân thọ khổ–lạc; ý thọ hỷ–xả; 6 thọ theo các cõi"),
                ref(TYD, 18, "VII/ THỌ DUYÊN ÁI: lấy cả 3 thọ; Ái là tâm sở tham; 32 tâm quả hiệp thế tính theo duyên"),
                ref(TYD, 19, "Thọ duyên Ái (tiếp): lấy cảnh — 6 cảnh"),
            ],
        },
        {
            "id": "M17_S04",
            "title": "Chi 8–9: Ái duyên Thủ; Thủ duyên Hữu",
            "summary": "Thủ có 6 theo trần, 4 theo chi pháp; Hữu gồm Nghiệp hữu (thân, khẩu, ý nghiệp) và Sanh hữu (3 hữu, 9 nhóm).",
            "body": [
                "TAṆHĀPACCAYĀ UPĀDĀNAṀ — Ái duyên Thủ. Thủ có 6 theo trần cảnh: Sắc thủ, Thinh thủ, Khí thủ, Vị thủ, Xúc thủ, Pháp thủ.",
                "Thủ phân theo Chi pháp có 4 loại: 1/ Dục thủ (Kāmupādāna) — bám thủ, đeo níu vào các trần cảnh với tràn đầy ái nhiễm phát sanh từ Ái; Dục thủ chính là tâm sở Tham. 2/ Tà kiến thủ (Diṭṭhupādāna) — bám thủ vào các kiến chấp sai lầm (thế giới thường còn vĩnh cửu, bản ngã trường tồn, không nhân không quả); Tà kiến thủ là tâm sở Tà kiến. 3/ Giới cấm thủ (Sīlabbatupādāna) — chấp rằng do tuân thủ các cách tu tập tà lệch, lễ lạc, cúng tế… mà tâm được trong sạch hóa. 4/ Ngã luận thủ (Attavādupādāna) — chấp ngã.",
                "UPĀDĀNAPACCAYĀ BHAVO — Thủ duyên Hữu. Hữu là cái gì trở thành, cái có, hiện hữu, sẽ có, sẽ trở thành. Hữu có 2 loại: Nghiệp hữu (Kammabhava) và Sanh hữu (Upapattibhava).",
                "Nghiệp hữu có 3: Thân nghiệp (cố tạo tác bằng thân hành), Khẩu nghiệp (bằng khẩu hành), Ý nghiệp (tư duy tạo tác ý nghĩ thiện hoặc bất thiện thuộc hiệp thế). Chi pháp: tâm sở Tư + 12 tâm Bất thiện + 8 tâm Thiện Dục giới Tịnh hảo; riêng ý nghiệp cộng thêm 9 tâm Thiện Đáo đại.",
                "Sanh hữu chia 3 nhóm: theo hữu — Dục hữu (11 cõi Dục giới đủ 5 uẩn: 4 cõi khổ + 1 cõi người + 6 cõi trời Dục giới), Sắc hữu, Vô sắc hữu; theo tưởng — Hữu tưởng hữu (29 cõi), Vô tưởng hữu (1 cõi Vô tưởng), Phi tưởng phi phi tưởng hữu (1 cõi); theo uẩn — Nhất uẩn hữu (cõi Vô tưởng, chỉ Sắc uẩn), Tứ uẩn hữu (4 cõi Vô sắc, chỉ Danh uẩn), Ngũ uẩn hữu (11 Dục giới + 15 Sắc giới trừ Vô tưởng).",
                "Dục hữu phát sanh do từ Dục; Hữu nào phát sanh do Ly Dục nhưng Ái Sắc là Sắc Hữu; Hữu nào phát sanh do Ly Sắc, Ái Vô sắc là Vô sắc Hữu. 3 Hữu × Tứ Thủ = 12 Hữu tương ứng.",
                "Ghi chú quan trọng: KHÔNG CÓ NGHIỆP HỮU THỜI KHÔNG CÓ SANH HỮU.",
            ],
            "keyTerms": [
                {"id": "TERM_TU_THU_M17", "term": "Tứ Thủ", "pali": "Upādāna (4)", "meaning": "Dục thủ, Tà kiến thủ, Giới cấm thủ, Ngã luận thủ"},
                {"id": "TERM_NGHIEP_HUU_M17", "term": "Nghiệp hữu", "pali": "Kammabhava", "meaning": "Thân, khẩu, ý nghiệp — Tư + 12 bất thiện + 8 đại thiện (+9 đáo đại cho ý nghiệp)"},
                {"id": "TERM_SANH_HUU_M17", "term": "Sanh hữu", "pali": "Upapattibhava", "meaning": "3 nhóm: theo hữu (Dục/Sắc/Vô sắc), theo tưởng, theo uẩn (1/4/5 uẩn)"},
            ],
            "sourceRefs": [
                ref(TYD, 20, "VIII/ ÁI DUYÊN THỦ: thủ 6 trần; 4 loại thủ — Dục, Tà kiến, Giới cấm (Sīla + Vata), Ngã luận"),
                ref(TYD, 21, "IX/ THỦ DUYÊN HỮU: Nghiệp hữu 3 nghiệp và chi pháp tâm sở Tư + 12 + 8"),
                ref(TYD, 22, "Sanh hữu: hữu tưởng hữu 29 cõi, vô tưởng hữu, phi tưởng phi phi tưởng hữu; nhất/tứ/ngũ uẩn hữu"),
                ref(TYD, 23, "Dục hữu – Sắc hữu – Vô sắc hữu; 3 Hữu × Tứ Thủ = 12 Hữu; không Nghiệp hữu thời không Sanh hữu"),
            ],
        },
        {
            "id": "M17_S05",
            "title": "Chi 10–12: Hữu duyên Sinh; Sinh duyên Lão Tử",
            "summary": "Hữu duyên Sinh chỉ lấy Nghiệp hữu (29 tâm); 4 cách sinh, 3 uẩn sinh; Sầu – Bi – Khổ – Ưu – Não là hậu quả tất yếu.",
            "body": [
                "BHAVAPACCAYĀ JĀTI — Hữu duyên Sinh. Hữu duyên Sinh chỉ lấy phần NGHIỆP HỮU, không thể là Sanh hữu.",
                "Nghiệp hữu gồm: 12 tâm Bất thiện + 8 tâm Đại thiện Dục giới + 5 tâm Thiện Sắc giới + 4 tâm Thiện Vô sắc giới = 29 tâm. Mọi sự khác biệt về giai cấp, dòng tộc, trú xứ, loại sanh thú khi sanh chính do các nghiệp này.",
                "Sinh (Jāti) là có sự phát sanh, sự hiện hữu của các Uẩn — hiện hữu của 2 thành phần Danh và Sắc; có sự phát sanh của các Sắc do nghiệp (Sắc nghiệp sanh: sắc Thần kinh Thân, sắc Tính, sắc Ý).",
                "Cách sinh có 4: Noãn sinh (Aṇḍajajāti), Thai sinh (Jalābujajāti), Thấp sinh (Saṃsedajajāti), Hóa sinh (Opapātikajāti). Uẩn sinh có 3: Ngũ uẩn sinh (26 cõi: 11 Dục giới + 15 Sắc giới trừ Vô tưởng), Tứ uẩn sinh (4 cõi Vô sắc), Nhất uẩn sinh (cõi Vô tưởng).",
                "JĀTIPACCAYĀ JARĀMARAṆAṀ — Sinh duyên Lão Tử. Lão là khi có sự lão hóa, già nua, cũ nát. Sắc thân lão (Rūpakāyajarā) là 49 sát na trụ của Sắc pháp — giai đoạn đình trệ phi sinh diệt; Danh thân lão (Nāmakāyajarā) là sát na trụ của Tâm (mỗi sát na tâm có 3 sát na tiểu: Sanh, Trụ, Diệt). Tử là sự tan rã sau khi sống.",
                "Sầu (Soka) là sự âu sầu do mất mát mọi thứ: bà con thân thuộc, của cải, danh vọng, sự nghiệp, sức khỏe, giới đức. Bi (Parideva) là sự thống khổ, khóc than phát xuất từ âu sầu — Bi là âm vang của Sầu. Khổ (Dukkha) là khổ thân, khổ thọ về thân như bệnh. Ưu (Domanassa) là đau nơi Tâm, cảm thọ Ưu của tâm. Não (Upāyāsa) là tình trạng não nề do chịu đựng quá nặng về tinh thần khi mất mát người thân — Não nặng hơn Ưu về tâm trạng.",
                "SẦU – BI – KHỔ – ƯU – NÃO là những hậu quả tất yếu của Sanh; và Lão Tử duyên Vô Minh — vòng xoay khép kín của luân hồi.",
            ],
            "keyTerms": [
                {"id": "TERM_29_TAM_M17", "term": "Nghiệp hữu 29 tâm", "pali": "Kammabhava", "meaning": "12 bất thiện + 8 đại thiện + 5 sắc giới + 4 vô sắc giới"},
                {"id": "TERM_BON_CACH_SINH_M17", "term": "4 cách sinh", "pali": "Jāti (4)", "meaning": "Noãn sinh, Thai sinh, Thấp sinh, Hóa sinh"},
                {"id": "TERM_SAUU_BI_KHO_UU_NAO_M17", "term": "Sầu – Bi – Khổ – Ưu – Não", "pali": "Soka, Parideva, Dukkha, Domanassa, Upāyāsa", "meaning": "Hậu quả tất yếu của Sanh"},
            ],
            "sourceRefs": [
                ref(TYD, 24, "X/ HỮU DUYÊN SINH: chỉ lấy Nghiệp hữu; 29 tâm; sắc nghiệp sanh 3 nhóm"),
                ref(TYD, 25, "4 cách sinh; 3 uẩn sinh (ngũ 26 cõi, tứ 4 cõi, nhất cõi vô tưởng); XI/ SINH DUYÊN LÃO TỬ: sắc thân lão 49 sát na trụ"),
                ref(TYD, 26, "Sầu – Bi – Khổ – Ưu – Não; XII/ Lão tử duyên Vô minh"),
            ],
        },
        {
            "id": "M17_S06",
            "title": "Ba thời và 20 hành tướng — tổng kết vòng duyên khởi",
            "summary": "Quá khứ 2 nhân, hiện tại 8 chi (5 quả + 3 nhân), vị lai 2 quả — 5 nhân quá khứ + 5 quả hiện tại + 5 nhân hiện tại + 5 quả vị lai.",
            "body": [
                "Ba thời (Addhā): Thời Quá khứ gồm Vô minh – Hành; Thời Hiện tại gồm Thức – Danh sắc – Lục nhập – Xúc – Thọ – Ái – Thủ – Hữu (8 chi); Thời Vị lai gồm Sinh – Lão Tử.",
                "12 chi (Aṅga): Vô minh → Hành → Thức → Danh sắc → Lục nhập → Xúc → Thọ → Ái → Thủ → Hữu → Sinh → Lão Tử.",
                "20 hành tướng (Visākāra): 5 nhân hành tướng Quá khứ — Vô minh + Hành, gom thâu chung với 3 chi Ái + Thủ + Hữu; 5 quả hành tướng Hiện tại — Thức, Danh sắc, Lục nhập, Xúc, Thọ; 5 nhân hành tướng Hiện tại — Ái + Thủ + Hữu, Vô minh + Hành; 5 quả hành tướng Tương lai — Thức, Danh sắc, Lục nhập, Xúc, Thọ.",
                "Như vậy 20 hành tướng = 5 nhân quá khứ + 5 quả hiện tại + 5 nhân hiện tại + 5 quả vị lai — hai vòng nhân quả nối tiếp nhau qua ba thời.",
            ],
            "keyTerms": [
                {"id": "TERM_BA_THOI_M17", "term": "Ba thời", "pali": "Addhā", "meaning": "Quá khứ (2 nhân) – Hiện tại (8 chi) – Vị lai (2 quả)"},
                {"id": "TERM_20_HANH_TUONG_M17", "term": "20 hành tướng", "pali": "Visākāra", "meaning": "5 nhân quá khứ + 5 quả hiện tại + 5 nhân hiện tại + 5 quả vị lai"},
            ],
            "sourceRefs": [
                ref(TYD, 27, "3 THỜI – ADDHĀ: quá khứ – hiện tại – vị lai; 20 HÀNH TƯỚNG – VISATĀKĀRA: 5+5+5+5"),
                ref(TYD, 5, "1. Tesamevaca mūlānaṁ nirodhena… — tiêu biểu cho vòng duyên khởi diệt"),
            ],
        },
    ],
    "reviewCards": [
        {"id": "M17_R01", "front": "Thức duyên Danh – Sắc: tùy cõi, Thức duyên thế nào?", "back": "Vô sắc: duyên Danh; Vô tưởng: duyên Sắc; Sắc giới và Dục giới: duyên đủ cả 2 Danh và Sắc.", "sourceRefs": [ref(TYD, 12)]},
        {"id": "M17_R02", "front": "Sắc nghiệp tục sinh có bao nhiêu nhóm và bao nhiêu sắc?", "back": "3 nhóm (sắc Thần kinh, sắc Tính, sắc Ý vật) — tổng 30 sắc, hiện khởi ngay sát na sinh của Tâm tục sinh.", "sourceRefs": [ref(TYD, 14)]},
        {"id": "M17_R03", "front": "Ý nhập (Mānāyatana) gồm những tâm nào?", "back": "32 tâm Quả hiệp thế: 15 Quả vô nhân + 8 Đại quả Dục giới + 5 Quả Sắc giới + 4 Quả Vô sắc giới.", "sourceRefs": [ref(TYD, 15)]},
        {"id": "M17_R04", "front": "Cõi Vô tưởng có Xúc không? Vì sao?", "back": "Không có Xúc (và không có Thọ) — cõi này chỉ có Sắc uẩn.", "sourceRefs": [ref(TYD, 16), ref(TYD, 17)]},
        {"id": "M17_R05", "front": "Thân thọ có mấy loại? Ý thọ có mấy loại?", "back": "Thân thọ 2 (Khổ, Lạc); Ý thọ 2 (Hỷ, Xả); 4 cặp ngũ song thức đầu chỉ thọ Xả.", "sourceRefs": [ref(TYD, 17)]},
        {"id": "M17_R06", "front": "Ái là tâm sở nào? Thọ duyên Ái lấy những thọ nào?", "back": "Ái là tâm sở Tham (Lobha); lấy cả 3 thọ Khổ, Lạc, Xả.", "sourceRefs": [ref(TYD, 18)]},
        {"id": "M17_R07", "front": "Tứ Thủ là gì?", "back": "Dục thủ (tâm sở Tham), Tà kiến thủ (tâm sở Tà kiến), Giới cấm thủ, Ngã luận thủ.", "sourceRefs": [ref(TYD, 20)]},
        {"id": "M17_R08", "front": "Nghiệp hữu là gì? Chi pháp gồm những tâm nào?", "back": "Sự tạo tác: thân, khẩu, ý nghiệp — Tư + 12 tâm bất thiện + 8 tâm đại thiện (+9 tâm thiện đáo đại cho ý nghiệp).", "sourceRefs": [ref(TYD, 21)]},
        {"id": "M17_R09", "front": "Hữu duyên Sinh lấy loại Hữu nào?", "back": "Chỉ lấy Nghiệp hữu (29 tâm) — không thể là Sanh hữu.", "sourceRefs": [ref(TYD, 24)]},
        {"id": "M17_R10", "front": "4 cách sinh và 3 uẩn sinh?", "back": "Noãn, Thai, Thấp, Hóa sinh. Uẩn sinh: Ngũ uẩn (26 cõi), Tứ uẩn (4 vô sắc), Nhất uẩn (Vô tưởng).", "sourceRefs": [ref(TYD, 25)]},
        {"id": "M17_R11", "front": "Sắc thân lão và Danh thân lão khác nhau thế nào?", "back": "Sắc thân lão = 49 sát na trụ của sắc pháp; Danh thân lão = sát na trụ của tâm (mỗi sát na có sanh–trụ–diệt).", "sourceRefs": [ref(TYD, 25)]},
        {"id": "M17_R12", "front": "20 hành tướng gồm những gì?", "back": "5 nhân quá khứ + 5 quả hiện tại + 5 nhân hiện tại + 5 quả vị lai.", "sourceRefs": [ref(TYD, 27)]},
    ],
    "quizSeeds": [
        {"id": "M17_Q01", "type": "mcq", "question": "Ở cõi Vô tưởng, Thức duyên cho phần nào?", "correctAnswer": "Chỉ duyên cho Sắc", "distractors": ["Chỉ duyên cho Danh", "Duyên cả Danh và Sắc", "Không duyên cho gì cả"], "explanation": "Vô tưởng chỉ có Sắc uẩn; Vô sắc chỉ có Danh; Dục – Sắc giới có cả hai.", "sourceRefs": [ref(TYD, 12)]},
        {"id": "M17_Q02", "type": "mcq", "question": "Ý nhập gồm bao nhiêu tâm Quả hiệp thế?", "correctAnswer": "32 tâm", "distractors": ["22 tâm", "17 tâm", "29 tâm"], "explanation": "15 vô nhân + 8 đại quả dục giới + 5 sắc giới + 4 vô sắc = 32.", "sourceRefs": [ref(TYD, 15)]},
        {"id": "M17_Q03", "type": "mcq", "question": "Ý xúc là tâm sở Xúc đồng sanh trong bao nhiêu tâm Quả hiệp thế?", "correctAnswer": "22 tâm (trừ cặp Ngũ song thức)", "distractors": ["32 tâm (tất cả)", "10 tâm (chỉ ngũ song thức)", "12 tâm"], "explanation": "Ý xúc = tâm sở Xúc trong 22 tâm quả hiệp thế, trừ 10 tâm ngũ song thức.", "sourceRefs": [ref(TYD, 16)]},
        {"id": "M17_Q04", "type": "mcq", "question": "Thân thọ gồm những thọ nào?", "correctAnswer": "Khổ và Lạc", "distractors": ["Hỷ và Xả", "Khổ, Lạc, Xả", "Chỉ có Xả"], "explanation": "Thân thức có 2 thọ; 4 cặp thức đầu (nhãn, nhĩ, tỷ, thiệt) chỉ thọ Xả.", "sourceRefs": [ref(TYD, 17)]},
        {"id": "M17_Q05", "type": "mcq", "question": "Dục thủ chính là tâm sở nào?", "correctAnswer": "Tham (Lobha)", "distractors": ["Tà kiến (Diṭṭhi)", "Tư (Cetanā)", "Ái (Taṇhā) — riêng biệt với Tham"], "explanation": "Dục thủ là tâm sở Tham; Tà kiến thủ là tâm sở Tà kiến.", "sourceRefs": [ref(TYD, 20)]},
        {"id": "M17_Q06", "type": "mcq", "question": "Giới cấm thủ (Sīlabbatupādāna) là gì?", "correctAnswer": "Chấp rằng tuân thủ các cách tu tà lệch, lễ lạc, cúng tế sẽ làm tâm trong sạch hóa", "distractors": ["Bám thủ trần cảnh với ái nhiễm", "Chấp thế giới thường còn", "Chấp ngã trường tồn"], "explanation": "Sīla + Vata: giữ giới cấm nỗ lực tròn đầy — nhưng chấp sai cách tu.", "sourceRefs": [ref(TYD, 20)]},
        {"id": "M17_Q07", "type": "mcq", "question": "Hữu có 2 loại nào?", "correctAnswer": "Nghiệp hữu và Sanh hữu", "distractors": ["Dục hữu và Sắc hữu", "Thân hữu và Tâm hữu", "Quá khứ hữu và vị lai hữu"], "explanation": "Kammabhava (tạo tác) và Upapattibhava (tái sanh).", "sourceRefs": [ref(TYD, 21)]},
        {"id": "M17_Q08", "type": "mcq", "question": "Nghiệp hữu gồm bao nhiêu tâm?", "correctAnswer": "29 tâm", "distractors": ["12 tâm", "20 tâm", "40 tâm"], "explanation": "12 bất thiện + 8 đại thiện dục giới + 5 thiện sắc giới + 4 thiện vô sắc giới.", "sourceRefs": [ref(TYD, 24)]},
        {"id": "M17_Q09", "type": "mcq", "question": "Tứ uẩn hữu (Catuvokārabhava) là chúng sanh cõi nào?", "correctAnswer": "4 cõi Vô sắc", "distractors": ["Cõi Vô tưởng", "11 cõi Dục giới", "Cõi Quảng Quả"], "explanation": "Chỉ có Thọ, Tưởng, Hành, Thức — không Sắc uẩn.", "sourceRefs": [ref(TYD, 22)]},
        {"id": "M17_Q10", "type": "mcq", "question": "Không có cái gì thì không có Sanh hữu?", "correctAnswer": "Nghiệp hữu", "distractors": ["Dục thủ", "Ái", "Thọ"], "explanation": "KHÔNG CÓ NGHIỆP HỮU THỜI KHÔNG CÓ SANH HỮU.", "sourceRefs": [ref(TYD, 23)]},
        {"id": "M17_Q11", "type": "mcq", "question": "Bi (Parideva) là gì?", "correctAnswer": "Sự thống khổ, khóc than — âm vang của Sầu", "distractors": ["Sự âu sầu trong tâm", "Khổ thân, khổ thọ về thân", "Não nề do chịu đựng quá nặng"], "explanation": "Sầu là âu sầu; Bi phát xuất từ Sầu; Khổ là khổ thân; Ưu đau nơi tâm; Não nặng hơn Ưu.", "sourceRefs": [ref(TYD, 26)]},
        {"id": "M17_Q12", "type": "mcq", "question": "Thời Hiện tại trong 3 thời gồm những chi nào?", "correctAnswer": "Thức → Hữu (8 chi)", "distractors": ["Vô minh, Hành", "Sinh, Lão Tử", "Ái, Thủ, Hữu"], "explanation": "Quá khứ: Vô minh + Hành; Hiện tại: Thức, Danh sắc, Lục nhập, Xúc, Thọ, Ái, Thủ, Hữu; Vị lai: Sinh, Lão Tử.", "sourceRefs": [ref(TYD, 27)]},
    ],
}
