#!/bin/bash
# MemLoop Setup - Mac / Linux
# Run once per machine. Configures git credentials, proxy, and backup alias.

echo "========================================"
echo "  MemLoop Setup - Mac / Linux"
echo "========================================"
echo ""

# 1. GitHub username
read -p "GitHub username: " GH_USER

# 2. Repo name
read -p "Repository name (e.g. session-context): " GH_REPO

# 3. Personal Access Token
echo ""
echo "A GitHub Personal Access Token is needed for auto-push."
echo "If you don't have one:"
echo "  github.com → Settings → Developer settings → Personal access tokens → Tokens (classic)"
echo "  → Generate new token (classic) → check 'repo' → Generate"
echo ""
read -p "GitHub token (ghp_...): " GH_TOKEN

# 4. Proxy
read -p "Proxy port (e.g. 7890, leave blank if none): " PROXY_PORT

echo ""
echo "Configuring..."

# Store credentials in ~/.git-credentials
echo "https://${GH_USER}:${GH_TOKEN}@github.com" > ~/.git-credentials
chmod 600 ~/.git-credentials

# Configure git globally
git config --global credential.helper store

if [ -n "$PROXY_PORT" ]; then
    git config --global http.proxy "http://127.0.0.1:${PROXY_PORT}"
    git config --global https.proxy "http://127.0.0.1:${PROXY_PORT}"
    echo "Proxy configured: 127.0.0.1:${PROXY_PORT}"
fi

# Create git backup alias
git config --global alias.backup '!git add session-context.md && git commit -m "auto-backup" && git -c http.sslVerify=false push'
echo "Git alias 'git backup' configured"

# Set remote if in the right directory
if [ -f "session-context.md" ]; then
    git remote remove origin 2>/dev/null
    git remote add origin "https://github.com/${GH_USER}/${GH_REPO}.git"
    echo "Remote set to: https://github.com/${GH_USER}/${GH_REPO}.git"
else
    echo ""
    echo "Run 'git clone https://github.com/${GH_USER}/${GH_REPO}.git' to clone your repo."
fi

echo ""
echo "========================================"
echo "  Setup Complete"
echo "========================================"
echo ""
echo "Workflow:"
echo "  1. cd 你的仓库目录"
echo "  2. git pull"
echo "  3. 启动智能体 (claude / codex / ...)"
echo "  4. 工作完成后智能体自动执行 git backup"
echo ""
echo "On another machine: git clone → run this script again → git pull → start agent"
echo "========================================"
