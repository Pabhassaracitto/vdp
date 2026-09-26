"""No Flutter SDK needed: verify the format that GitHub CI actually receives."""
import unittest

from tool.report_flutter_analyze import annotations, parse_findings, report

SAMPLE = """Analyzing vdp_app...
  info • 'withOpacity' is deprecated • lib/a.dart:12:3 • deprecated_member_use
warning • Unused import • lib/b.dart:2:8 • unused_import
  error • Method missing • lib/z.dart:198:21 • undefined_method
3 issues found. (ran in 2.0s)
"""


class FlutterAnalyzeReportTest(unittest.TestCase):
    def test_parse_human_diagnostics(self):
        findings = parse_findings(SAMPLE)
        self.assertEqual([f.severity for f in findings], ["info", "warning", "error"])
        self.assertEqual((findings[-1].path, findings[-1].line, findings[-1].column),
                         ("lib/z.dart", 198, 21))

    def test_report_prioritizes_errors_above_lint(self):
        result = report(SAMPLE, limit=2)
        self.assertIn("error=1, warning=1, info=1", result)
        self.assertLess(result.index("`undefined_method`"), result.index("`unused_import`"))
        self.assertNotIn("`deprecated_member_use`", result)
        self.assertIn("còn 1 mục", result)

    def test_annotations_omit_info_but_do_not_hide_errors(self):
        result = annotations(SAMPLE, limit=1)
        self.assertIn("::error file=lib/z.dart,line=198,col=21::", result)
        self.assertNotIn("deprecated_member_use", result)
        self.assertIn("more warnings/errors", result)

    def test_message_containing_separator(self):
        finding = parse_findings("error • A • B • lib/a.dart:1:2 • parse_error")[0]
        self.assertEqual(finding.message, "A • B")

    def test_raw_tool_error_is_reported(self):
        self.assertIn("Failed to run Flutter", report("Failed to run Flutter\n"))


if __name__ == "__main__":
    unittest.main()
