#!/bin/bash
# Wayen AI Tools Installer
# 一键安装常用 AI 开发工具

echo "═══════════════════════════════════════"
echo "  Wayen AI Tools Installer"
echo "═══════════════════════════════════════"
echo ""

install_claude_code() {
    echo "🔧 Claude Code..."
    if command -v claude &> /dev/null; then
        echo "  ✓ 已安装"
    else
        echo "  安装命令: npm install -g @anthropic-ai/claude-code"
        echo "  或使用: brew install claude-code (如果有)"
    fi
}

install_codex() {
    echo "🔧 OpenAI Codex CLI..."
    if command -v codex &> /dev/null; then
        echo "  ✓ 已安装"
    else
        echo "  安装命令: npm install -g @openai/codex"
        echo "  或: brew install --cask codex"
    fi
}

install_loki_mode() {
    echo "🔧 Loki Mode (multi-agent)..."
    if [ -d "$HOME/.claude/skills/loki-mode" ]; then
        echo "  ✓ 已安装"
    else
        echo "  安装命令:"
        echo "    git clone https://github.com/asklokesh/loki-mode.git ~/.claude/skills/loki-mode"
        echo "    或使用: npm install -g loki-mode"
    fi
}

install_aider() {
    echo "🔧 Aider (AI pair programming)..."
    if command -v aider &> /dev/null; then
        echo "  ✓ 已安装"
    else
        echo "  安装命令: pip install aider-chat"
    fi
}

install_continue() {
    echo "🔧 Continue (VS Code extension)..."
    echo "  在 VS Code 中搜索 'Continue' 并安装"
}

# 主菜单
echo "AI 开发工具检查:"
echo ""
install_claude_code
install_codex
install_loki_mode
install_aider
install_continue

echo ""
echo "═══════════════════════════════════════"
echo "提示: 使用 '$0 --install [工具名]' 安装特定工具"
echo "═══════════════════════════════════════"
