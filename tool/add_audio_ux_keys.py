#!/usr/bin/env python3
"""VDP 0.10.3 l10n surgery — chuỗi của góp ý "Audio (tab Tương Ưng)".

Bốn góp ý người dùng (doc/audio_ux_0.10.3.md) cần 11 khoá mới:

  • Chế độ nghe (0.10.3 §2 — "nghe 1 mục hay tịnh tiến"):
      playModeTitle, playModeOnce, playModeSequence,
      playModeOnceHint, playModeRepeatOneHint, playModeSequenceHint,
      playModeRepeatAllHint
  • Thanh nghe nổi mở rộng cấp 2 (§2):
      audioBubbleExpand, audioBubbleCollapse
  • Cây học tập (§3):
      studyTreeExpandAll, studyTreeCollapseAll

Script làm hai việc, theo đúng quy ước đã dùng ở `add_matrix_listen_keys.py`:

1. Thêm 11 khoá (kèm @-metadata) vào **cả 26** file `lib/l10n/app_*.arb`, ở
   CUỐI file — đúng vị trí chúng xuất hiện trong template `app_en.arb`, để thứ
   tự khoá trong file generated khớp thứ tự ARB (quy ước của `flutter gen-l10n`
   cho repo này: generated giữ nguyên thứ tự template).

2. Cập nhật thẳng các file generated `lib/l10n/app_localizations*.dart` (sandbox
   không có Flutter SDK nên không chạy được `flutter gen-l10n`): thêm khai báo
   vào lớp cơ sở `AppLocalizations` (kèm doc-comment đúng khuôn gen-l10n) và
   `@override` vào từng lớp locale — kể cả 2 lớp `zh`/`zh_TW` nằm chung file.

Bản dịch: 24 locale có bản dịch thật (theo đúng văn phong/thuật ngữ đã dùng
cho repeatOne/repeatAll/listeningQueue trong từng ARB); `bo` và `lo` dùng
tiếng Anh — cùng tiền lệ với `add_matrix_listen_keys.py` (2 locale này vốn đã
để tiếng Anh cho các khoá chưa dịch).

Chạy:  python3 tool/add_audio_ux_keys.py
Kiểm:  python3 tool/check_localizations.py
"""

from __future__ import annotations

import json
import re
from collections import OrderedDict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
L10N = ROOT / "lib" / "l10n"

KEY_ORDER = [
    "playModeTitle",
    "playModeOnce",
    "playModeSequence",
    "playModeOnceHint",
    "playModeRepeatOneHint",
    "playModeSequenceHint",
    "playModeRepeatAllHint",
    "audioBubbleExpand",
    "audioBubbleCollapse",
    "studyTreeExpandAll",
    "studyTreeCollapseAll",
]

_EN = {
    "playModeTitle": "Play mode",
    "playModeOnce": "This item only",
    "playModeSequence": "Play through",
    "playModeOnceHint": "Stops when the current item finishes",
    "playModeRepeatOneHint": "Keeps repeating the current item",
    "playModeSequenceHint":
        "Continues to the next items, stops at the end of the list",
    "playModeRepeatAllHint":
        "Continues and loops back to the start at the end",
    "audioBubbleExpand": "Expand player",
    "audioBubbleCollapse": "Collapse player",
    "studyTreeExpandAll": "Expand all",
    "studyTreeCollapseAll": "Collapse all",
}

