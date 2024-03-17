#!/bin/bash

SCRIPT_DIR="$(pwd)/main.sh"
chmod +x $SCRIPT_DIR
echo "source $SCRIPT_DIR" >> ~/.zshrc

# Last messages to user:
printf "\033[0;32m------------------------------------------------------\033[0m\n"
printf "\033[1;32mSetup Complete! ✅\033[0m\n"
printf "Added: source $SCRIPT_DIR to: ~/.zshrc\n"
printf "\033[0;36mYou can consider adding aliases like:\033[0m\n"
printf "\033[0;36mgac=alias quick_commit_ai --commit\033[0m\n"
printf "\033[0;36mgas=alias quick_commit_ai --squash\033[0m\n"
