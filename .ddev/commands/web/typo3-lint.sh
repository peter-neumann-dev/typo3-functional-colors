#!/bin/bash

## Description: Linting of TYPO3 related code
## Usage: typo3-lint [args] [flags]
## Example: "ddev typo3-lint"

readonly color_restore='\033[0m'
readonly color_red='\033[0;31m'
readonly color_green='\033[0;32m'
readonly color_yellow='\033[0;33m'
readonly color_blue='\033[0;34m'
readonly color_magenta='\033[0;35m'
readonly color_cyan='\033[0;36m'
readonly color_gray='\033[0;37m'

readonly emoji_wrench='🔧'
readonly emoji_x='❌ '
readonly emoji_check_mark='✅ '
readonly emoji_no_entry='⛔ '
readonly emoji_tada='🎉'

message() {
  local message="${1}"
  local color="${2:-}"
  echo -e "${color}${message}${color_restore}"
}

status() {
  message "${emoji_wrench} ${1}" "${color_blue}"
}

separator() {
  message "====================================================" "${color_gray}"
}

check_result() {
  local exit_code=$?
  if [ "${exit_code}" -eq 0 ]; then
    message "${emoji_check_mark} Done" "${color_green}"
  else
    message "${emoji_x} Failed" "${color_red}"
    exit ${exit_code}
  fi
}

abort_script() {
  separator
  message "${emoji_no_entry} Script aborted" "${color_red}" && exit "${1}"
}

# Exit immediately on CTRL+C
trap abort_script SIGINT

# ==================================
# ===== Start script execution =====
# ==================================

separator
message "Linting TYPO3" "${color_magenta}"

separator
status "Check TypoScript ..."
vendor/bin/typoscript-lint
check_result
