#!/bin/bash

## Description: Setting up TYPO3 CMS on ddev start
## Usage: post-start [args] [flags]
## Example: "ddev post-start"

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
readonly emoji_rocket='🚀'
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

# ==================================
# ===== Start script execution =====
# ==================================

separator
message "${emoji_rocket} Setting up TYPO3 CMS" "${color_magenta}"

separator
status "Install Composer packages ..."
composer i
check_result

separator
status "Install Node.js packages ..."
npm i
check_result

separator
status "Fixing TYPO3 folder structure ..."
vendor/bin/typo3 install:fixfolderstructure
check_result

separator
status "Setting required file and folder permissions ..."
find . -type d -exec chmod 2775 {} + \
  && find . -type f ! -executable -exec chmod 0664 {} + \
  && find . -type f -executable -exec chmod 0775 {} +
check_result

separator
status "Updating TYPO3 database schema ..."
vendor/bin/typo3 database:updateschema safe
check_result

separator
status "Updating TYPO3 language packs ..."
# Allow to fail because of timeouts
vendor/bin/typo3 language:update || (message "TYPO3 language:update allowed to fail" "${color_red}" "${emoji_x}" && exit 0)
check_result

separator
status "Clearing TYPO3 caches ..."
vendor/bin/typo3 cache:flush
check_result

separator
status "Enable pre-commit hooks ..."
git config core.hooksPath assets/git-hooks
check_result

separator
message "${emoji_tada} TYPO3 CMS is ready" "${color_magenta}"
