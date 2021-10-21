#!/bin/bash
# Declare colors
GREEN='\033[0;32m'
BLUE='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Declare base pathes
STOIC_REPO="git@github.com:nikbrunner/obsidian-stoic-theme"
STOIC_BUILD_BRANCH="#main"
STOIC_REPO_BUILD_PATH="$STOIC_REPO/build"

OBSIDIAN_PATH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
OBSIDIAN_CONFIG_FOLDER_DESKTOP=".obsidian.desktop.nosync"
OBSIDIAN_CONFIG_FOLDER_MOBILE=".obsidian"
DEV_NOTES_OBSIDIAN_CONFIG_FOLDER_DESKTOP=".obsidian"

PRIVATE_NOTES_PATH="$OBSIDIAN_PATH/notes" 
# I moved my work notes to my normal repositories path to only sync my content to GitHub and not any other cloud plattform
DEV_NOTES_PATH="$HOME/Documents/dev/repositories/own/dev-notes" 

THEMES_FOLDER_DESKTOP="$OBSIDIAN_CONFIG_FOLDER_DESKTOP/themes"
DEV_NOTES_THEMES_FOLDER_DESKTOP="$OBSIDIAN_CONFIG_FOLDER_DESKTOP/themes"
THEMES_FOLDER_MOBILE="$OBSIDIAN_CONFIG_FOLDER_MOBILE/themes"

# Declare filenames
STOIC_FILE="Stoic.css"
STOIC_PUBLISH_FILE="publish.css"

# Concat complex pathes
PRIVATE_NOTES_STOIC_FILE_DESKTOP="$PRIVATE_NOTES_PATH/$THEMES_FOLDER_DESKTOP/$STOIC_FILE"
PRIVATE_NOTES_STOIC_FILE_MOBILE="$PRIVATE_NOTES_PATH/$THEMES_FOLDER_MOBILE/$STOIC_FILE"
DEV_NOTES_STOIC_FILE_DESKTOP="$DEV_NOTES_PATH/$DEV_NOTES_THEMES_FOLDER_DESKTOP/$STOIC_FILE"
DEV_NOTES_STOIC_FILE_MOBILE="$DEV_NOTES_PATH/$THEMES_FOLDER_MOBILE/$STOIC_FILE"

PRIVATE_NOTES_STOIC_PUBLISH_FILE="$PRIVATE_NOTES_PATH/$STOIC_PUBLISH_FILE"
DEV_NOTES_STOIC_PUBLISH_FILE="$DEV_NOTES_PATH/$STOIC_PUBLISH_FILE"

function log_info () {
    echo "${BLUE}> ${1}${NC}"
}

function log_warning () {
    echo "${RED}${1}${NC}"
}

function log_file_not_found () {
    log_warning "File not found! \"$1\"" 
}

function log_success () {
    echo "${GREEN}${1}${NC}"
}

log_info "Checking old version of the Obsidian Stoic Theme"

# Remove old theme from private notes
## notes/Stoic.css Theme Desktop
if [ ! -f "$PRIVATE_NOTES_STOIC_FILE_DESKTOP" ]; then
    log_file_not_found "$PRIVATE_NOTES_STOIC_FILE_DESKTOP"
else 
    log_info "Removing old file.. $PRIVATE_NOTES_STOIC_FILE_DESKTOP"
    rm "$PRIVATE_NOTES_STOIC_FILE_DESKTOP"
fi

## notes/Stoic.css Theme Mobile
if [ ! -f "$PRIVATE_NOTES_STOIC_FILE_MOBILE" ]; then
    log_file_not_found "$PRIVATE_NOTES_STOIC_FILE_MOBILE"
else 
    log_info "Removing old file.. $PRIVATE_NOTES_STOIC_FILE_MOBILE"
    rm "$PRIVATE_NOTES_STOIC_FILE_MOBILE"
fi

## notes/publish.css Theme 
if [ ! -f "$PRIVATE_NOTES_STOIC_PUBLISH_FILE" ]; then
    log_file_not_found "$PRIVATE_NOTES_STOIC_PUBLISH_FILE"
else 
    log_info "Removing old file.. $PRIVATE_NOTES_STOIC_PUBLISH_FILE"
    rm "$PRIVATE_NOTES_STOIC_PUBLISH_FILE"
fi

# Remove old theme from dev notes
## dev-notes/Stoic.css Theme Desktop
if [ ! -f "$DEV_NOTES_STOIC_FILE_DESKTOP" ]; then
    log_file_not_found "$DEV_NOTES_STOIC_FILE_DESKTOP"
else 
    log_info "Removing old file.. $DEV_NOTES_STOIC_FILE_DESKTOP" 
    rm "$DEV_NOTES_STOIC_FILE_DESKTOP" 
fi

## dev-notes/Stoic.css Theme Mobile
if [ ! -f "$DEV_NOTES_STOIC_FILE_MOBILE" ]; then
    log_file_not_found "$DEV_NOTES_STOIC_FILE_MOBILE"
else 
    log_info "Removing old file.. $DEV_NOTES_STOIC_FILE_MOBILE" 
    rm "$DEV_NOTES_STOIC_FILE_MOBILE" 
fi

## dev-notes/publish.css Theme 
if [ ! -f "$DEV_NOTES_STOIC_PUBLISH_FILE" ]; then
    log_file_not_found "$DEV_NOTES_STOIC_PUBLISH_FILE"
else 
    log_info "Removing old file.. $DEV_NOTES_STOIC_PUBLISH_FILE"
    rm "$DEV_NOTES_STOIC_PUBLISH_FILE"
fi

log_info "Get current updates version of the Obsidian Stoic Theme"

## New Theme File Desktop
degit "$STOIC_REPO_BUILD_PATH/$STOIC_FILE$STOIC_BUILD_BRANCH" "$PRIVATE_NOTES_STOIC_FILE_DESKTOP"
degit "$STOIC_REPO_BUILD_PATH/$STOIC_FILE$STOIC_BUILD_BRANCH" "$DEV_NOTES_STOIC_FILE_DESKTOP"

## New Theme File Mobile
degit "$STOIC_REPO_BUILD_PATH/$STOIC_FILE$STOIC_BUILD_BRANCH" "$PRIVATE_NOTES_STOIC_FILE_MOBILE"
degit "$STOIC_REPO_BUILD_PATH/$STOIC_FILE$STOIC_BUILD_BRANCH" "$DEV_NOTES_STOIC_FILE_MOBILE"

## New publish file for both
degit "$STOIC_REPO_BUILD_PATH/$STOIC_PUBLISH_FILE$STOIC_BUILD_BRANCH" "$PRIVATE_NOTES_STOIC_PUBLISH_FILE"
degit "$STOIC_REPO_BUILD_PATH/$STOIC_PUBLISH_FILE$STOIC_BUILD_BRANCH" "$DEV_NOTES_STOIC_PUBLISH_FILE"

log_success "Stoic Theme successfully updated"
