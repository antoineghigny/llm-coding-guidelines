# LLM Coding Guidelines (Karpathy-Inspired Fork)

A unified set of behavioral guidelines (`CLAUDE.md`, `GEMINI.md`, `AGENTS.md`) designed to improve LLM coding behavior and **stop LLMs from repeating the same mistakes over and over**.

## Why I created this fork

I use LLMs heavily to code features, but I noticed a frustrating pattern: **the LLM would systematically fall into the exact same traps, leading to the exact same PR review comments from my team.** I was losing time fixing the same architectural mistakes (like degrading integration tests into unit tests, messing up feature-flag wiring, or mismanaging OpenAPI contracts).

The original Karpathy guidelines were a fantastic starting point for general behavior, but they lacked specific architectural guardrails and a mechanism for continuous learning on a specific codebase.

I created this fork to solve my own pain point:
1. **Prioritizing Core Principles**: Restoring Karpathy's original rules (Think Before Coding, Simplicity First, Surgical Changes, Goal-Driven Execution) exactly as they were intended.
2. **Merging Logic for Architectural Guardrails**: Introducing specific behavioral guardrails based on real PR reviews (Architecture & Boundaries, Feedback-Driven Changes, Test Semantics).
3. **The "Project Lessons" Engine**: A designated, living section specifically designed to aggregate new PR reviews. When your LLM makes a new mistake, you distill that feedback into a single bullet point in this section. The next time the LLM touches the codebase, it reads the lesson and avoids the trap.

## The 8 Principles

1. **Think Before Coding**: Don't assume. Clarify over guesswork. Prioritize research and questions if ambiguous.
2. **Simplicity First**: Minimum code that solves the problem. Nothing speculative.
3. **Surgical Changes**: Touch only what you must. Clean up only your own mess.
4. **Goal-Driven Execution**: Define verifiable success criteria. Loop until verified.
5. **Architecture & Boundaries**: Keep each layer focused. Define contracts once.
6. **Feedback-Driven Changes**: Fix the smallest real problem first. Resolve the specific concern raised.
7. **Preserve Test Semantics**: Don't silently change integration tests to unit tests.
8. **Project Lessons**: A living section to append specific mistakes observed during code review so the LLM learns your project's traps.

## Workflow: The PR Review Loop

Simply copy the guidelines into your project root. The exact same guidelines are provided in different filenames to support your preferred tools:

- `CLAUDE.md` (for Claude Code / Claude projects)
- `GEMINI.md` (for Gemini CLI)
- `AGENTS.md` (for general AI agents)
- `.cursor/rules/karpathy-guidelines.mdc` (for Cursor)

**How to use it effectively:**
1. Pick the file(s) that match your workflow and add it to your project repository.
2. Assign a feature task to your LLM.
3. Submit the PR.
4. **When you receive PR review feedback about an architectural or implementation mistake the LLM made, DO NOT just fix the code. Add the core lesson as a new bullet point under the `Project Lessons` section of your guideline file.**
5. Commit the updated guideline file.
6. The next time the LLM works on a feature, it will read its past mistake and avoid it. You stop wasting time on the same reviews.

## How to Know It's Working

These guidelines are working if you see:
- **No more repetitive PR comments** — The LLM learns your project's specific architecture and testing standards.
- **Integration tests remain intact** — The LLM doesn't take shortcuts by mocking everything.
- **Fewer unnecessary changes in diffs** — Only requested changes appear.
- **Clean, minimal PRs** — No drive-by refactoring or unrequested "improvements".
