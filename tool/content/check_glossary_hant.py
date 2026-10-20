# -*- coding: utf-8 -*-
"""Flag simplified-Chinese characters leaking into zh_TW (Traditional) strings.

Checks:
  * l10n_work/glossary.csv            column zh_TW
  * assets/content/content_zh_TW.json every string value
  * tool/content/data_priority_*.py   string literals on lines whose key is
                                      "zh_TW" / zh_tw= (best-effort)

A character is flagged when it is in the simplified set below and has a
distinct traditional form. The list is deliberately short and explicit
(characters that actually occurred in this repo plus common Abhidhamma
vocabulary) so there are no false positives from OpenCC-style variants
(e.g. 群→羣 is NOT flagged).

Usage: python3 tool/content/check_glossary_hant.py [--fix]
  --fix rewrites glossary.csv / glossary.json / content_zh_TW.json in place
  using the same map (sources in tool/content must be fixed by hand).
Exit 1 when anything is flagged (without --fix).
"""
import csv
import io
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))

S2T = {
    "禅": "禪", "处": "處", "无": "無", "边": "邊", "识": "識", "业": "業",
    "缘": "緣", "摄": "攝", "摂": "攝", "与": "與", "为": "為", "这": "這",
    "来": "來", "时": "時", "会": "會", "对": "對", "贪": "貪", "瞋": "瞋",
    "痴": "癡", "见": "見", "舍": "捨", "忧": "憂", "悦": "悅", "乐": "樂",
    "异": "異", "净": "淨", "欲": "欲", "色": "色", "界": "界", "门": "門",
    "转": "轉", "领": "領", "确": "確", "际": "際", "触": "觸", "虑": "慮",
    "称": "稱", "随": "隨", "灭": "滅", "观": "觀", "现": "現", "报": "報",
    "阴": "陰", "蕴": "蘊", "净": "淨", "寻": "尋", "间": "間", "着": "著",
    "结": "結", "语": "語", "爱": "愛", "后": "後", "导": "導", "关": "關",
}
S2T = {k: v for k, v in S2T.items() if k != v}
PATTERN = re.compile("[" + "".join(map(re.escape, S2T)) + "]")


def convert(s: str) -> str:
    return PATTERN.sub(lambda m: S2T[m.group(0)], s)


def check_glossary(fix: bool):
    path = os.path.join(ROOT, "l10n_work", "glossary.csv")
    if not os.path.exists(path):
        return []
    raw = open(path, encoding="utf-8").read()
    lines = raw.splitlines()
    hdr = next(i for i, l in enumerate(lines) if l.startswith("pali,"))
    rows = list(csv.reader(io.StringIO("\n".join(lines[hdr:]))))
    zi = rows[0].index("zh_TW")
    hits = []
    for r in rows[1:]:
        if len(r) > zi and PATTERN.search(r[zi]):
            hits.append(("glossary.csv", r[0], r[zi]))
            if fix:
                r[zi] = convert(r[zi])
    if fix and hits:
        out = io.StringIO()
        w = csv.writer(out, lineterminator="\n")
        w.writerows(rows)
        open(path, "w", encoding="utf-8").write(
            "\n".join(lines[:hdr]) + "\n" + out.getvalue()
        )
        jpath = os.path.join(ROOT, "l10n_work", "glossary.json")
        if os.path.exists(jpath):
            data = json.load(open(jpath, encoding="utf-8"))
            for t in data.get("terms", []):
                if isinstance(t.get("zh_TW"), str):
                    t["zh_TW"] = convert(t["zh_TW"])
            json.dump(data, open(jpath, "w", encoding="utf-8"),
                      ensure_ascii=False, indent=2)
    return hits


def walk(obj, path, hits, fix):
    if isinstance(obj, dict):
        for k, v in obj.items():
            r = walk(v, f"{path}.{k}", hits, fix)
            if fix and isinstance(v, str):
                obj[k] = r
    elif isinstance(obj, list):
        for i, v in enumerate(obj):
            r = walk(v, f"{path}[{i}]", hits, fix)
            if fix and isinstance(v, str):
                obj[i] = r
    elif isinstance(obj, str):
        if PATTERN.search(obj):
            hits.append(("content_zh_TW.json", path, obj[:60]))
            return convert(obj)
    return obj


def check_catalog(fix: bool):
    path = os.path.join(ROOT, "assets", "content", "content_zh_TW.json")
    if not os.path.exists(path):
        return []
    data = json.load(open(path, encoding="utf-8"))
    hits = []
    walk(data, "", hits, fix)
    if fix and hits:
        with open(path, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
            f.write("\n")
    return hits


def check_sources():
    hits = []
    for name in sorted(os.listdir(HERE)):
        if not (name.startswith("data_priority_") and name.endswith(".py")):
            continue
        for n, line in enumerate(open(os.path.join(HERE, name), encoding="utf-8"), 1):
            if ('"zh_TW"' in line or "zh_tw" in line) and PATTERN.search(line):
                hits.append((name, f"line {n}", line.strip()[:80]))
    return hits


def main() -> int:
    fix = "--fix" in sys.argv
    hits = check_glossary(fix) + check_catalog(fix) + check_sources()
    if not hits:
        print("OK: no simplified characters in zh_TW strings")
        return 0
    print(f"{'FIXED' if fix else 'FAIL'}: {len(hits)} zh_TW strings with simplified characters")
    for h in hits[:80]:
        print("  -", " · ".join(h))
    if len(hits) > 80:
        print(f"  … {len(hits) - 80} more")
    return 0 if fix else 1


if __name__ == "__main__":
    sys.exit(main())
