#!/bin/bash

# Copy vim configuration files from home directory to current directory
cp ~/.ideavimrc .ideavimrc
cp ~/.vsvimrc .vsvimrc
cp ~/Library/Application\ Support/Code/User/settings.json settings.json
cp ~/.vimrc .vimrc

echo "Copied .ideavimrc, .vsvimrc, .vscvimrc, and .vimrc from home directory to current directory"