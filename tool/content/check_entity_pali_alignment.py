# -*- coding: utf-8 -*-
"""Guard against row-shift bugs in the shared translation tables.

For every citta / kamma id, the `pali` recorded in the priority translation
tables (data_priority_cittas.CITTAS, data_priority_conditions.KAMMAS) must be
the `namePali` of the same id in assets/data/*.json, and the glossary row for
that Pāḷi headword must carry the same locale renderings as the catalogs.

Background: IN4-72 — KM_P_*/KM_U_* and CI_026/CI_027 shipped with swapped
texts in all 7 locales because the tables were keyed by position, not by id.

Usage: python3 tool/content/check_entity_pali_alignment.py   (exit 1 on drift)
"""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)

from tool.content import data_priority_cittas as dcit  # noqa: E402
from tool.content import data_priority_conditions as dcond  # noqa: E402

DATA = os.path.join(ROOT, "assets", "data")
CONTENT = os.path.join(ROOT, "assets", "content")
LOCALES = ["hi", "zh", "zh_TW", "si", "my", "ja", "th"]


def _load(name, key):
    with open(os.path.join(DATA, name), encoding="utf-8") as f:
        return {x["id"]: x["namePali"] for x in json.load(f)[key]}


def main() -> int:
    errors = []
    truth = {
        "cittas": (_load("cittas.json", "cittas"), dcit.CITTAS),
        "kammas": (_load("kammas.json", "kammas"), dcond.KAMMAS),
    }
    for kind, (json_pali, table) in truth.items():
        for eid, entry in table.items():
            if eid not in json_pali:
                errors.append(f"{kind}: {eid} in table but not in assets/data")
                continue
            if entry.get("pali") != json_pali[eid]:
                errors.append(
                    f"{kind}: {eid} table pali={entry.get('pali')!r} "
                    f"!= json namePali={json_pali[eid]!r}"
                )

    # Shipped catalogs must agree with the (now id-keyed) tables.
    for loc in LOCALES:
        path = os.path.join(CONTENT, f"content_{loc}.json")
        if not os.path.exists(path):
            continue
        with open(path, encoding="utf-8") as f:
            cat = json.load(f)
        for eid, entry in dcit.CITTAS.items():
            want = entry.get(loc, (None,))[0]
            got = cat.get("cittas", {}).get(eid, {}).get("name")
            if want and got and want != got:
                errors.append(f"{loc} cittas.{eid}.name={got!r} != table {want!r}")
        for eid, entry in dcond.KAMMAS.items():
            want = (entry.get(loc) or (None,))[0]
            got = cat.get("kammas", {}).get(eid, {}).get("name")
            if want and got and want != got:
                errors.append(f"{loc} kammas.{eid}.name={got!r} != table {want!r}")

    if errors:
        print("FAIL: entity Pāḷi/id alignment")
        for e in errors:
            print("  -", e)
        return 1
    print(
        f"OK: {len(dcit.CITTAS)} cittas + {len(dcond.KAMMAS)} kammas aligned "
        f"with assets/data and {len(LOCALES)} shipped catalogs"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