NEW: dict[str, dict[str, str]] = {
    "vi": {
        "playModeTitle": "Chế độ nghe",
        "playModeOnce": "Chỉ mục này",
        "playModeSequence": "Tịnh tiến",
        "playModeOnceHint": "Đọc xong mục đang chọn thì dừng",
        "playModeRepeatOneHint": "Đọc lặp lại mục đang chọn",
        "playModeSequenceHint": "Đọc tiếp các mục sau, hết danh sách thì dừng",
        "playModeRepeatAllHint":
            "Đọc tiếp và quay vòng về đầu khi hết danh sách",
        "audioBubbleExpand": "Mở rộng thanh nghe",
        "audioBubbleCollapse": "Thu gọn thanh nghe",
        "studyTreeExpandAll": "Mở rộng toàn bộ",
        "studyTreeCollapseAll": "Thu gọn toàn bộ",
    },
    "en": dict(_EN),
    "zh": {
        "playModeTitle": "播放模式",
        "playModeOnce": "仅此项",
        "playModeSequence": "连续播放",
        "playModeOnceHint": "当前项读完后停止",
        "playModeRepeatOneHint": "反复朗读当前项",
        "playModeSequenceHint": "继续播放后面的项目，到列表末尾停止",
        "playModeRepeatAllHint": "继续播放，到最后回到开头循环",
        "audioBubbleExpand": "展开播放栏",
        "audioBubbleCollapse": "收起播放栏",
        "studyTreeExpandAll": "全部展开",
        "studyTreeCollapseAll": "全部收起",
    },
    "zh_TW": {
        "playModeTitle": "播放模式",
        "playModeOnce": "僅此項",
        "playModeSequence": "連續播放",
        "playModeOnceHint": "目前項目讀完後停止",
        "playModeRepeatOneHint": "反覆朗讀目前項目",
        "playModeSequenceHint": "繼續播放後面的項目，到清單末尾停止",
        "playModeRepeatAllHint": "繼續播放，到最後回到開頭循環",
        "audioBubbleExpand": "展開播放欄",
        "audioBubbleCollapse": "收合播放欄",
        "studyTreeExpandAll": "全部展開",
        "studyTreeCollapseAll": "全部收合",
    },
    "hi": {
        "playModeTitle": "सुनने का मोड",
        "playModeOnce": "केवल यही मद",
        "playModeSequence": "क्रम से सुनें",
        "playModeOnceHint": "वर्तमान मद पूरी होने पर रुक जाएगा",
        "playModeRepeatOneHint": "वर्तमान मद को बार-बार दोहराएगा",
        "playModeSequenceHint":
            "अगली मदों को सुनता रहेगा, सूची के अंत में रुकेगा",
        "playModeRepeatAllHint": "सुनता रहेगा और अंत में शुरू से दोहराएगा",
        "audioBubbleExpand": "प्लेयर फैलाएं",
        "audioBubbleCollapse": "प्लेयर समेटें",
        "studyTreeExpandAll": "सभी फैलाएं",
        "studyTreeCollapseAll": "सभी समेटें",
    },
    "my": {
        "playModeTitle": "နားထောင်မှု မုဒ်",
        "playModeOnce": "ဤအရာသာ",
        "playModeSequence": "ဆက်တိုက် ဖွင့်ရန်",
        "playModeOnceHint": "လက်ရှိအရာ ပြီးဆုံးလျှင် ရပ်မည်",
        "playModeRepeatOneHint": "လက်ရှိအရာကို ထပ်ခါတလဲလဲ ဖွင့်မည်",
        "playModeSequenceHint":
            "နောက်အရာများကို ဆက်ဖွင့်မည်၊ စာရင်းဆုံးလျှင် ရပ်မည်",
        "playModeRepeatAllHint":
            "ဆက်ဖွင့်ပြီး စာရင်းဆုံးလျှင် အစသို့ ပြန်လည်ပတ်မည်",
        "audioBubbleExpand": "ဖွင့်စက် ချဲ့ရန်",
        "audioBubbleCollapse": "ဖွင့်စက် ခေါက်သိမ်းရန်",
        "studyTreeExpandAll": "အားလုံး ချဲ့ရန်",
        "studyTreeCollapseAll": "အားလုံး ခေါက်သိမ်းရန်",
    },
    "si": {
        "playModeTitle": "ඇසීමේ ප්‍රකාරය",
        "playModeOnce": "මෙම අයිතමය පමණි",
        "playModeSequence": "අනුපිළිවෙලින් අසන්න",
        "playModeOnceHint": "වත්මන් අයිතමය අවසන් වූ පසු නවතී",
        "playModeRepeatOneHint": "වත්මන් අයිතමය නැවත නැවත අසයි",
        "playModeSequenceHint":
            "ඊළඟ අයිතම දිගටම අසයි, ලැයිස්තුව අවසානයේ නවතී",
        "playModeRepeatAllHint": "දිගටම අසා අවසානයේ මුලට නැවත යයි",
        "audioBubbleExpand": "වාදකය විහිදන්න",
        "audioBubbleCollapse": "වාදකය හකුළන්න",
        "studyTreeExpandAll": "සියල්ල විහිදන්න",
        "studyTreeCollapseAll": "සියල්ල හකුළන්න",
    },
    "th": {
        "playModeTitle": "โหมดการฟัง",
        "playModeOnce": "เฉพาะรายการนี้",
        "playModeSequence": "ฟังต่อเนื่อง",
        "playModeOnceHint": "หยุดเมื่ออ่านรายการปัจจุบันจบ",
        "playModeRepeatOneHint": "อ่านซ้ำรายการปัจจุบันไปเรื่อย ๆ",
        "playModeSequenceHint": "อ่านรายการถัดไปต่อเนื่อง หยุดเมื่อจบรายการ",
        "playModeRepeatAllHint":
            "อ่านต่อเนื่องและวนกลับไปเริ่มใหม่เมื่อจบรายการ",
        "audioBubbleExpand": "ขยายแถบเสียง",
        "audioBubbleCollapse": "ย่อแถบเสียง",
        "studyTreeExpandAll": "ขยายทั้งหมด",
        "studyTreeCollapseAll": "ย่อทั้งหมด",
    },
    "ja": {
        "playModeTitle": "再生モード",
        "playModeOnce": "この項目のみ",
        "playModeSequence": "連続再生",
        "playModeOnceHint": "現在の項目を読み終えたら停止",
        "playModeRepeatOneHint": "現在の項目を繰り返し再生",
        "playModeSequenceHint": "次の項目へ続けて再生し、リストの最後で停止",
        "playModeRepeatAllHint": "続けて再生し、最後まで行ったら先頭へ戻る",
        "audioBubbleExpand": "プレイヤーを展開",
        "audioBubbleCollapse": "プレイヤーを折りたたむ",
        "studyTreeExpandAll": "すべて展開",
        "studyTreeCollapseAll": "すべて折りたたむ",
    },
    "ko": {
        "playModeTitle": "재생 모드",
        "playModeOnce": "이 항목만",
        "playModeSequence": "연속 재생",
        "playModeOnceHint": "현재 항목을 다 읽으면 정지",
        "playModeRepeatOneHint": "현재 항목을 반복해서 읽음",
        "playModeSequenceHint": "다음 항목으로 계속 읽고 목록 끝에서 정지",
        "playModeRepeatAllHint": "계속 읽고 목록 끝에서 처음으로 돌아감",
        "audioBubbleExpand": "플레이어 펼치기",
        "audioBubbleCollapse": "플레이어 접기",
        "studyTreeExpandAll": "모두 펼치기",
        "studyTreeCollapseAll": "모두 접기",
    },
    "de": {
        "playModeTitle": "Wiedergabemodus",
        "playModeOnce": "Nur dieser Eintrag",
        "playModeSequence": "Fortlaufend",
        "playModeOnceHint": "Stoppt, wenn der aktuelle Eintrag zu Ende ist",
        "playModeRepeatOneHint": "Wiederholt den aktuellen Eintrag",
        "playModeSequenceHint":
            "Liest die folgenden Einträge weiter, stoppt am Listenende",
        "playModeRepeatAllHint":
            "Liest weiter und beginnt am Ende wieder von vorn",
        "audioBubbleExpand": "Player erweitern",
        "audioBubbleCollapse": "Player einklappen",
        "studyTreeExpandAll": "Alle ausklappen",
        "studyTreeCollapseAll": "Alle einklappen",
    },
    "es": {
        "playModeTitle": "Modo de reproducción",
        "playModeOnce": "Solo este elemento",
        "playModeSequence": "Reproducción continua",
        "playModeOnceHint": "Se detiene al terminar el elemento actual",
        "playModeRepeatOneHint": "Repite el elemento actual",
        "playModeSequenceHint":
            "Continúa con los siguientes elementos y se detiene al final de la lista",
        "playModeRepeatAllHint":
            "Continúa y vuelve al principio al final de la lista",
        "audioBubbleExpand": "Expandir reproductor",
        "audioBubbleCollapse": "Contraer reproductor",
        "studyTreeExpandAll": "Expandir todo",
        "studyTreeCollapseAll": "Contraer todo",
    },
    "fr": {
        "playModeTitle": "Mode d’écoute",
        "playModeOnce": "Seulement cet élément",
        "playModeSequence": "Lecture continue",
        "playModeOnceHint": "S’arrête à la fin de l’élément en cours",
        "playModeRepeatOneHint": "Répète l’élément en cours",
        "playModeSequenceHint":
            "Continue avec les éléments suivants, s’arrête à la fin de la liste",
        "playModeRepeatAllHint":
            "Continue puis revient au début à la fin de la liste",
        "audioBubbleExpand": "Développer le lecteur",
        "audioBubbleCollapse": "Réduire le lecteur",
        "studyTreeExpandAll": "Tout développer",
        "studyTreeCollapseAll": "Tout réduire",
    },
    "it": {
        "playModeTitle": "Modalità di ascolto",
        "playModeOnce": "Solo questo elemento",
        "playModeSequence": "Ascolto continuo",
        "playModeOnceHint": "Si ferma al termine dell’elemento corrente",
        "playModeRepeatOneHint": "Ripete l’elemento corrente",
        "playModeSequenceHint":
            "Prosegue con gli elementi successivi e si ferma a fine elenco",
        "playModeRepeatAllHint":
            "Prosegue e ricomincia dall’inizio a fine elenco",
        "audioBubbleExpand": "Espandi il lettore",
        "audioBubbleCollapse": "Comprimi il lettore",
        "studyTreeExpandAll": "Espandi tutto",
        "studyTreeCollapseAll": "Comprimi tutto",
    },
    "pt": {
        "playModeTitle": "Modo de reprodução",
        "playModeOnce": "Apenas este item",
        "playModeSequence": "Reprodução contínua",
        "playModeOnceHint": "Para quando o item atual terminar",
        "playModeRepeatOneHint": "Repete o item atual",
        "playModeSequenceHint":
            "Continua para os próximos itens e para no fim da lista",
        "playModeRepeatAllHint": "Continua e volta ao início no fim da lista",
        "audioBubbleExpand": "Expandir reprodutor",
        "audioBubbleCollapse": "Recolher reprodutor",
        "studyTreeExpandAll": "Expandir tudo",
        "studyTreeCollapseAll": "Recolher tudo",
    },
    "ru": {
        "playModeTitle": "Режим воспроизведения",
        "playModeOnce": "Только этот элемент",
        "playModeSequence": "Подряд",
        "playModeOnceHint":
            "Остановится, когда текущий элемент закончится",
        "playModeRepeatOneHint": "Повторяет текущий элемент",
        "playModeSequenceHint":
            "Продолжит следующие элементы и остановится в конце списка",
        "playModeRepeatAllHint":
            "Продолжит и вернётся к началу в конце списка",
        "audioBubbleExpand": "Развернуть плеер",
        "audioBubbleCollapse": "Свернуть плеер",
        "studyTreeExpandAll": "Развернуть всё",
        "studyTreeCollapseAll": "Свернуть всё",
    },
    "id": {
        "playModeTitle": "Mode mendengarkan",
        "playModeOnce": "Hanya item ini",
        "playModeSequence": "Mendengar berurutan",
        "playModeOnceHint": "Berhenti setelah item saat ini selesai",
        "playModeRepeatOneHint": "Mengulang item saat ini",
        "playModeSequenceHint":
            "Melanjutkan ke item berikutnya, berhenti di akhir daftar",
        "playModeRepeatAllHint":
            "Melanjutkan dan kembali ke awal saat daftar habis",
        "audioBubbleExpand": "Bentangkan pemutar",
        "audioBubbleCollapse": "Lipat pemutar",
        "studyTreeExpandAll": "Bentangkan semua",
        "studyTreeCollapseAll": "Lipat semua",
    },
    "ar": {
        "playModeTitle": "وضع الاستماع",
        "playModeOnce": "هذا العنصر فقط",
        "playModeSequence": "تشغيل متتابع",
        "playModeOnceHint": "يتوقف عند انتهاء العنصر الحالي",
        "playModeRepeatOneHint": "يكرر العنصر الحالي",
        "playModeSequenceHint":
            "يتابع العناصر التالية ويتوقف في نهاية القائمة",
        "playModeRepeatAllHint":
            "يتابع ثم يعود إلى البداية عند نهاية القائمة",
        "audioBubbleExpand": "توسيع المشغل",
        "audioBubbleCollapse": "طي المشغل",
        "studyTreeExpandAll": "توسيع الكل",
        "studyTreeCollapseAll": "طي الكل",
    },
    "bn": {
        "playModeTitle": "শোনার মোড",
        "playModeOnce": "শুধু এই আইটেম",
        "playModeSequence": "ক্রমাগত শোনা",
        "playModeOnceHint": "বর্তমান আইটেম শেষ হলে থেমে যাবে",
        "playModeRepeatOneHint": "বর্তমান আইটেমটি বারবার পড়বে",
        "playModeSequenceHint":
            "পরের আইটেমগুলো শুনতে থাকবে, তালিকার শেষে থামবে",
        "playModeRepeatAllHint":
            "শুনতে থাকবে এবং শেষে আবার শুরু থেকে ঘুরবে",
        "audioBubbleExpand": "প্লেয়ার প্রসারিত করুন",
        "audioBubbleCollapse": "প্লেয়ার গুটিয়ে নিন",
        "studyTreeExpandAll": "সব প্রসারিত করুন",
        "studyTreeCollapseAll": "সব গুটিয়ে নিন",
    },
    "km": {
        "playModeTitle": "របៀបស្ដាប់",
        "playModeOnce": "តែធាតុនេះ",
        "playModeSequence": "ស្ដាប់បន្តបន្ទាប់",
        "playModeOnceHint": "ឈប់នៅពេលធាតុបច្ចុប្បន្នអានចប់",
        "playModeRepeatOneHint": "អានធាតុបច្ចុប្បន្នឡើងវិញ",
        "playModeSequenceHint":
            "បន្តទៅធាតុបន្ទាប់ ហើយឈប់នៅចុងបញ្ជី",
        "playModeRepeatAllHint":
            "បន្តអាន ហើយត្រឡប់ទៅដើមវិញនៅចុងបញ្ជី",
        "audioBubbleExpand": "ពង្រីកឧបករណ៍ចាក់",
        "audioBubbleCollapse": "បង្រួមឧបករណ៍ចាក់",
        "studyTreeExpandAll": "ពង្រីកទាំងអស់",
        "studyTreeCollapseAll": "បង្រួមទាំងអស់",
    },
    "mn": {
        "playModeTitle": "Сонсох горим",
        "playModeOnce": "Зөвхөн энэ зүйл",
        "playModeSequence": "Дараалан сонсох",
        "playModeOnceHint": "Одоогийн зүйл дуусахад зогсоно",
        "playModeRepeatOneHint": "Одоогийн зүйлийг давтан уншина",
        "playModeSequenceHint":
            "Дараагийн зүйлсийг үргэлжлүүлэн уншиж, жагсаалтын төгсгөлд зогсоно",
        "playModeRepeatAllHint":
            "Үргэлжлүүлэн уншиж, төгсгөлд эхнээсээ эргэлдэнэ",
        "audioBubbleExpand": "Тоглуулагчийг дэлгэх",
        "audioBubbleCollapse": "Тоглуулагчийг хураах",
        "studyTreeExpandAll": "Бүгдийг дэлгэх",
        "studyTreeCollapseAll": "Бүгдийг хураах",
    },
    "mr": {
        "playModeTitle": "ऐकण्याचा मोड",
        "playModeOnce": "फक्त हा घटक",
        "playModeSequence": "सलग ऐका",
        "playModeOnceHint": "सध्याचा घटक संपल्यावर थांबेल",
        "playModeRepeatOneHint": "सध्याचा घटक पुन्हा पुन्हा वाचेल",
        "playModeSequenceHint":
            "पुढील घटक सुरू ठेवेल, यादी संपल्यावर थांबेल",
        "playModeRepeatAllHint":
            "सुरू ठेवेल आणि यादी संपल्यावर सुरुवातीला परतेल",
        "audioBubbleExpand": "प्लेअर विस्तृत करा",
        "audioBubbleCollapse": "प्लेअर आकुंचित करा",
        "studyTreeExpandAll": "सर्व विस्तृत करा",
        "studyTreeCollapseAll": "सर्व आकुंचित करा",
    },
    "ta": {
        "playModeTitle": "கேட்கும் பயன்முறை",
        "playModeOnce": "இந்த உருப்படி மட்டும்",
        "playModeSequence": "தொடர்ந்து இயக்கு",
        "playModeOnceHint": "தற்போதைய உருப்படி முடிந்ததும் நிற்கும்",
        "playModeRepeatOneHint":
            "தற்போதைய உருப்படியை மீண்டும் மீண்டும் வாசிக்கும்",
        "playModeSequenceHint":
            "அடுத்த உருப்படிகளைத் தொடர்ந்து வாசிக்கும், பட்டியல் முடிவில் நிற்கும்",
        "playModeRepeatAllHint":
            "தொடர்ந்து வாசித்து, முடிவில் மீண்டும் தொடக்கத்திற்குச் செல்லும்",
        "audioBubbleExpand": "பிளேயரை விரிவாக்கு",
        "audioBubbleCollapse": "பிளேயரைச் சுருக்கு",
        "studyTreeExpandAll": "அனைத்தையும் விரிவாக்கு",
        "studyTreeCollapseAll": "அனைத்தையும் சுருக்கு",
    },
    "te": {
        "playModeTitle": "వినే మోడ్",
        "playModeOnce": "ఈ అంశం మాత్రమే",
        "playModeSequence": "వరుసగా వినండి",
        "playModeOnceHint": "ప్రస్తుత అంశం పూర్తయ్యాక ఆగుతుంది",
        "playModeRepeatOneHint": "ప్రస్తుత అంశాన్ని పునరావృతం చేస్తుంది",
        "playModeSequenceHint":
            "తర్వాతి అంశాలను కొనసాగిస్తుంది, జాబితా చివరిలో ఆగుతుంది",
        "playModeRepeatAllHint":
            "కొనసాగించి, చివరిలో తిరిగి మొదటికి వెళ్తుంది",
        "audioBubbleExpand": "ప్లేయర్‌ను విస్తరించు",
        "audioBubbleCollapse": "ప్లేయర్‌ను కుదించు",
        "studyTreeExpandAll": "అన్నీ విస్తరించు",
        "studyTreeCollapseAll": "అన్నీ కుదించు",
    },
    # Tiền lệ của add_matrix_listen_keys.py: bo/lo để tiếng Anh cho khoá chưa dịch.
    "bo": dict(_EN),
    "lo": dict(_EN),
}

