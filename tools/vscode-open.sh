#!/bin/bash
# Wayen VS Code Integration
# 使用 code 命令与 VS Code 交互

echo "🔧 Wayen VS Code 集成"
echo ""

# 检查 code 命令
if ! command -v code > /dev/null 2>&1; then
    echo "❌ code 命令未找到"
    echo "提示: 在 VS Code 中按 Cmd+Shift+P, 输入 'Shell Command: Install'"
    exit 1
fi

echo "✅ code 命令可用"
echo ""

# 工作区路径
WORKSPACE="$HOME/.openclaw/workspace"

# 打开工作区
echo "正在打开 VS Code 工作区..."
code "$WORKSPACE" &

echo ""
echo "常用命令:"
echo "  code -r file.txt      # 在当前窗口打开"
echo "  code -d file1 file2   # 对比文件"
echo "  code .                # 打开当前目录"
