#!/usr/bin/env bash
# sync-test.sh — wipe + recreate a local test copy from the working tree.
#
# The fast loop. A plain directory copy (no git, no network, sub-second), so
# uncommitted edits to CLAUDE.md / context/ / .claude/skills/ flow through
# instantly. Best for iterating on the orientation half of /os-start (the
# briefing) where you don't need the real GitHub clone path.
#
# Default target: ~/Code/claude-code-jobs-test-fast — always overwritten in full.
# Numbered test dirs (test-1, test-2, ...) are reserved for refresh-test.sh,
# which clones from the GitHub remote and requires a push first.
#
# Usage:
#   bash scripts/sync-test.sh                                  # default: ~/Code/claude-code-jobs-test-fast
#   bash scripts/sync-test.sh ~/Code/claude-code-jobs-test-foo # custom path
#
# Workflow:
#   1. Edit this repo
#   2. bash scripts/sync-test.sh
#   3. In the test-fast Claude window: /os-start
#   4. Observe friction, repeat from 1
#
# IMPORTANT: must run from your interactive shell (Terminal app or via the `!`
# prefix in the Claude prompt). Running from inside Claude Code's sandboxed bash
# hits macOS TCC restrictions on com.apple.provenance-tagged files (rm/cp fail
# with "Operation not permitted").
#
# Note: the copy keeps this repo's git remote, so running /os-save inside it will
# push a branch + open a PR on the REAL repo. That's expected when testing the
# PR flow; just delete the test branch/PR afterwards. Use refresh-test.sh when
# you want the true fresh-clone install experience.

set -e

TEST_DIR="${1:-$HOME/Code/claude-code-jobs-test-fast}"
SOURCE_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "Source:    $SOURCE_DIR"
echo "Test dir:  $TEST_DIR"
echo

if [ -d "$TEST_DIR" ]; then
  echo "Removing existing $TEST_DIR"
  rm -rf "$TEST_DIR"
fi

echo "Copying working tree into $TEST_DIR"
cp -R "$SOURCE_DIR" "$TEST_DIR"

echo
echo "Done. Test copy synced from the working tree."
echo "Open $TEST_DIR in a new Claude Code window, then run /os-start."
