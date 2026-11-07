#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_DIR="${1:-${CODEX_HOME:-$HOME/.codex}}"
PRESERVED_PATHS=0

link_config() {
  local source="$1"
  local target="$2"

  if [ -L "$target" ]; then
    if [ "$(readlink "$target")" = "$source" ]; then
      echo "Already linked $target -> $source"
      return
    fi

    ln -sfn "$source" "$target"
    echo "Relinked $target -> $source"
    return
  fi

  if [ -e "$target" ]; then
    echo "Preserved existing path: $target" >&2
    echo "  Merge manually from: $source" >&2
    PRESERVED_PATHS=$((PRESERVED_PATHS + 1))
    return
  fi

  ln -s "$source" "$target"
  echo "Linked $target -> $source"
}

if [ -e "$CODEX_DIR/skills" ] && [ ! -d "$CODEX_DIR/skills" ]; then
  echo "Cannot install skills: $CODEX_DIR/skills is not a directory." >&2
  exit 1
fi

if [ -e "$CODEX_DIR/agents" ] && [ ! -d "$CODEX_DIR/agents" ]; then
  echo "Cannot install agents: $CODEX_DIR/agents is not a directory." >&2
  exit 1
fi

mkdir -p "$CODEX_DIR/skills" "$CODEX_DIR/agents"

link_config "$DOTFILES_DIR/codex/config.toml" "$CODEX_DIR/config.toml"
link_config "$DOTFILES_DIR/codex/AGENTS.md" "$CODEX_DIR/AGENTS.md"

for skill_dir in "$DOTFILES_DIR"/codex/skills/*; do
  [ -d "$skill_dir" ] || continue
  link_config "$skill_dir" "$CODEX_DIR/skills/$(basename "$skill_dir")"
done

for agent_file in "$DOTFILES_DIR"/codex/agents/*.toml; do
  [ -f "$agent_file" ] || continue
  link_config "$agent_file" "$CODEX_DIR/agents/$(basename "$agent_file")"
done

if command -v codex >/dev/null 2>&1; then
  echo "Codex CLI found."
else
  echo "Codex CLI not found. Install it separately."
fi

if [ "$PRESERVED_PATHS" -gt 0 ]; then
  echo "Done. Preserved $PRESERVED_PATHS existing path(s); review the merge messages above."
else
  echo "Done."
fi
