#!/bin/bash
# Wayen Quick Search
# 快速搜索工具

QUERY="$1"

if [ -z "$QUERY" ]; then
    echo "用法: $0 [搜索内容]"
    echo ""
    echo "示例:"
    echo "  $0 'docker install macos'"
    echo "  $0 'python asyncio tutorial'"
    exit 1
fi

echo "🔍 搜索: $QUERY"
echo ""

# 使用 brave 搜索 (如果可用)
if command -v brave-search &> /dev/null; then
    brave-search "$QUERY"
else
    # 打开浏览器搜索
    open "https://www.google.com/search?q=$(echo $QUERY | sed 's/ /+/g')"
    echo "已在浏览器打开搜索"
fi
