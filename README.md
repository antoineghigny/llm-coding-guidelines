# LLM Coding Guidelines (Karpathy-Inspired Fork)

A unified set of behavioral guidelines (`CLAUDE.md`, `GEMINI.md`, `AGENTS.md`) designed to improve LLM coding behavior and **stop LLMs from repeating the same mistakes over and over**.

## Why I created this fork

I use LLMs heavily to code features, but I noticed a frustrating pattern: **the LLM would systematically fall into the exact same traps, leading to the exact same PR review comments from my team.** I was losing time fixing the same architectural mistakes (like degrading integration tests into unit tests, messing up feature-flag wiring, or mismanaging OpenAPI contracts).

The original Karpathy guidelines were a fantastic starting point for general behavior, but they lacked specific architectural guardrails and a mechanism for continuous learning on a specific codebase.

I created this fork to solve my own pain point:
1. **Prioritizing Core Principles**: Restoring Karpathy's original rules (Think Before Coding, Simplicity First, Surgical Changes, Goal-Driven Execution) exactly as they were intended.
2. **Evolutionary API Standards**: Integrating a strict "Contract First" policy to prevent breaking consumers.
3. **Event-Driven Guardrails**: Guidelines for reliable messaging and schema evolution in asynchronous systems.
4. **The "Project Lessons" Ledger**: A designated, living section specifically designed to aggregate new project-specific mistakes. When your LLM makes a new mistake, you distill that feedback into a single bullet point in this section.

## The 12 Principles

1. **Think Before Coding**: Don't assume. Clarify over guesswork. Surface tradeoffs.
2. **Read Before Editing**: Understand the local pattern before changing code. Inspect neighbors.
3. **Simplicity First**: Minimum code that solves the problem. Nothing speculative.
4. **Surgical Changes**: Touch only what you must. Clean up only your own mess.
5. **Goal-Driven Execution**: Define verifiable success criteria. Loop until verified.
6. **Evolutionary API Design**: Do not break backward compatibility. Treat APIs as sacred contracts.
7. **Event-Driven & Messaging**: Design for asynchronous reliability and schema evolution.
8. **Architecture & Boundaries**: Keep each layer focused. Perform boundary-level validation.
9. **Feedback-Driven Changes**: Fix the smallest real problem first. Resolve the specific concern raised.
10. **Preserve Test Semantics**: Don't silently change integration tests to unit tests.
11. **Computational Efficiency & Clean Logic**: Avoid brute-force O(n²) and deep nesting.
12. **Project Lessons**: A living section to append specific mistakes observed while using coding agents.

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
4. **When you receive feedback about an architectural or implementation mistake the LLM made, DO NOT just fix the code. Add the core lesson as a new bullet point under the `Project Lessons` section of your guideline file.**
5. Commit the updated guideline file.
6. The next time the LLM works on a feature, it will read its past mistake and avoid it. You stop wasting time on the same issues.

## How to Know It's Working

These guidelines are working if you see:
- **No more repetitive PR comments** — The LLM learns your project's specific architecture and testing standards.
- **Integration tests remain intact** — The LLM doesn't take shortcuts by mocking everything.
- **Fewer unnecessary changes in diffs** — Only requested changes appear.
- **Clean, minimal PRs** — No drive-by refactoring or unrequested "improvements".
