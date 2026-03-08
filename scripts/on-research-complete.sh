#!/bin/bash
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // "."')
ARTIFACT=$(find "$CWD" -name "research-brief.md" -mmin -30 2>/dev/null | head -1)
if [ -n "$ARTIFACT" ]; then
  cat <<EOF
{"systemMessage":"Research brief saved: $ARTIFACT\n\nNext step: Hand off to **info-arch** agent or submit for **design review**.\n\nFull pipeline: https://github.com/SufficientDaikon/sdd-vscode-agents"}
EOF
else
  echo '{"continue":true}'
fi
