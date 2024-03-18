generate_summary_message() {
  local commit_messages="$1"
  local json_commit_messages=$(jq -aRs . <<< "$commit_messages")
  local data_json=$(jq -cn --arg jsonCommitMessages "$json_commit_messages" '{
    "model": "gpt-4-turbo-preview",
    "messages": [
      {
        "role": "system",
        "content": "You are a summary assistant. Your task is to generate a concise and informative summary based on the provided commit messages. More than just a list of commit messages, your summary should provide context and a high-level overview of the changes. Explaining the importance of the changes and how they fit into the project is also helpful. Keep your summary inline and less than 300 characters."
      },
      {
        "role": "user",
        "content": $jsonCommitMessages
      }
    ]
  }')

  local response=$(curl -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d "$data_json" \
    "https://api.openai.com/v1/chat/completions")

  echo $response | jq -r '.choices[0].message.content'
}

summary_changes() {
  local summary_message=$(generate_summary_message "$commit_messages")
  printf "\033[0;36m$summary_message\n\033[0m\n"
  echo "Press Enter to copy the summary message to the clipboard or Ctrl+C to cancel."
  read -r
  echo "$summary_message" | pbcopy
  echo "Summary message copied to clipboard. ✅"
}

quick_summary_user_flow() {
  local remote=origin
  local default_branch=$(git remote show $remote | grep 'HEAD branch' | cut -d' ' -f5)

  if [ -z "$default_branch" ]; then
    echo "Default branch not detected, falling back to 'main'."
    default_branch="main"
  fi

  local commit_messages=$(git log $default_branch..HEAD --pretty=format:"%s")
  if [ -z "$commit_messages" ]; then
    echo "No new commits to summarize."
    return
  fi

  summary_changes "$commit_messages"
}