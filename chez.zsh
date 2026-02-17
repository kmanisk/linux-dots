#!/usr/bin/env zsh

# Show chezmoi status
function st() {
    chezmoi status
}

# Show managed files
function chm() {
    chezmoi managed
}

# Add a specific path
function cadd() {
    local path="$1"
    if [[ -z "$path" ]]; then
        echo "Usage: cadd <path>"
        return 1
    fi
    /usr/bin/chezmoi add "$path"
}

# Forget deleted files (DA)
function dfor() {
    deleted_files=$(chezmoi status | grep '^DA' | awk '{print $2}')

    for file in ${(f)deleted_files}; do
        absolute_path="$HOME/$file"
        echo "Forgetting $absolute_path"
        chezmoi forget "$absolute_path"
    done
}

# Add modified files (MM)
function madd() {
    modified_files=$(chezmoi status | grep '^MM' | awk '{print $2}')

    for file in ${(f)modified_files}; do
        absolute_path="$HOME/$file"
        echo "Adding $absolute_path"
        chezmoi add "$absolute_path"
    done
}

# Push all changes to git
function dp() {
    echo "Starting automation..."
    cd "$HOME/.local/share/chezmoi" || return
    git add .
    git commit -m "added lazily .files"
    git push -u origin master
    cd "$HOME" || return
}

# Full automation function
function dall() {
    echo "Changes Done..."
    st
    echo "Adding all the changes to dotfiles repo..."

    # Forget deleted files
    if [[ $(chezmoi status | grep '^DA') ]]; then
        echo "Deleting removed files from dotfiles repo..."
        dfor
        echo
    fi

    # Add modified files
    madd
    echo
    echo "Pushing everything..."
    dp
}

# added for testing
