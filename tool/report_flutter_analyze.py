#!/usr/bin/env python3
"""Summarize Flutter's human-readable analyzer output for GitHub Actions.

`flutter analyze --machine` emits human-readable `severity • message • file:line:col
• code` lines in the CI Flutter version (3.47.5), not JSONL. Keep errors at the
front of the PR report so pre-existing lint messages cannot hide compile errors.
"""
from __future__ import annotations

import re
import sys
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

SEVERITIES = {"error": 0, "warning": 1, "info": 2}
LOCATION = re.compile(r"(.+):(\d+):(\d+)$")


@dataclass(frozen=True)
class Finding:
    severity: str
    message: str
    path: str
    line: int
    column: int
    code: str


def parse_findings(text: str) -> list[Finding]:
    findings = []
    for raw in text.splitlines():
        # A message may itself contain the separator; split location/code from
        # the RIGHT so the diagnostic stays intact.
        parts = re.split(r"\s+•\s+", raw.strip())
        if len(parts) < 4 or parts[0].lower() not in SEVERITIES:
            continue
        match = LOCATION.fullmatch(parts[-2])
        if match is None:
            continue
        path, line, column = match.groups()
        findings.append(Finding(
            severity=parts[0].lower(),
            message=" • ".join(parts[1:-2]),
            path=path,
            line=int(line),
            column=int(column),
            code=parts[-1],
        ))
    return findings


def report(text: str, *, limit: int = 100) -> str:
    findings = parse_findings(text)
    counts = Counter(f.severity for f in findings)
    lines = [
        f"flutter analyze: {len(findings)} findings — "
        f"error={counts['error']}, warning={counts['warning']}, info={counts['info']}",
        "CI chỉ chặn lỗi `error`; lint `warning`/`info` vẫn được báo cáo để xử lý dần.",
        "",
    ]
    # Stable sort: errors first, then warnings, then infos, preserving file order.
    prioritized = sorted(findings, key=lambda f: SEVERITIES[f.severity])
    for f in prioritized[:limit]:
        lines.append(f"- [{f.severity}] `{f.path}:{f.line}:{f.column}` "
                     f"`{f.code}`: {f.message}")
    if len(prioritized) > limit:
        lines.append(f"\n… còn {len(prioritized) - limit} mục chưa hiển thị")
    if not findings and text.strip():
        # Non-diagnostic tool errors (e.g. failed `flutter pub get`) must not
        # disappear merely because they don't match a finding line.
        lines.append("Đầu ra gốc (không tìm thấy dòng diagnostic):\n```text")
        lines.extend(text.splitlines()[:30])
        lines.append("```")
    return "\n".join(lines) + "\n"


def annotations(text: str, *, limit: int = 20) -> str:
    findings = parse_findings(text)
    prioritized = sorted(findings, key=lambda f: SEVERITIES[f.severity])
    actionable = [f for f in prioritized if f.severity != "info"]
    result = []
    for f in actionable[:limit]:
        message = f"{f.code}: {f.message}"[:350]
        message = message.replace("%", "%25").replace("\r", "%0D").replace("\n", "%0A")
        # GitHub workflow command file properties need their own escaping.
        path = f.path.replace("%", "%25").replace(",", "%2C").replace("\r", "")
        result.append(f"::{f.severity} file={path},line={f.line},col={f.column}::{message}")
    if len(actionable) > limit:
        result.append(f"::notice::{len(actionable) - limit} more warnings/errors in PR report")
    return "\n".join(result) + ("\n" if result else "")


def main() -> int:
    if len(sys.argv) != 3 or sys.argv[1] not in ("report", "annotations"):
        print("Usage: report_flutter_analyze.py {report|annotations} analyze.txt", file=sys.stderr)
        return 2
    text = Path(sys.argv[2]).read_text(encoding="utf-8", errors="replace")
    print((report if sys.argv[1] == "report" else annotations)(text), end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
