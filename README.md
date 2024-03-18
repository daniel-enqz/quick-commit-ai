# Quick Commit AI
---
> Just one more tool to generate commit messages, but lightweight and easy to use.

## Note: Customize everything to your needs.

### Installation:

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
- Each flow makes it's own call to OpenAI API
- Each flow has its own outputs for user.

