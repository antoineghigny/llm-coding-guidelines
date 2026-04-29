# 🧭 LLM Coding Guidelines
> **Karpathy-inspired guardrails for AI coding agents — from messy diffs to focused pull requests.**

[![Built for: Claude Code + Codex + Gemini CLI + Cursor](https://img.shields.io/badge/Built%20for-Claude%20Code%20%2B%20Codex%20%2B%20Gemini%20CLI%20%2B%20Cursor-orange.svg)](https://github.com/antoineghigny/llm-coding-guidelines)
[![Source of truth: guidelines/core.md](https://img.shields.io/badge/Source%20of%20truth-guidelines%2Fcore.md-blue.svg)](guidelines/core.md)
[![Agent rules: AGENTS + CLAUDE + GEMINI + Cursor](https://img.shields.io/badge/Agent%20rules-AGENTS%20%2B%20CLAUDE%20%2B%20GEMINI%20%2B%20Cursor-green.svg)](#-quick-start)

**LLM Coding Guidelines** is a compact set of behavioral instructions for AI coding agents. It helps Claude Code, Codex, Gemini CLI, Cursor, and similar tools avoid broken contracts, downgraded tests, blurred boundaries, speculative abstractions, and noisy diffs.

---

## 🌟 Key Highlights

- **🤖 Multi-agent ready:** One guideline set generated for `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, Cursor rules, and reusable skill workflows.
- **🧱 Architecture-aware:** Explicit guardrails for public APIs, schemas, messaging, boundaries, and ownership.
- **✅ Test-preserving:** Agents are instructed to keep integration, slice, and unit tests in their proper category.
- **🎯 Surgical by default:** Changes should trace to the task, match local patterns, and avoid drive-by cleanup.

---

## 🚀 Quick Start

The canonical guidelines live in [`guidelines/core.md`](guidelines/core.md). Pick the generated entrypoint that matches your agent or editor:

| File | Use it for |
| --- | --- |
| [`AGENTS.md`](AGENTS.md) | General coding agents and Codex-style workflows |
| [`CLAUDE.md`](CLAUDE.md) | Claude Code and Claude projects |
| [`GEMINI.md`](GEMINI.md) | Gemini CLI |
| [`.cursor/rules/karpathy-guidelines.mdc`](.cursor/rules/karpathy-guidelines.mdc) | Cursor project rules |
| [`skills/karpathy-guidelines/SKILL.md`](skills/karpathy-guidelines/SKILL.md) | Reusable skill/plugin workflows |
| [`CURSOR.md`](CURSOR.md) | Cursor setup notes |
| [`EXAMPLES.md`](EXAMPLES.md) | Supplementary examples |

Copy the file your coding tool reads by default into the target project. Keep it close to the codebase so the agent sees the same guardrails before implementing changes.

---

## 📂 Repository Structure

```text
├── guidelines/
│   └── core.md                         # Canonical guideline source
├── scripts/
│   └── sync-guidelines.sh              # Regenerates tool-specific files
├── skills/
│   └── karpathy-guidelines/SKILL.md    # Reusable skill entrypoint
├── .cursor/rules/
│   └── karpathy-guidelines.mdc         # Cursor project rule
├── AGENTS.md                           # General agent / Codex entrypoint
├── CLAUDE.md                           # Claude Code entrypoint
├── GEMINI.md                           # Gemini CLI entrypoint
├── CURSOR.md                           # Cursor usage notes
└── EXAMPLES.md                         # Supplementary examples
```

---

## 🧠 Current Guidelines

1. **Ground Before Acting:** Inspect local truth first, then clarify only unresolved material ambiguity.
2. **Keep Changes Surgical:** Every changed line should trace to the task.
3. **Build the Simplest Robust Thing:** Solve the real problem without speculative flexibility.
4. **Protect Contracts and Boundaries:** Treat public APIs, schemas, messages, and layers as owned surfaces.
5. **Preserve Test Intent and Verify Behavior:** Keep test category and observable behavior intact.
6. **Finish Cleanly:** Remove iteration artifacts and report what was verified.

---

## 🛠️ Maintaining the Guidelines

Edit only [`guidelines/core.md`](guidelines/core.md) when changing the generated instructions.

Regenerate every tool-specific entrypoint:

```bash
./scripts/sync-guidelines.sh
```

Verify the generated files are in sync before committing:

```bash
./scripts/sync-guidelines.sh --check
git diff --check
```

`EXAMPLES.md` is supplementary. It should illustrate the guidelines, not become a second source of instructions.

---

## 🛡️ Why this Fork Exists

I use LLMs heavily to code features, but I noticed a costly pattern: the agent would fall into the same traps and trigger the same PR review comments from my team. The repeated issues were not just style problems; they were architectural mistakes such as downgrading integration tests into unit tests, mismanaging OpenAPI contracts, blurring service boundaries, or wiring feature flags incorrectly.

The original Karpathy-inspired guidelines were a strong starting point for general agent behavior. This fork keeps that spirit while adding stricter software-engineering guardrails for contracts, tests, boundaries, and implementation hygiene.

---

## 🙏 Credits

This project builds on the upstream [Karpathy-inspired guidelines](https://github.com/forrestchang/andrej-karpathy-skills) and adapts them for multi-agent coding workflows with stronger architectural and testing guardrails.

---

<p align="center">Built for AI coding agents by <a href="https://github.com/antoineghigny">Antoine Ghigny</a></p>
