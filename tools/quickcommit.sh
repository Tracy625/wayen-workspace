#!/bin/bash
# Wayen Git Quick Commit
# 快速提交 OpenClaw 工作区更改

cd /Users/kapibaltest/.openclaw/workspace || exit 1

# 检查是否有更改
if [ -z "$(git status --porcelain 2>/dev/null)" ]; then
    echo "✓ 工作区已是最新，无更改需要提交"
    exit 0
fi

# 生成提交信息
timestamp=$(date '+%Y-%m-%d %H:%M')
hostname=$(hostname -s)
msg="Auto commit from $hostname at $timestamp"

# 添加并提交
echo "📝 发现更改，正在提交..."
git add -A 2>/dev/null
git commit -m "$msg" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✅ 已提交: $msg"
    
    # 尝试推送
    git push 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "🚀 已推送到远程"
    else
        echo "⚠️  推送失败，可能需要手动处理"
    fi
else
    echo "❌ 提交失败"
fi
