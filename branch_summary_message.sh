  # Function to generate a summary based on commit messages
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

  # Function to get commit messages since divergence from the default branch
  get_commit_messages_since_divergence() {
    local base_branch="$1"
    git log $base_branch..HEAD --pretty=format:"%s"
  }


