#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="$HOME/.claude"

mkdir -p "$CLAUDE_DIR"

ln -sf "$DOTFILES_DIR/claude/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

echo "Linked CLAUDE.md -> $CLAUDE_DIR/CLAUDE.md"

if command -v claude >/dev/null 2>&1; then
  echo "Claude CLI found."

  if [ -f "$DOTFILES_DIR/claude/plugins.txt" ]; then
    while IFS= read -r marketplace; do
      [ -z "$marketplace" ] && continue
      echo "Add marketplace: $marketplace"
      claude /plugin marketplace add "$marketplace" || true
    done < "$DOTFILES_DIR/claude/plugins.txt"
  fi
else
  echo "Claude CLI not found. Install Claude Code first."
fi

echo "Done."