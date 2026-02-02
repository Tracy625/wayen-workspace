#!/bin/bash
# Wayen Dev Setup
# 开发环境快速配置

echo "═══════════════════════════════════════"
echo "  Wayen Dev Setup"
echo "═══════════════════════════════════════"
echo ""

setup_git() {
    echo "🔧 配置 Git..."
    git config --global user.name "Wayen" 2>/dev/null
    git config --global user.email "wayen@openclaw.ai" 2>/dev/null
    git config --global init.defaultBranch main 2>/dev/null
    echo "✓ Git 配置完成"
}

setup_vscode() {
    echo "🔧 配置 VS Code 快捷方式..."
    if [ -d "/Applications/Visual Studio Code.app" ]; then
        cat >> ~/.zshrc << 'EOF'

# VS Code
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
        echo "✓ VS Code 配置完成"
    else
        echo "✗ VS Code 未安装"
    fi
}

setup_python() {
    echo "🔧 配置 Python..."
    if command -v uv &> /dev/null; then
        echo "✓ uv 已安装"
    else
        echo "✗ uv 未安装，建议: brew install uv"
    fi
}

setup_node() {
    echo "🔧 检查 Node.js..."
    if command -v node &> /dev/null; then
        node --version | xargs echo "✓ Node.js"
    else
        echo "✗ Node.js 未安装"
    fi
}

# 执行所有配置
setup_git
setup_vscode
setup_python
setup_node

echo ""
echo "═══════════════════════════════════════"
echo "开发环境配置完成！"
echo "═══════════════════════════════════════"
