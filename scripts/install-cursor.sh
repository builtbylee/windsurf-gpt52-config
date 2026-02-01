#!/bin/bash

# Cursor IDE Adapter - Install rules as .cursorrules

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║      GPT-5.2 Optimization Kit - Cursor Adapter            ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Cursor uses .cursorrules in project root or ~/.cursor/rules/
CURSOR_GLOBAL="$HOME/.cursor/rules"

echo "This script installs global rules for Cursor IDE."
echo ""
echo "Options:"
echo "  1. Install to current project (.cursorrules)"
echo "  2. Install globally (~/.cursor/rules/)"
echo ""

read -p "Choose option (1/2): " -n 1 -r
echo ""

if [[ $REPLY == "1" ]]; then
    TARGET=".cursorrules"
    if [ -f "$TARGET" ]; then
        echo -e "${YELLOW}Backing up existing .cursorrules${NC}"
        cp "$TARGET" "$TARGET.backup"
    fi
    cp "$REPO_DIR/global_rules.md" "$TARGET"
    echo -e "${GREEN}✓ Installed to .cursorrules${NC}"
elif [[ $REPLY == "2" ]]; then
    mkdir -p "$CURSOR_GLOBAL"
    cp "$REPO_DIR/global_rules.md" "$CURSOR_GLOBAL/gpt52-rules.md"
    echo -e "${GREEN}✓ Installed to $CURSOR_GLOBAL/gpt52-rules.md${NC}"
else
    echo "Invalid option."
    exit 1
fi

echo ""
echo -e "${YELLOW}Note: Cursor doesn't support Skills/Workflows like Windsurf.${NC}"
echo "The rules file will provide behavioral guidelines only."
echo ""
