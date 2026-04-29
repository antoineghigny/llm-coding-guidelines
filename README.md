# LLM Coding Guidelines

A compact, tool-compatible set of behavioral guidelines for coding agents. The goal is to reduce repeat LLM coding mistakes without loading every agent prompt with redundant prose.

## Why this shape

This repo now uses one canonical source, [`guidelines/core.md`](guidelines/core.md), and generates the agent-specific files from it. The generated files remain complete because different tools read different entrypoints:

- [`AGENTS.md`](AGENTS.md) for general coding agents and Codex-style workflows
- [`CLAUDE.md`](CLAUDE.md) for Claude Code and Claude projects
- [`GEMINI.md`](GEMINI.md) for Gemini CLI
- [`.cursor/rules/karpathy-guidelines.mdc`](.cursor/rules/karpathy-guidelines.mdc) for Cursor project rules
- [`skills/karpathy-guidelines/SKILL.md`](skills/karpathy-guidelines/SKILL.md) for reusable skill/plugin use

The content is deliberately shorter than the previous 11-section version, but not shortened for its own sake. The design follows a few practical prompt-writing lessons:

- OpenAI's GPT-5-Codex prompting guidance recommends keeping custom instructions focused on the essential behavior you want changed.
- Codex's public model instructions use concrete sections for behavior, tool use, editing discipline, and final verification instead of long theoretical policy text.
- OpenAI's instruction-hierarchy work and Anthropic's prompting guidance both favor clear, direct instructions with explicit conflict handling.
- Long-context research such as "Lost in the Middle" is a reminder that repeated or low-signal text can make important instructions easier to miss.
- Prompting surveys such as "The Prompt Report" support using clear role/task/context structure and examples where they add signal.

References: [GPT-5-Codex prompting guide](https://cookbook.openai.com/examples/gpt-5-codex_prompting_guide), [Codex models.json](https://raw.githubusercontent.com/openai/codex/main/codex-rs/models-manager/models.json), [OpenAI instruction hierarchy](https://openai.com/index/instruction-hierarchy-challenge/), [Anthropic prompting best practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices), [Lost in the Middle](https://arxiv.org/abs/2307.03172), [The Prompt Report](https://arxiv.org/abs/2406.06608), and the upstream [Karpathy-inspired guidelines](https://github.com/forrestchang/andrej-karpathy-skills).

## The six guidelines

1. **Ground Before Acting**: inspect local truth first, then clarify only unresolved material ambiguity.
2. **Keep Changes Surgical**: every changed line should trace to the task.
3. **Build the Simplest Robust Thing**: solve the real problem without speculative flexibility.
4. **Protect Contracts and Boundaries**: treat public APIs, schemas, messages, and layers as owned surfaces.
5. **Preserve Test Intent and Verify Behavior**: keep test category and observable behavior intact.
6. **Finish Cleanly and Capture Lessons**: remove iteration artifacts and record repeated agent failure patterns.

## Workflow

Edit only [`guidelines/core.md`](guidelines/core.md) when changing the guidelines.

Then regenerate the tool-specific files:

```bash
./scripts/sync-guidelines.sh
```

Before committing, verify generated files are in sync:

```bash
./scripts/sync-guidelines.sh --check
git diff --check
```

[`EXAMPLES.md`](EXAMPLES.md) is supplementary. It should illustrate the guidelines, not become a second source of instructions.

## Project Lessons

When PR feedback reveals a repeated or high-cost agent failure, add one short, actionable bullet under `Project Lessons` in [`guidelines/core.md`](guidelines/core.md), then run the sync script. Do not add one-off preferences or long explanations there.
