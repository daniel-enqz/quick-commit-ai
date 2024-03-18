# Quick Commit AI
---
> Just one more tool to generate commit messages, but lightweight, easy to use and customizable.



https://github.com/daniel-enqz/quick-commit-ai/assets/72522628/485965ee-90de-40f4-bf88-46201dbbe0ef




## Note: Customize everything to your needs.

### ⚡️ Quick Installation:

```bash
git clone git@github.com:daniel-enqz/quick-commit-ai.git
```

```bash
cd quick-commit-ai
```

```bash
sh setup.sh
```

### Features:

#### ✨ Generate AI commit messages based on your changes:

```bash
quick-commit-ai --commit
```

#### ✨ Generate a summary from all the work you've made on your branch:
> Useful when you need a message for a pull request or squash commits.

```bash
quick-commit-ai --summary
```

### Customize:
- Add more flows in `main.sh`
- Tune prompts in: `branch_summary_flow.sh` or `commit_flow.sh`
- Each flow makes it's own request to OpenAI: (Ex. `commit_message_request`)
- Each flow has its own output for user. (Ex. `commit_outpu`)

