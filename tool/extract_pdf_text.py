#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Extract plain text from every PDF in `reference/` into `.pdfextract/`.

Output files use one delimiter per page so lesson `sourceRefs` can cite exact
page numbers:

    ===== [VDP-Nghiep.pdf] PAGE 3 =====

`.pdfextract/` is gitignored — it is a derived artifact, the PDFs in
`reference/` are the source of truth.

Requires pypdf:  python3 -m pip install --break-system-packages pypdf
Usage (from the repo root):  python3 tool/extract_pdf_text.py
"""

from __future__ import annotations

import glob
import json
import os

from pypdf import PdfReader

OUT_DIR = ".pdfextract"


def main() -> None:
    os.makedirs(OUT_DIR, exist_ok=True)
    report: dict[str, dict] = {}

    for path in sorted(glob.glob("reference/*.pdf")):
        name = os.path.basename(path)
        try:
            reader = PdfReader(path)
        except Exception as exc:  # noqa: BLE001 - report, don't crash the batch
            report[name] = {"error": str(exc)}
            continue

        chunks: list[str] = []
        chars = 0
        empty_pages: list[int] = []
        for index, page in enumerate(reader.pages, start=1):
            try:
                text = page.extract_text() or ""
            except Exception:  # noqa: BLE001 - a single bad page must not abort
                text = ""
            if not text.strip():
                empty_pages.append(index)
            chars += len(text.strip())
            chunks.append(f"\n===== [{name}] PAGE {index} =====\n{text}")

        out_path = os.path.join(OUT_DIR, name.replace(".pdf", ".txt"))
        with open(out_path, "w", encoding="utf-8") as handle:
            handle.write("".join(chunks))

        report[name] = {
            "pages": len(reader.pages),
            "text_chars": chars,
            "avg_per_page": round(chars / max(len(reader.pages), 1)),
            # Pages with no extractable text are image-only and would need OCR.
            "empty_pages": empty_pages,
        }

    print(json.dumps(report, indent=1, ensure_ascii=False))


if __name__ == "__main__":
    main()
