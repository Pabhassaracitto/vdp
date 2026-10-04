#!/usr/bin/env python3
"""Pre-release 0.10.2 l10n surgery (run once from repo root).

1. Fixes the two ARB strings that break `flutter pub get` (ICU unmatched
   single quotes: it/fr karaokeModeSubtitle) by switching the ASCII
   apostrophe to the typographic U+2019 — the convention already used by
   every other French string (e.g. "Liste d’écoute").
2. Adds the 4 new Matrix listening keys (matrixListenCittas,
   matrixListenCetasikas, matrixListenFromHint, matrixListenHelpBody) to
   all 26 locale ARBs, inserted after matrixHelpTips to keep key order
   aligned with the generated getters.
"""
import json
from collections import OrderedDict
from pathlib import Path

L10N = Path("lib/l10n")

# ── 1. ICU quote fix ─────────────────────────────────────────────────────────
FIXES = {
    "fr": {"karaokeModeSubtitle": "Surligner le texte lu pendant l’écoute"},
    "it": {"karaokeModeSubtitle": "Evidenzia il testo letto durante l’ascolto"},
}

# ── 2. New keys ──────────────────────────────────────────────────────────────
NEW = {
    "vi": {
        "matrixListenCittas": "Nghe toàn bộ Tâm",
        "matrixListenCetasikas": "Nghe toàn bộ Tâm Sở",
        "matrixListenFromHint": "Nhấn giữ để nghe từ mục này",
        "matrixListenHelpBody": "Nhấn giữ một hàng Tâm hoặc cột Tâm Sở để nghe từ mục đó. Nhấn biểu tượng tai nghe ở góc bảng để nghe cả danh sách.",
    },
    "en": {
        "matrixListenCittas": "Listen to all cittas",
        "matrixListenCetasikas": "Listen to all cetasikas",
        "matrixListenFromHint": "Long-press to listen from this item",
        "matrixListenHelpBody": "Long-press a citta row or a cetasika column to listen from that item. Tap the headphones icon in the table corner to listen to the whole list.",
    },
    "zh": {
        "matrixListenCittas": "收听全部心",
        "matrixListenCetasikas": "收听全部心所",
        "matrixListenFromHint": "长按可从此项开始收听",
        "matrixListenHelpBody": "长按某一行心或某一列心所可从该项开始收听。点击表格角落的耳机图标可收听整个列表。",
    },
    "zh_TW": {
        "matrixListenCittas": "收聽全部心",
        "matrixListenCetasikas": "收聽全部心所",
        "matrixListenFromHint": "長按可從此項開始收聽",
        "matrixListenHelpBody": "長按某一行心或某一列心所可從該項開始收聽。點擊表格角落的耳機圖標可收聽整個列表。",
    },
    "hi": {
        "matrixListenCittas": "सभी चित्त सुनें",
        "matrixListenCetasikas": "सभी चेतसिक सुनें",
        "matrixListenFromHint": "इस मद से सुनने के लिए देर तक दबाए रखें",
        "matrixListenHelpBody": "किसी चित्त पंक्ति या चेतसिक कॉलम को देर तक दबाकर उस मद से सुनें। पूरी सूची सुनने के लिए तालिका के कोने में हेडफ़ोन आइकन पर टैप करें।",
    },
    "my": {
        "matrixListenCittas": "စိတ်အားလုံး နားထောင်ရန်",
        "matrixListenCetasikas": "စေတသိက်အားလုံး နားထောင်ရန်",
        "matrixListenFromHint": "ဤအရာမှ နားထောင်ရန် နှိပ်ဖိထားပါ",
        "matrixListenHelpBody": "စိတ် တစ်ကြောင်း သို့မဟုတ် စေတသိက် တစ်ခုကို နှိပ်ဖိထားခြင်းဖြင့် ထိုအရာမှ နားထောင်ပါ။ စာရင်းအားလုံး နားထောင်ရန် စားပွဲကွက် ထောင့်ရှိ နားကြပ်သင်္ကေတကို နှိပ်ပါ။",
    },
    "si": {
        "matrixListenCittas": "සියලු චිත්ත අසන්න",
        "matrixListenCetasikas": "සියලු චෛතසික අසන්න",
        "matrixListenFromHint": "මෙම අයිතමයෙන් ඇසීමට දිගුවට ඔබාගෙන සිටින්න",
        "matrixListenHelpBody": "චිත්ත පේළියක් හෝ චෛතසික තීරුවක් දිගුවට ඔබාගෙන සිටිමින් එම අයිතමයෙන් අසන්න. මුළු ලැයිස්තුවම ඇසීමට වගුවේ කොනේ හෙඩ්ෆෝන් නිරූපකය තට්ටු කරන්න.",
    },
    "th": {
        "matrixListenCittas": "ฟังจิตทั้งหมด",
        "matrixListenCetasikas": "ฟังเจตสิกทั้งหมด",
        "matrixListenFromHint": "กดค้างเพื่อฟังจากรายการนี้",
        "matrixListenHelpBody": "กดค้างที่แถวจิตหรือคอลัมน์เจตสิกเพื่อฟังจากรายการนั้น แตะไอคอนหูฟังที่มุมตารางเพื่อฟังรายการทั้งหมด",
    },
    "ja": {
        "matrixListenCittas": "すべてのチッタを再生",
        "matrixListenCetasikas": "すべてのチェータシカを再生",
        "matrixListenFromHint": "長押しでこの項目から再生",
        "matrixListenHelpBody": "心の行または心所の列を長押しすると、その項目から再生できます。表の隅のヘッドホンアイコンをタップすると、リスト全体を再生できます。",
    },
    "ko": {
        "matrixListenCittas": "모든 찌따 듣기",
        "matrixListenCetasikas": "모든 쩨따시까 듣기",
        "matrixListenFromHint": "길게 눌러 이 항목부터 듣기",
        "matrixListenHelpBody": "찌따 행이나 쩨따시까 열을 길게 누르면 그 항목부터 들을 수 있습니다. 표 모서리의 헤드폰 아이콘을 탭하면 전체 목록을 들을 수 있습니다.",
    },
    "de": {
        "matrixListenCittas": "Alle Cittas anhören",
        "matrixListenCetasikas": "Alle Cetasikas anhören",
        "matrixListenFromHint": "Zum Anhören ab diesem Element lange drücken",
        "matrixListenHelpBody": "Halten Sie eine Citta-Zeile oder eine Cetasika-Spalte lange gedrückt, um ab diesem Element zu hören. Tippen Sie auf das Kopfhörersymbol in der Tabellenecke, um die ganze Liste zu hören.",
    },
    "es": {
        "matrixListenCittas": "Escuchar todos los citta",
        "matrixListenCetasikas": "Escuchar todos los cetasika",
        "matrixListenFromHint": "Mantén pulsado para escuchar desde este elemento",
        "matrixListenHelpBody": "Mantén pulsada una fila de citta o una columna de cetasika para escuchar desde ese elemento. Toca el icono de auriculares en la esquina de la tabla para escuchar toda la lista.",
    },
    "fr": {
        "matrixListenCittas": "Écouter tous les citta",
        "matrixListenCetasikas": "Écouter tous les cetasika",
        "matrixListenFromHint": "Appuyez longuement pour écouter à partir de cet élément",
        "matrixListenHelpBody": "Maintenez appuyée une ligne de citta ou une colonne de cetasika pour écouter à partir de cet élément. Touchez l’icône casque dans le coin du tableau pour écouter toute la liste.",
    },
    "it": {
        "matrixListenCittas": "Ascolta tutti i citta",
        "matrixListenCetasikas": "Ascolta tutti i cetasika",
        "matrixListenFromHint": "Tieni premuto per ascoltare da questo elemento",
        "matrixListenHelpBody": "Tieni premuta una riga di citta o una colonna di cetasika per ascoltare da quell’elemento. Tocca l’icona delle cuffie nell’angolo della tabella per ascoltare tutta la lista.",
    },
    "pt": {
        "matrixListenCittas": "Ouvir todos os citta",
        "matrixListenCetasikas": "Ouvir todos os cetasika",
        "matrixListenFromHint": "Toque sem soltar para ouvir a partir deste item",
        "matrixListenHelpBody": "Toque sem soltar numa linha de citta ou coluna de cetasika para ouvir a partir desse item. Toque no ícone de fones no canto da tabela para ouvir toda a lista.",
    },
    "ru": {
        "matrixListenCittas": "Слушать все читта",
        "matrixListenCetasikas": "Слушать все четасика",
        "matrixListenFromHint": "Долгое нажатие — слушать с этого элемента",
        "matrixListenHelpBody": "Долгое нажатие на строку читта или столбец четасика — слушать с этого элемента. Нажмите значок наушников в углу таблицы, чтобы прослушать весь список.",
    },
    "id": {
        "matrixListenCittas": "Dengarkan semua citta",
        "matrixListenCetasikas": "Dengarkan semua cetasika",
        "matrixListenFromHint": "Tahan lama untuk mendengarkan dari item ini",
        "matrixListenHelpBody": "Tahan lama baris citta atau kolom cetasika untuk mendengarkan dari item tersebut. Ketuk ikon headphone di sudut tabel untuk mendengarkan seluruh daftar.",
    },
    "ar": {
        "matrixListenCittas": "استمع إلى جميع التشيتا",
        "matrixListenCetasikas": "استمع إلى جميع التشيتاسيكا",
        "matrixListenFromHint": "اضغط مطولًا للاستماع بدءًا من هذا العنصر",
        "matrixListenHelpBody": "اضغط مطولًا على صف تشيتا أو عمود تشيتاسيكا للاستماع بدءًا من هذا العنصر. انقر على أيقونة سماعات الرأس في زاوية الجدول للاستماع إلى القائمة كاملة.",
    },
    "bn": {
        "matrixListenCittas": "সব চিত্ত শুনুন",
        "matrixListenCetasikas": "সব চৈতসিক শুনুন",
        "matrixListenFromHint": "এই আইটেম থেকে শুনতে চেপে ধরে রাখুন",
        "matrixListenHelpBody": "এই আইটেম থেকে শুনতে একটি চিত্ত সারি বা চৈতসিক কলাম চেপে ধরে রাখুন। পুরো তালিকা শুনতে টেবিলের কোণে হেডফোন আইকনে ট্যাপ করুন।",
    },
    "km": {
        "matrixListenCittas": "ស្ដាប់ចិត្តទាំងអស់",
        "matrixListenCetasikas": "ស្ដាប់ចេតសិកទាំងអស់",
        "matrixListenFromHint": "ចុចឱ្យជាប់ដើម្បីស្ដាប់ពីធាតុនេះ",
        "matrixListenHelpBody": "ចុចឱ្យជាប់លើជួរចិត្ត ឬជួរឈរចេតសិក ដើម្បីស្ដាប់ពីធាតុនោះ។ ប៉ះរូបតំណាងក្បាលត្រាក់នៅជ្រុងតារាង ដើម្បីស្ដាប់បញ្ជីទាំងមូល។",
    },
    "mn": {
        "matrixListenCittas": "Бүх Читта сонсох",
        "matrixListenCetasikas": "Бүх Четасика сонсох",
        "matrixListenFromHint": "Энэ зүйлээс сонсохын тулд удаан дарна уу",
        "matrixListenHelpBody": "Тухайн зүйлээс сонсохын тулд Читта мөр эсвэл Четасика баганыг удаан дарна уу. Бүх жагсаалтыг сонсохын тулд хүснэгтний буланд байгаа чихэвч дүрс дээр дарна уу.",
    },
    "mr": {
        "matrixListenCittas": "सर्व चित्त ऐका",
        "matrixListenCetasikas": "सर्व चेतसिक ऐका",
        "matrixListenFromHint": "या घटकापासून ऐकण्यासाठी जास्त वेळ दाबून धरा",
        "matrixListenHelpBody": "त्या घटकापासून ऐकण्यासाठी चित्त पंक्ती किंवा चेतसिक स्तंभ जास्त वेळ दाबून धरा. संपूर्ण यादी ऐकण्यासाठी तक्त्याच्या कोपऱ्यातील हेडफोन चिन्हावर टॅप करा.",
    },
    "ta": {
        "matrixListenCittas": "அனைத்து சித்தங்களையும் கேளுங்கள்",
        "matrixListenCetasikas": "அனைத்து சைதசிகங்களையும் கேளுங்கள்",
        "matrixListenFromHint": "இந்த உருப்படியிலிருந்து கேட்க நீண்ட நேரம் அழுத்திப் பிடிக்கவும்",
        "matrixListenHelpBody": "அந்த உருப்படியிலிருந்து கேட்க ஒரு சித்த வரிசை அல்லது சைதசிக நெடுவரிசையை நீண்ட நேரம் அழுத்திப் பிடிக்கவும். முழு பட்டியலையும் கேட்க அட்டவணையின் மூலையில் உள்ள ஹெட்ஃபோன் படத்தைத் தட்டவும்.",
    },
    "te": {
        "matrixListenCittas": "అన్ని చిత్తలు వినండి",
        "matrixListenCetasikas": "అన్ని చైతసికాలు వినండి",
        "matrixListenFromHint": "ఈ అంశం నుండి వినడానికి సుదీర్ఘంగా నొక్కి పట్టుకోండి",
        "matrixListenHelpBody": "ఆ అంశం నుండి వినడానికి చిత్త వరుస లేదా చైతసిక నిలువు వరుసను సుదీర్ఘంగా నొక్కి పట్టుకోండి. పూర్తి జాబితా వినడానికి పట్టిక మూలలో ఉన్న హెడ్‌ఫోన్ చిహ్నాన్ని నొక్కండి.",
    },
    # English fallback for locales whose ARBs already carry English strings
    # for untranslated keys (matches the holdGlobeToReset precedent).
    "bo": {
        "matrixListenCittas": "Listen to all cittas",
        "matrixListenCetasikas": "Listen to all cetasikas",
        "matrixListenFromHint": "Long-press to listen from this item",
        "matrixListenHelpBody": "Long-press a citta row or a cetasika column to listen from that item. Tap the headphones icon in the table corner to listen to the whole list.",
    },
    "lo": {
        "matrixListenCittas": "Listen to all cittas",
        "matrixListenCetasikas": "Listen to all cetasikas",
        "matrixListenFromHint": "Long-press to listen from this item",
        "matrixListenHelpBody": "Long-press a citta row or a cetasika column to listen from that item. Tap the headphones icon in the table corner to listen to the whole list.",
    },
}

