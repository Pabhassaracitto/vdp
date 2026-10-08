# Priority translation agent prompts

Prompts for the agent team that translates Study / Nhân Duyên content into
the seven priority locales (`hi`, `zh`, `zh_TW`, `si`, `my`, `ja`, `th`).

| File | Role |
|---|---|
| [`../priority_translation_agent_prompt.md`](../priority_translation_agent_prompt.md) | Base rules every locale agent follows (sources, non-negotiable translation rules, batches, validation gates). |
| [`manager_orchestrator.md`](manager_orchestrator.md) | Manager agent: collects handoffs from all seven locale agents, verifies what is still open with the checkers, assigns one coherent unit per agent, owns shared files, integrates and reports. |

Key principles enforced by the manager prompt:

- Measure with `tool/content/check_content_locale.py` before assigning;
  never retranslate units that are already complete.
- One agent owns one locale; shared builders, glossary, generated assets and
  tests are manager-owned and edited serially.
- Separate "needs source evidence" work from "blocked on doctrinal review"
  work; blocked fields stay absent so English fallback renders.
- Statuses remain `draft` until a doctrinal reviewer signs off.

- [`INTEGRATION_CONTRACT.md`](INTEGRATION_CONTRACT.md) — binding delivery shape for every locale module (cycle-1 PM decision).
