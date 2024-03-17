#!/bin/bash

SCRIPT_DIR="$(pwd)/main.sh"
chmod +x $SCRIPT_DIR
echo "source $SCRIPT_DIR" >> ~/.zshrc

echo "Added source $SCRIPT_DIR to ~/.zshrc"
echo "Call quick_commit_ai to use the script"