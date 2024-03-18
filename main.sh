#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"

function quick_commit_ai {
  source "${SCRIPT_DIR}/commit_message.sh"
  source "${SCRIPT_DIR}/branch_summary_message.sh"

  if [[ "$1" == "--commit" ]]; then
    quick_commit_user_flow
  elif [[ "$1" == "--summary" ]]; then
    quick_summary_user_flow
  else
    echo "Invalid option. Use --commit for individual commits or --summary for a summary of all commits."
  fi
}

