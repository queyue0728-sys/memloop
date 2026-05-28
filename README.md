# MemLoop

## Cross-Agent Cross-Device Memory System

**Every time you open a new terminal, on any computer, with any AI agent — it remembers everything you've ever done.**

No more re-explaining. No more lost context. One file. One loop. Infinite memory.

---

## The Problem

You use Claude Code on Windows. You use Codex on Mac. You start a new session. You type `claude` and wait. Then you spend 10 minutes explaining what you were working on, what books you've read, what method you prefer. Repeat every session. Repeat on every machine. Repeat with every agent.

## The Solution

A single Markdown file. Every agent reads it on startup. Every agent writes to it when work is done. Every agent pushes to the same GitHub repo. Pull before work, push after work. That's it.

```
Any machine → git pull → start agent → agent reads MD → work → agent updates MD → git push
    ↓
Next machine → git pull → agent reads latest MD → picks up where you left off → work → push
    ↓
Any other agent → git pull → reads same MD → different model, same memory
```

---

## Quick Start (3 Minutes)

### 1. Create your private GitHub repo

Create a new **private** repository on GitHub. Name it `session-context`.

### 2. Clone this template

```bash
git clone https://github.com/queyue0728-sys/memloop-template.git
cd memloop-template
```

### 3. Run setup

**Windows:**
```powershell
.\setup.bat
```

**Mac / Linux:**
```bash
chmod +x setup.sh && ./setup.sh
```

The script will ask for:
- Your GitHub username
- Your private repo name
- A GitHub Personal Access Token (classic, with `repo` scope)
- Your proxy port (leave blank if none)

### 4. Start working

```bash
git pull          # Get latest memory
claude            # Or codex, or any agent
```

The agent reads `session-context.md`, knows everything about you, and continues from where you left off. After each session, your progress is automatically committed and pushed.

### 5. On another machine

```bash
git clone https://github.com/YOUR_USERNAME/session-context.git
cd session-context
# Run setup.sh or setup.bat again (different machine, different proxy)
git pull
claude
```

Same memory. Different machine. Different agent. Doesn't matter.

---

## What Gets Stored

- Your profile, preferences, work style
- All completed work with timestamps
- Methodology iterations (the system learns how you like things done)
- Reading lists and progress
- Cross-book concept frameworks
- Any insight, correction, or discovery from any session

Nothing is ever lost. Every session builds on every previous session.

---

## Requirements

- Git installed
- An AI agent with **CLI/terminal access** (Claude Code CLI, Codex terminal, etc.)
  - Claude Desktop runs in a sandbox — it can read the MD file but cannot auto-push. Use CLI for full automation.
- A GitHub account
- 3 minutes for setup

---

## Why It Works

The loop is self-reinforcing. Every time you correct the agent's method, that correction is written to the file and pushed. Next session, any agent reads it and applies it. The system gets smarter the more you use it.

```
Work → Feedback → Correction → Record → Push → Next Pull → Better Work
```

---

## FAQ

**Does this work with any AI agent?** Yes. The MD file is plain text. Any agent that can read local files can use it.

**Can I switch between Claude Code and Codex?** Yes. Both read the same file. Different models, shared memory.

**Will it work at an internet cafe?** Yes. `git clone` → `git pull` → work. You won't have auto-push without your token, but you can save work manually.

**Claude Desktop vs CLI — which one do I need?** You need **Claude Code CLI** (terminal). Claude Desktop runs in a sandbox and cannot execute `git push` / `git pull` — it can read and update the MD file, but auto-backup won't work. If you're on Claude Desktop, you'll need to manually `git pull` before each session and `git push` after. Switch to CLI if you want full automation.

**Can the agent auto-push on any platform?** Only with CLI (terminal-based) agents. Desktop/sandboxed agents can read and write the file but cannot access Git. Check your platform's sandbox policy.

**Is my data private?** Your session-context repo is private. Only you can see it.

**Why not just use cloud sync?** Git gives you version history. You can roll back any change. Every modification has a timestamp and a commit message. Cloud sync overwrites. Git archives.

---

## License

MIT — use it, fork it, build on it. Attribution appreciated, not required.

---

[中文](#chinese) | [English](#english)

<a name="chinese"></a>
## MemLoop · 跨终端跨智能体记忆系统

**每次打开新终端，在任何电脑上，用任何智能体——它都记得你做过的一切。**

不再重复解释。不再丢失上下文。一个文件。一个循环。无限记忆。

### 三分钟上手

1. 在 GitHub 创建一个**私有**仓库，命名为 `session-context`
2. 克隆此模板：`git clone https://github.com/queyue0728-sys/memloop-template.git`
3. 运行安装脚本（Windows 运行 `setup.bat`，Mac/Linux 运行 `setup.sh`）——按提示填入用户名、仓库名、token、代理端口
4. 开始工作：`git pull` → 启动智能体 → 自动记忆

### 多机使用

另一台电脑上：`git clone 你的仓库地址` → 运行安装脚本 → `git pull` → 启动智能体。同一份记忆，不同机器，不同智能体。

### 为什么用 Git 而不是云盘

Git 有版本历史。每次修改都有时间戳和提交记录。可以回滚。云盘只能覆盖。Git 归档。

### 重要：CLI vs 桌面版

Claude Desktop 运行在沙盒里，无法执行 `git pull` / `git push`——它能读写 MD 文件，但不能自动备份。需要完全自动化请使用 **Claude Code CLI**（终端版）。桌面版用户可以手动 git pull/push。

### 许可证

MIT · 自由使用、分叉、在此基础上构建。
