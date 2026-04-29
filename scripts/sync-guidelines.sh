#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CORE="$ROOT/guidelines/core.md"
MODE="write"

if [[ "${1:-}" == "--check" ]]; then
  MODE="check"
elif [[ "${1:-}" != "" ]]; then
  echo "usage: $0 [--check]" >&2
  exit 2
fi

if [[ ! -f "$CORE" ]]; then
  echo "missing canonical guidelines: guidelines/core.md" >&2
  exit 1
fi

core_body() {
  tail -n +2 "$CORE" | sed '1{/^$/d;}'
}

render_agent_file() {
  local title="$1"
  printf "# %s\n\n" "$title"
  core_body
}

render_cursor_rule() {
  cat <<'EOF'
---
description: Compact coding-agent guardrails for narrower diffs, protected contracts, honest tests, and verified behavior.
alwaysApply: true
---

# Coding Agent Guidelines

EOF
  core_body
}

render_skill() {
  cat <<'EOF'
---
name: karpathy-guidelines
description: Compact coding-agent guardrails for narrower diffs, protected contracts, honest tests, and verified behavior.
license: MIT
---

# Coding Agent Guidelines

EOF
  core_body
}

write_or_check() {
  local path="$1"
  local renderer="$2"
  local title="${3:-}"
  local tmp

  tmp="$(mktemp)"
  if [[ "$title" == "" ]]; then
    "$renderer" > "$tmp"
  else
    "$renderer" "$title" > "$tmp"
  fi

  if [[ "$MODE" == "check" ]]; then
    if ! cmp -s "$tmp" "$ROOT/$path"; then
      echo "out of sync: $path" >&2
      rm -f "$tmp"
      return 1
    fi
    rm -f "$tmp"
    return 0
  fi

  mkdir -p "$(dirname "$ROOT/$path")"
  cp "$tmp" "$ROOT/$path"
  rm -f "$tmp"
}

status=0
write_or_check "AGENTS.md" render_agent_file "AGENTS.md" || status=1
write_or_check "CLAUDE.md" render_agent_file "CLAUDE.md" || status=1
write_or_check "GEMINI.md" render_agent_file "GEMINI.md" || status=1
write_or_check ".cursor/rules/karpathy-guidelines.mdc" render_cursor_rule || status=1
write_or_check "skills/karpathy-guidelines/SKILL.md" render_skill || status=1

if [[ "$MODE" == "check" ]]; then
  exit "$status"
fi

chmod +x "$ROOT/scripts/sync-guidelines.sh"