# file generated → [(tên lớp, locale)]
GENERATED_CLASSES: dict[str, list[tuple[str, str]]] = {
    "app_localizations_ar.dart": [("AppLocalizationsAr", "ar")],
    "app_localizations_bn.dart": [("AppLocalizationsBn", "bn")],
    "app_localizations_bo.dart": [("AppLocalizationsBo", "bo")],
    "app_localizations_de.dart": [("AppLocalizationsDe", "de")],
    "app_localizations_en.dart": [("AppLocalizationsEn", "en")],
    "app_localizations_es.dart": [("AppLocalizationsEs", "es")],
    "app_localizations_fr.dart": [("AppLocalizationsFr", "fr")],
    "app_localizations_hi.dart": [("AppLocalizationsHi", "hi")],
    "app_localizations_id.dart": [("AppLocalizationsId", "id")],
    "app_localizations_it.dart": [("AppLocalizationsIt", "it")],
    "app_localizations_ja.dart": [("AppLocalizationsJa", "ja")],
    "app_localizations_km.dart": [("AppLocalizationsKm", "km")],
    "app_localizations_ko.dart": [("AppLocalizationsKo", "ko")],
    "app_localizations_lo.dart": [("AppLocalizationsLo", "lo")],
    "app_localizations_mn.dart": [("AppLocalizationsMn", "mn")],
    "app_localizations_mr.dart": [("AppLocalizationsMr", "mr")],
    "app_localizations_my.dart": [("AppLocalizationsMy", "my")],
    "app_localizations_pt.dart": [("AppLocalizationsPt", "pt")],
    "app_localizations_ru.dart": [("AppLocalizationsRu", "ru")],
    "app_localizations_si.dart": [("AppLocalizationsSi", "si")],
    "app_localizations_ta.dart": [("AppLocalizationsTa", "ta")],
    "app_localizations_te.dart": [("AppLocalizationsTe", "te")],
    "app_localizations_th.dart": [("AppLocalizationsTh", "th")],
    "app_localizations_vi.dart": [("AppLocalizationsVi", "vi")],
    "app_localizations_zh.dart": [
        ("AppLocalizationsZh", "zh"),
        ("AppLocalizationsZhTw", "zh_TW"),
    ],
    "app_localizations.dart": [("AppLocalizations", "en")],  # lớp cơ sở
}