KEY_ORDER = [
    "matrixListenCittas",
    "matrixListenCetasikas",
    "matrixListenFromHint",
    "matrixListenHelpBody",
]


def main():
    for locale, additions in NEW.items():
        path = L10N / f"app_{locale}.arb"
        data = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=OrderedDict)

        # 1. targeted ICU fixes
        for key, value in FIXES.get(locale, {}).items():
            if key in data and data[key] != value:
                data[key] = value
                print(f"[fix] {locale}.{key}: ICU quote normalized")

        # 2. insert new keys after the matrixHelpTips @-block
        if "matrixListenCittas" in data:
            print(f"[skip] {locale}: keys already present")
            continue
        rebuilt = OrderedDict()
        for k, v in data.items():
            rebuilt[k] = v
            if k == "@matrixHelpTips":
                for new_key in KEY_ORDER:
                    rebuilt[new_key] = additions[new_key]
                    rebuilt[f"@{new_key}"] = {"description": new_key}
        assert len(rebuilt) == len(data) + 2 * len(KEY_ORDER), locale
        path.write_text(
            json.dumps(rebuilt, indent=2, ensure_ascii=False) + "\n", encoding="utf-8"
        )
        print(f"[add] {locale}: +{2 * len(KEY_ORDER)} entries")

    # safety: no remaining unescaped ASCII apostrophes anywhere
    import glob
    import re

    bad = []
    for f in sorted(glob.glob(str(L10N / "app_*.arb"))):
        d = json.loads(Path(f).read_text(encoding="utf-8"))
        for k, v in d.items():
            if k.startswith("@") or not isinstance(v, str):
                continue
            if "'" in v.replace("''", "\x00"):
                bad.append((f, k))
    print("remaining ICU quote issues:", bad or "none")


if __name__ == "__main__":
    main()
