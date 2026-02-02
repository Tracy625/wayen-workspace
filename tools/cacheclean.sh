#!/bin/bash
# Wayen Cache Cleaner
# 智能清理 macOS 缓存

DRY_RUN=${1:-"--dry-run"}
SAVED_SPACE=0

clean_path() {
    local path=$1
    local desc=$2
    
    if [ ! -d "$path" ]; then
        return
    fi
    
    local size=$(du -sk "$path" 2>/dev/null | awk '{print $1}')
    local size_mb=$((size / 1024))
    
    if [ "$size_mb" -gt 50 ]; then
        echo "🗂️  $desc: ${size_mb}MB"
        
        if [ "$DRY_RUN" != "--dry-run" ]; then
            rm -rf "$path"/* 2>/dev/null
            echo "   ✅ 已清理"
        else
            echo "   (预览模式，未实际删除)"
        fi
        
        SAVED_SPACE=$((SAVED_SPACE + size_mb))
    fi
}

echo "═══════════════════════════════════════"
echo "  Wayen Cache Cleaner"
echo "═══════════════════════════════════════"
echo ""

if [ "$DRY_RUN" == "--dry-run" ]; then
    echo "🔍 预览模式 (添加 --execute 参数执行清理)"
    echo ""
fi

# 清理目标
clean_path "$HOME/Library/Caches/Homebrew" "Homebrew 缓存"
clean_path "$HOME/Library/Caches/com.apple.dt.Xcode" "Xcode 缓存"
clean_path "$HOME/Library/Caches/Google" "Google 缓存"
clean_path "$HOME/Library/Caches/node-gyp" "Node 编译缓存"
clean_path "$HOME/Library/Caches/pip" "Python pip 缓存"
clean_path "$HOME/Library/Caches/yarn" "Yarn 缓存"
clean_path "$HOME/Library/Developer/Xcode/DerivedData" "Xcode 构建数据"
clean_path "$HOME/Library/Logs/DiagnosticReports" "崩溃日志"

echo ""
echo "═══════════════════════════════════════"
if [ "$DRY_RUN" == "--dry-run" ]; then
    echo "💡 可释放空间: ${SAVED_SPACE}MB"
    echo ""
    echo "执行清理命令:"
    echo "   $0 --execute"
else
    echo "✅ 已释放空间: ${SAVED_SPACE}MB"
fi
echo "═══════════════════════════════════════"
