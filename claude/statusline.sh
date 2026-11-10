#!/bin/bash
input=$(cat)

# Colors
CYAN='\033[36m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'
DIM='\033[2m'; RESET='\033[0m'

# --- Extract fields ---
MODEL=$(echo "$input" | jq -r '.model.display_name // "?"')
PROJECT_DIR=$(echo "$input" | jq -r '.workspace.project_dir // ""')
CURRENT_DIR=$(echo "$input" | jq -r '.workspace.current_dir // ""')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
DURATION_MS=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')
LINES_ADDED=$(echo "$input" | jq -r '.cost.total_lines_added // 0')
LINES_REMOVED=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
AGENT=$(echo "$input" | jq -r '.agent.name // empty')

# --- Directory (relative to project) ---
if [ "$CURRENT_DIR" = "$PROJECT_DIR" ]; then
  DIR_NAME=$(basename "$CURRENT_DIR")
else
  REL_PATH="${CURRENT_DIR#"$PROJECT_DIR"/}"
  DIR_NAME="$(basename "$PROJECT_DIR")/$REL_PATH"
fi

# --- Git info ---
GIT_INFO=""
if git rev-parse --git-dir > /dev/null 2>&1; then
  BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null || echo '?')
  STAGED=$(git diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
  MODIFIED=$(git diff --numstat 2>/dev/null | wc -l | tr -d ' ')
  GIT_INFO=" | ${CYAN}${BRANCH}${RESET}"
  [ "$STAGED" -gt 0 ] && GIT_INFO="${GIT_INFO} ${GREEN}+${STAGED}${RESET}"
  [ "$MODIFIED" -gt 0 ] && GIT_INFO="${GIT_INFO} ${YELLOW}~${MODIFIED}${RESET}"
fi

# --- Lines changed ---
LINES_INFO=""
if [ "$LINES_ADDED" -gt 0 ] || [ "$LINES_REMOVED" -gt 0 ]; then
  LINES_INFO=" | ${GREEN}+${LINES_ADDED}${RESET}/${RED}-${LINES_REMOVED}${RESET}"
fi

# --- Agent indicator ---
AGENT_INFO=""
[ -n "$AGENT" ] && AGENT_INFO=" ${DIM}(${AGENT})${RESET}"

# --- Context bar with color ---
if [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

BAR_WIDTH=10
FILLED=$((PCT * BAR_WIDTH / 100))
EMPTY=$((BAR_WIDTH - FILLED))
if [ "$(uname)" = "Darwin" ]; then FILL_CHAR='█'; EMPTY_CHAR='░'; else FILL_CHAR='#'; EMPTY_CHAR='.'; fi
BAR=""
[ "$FILLED" -gt 0 ] && BAR=$(printf "%${FILLED}s" | tr ' ' "$FILL_CHAR")
[ "$EMPTY" -gt 0 ] && BAR="${BAR}$(printf "%${EMPTY}s" | tr ' ' "$EMPTY_CHAR")"

# --- Cost & duration ---
COST_FMT=$(printf '$%.2f' "$COST")
DURATION_SEC=$((DURATION_MS / 1000))
MINS=$((DURATION_SEC / 60))
SECS=$((DURATION_SEC % 60))

# --- Output ---
echo -e "[${CYAN}${MODEL}${RESET}]${AGENT_INFO} ${DIR_NAME}${GIT_INFO}${LINES_INFO}"
echo -e "${BAR_COLOR}${BAR}${RESET} ${PCT}% | ${YELLOW}${COST_FMT}${RESET} | ${DIM}${MINS}m ${SECS}s${RESET}"