def dart_escape(text: str) -> str:
    return text.replace("\\", "\\\\").replace("$", r"\$").replace("'", r"\'")


def add_to_arbs() -> None:
    for locale, additions in NEW.items():
        path = L10N / f"app_{locale}.arb"
        data = json.loads(
            path.read_text(encoding="utf-8"), object_pairs_hook=OrderedDict
        )
        if KEY_ORDER[0] in data:
            print(f"[skip] {locale}: keys already present")
            continue
        # Chèn ngay sau khoá audio cuối cùng để cuối file, đúng thứ tự template.
        anchor = "@audioFloatingClose"
        assert anchor in data, locale
        rebuilt = OrderedDict()
        for key, value in data.items():
            rebuilt[key] = value
            if key == anchor:
                for new_key in KEY_ORDER:
                    rebuilt[new_key] = additions[new_key]
                    rebuilt[f"@{new_key}"] = {"description": new_key}
        assert len(rebuilt) == len(data) + 2 * len(KEY_ORDER), locale
        path.write_text(
            json.dumps(rebuilt, indent=2, ensure_ascii=False) + "\n",
            encoding="utf-8",
        )
        print(f"[add] {locale}: +{2 * len(KEY_ORDER)} entries")


def class_body_span(source: str, class_name: str) -> tuple[int, int]:
    """Trả về (vị trí dòng khai báo, vị trí dấu } đóng lớp) trong source."""
    match = re.search(
        rf"^(?:abstract\s+)?class {class_name}\b[^{{]*\{{$",
        source,
        re.MULTILINE,
    )
    if match is None:
        raise SystemExit(f"class {class_name} not found")
    start = match.start()
    closing = source.find("\n}\n", match.end())
    if closing < 0:
        raise SystemExit(f"closing brace for {class_name} not found")
    return start, closing + 1  # vị trí trước '}'


