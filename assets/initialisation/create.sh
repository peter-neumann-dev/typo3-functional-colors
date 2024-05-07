#!/bin/bash

## Description: Creates initialisation assets
## Example: Run from project root "./assets/initialisation/create.sh"

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
readonly emoji_rocket='🚀'

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

# ===========================
# ===== Starting script =====
# ===========================

separator
message "${emoji_rocket} Creating initialisation assets ..." "${color_magenta}"

separator
status "Getting sample files from fileadmin ..."
rsync -avzhP --delete --exclude '*.webp' public/fileadmin/sample_data/ assets/initialisation/fileadmin/sample_data/
check_result

separator
status "Getting initial database ..."
ddev exec mysqldump -h db --password=db -u db --ignore-table=db.be_users --ignore-table=db.be_sessions --ignore-table=db.fe_sessions db | gzip > assets/initialisation/database.sql.gz
check_result

separator
message "${emoji_tada} Initialisation assets successfully created" "${color_magenta}"
separator
