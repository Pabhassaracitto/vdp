# Council verdict sheets — DOCTRINE-L10N-001

Advisory only. Each file is the verbatim Round-N sheet of one council member
answering `doc/council_prompt_doctrine_l10n_cycle1.md`. Nothing here is applied
to `assets/data/` or the glossary until the doctrinal reviewer signs off on
Linear IN4-38.

| File | Member | Round | Status |
|---|---|---|---|
| `round1_claude_luan_su.md` | AI-Luận sư (Claude) | 1 | received 2026-10-09 |
| `round1_chatgpt_han_nhat.md` | AI-Ngữ văn Hán–Nhật (ChatGPT) | 1 | received 2026-10-21 |
| `round1_gemini_an_tich.md` | AI-Ngữ văn Ấn–Tích Lan (Gemini) | 1 | received 2026-10-21 |
| `round1_red_team.md` | AI-Phản biện đỏ (Grok/Qwen) | 1 | received 2026-10-21 |
| `round1_consensus.md` | PM position matrix + red-team responses | 1 | 2026-10-21 |
| `round2_red_team.md` | AI-Phản biện đỏ (Grok/Qwen) | 2 | received 2026-10-21 — rubric + 6 điểm vênh, đổi 28→52, rút Q5 |
| `round2_chatgpt_han_nhat.md` | AI-Ngữ văn Hán–Nhật (ChatGPT) | 2 | received 2026-10-21 — rubric chi tiết 6 cột + phiếu KHÔNG XÁC MINH Q4/Q6/Q10 |
| `round2_gemini_an_tich.md` | AI-Ngữ văn Ấn–Tích Lan (Gemini) | 2 | received 2026-10-21 — 28 citta Table 8.4, hasituppāda CÓ āsevana |
| `round2_consensus.md` | PM Round-2 matrix **4/4** | 2 | 2026-10-21 — nhóm A/B/C trình IN4-38, V3 candidates |
| `round2_claude_luan_su.md` | AI-Luận sư (Claude Sonnet 5) | 2 | received 2026-10-21 — tự sửa Q3 (đạo→quả sai), hạ Q6 xuống KHÔNG XÁC MINH, nghiêng 28 loại 52 |

PM notes on Round 1 are in `pm_notes_round1.md`; the 4-sheet position matrix in `round1_consensus.md`. Round-2 consolidation in `round2_consensus.md`. How to run the next rounds: `ROUND_KIT.md`; the Round-2 message is `ROUND2_MESSAGE.md`.

## Review policy — per-language, not one elder for all (2026-10-21)

**Nguyên tắc:** Không có một vị trưởng lão duy nhất duyệt cả 7 ngôn ngữ. Mỗi locale duyệt bởi người có thẩm quyền của chính ngôn ngữ/truyền thống đó (List A/B tách riêng). Sri Lanka (si) chỉ duyệt Sinhala — hi do tu sĩ Ấn, zh/zh_TW do Đài Loan/Đại Lục, ja do Nhật, my/th do Miến/Thái duyệt. Đề xuất hiệu đính của người dùng cũng đi theo cùng luồng này (xem `../../tool/content/priority_translation_agents/REVIEW_TEMPLATES.md`).

| Locale | Linear issue | Người duyệt gợi ý | Ghi chú |
|---|---|---|---|
| hi | IN4-42 | Tu sĩ Hindi (Rewata Dhamma / Dharmarakshita lineage) | Đối chiếu `tool/content/priority_translation_agents/REVIEW_TEMPLATES.md#hi` |
| zh | IN4-43 | Tăng đoàn Hán (bản 攝阿毘達磨義論) | Giản thể |
| zh_TW | IN4-44 | Tăng đoàn Đài Loan (CBETA, 攝阿毘達磨義論 phồn thể) | Đã fix 禪/攝 ở `ce97b61` |
| si | IN4-45 | Trưởng lão Sri Lanka (duyên hiện có) | Chỉ duyệt `si` |
| my | IN4-46 | Tăng Miến (Q13a–h) | Đang chờ handoff |
| ja | IN4-47 | Tăng Nhật (ウ・ウェープッラ / 水野弘元) | Shinjitai check |
| th | IN4-48 | Tăng Thái (อภิธัมมัตถสังคหะ) | Silent — sẽ tạo handoff |

Hội đồng đa AI chỉ là **advisory**. Quyết định cuối thuộc về người duyệt của locale đó, ghi lại trên Linear issue tương ứng + comment trên IN4-38 để PM tổng hợp áp dụng.
