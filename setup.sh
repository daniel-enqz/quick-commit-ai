#!/bin/bash

SCRIPT_DIR="$(pwd)/main.sh"
chmod +x $SCRIPT_DIR
echo "source $SCRIPT_DIR" >> ~/.zshrc

printf "Please enter your OpenAI API key: "
read OPENAI_API_KEY
echo "export OPENAI_API_KEY=$OPENAI_API_KEY" >> ~/.zshrc

printf "\033[0;32m------------------------------------------------------\033[0m\n"
printf "\033[1;32mSetup Complete! ✅\033[0m\n"
printf "🐦‍🔥 Added: source $SCRIPT_DIR to: ~/.zshrc\n"
printf "🐦‍🔥 Added: OPENAI_API_KEY to: ~/.zshrc\n"
printf "👆 Move this to anywhere that fits your needs\n"
printf "\033[0;36mYou can consider adding aliases like:\033[0m\n"
printf "\033[0;36mgac=alias quick_commit_ai --commit\033[0m\n"
printf "\033[0;36mgas=alias quick_commit_ai --summary\033[0m\n"