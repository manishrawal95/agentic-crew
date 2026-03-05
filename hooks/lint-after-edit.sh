#!/bin/bash
# PostToolUse hook: auto type-check after file edits
# Portable — works in any project with tsconfig.json or Python files
# Reads JSON from stdin (Claude Code hook protocol)

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
CWD=$(echo "$INPUT" | jq -r '.cwd // empty')

[ -z "$FILE_PATH" ] && exit 0

# TypeScript/JavaScript → run tsc
if [[ "$FILE_PATH" =~ \.(tsx?|jsx?)$ ]]; then
  # Find nearest tsconfig.json
  TSCONFIG_DIR="$CWD"
  if [ -f "$CWD/frontend/tsconfig.json" ]; then
    TSCONFIG_DIR="$CWD/frontend"
  elif [ -f "$CWD/tsconfig.json" ]; then
    TSCONFIG_DIR="$CWD"
  else
    exit 0  # No tsconfig, skip
  fi

  OUTPUT=$(cd "$TSCONFIG_DIR" && npx tsc --noEmit --pretty 2>&1 | tail -20)
  if [ $? -ne 0 ]; then
    echo "TypeScript errors after editing $FILE_PATH:" >&2
    echo "$OUTPUT" >&2
    exit 2  # Feed errors back to Claude for auto-fix
  fi
fi

# Python → syntax check
if [[ "$FILE_PATH" =~ \.py$ ]]; then
  OUTPUT=$(python3 -c "import py_compile; py_compile.compile('$FILE_PATH', doraise=True)" 2>&1)
  if [ $? -ne 0 ]; then
    echo "Python syntax error in $FILE_PATH:" >&2
    echo "$OUTPUT" >&2
    exit 2
  fi
fi

exit 0
