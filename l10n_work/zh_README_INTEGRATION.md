# zh 整合指引（草案・仅 `zh`）

本目录下为 `zh` 简体中文的 **提案补丁与证据台账**，**未** 直接改动 `assets/content/content_zh.json`（由整合人审核后统一运行 builder 生成）。

## 文件清单

- `zh_terminology_ledger.md` — 术语证据台账（含 `摂` → `摄` 勘误、十二支/二十四缘/心路/四相 的逐条来源、置信度与未决异读；诚实缺口统计）
- `zh_batch1_proposal.json` — Batch 1 已译字段的完整 `zh` 文案（paticcas 12×四相/示例/注记；paccayas 24×缘法/缘生法/示例/注记/细分；vithis 4×缘起语境+缺失的3路共18步；kammas 16×注记/示例草案）
- `zh_patch_proposal.diff` — 对 `l10n_work/glossary.csv` 题记、`tool/content/build_glossary.py` 及 `tool/content/data_priority_conditions.py`（新增 `PATICCA_DETAILS_ZH` / `PACCAYA_DETAILS_ZH` / `VITHI_DETAILS_ZH` / `KAMMA_DETAILS_ZH`）的 unified diff；对 `tool/content/build_full_catalogs.py` 的合并逻辑示意（仅 `zh` 分支）

## 应用步骤（整合人）

```bash
# 1. 审核题记勘误与台账
cat l10n_work/zh_terminology_ledger.md

# 2. 应用补丁（审阅后）
patch -p1 < l10n_work/zh_patch_proposal.diff
# 或手工将 zh_batch1_proposal.json 的 24+12+4 条目按 diff 示意写入 data_priority_conditions.py

# 3. 重新生成并验证幂等（整合人执行；本轮未执行以避免重写七种目录）
python3 tool/content/build_full_catalogs.py
python3 tool/content/build_full_catalogs.py  # 二次验证幂等
python3 tool/content/check_content_locale.py zh --glossary
python3 tool/check_localizations.py
# 可选：flutter analyze / flutter test
```

## 状态诚实性

- `lessonTranslationStatus` 保持 `partial`，模块仅 `M1_BASICS` / `M2_SI_PHAN` / `M11_BIET_CANH` 为 `reviewed`，其余14模块保持标题/简介草稿，正文/卡片/题库缺省回退英文。
- `cetasikas` 52×4 / `rupas` 28×5 / `kammas` 16×2 等未达复核阈值的字段在提案 JSON 中暂留或标 `confidence: medium`，**不** 写入 `content_zh.json`，运行时回退英文，永不回退越文。
- 旧通用心识示例模板 `生起于相应境遇中（…）` 已按规范剔除，空缺回退英文。

## 回退链

- `zh` → `en`，`zh_TW` → `zh` → `en`，`allowsEnglishFallback: true` 保持开启。