def update_generated() -> None:
    base_path = L10N / "app_localizations.dart"
    base = base_path.read_text(encoding="utf-8")
    block_lines: list[str] = []
    for key in KEY_ORDER:
        block_lines.append(f"  /// {key}")
        block_lines.append("  ///")
        block_lines.append("  /// In en, this message translates to:")
        block_lines.append(f"  /// **'{dart_escape(_EN[key])}'**")
        block_lines.append(f"  String get {key};")
        block_lines.append("")
    block = "\n".join(block_lines)
    start, closing = class_body_span(base, "AppLocalizations")
    base = base[:closing] + "\n" + block + base[closing:]
    base_path.write_text(base, encoding="utf-8")
    print("[gen] app_localizations.dart: +11 declarations")

    for filename, classes in GENERATED_CLASSES.items():
        if filename == "app_localizations.dart":
            continue
        path = L10N / filename
        source = path.read_text(encoding="utf-8")
        for class_name, locale in classes:
            additions = NEW[locale]
            lines: list[str] = []
            for key in KEY_ORDER:
                lines.append("  @override")
                lines.append(
                    f"  String get {key} => '{dart_escape(additions[key])}';"
                )
                lines.append("")
            block = "\n".join(lines)
            start, closing = class_body_span(source, class_name)
            source = source[:closing] + "\n" + block + source[closing:]
        path.write_text(source, encoding="utf-8")
        print(f"[gen] {filename}: +{11 * len(classes)} overrides")


def safety_check() -> None:
    bad: list[tuple[str, str]] = []
    for path in sorted(L10N.glob("app_*.arb")):
        data = json.loads(path.read_text(encoding="utf-8"))
        for key, value in data.items():
            if key.startswith("@") or not isinstance(value, str):
                continue
            if "'" in value.replace("''", "\x00"):
                bad.append((path.name, key))
    print("remaining ICU quote issues:", bad or "none")


def main() -> None:
    add_to_arbs()
    update_generated()
    safety_check()


if __name__ == "__main__":
    main()
