#!/bin/bash

# Windsurf GPT-5.2 Optimization Kit - Installer
# https://github.com/YOUR_USERNAME/windsurf-config

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║     Windsurf GPT-5.2 Optimization Kit - Installer         ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Detect script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Windsurf paths
WINDSURF_BASE="$HOME/.codeium/windsurf"
MEMORIES_DIR="$WINDSURF_BASE/memories"
SKILLS_DIR="$WINDSURF_BASE/skills"
WORKFLOWS_DIR="$WINDSURF_BASE/windsurf/workflows"

# Check if Windsurf directory exists
if [ ! -d "$WINDSURF_BASE" ]; then
    echo -e "${RED}Error: Windsurf directory not found at $WINDSURF_BASE${NC}"
    echo "Please install Windsurf first: https://windsurf.com/"
    exit 1
fi

echo -e "${YELLOW}Installing to:${NC}"
echo "  Rules:     $MEMORIES_DIR"
echo "  Skills:    $SKILLS_DIR"
echo "  Workflows: $WORKFLOWS_DIR"
echo ""

# Create directories if they don't exist
mkdir -p "$MEMORIES_DIR"
mkdir -p "$SKILLS_DIR"
mkdir -p "$WORKFLOWS_DIR"

# Backup existing files
BACKUP_DIR="$WINDSURF_BASE/backup_$(date +%Y%m%d_%H%M%S)"
if [ -f "$MEMORIES_DIR/global_rules.md" ] || [ -d "$SKILLS_DIR" ] || [ -d "$WORKFLOWS_DIR" ]; then
    echo -e "${YELLOW}Backing up existing configuration to $BACKUP_DIR${NC}"
    mkdir -p "$BACKUP_DIR"
    [ -f "$MEMORIES_DIR/global_rules.md" ] && cp "$MEMORIES_DIR/global_rules.md" "$BACKUP_DIR/"
    [ -d "$SKILLS_DIR" ] && cp -r "$SKILLS_DIR" "$BACKUP_DIR/"
    [ -d "$WORKFLOWS_DIR" ] && cp -r "$WORKFLOWS_DIR" "$BACKUP_DIR/"
fi

# Install global rules
echo -e "${GREEN}Installing global rules...${NC}"
cp "$REPO_DIR/global_rules.md" "$MEMORIES_DIR/"

# Install skills
echo -e "${GREEN}Installing skills...${NC}"
for skill_dir in "$REPO_DIR/skills"/*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        echo "  - $skill_name"
        mkdir -p "$SKILLS_DIR/$skill_name"
        cp -r "$skill_dir"* "$SKILLS_DIR/$skill_name/"
    fi
done

# Install workflows
echo -e "${GREEN}Installing workflows...${NC}"
for workflow_file in "$REPO_DIR/workflows"/*.md; do
    if [ -f "$workflow_file" ]; then
        workflow_name=$(basename "$workflow_file")
        echo "  - $workflow_name"
        cp "$workflow_file" "$WORKFLOWS_DIR/"
    fi
done

echo ""
echo -e "${GREEN}✓ Installation complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Restart Windsurf"
echo "  2. Test with: /workflow-protocol or @build-android"
echo ""
echo "For usage guide, see: README.md"
echo ""
