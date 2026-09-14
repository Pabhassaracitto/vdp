#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Kiểm tra tính toàn vẹn của `assets/data/paccayas.json` (24 Duyên Hệ).

Đây là bản kiểm tra chạy được khi chưa có Flutter/Dart SDK — cùng bộ quy tắc
với `test/paccaya_data_test.dart`. Khi có SDK, hãy chạy `flutter test` thay vì
script này; script chỉ dùng để soát nhanh dữ liệu.

Usage (từ thư mục gốc repo):
    python3 tool/check_paccaya_data.py
"""

from __future__ import annotations

import json
import sys

CANONICAL = [
    "Hetu-paccaya", "Ārammaṇa-paccaya", "Adhipati-paccaya", "Anantara-paccaya",
    "Samanantara-paccaya", "Sahajāta-paccaya", "Aññamañña-paccaya",
    "Nissaya-paccaya", "Upanissaya-paccaya", "Purejāta-paccaya",
    "Pacchājāta-paccaya", "Āsevana-paccaya", "Kamma-paccaya", "Vipāka-paccaya",
    "Āhāra-paccaya", "Indriya-paccaya", "Jhāna-paccaya", "Magga-paccaya",
    "Sampayutta-paccaya", "Vippayutta-paccaya", "Atthi-paccaya",
    "Natthi-paccaya", "Vigata-paccaya", "Avigata-paccaya",
]

REQUIRED_FIELDS = [
    "id", "order", "namePali", "nameVietnamese", "nameShort", "nameEnglish",
    "group", "definitionVi", "paccayaDhamma", "paccayuppanna",
]

VALID_GROUPS = {
    "root_object", "continuity", "conascence", "time_relation",
    "kamma_vipaka", "general",
}


def _load(path: str, key: str) -> list[dict]:
    with open(path, encoding="utf-8") as handle:
        data = json.load(handle)
    return data[key]


def main() -> int:
    paccayas = _load("assets/data/paccayas.json", "paccayas")
    paccayas.sort(key=lambda item: item["order"])

    cetasika_ids = {c["id"] for c in _load("assets/data/cetasikas.json", "cetasikas")}
    citta_ids = {c["id"] for c in _load("assets/data/cittas.json", "cittas")}
    paticca_ids = {p["id"] for p in _load("assets/data/paticca.json", "paticcas")}

    failures: list[str] = []

    def check(condition: bool, message: str) -> None:
        if not condition:
            failures.append(message)

    check(len(paccayas) == 24, f"phải có đúng 24 duyên, thực tế {len(paccayas)}")
    check(
        [p["namePali"] for p in paccayas] == CANONICAL,
        "tên Pāḷi / thứ tự không khớp Paccayuddesa: "
        + str([(i + 1, p["namePali"]) for i, p in enumerate(paccayas)
               if i >= len(CANONICAL) or p["namePali"] != CANONICAL[i]]),
    )
    check(
        [p["order"] for p in paccayas] == list(range(1, 25)),
        "trường order phải chạy 1..24 không trùng",
    )
    check(
        len({p["id"] for p in paccayas}) == len(paccayas),
        "id trùng nhau trong paccayas.json",
    )

    for p in paccayas:
        pid = p.get("id", "?")
        for field in REQUIRED_FIELDS:
            check(str(p.get(field, "")).strip() != "", f"{pid}: thiếu {field}")
        check(p.get("group") in VALID_GROUPS, f"{pid}: group lạ {p.get('group')}")
        refs = p.get("sourceRefs") or []
        check(len(refs) > 0, f"{pid}: không có sourceRefs")
        check(
            any(r.get("confidence") == "canonical" for r in refs),
            f"{pid}: thiếu nguồn canonical (Paṭṭhāna)",
        )
        for ref in refs:
            check(ref.get("source", "") != "", f"{pid}: sourceRefs thiếu source")
        for cid in p.get("relatedCetasikaIds") or []:
            check(cid in cetasika_ids, f"{pid}: cetasika không tồn tại {cid}")
        for cid in p.get("relatedCittaIds") or []:
            check(cid in citta_ids, f"{pid}: citta không tồn tại {cid}")
        for lid in p.get("operatesInPaticca") or []:
            check(lid in paticca_ids, f"{pid}: chi nhân duyên không tồn tại {lid}")

    with open("assets/data/paccayas.json", encoding="utf-8") as handle:
        meta = json.load(handle).get("meta", {})
    policy = meta.get("sourcePolicy", "")
    for token in ("Paṭṭhāna", "Visuddhimagga", "Pa-Auk"):
        check(token in policy, f"meta.sourcePolicy phải nhắc đến {token}")

    if failures:
        print("FAIL — 24 Duyên Hệ")
        for failure in failures:
            print("  •", failure)
        return 1

    print("PASS — 24 Duyên Hệ")
    print(f"  • 24/24 duyên, thứ tự khớp Paccayuddesa")
    print(f"  • nguồn canonical: {sum(1 for p in paccayas if any(r.get('confidence') == 'canonical' for r in p['sourceRefs']))}/24")
    print(f"  • liên kết 12 chi: {sum(len(p.get('operatesInPaticca') or []) for p in paccayas)} cặp duyên–chi")
    return 0


if __name__ == "__main__":
    sys.exit(main())
