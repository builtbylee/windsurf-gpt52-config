#!/bin/bash

# Windsurf GPT-5.2 Optimization Kit - Uninstaller

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║    Windsurf GPT-5.2 Optimization Kit - Uninstaller        ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

WINDSURF_BASE="$HOME/.codeium/windsurf"
MEMORIES_DIR="$WINDSURF_BASE/memories"
SKILLS_DIR="$WINDSURF_BASE/skills"
WORKFLOWS_DIR="$WINDSURF_BASE/windsurf/workflows"

# Skills to remove
SKILLS=("build-android" "commit-changes" "plan-mode" "review-code" "update-docs" "workflow-full" "workflow-quick")

# Workflows to remove
WORKFLOWS=("build.md" "commit.md" "quick-fix.md" "review.md" "workflow-protocol.md")

echo -e "${YELLOW}This will remove:${NC}"
echo "  - global_rules.md"
echo "  - 7 skills (build-android, commit-changes, etc.)"
echo "  - 5 workflows (build, commit, etc.)"
echo ""

read -p "Continue? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

# Remove global rules
if [ -f "$MEMORIES_DIR/global_rules.md" ]; then
    echo -e "${GREEN}Removing global rules...${NC}"
    rm "$MEMORIES_DIR/global_rules.md"
fi

# Remove skills
echo -e "${GREEN}Removing skills...${NC}"
for skill in "${SKILLS[@]}"; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        echo "  - $skill"
        rm -rf "$SKILLS_DIR/$skill"
    fi
done

# Remove workflows
echo -e "${GREEN}Removing workflows...${NC}"
for workflow in "${WORKFLOWS[@]}"; do
    if [ -f "$WORKFLOWS_DIR/$workflow" ]; then
        echo "  - $workflow"
        rm "$WORKFLOWS_DIR/$workflow"
    fi
done

echo ""
echo -e "${GREEN}✓ Uninstall complete!${NC}"
echo "Restart Windsurf to apply changes."
echo ""
