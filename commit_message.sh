generate_commit_message() {
  local diff_data="$1"
  local json_diff_data=$(jq -aRs . <<< "$diff_data")
  local data_json=$(jq -cn --arg jsonDiffData "$json_diff_data" '{
    "model": "gpt-4-turbo-preview",
    "messages": [
      {
        "role": "system",
        "content": "You are a commit message assistant. Your task is to generate a concise and informative commit message based on the provided git diff data. Keep your commit inline and less than 50 characters."
      },
      {
        "role": "user",
        "content": $jsonDiffData
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





commit_changes() {
  echo "Ready to commit with the following message:"
  printf "\033[0;36mgit commit -m \"$1\"\033[0m\n"
  echo "Press Enter to proceed or Ctrl+C to abort."
  read
  git add .
  git commit -m "$1"
  echo "Changes committed. ✅"
}






quick_commit_user_flow() {
  local diff_data=$(git diff)
  if [ -z "$diff_data" ]; then
    echo "No changes to commit."
    return
  fi
  local commit_message=$(generate_commit_message "$diff_data")
  commit_changes "$commit_message"
}