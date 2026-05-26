@echo off
chcp 65001 >nul
echo ========================================
echo   MemLoop Setup - Windows
echo ========================================
echo.

set /p GH_USER="GitHub username: "
set /p GH_REPO="Repository name (e.g. session-context): "
echo.
echo A GitHub Personal Access Token is needed for auto-push.
echo If you don't have one:
echo   github.com → Settings → Developer settings → Personal access tokens → Tokens (classic)
echo   → Generate new token (classic) → check 'repo' → Generate
echo.
set /p GH_TOKEN="GitHub token (ghp_...): "
set /p PROXY_PORT="Proxy port (e.g. 7890, leave blank if none): "
echo.
echo Configuring...

REM Store credentials
echo https://%GH_USER%:%GH_TOKEN%@github.com> %USERPROFILE%\.git-credentials

REM Configure git globally
git config --global credential.helper store

if not "%PROXY_PORT%"=="" (
    git config --global http.proxy http://127.0.0.1:%PROXY_PORT%
    git config --global https.proxy http://127.0.0.1:%PROXY_PORT%
    echo Proxy configured: 127.0.0.1:%PROXY_PORT%
)

REM Create git backup alias
git config --global alias.backup "!git add session-context.md && git commit -m \"auto-backup\" && git -c http.sslVerify=false push"
echo Git alias 'git backup' configured

REM Set remote if in the right directory
if exist "session-context.md" (
    git remote remove origin 2>nul
    git remote add origin https://github.com/%GH_USER%/%GH_REPO%.git
    echo Remote set to: https://github.com/%GH_USER%/%GH_REPO%.git
) else (
    echo.
    echo Run 'git clone https://github.com/%GH_USER%/%GH_REPO%.git' to clone your repo.
)

echo.
echo ========================================
echo   Setup Complete
echo ========================================
echo.
echo Workflow:
echo   1. cd 你的仓库目录
echo   2. git pull
echo   3. 启动智能体 ^(claude / codex / ...^)
echo   4. 工作完成后智能体自动执行 git backup
echo.
echo On another machine: git clone → run this script again → git pull → start agent
echo ========================================
pause
