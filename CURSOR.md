# Using this repo with Cursor

This project includes a Cursor project rule at [`.cursor/rules/karpathy-guidelines.mdc`](.cursor/rules/karpathy-guidelines.mdc). It is committed with `alwaysApply: true`, so Cursor applies the generated guidelines automatically when this folder is opened.

## In this repository

1. Open the folder in Cursor.
2. Confirm the `karpathy-guidelines` project rule appears under Cursor's Rules UI if needed.
3. Edit [`guidelines/core.md`](guidelines/core.md), not the generated Cursor rule, when changing guideline content.

## Use the same guidelines in another project

For Cursor, copy [`.cursor/rules/karpathy-guidelines.mdc`](.cursor/rules/karpathy-guidelines.mdc) into the target project's `.cursor/rules/` directory.

For tools that read root instruction files, copy the generated file they support, such as [`AGENTS.md`](AGENTS.md), [`CLAUDE.md`](CLAUDE.md), or [`GEMINI.md`](GEMINI.md).

For reusable skill/plugin workflows, use [`skills/karpathy-guidelines/SKILL.md`](skills/karpathy-guidelines/SKILL.md).

## For contributors

The source of truth is [`guidelines/core.md`](guidelines/core.md). After editing it, run:

```bash
./scripts/sync-guidelines.sh
./scripts/sync-guidelines.sh --check
```

Do not hand-edit the generated agent files unless you are changing the generator itself.
