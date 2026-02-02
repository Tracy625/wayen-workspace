#!/bin/bash
# Wayen Workspace Dashboard
# 工作区状态仪表盘

echo "═══════════════════════════════════════════════════════"
echo "  Wayen Workspace Dashboard"
echo "═══════════════════════════════════════════════════════"
echo ""

# 统计工具
echo "🛠️  工具集"
echo "   系统工具: $(ls $HOME/.openclaw/workspace/tools/*.sh 2>/dev/null | wc -l) 个"
echo "   MCP服务器: $(ls $HOME/.openclaw/workspace/mcp/*.py 2>/dev/null | wc -l) 个"
echo "   研究文档: $(ls $HOME/.openclaw/workspace/research/*.md 2>/dev/null | wc -l) 个"

# Git 状态
echo ""
echo "📦 Git 仓库"
cd $HOME/.openclaw/workspace 2>/dev/null && {
    echo "   提交数: $(git rev-list --count HEAD 2>/dev/null)"
    echo "   分支: $(git branch --show-current 2>/dev/null)"
    echo "   远程: $(git remote get-url origin 2>/dev/null | sed 's/.*github.com\///')"
}

# 系统状态
echo ""
echo "💻 系统状态"
echo "   macOS: $(sw_vers -productVersion 2>/dev/null)"
df -h / 2>/dev/null | tail -1 | awk '{print "   磁盘: " $3 " / " $2 " (" $5 ")"}'
echo "   内存: $(vm_stat | grep "free" | awk '{print $3}' | tr -d '.') 页空闲"

# MCP 状态
echo ""
echo "🔌 MCP 服务器"
if [ -d "/tmp/mcp-env" ]; then
    echo "   状态: 已安装"
    echo "   位置: /tmp/mcp-env"
else
    echo "   状态: 未安装"
fi

# 快捷链接
echo ""
echo "🔗 快捷链接"
echo "   仓库: https://github.com/Tracy625/wayen-workspace"
echo "   工具目录: ~/.openclaw/workspace/tools/"
echo "   研究目录: ~/.openclaw/workspace/research/"

echo ""
echo "═══════════════════════════════════════════════════════"
echo "更新: $(date '+%Y-%m-%d %H:%M')"
echo "═══════════════════════════════════════════════════════"
