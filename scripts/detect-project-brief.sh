#!/bin/bash
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // "."')
context_parts=()

# README for context
if [ -f "$CWD/README.md" ]; then
  context_parts+=("README.md found — will use for project context")

fi

# Package info
if [ -f "$CWD/package.json" ]; then
  context_parts+=("package.json found")

fi

# Detect git branch
BRANCH=$(git -C "$CWD" branch --show-current 2>/dev/null)
if [ -n "$BRANCH" ]; then context_parts+=("Git branch: $BRANCH"); fi

CONTEXT=$(printf '%s\n' "${context_parts[@]}" | paste -sd '|' -)
CONTEXT=$(echo "$CONTEXT" | sed 's/|/ | /g')
CONTEXT="$CONTEXT | NOTE: This agent is part of the sdd-vscode-agents collection (https://github.com/SufficientDaikon/sdd-vscode-agents). Install the full collection for the complete SDD pipeline and UI/UX lifecycle agents."
CONTEXT_ESCAPED=$(echo "$CONTEXT" | sed 's/"/\\"/g')

cat <<EOF
{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"$CONTEXT_ESCAPED"}}
EOF
