#!/usr/bin/env bash
# refresh-test.sh — re-clone the Claude Code Jobs repo into a throwaway folder.
#
# The honest loop. Clones fresh from GitHub over SSH, so it tests the real
# new-contributor install path and catches anything cp -R masks (gitignore
# behaviour, file structure, what a clone actually produces). Requires that
# you've committed + pushed first.
#
# Usage:
#   bash scripts/refresh-test.sh                                 # default: ~/Code/claude-code-jobs-test-1
#   bash scripts/refresh-test.sh ~/Code/claude-code-jobs-test-2  # custom path
#
# Override the repo if the owner/name differs:
#   CCJ_REPO=git@github.com:OWNER/REPO.git bash scripts/refresh-test.sh
#
# Workflow: edit this repo, commit + push, then run this to get a fresh clone and
# test the install experience as a new contributor would.
#
# IMPORTANT: run from your interactive shell (Terminal or `!`), not Claude's
# sandboxed bash — same com.apple.provenance limit as sync-test.sh.

set -e

TEST_DIR="${1:-$HOME/Code/claude-code-jobs-test-1}"
REPO_URL="${CCJ_REPO:-git@github.com:simonconway1979/claude-code-jobs.git}"

echo "Test dir:  $TEST_DIR"
echo "Repo URL:  $REPO_URL"
echo

if [ -d "$TEST_DIR" ]; then
  echo "Removing existing $TEST_DIR"
  rm -rf "$TEST_DIR"
fi

echo "Cloning fresh"
git clone "$REPO_URL" "$TEST_DIR"

echo
echo "Done. Fresh clone ready at:"
echo "  $TEST_DIR"
echo
echo "Open it in Claude Code, then run /os-start."
