#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_DIR="${1:-${CODEX_HOME:-$HOME/.codex}}"

link_config() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Refusing to replace existing path: $target" >&2
    return 1
  fi

  ln -sfn "$source" "$target"
  echo "Linked $target -> $source"
}

mkdir -p "$CODEX_DIR/skills"

link_config "$DOTFILES_DIR/codex/AGENTS.md" "$CODEX_DIR/AGENTS.md"

for skill_dir in "$DOTFILES_DIR"/codex/skills/*; do
  [ -d "$skill_dir" ] || continue
  link_config "$skill_dir" "$CODEX_DIR/skills/$(basename "$skill_dir")"
done

if command -v codex >/dev/null 2>&1; then
  echo "Codex CLI found."
else
  echo "Codex CLI not found. Install it separately."
fi

echo "Done."
