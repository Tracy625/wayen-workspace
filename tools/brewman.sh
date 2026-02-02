#!/bin/bash
# Wayen Homebrew Manager
# Homebrew 包管理工具

echo "═══════════════════════════════════════"
echo "  Wayen Homebrew Manager"
echo "═══════════════════════════════════════"
echo ""

show_menu() {
    echo "1. 列出已安装包 (${INSTALLED} 个)"
    echo "2. 检查可更新包"
    echo "3. 清理旧版本"
    echo "4. 诊断问题"
    echo "5. 备份包列表"
    echo ""
    echo "用法: $0 [1-5]"
}

INSTALLED=$(brew list --formula 2>/dev/null | wc -l | tr -d ' ')

# 根据参数执行
 case "${1:-menu}" in
    1|list)
        echo "📦 已安装的包 (前 20 个):"
        brew list --formula 2>/dev/null | head -20 | nl
        echo ""
        echo "总计: $INSTALLED 个包"
        ;;
    2|outdated)
        echo "🔍 检查可更新..."
        brew outdated
        ;;
    3|cleanup)
        echo "🧹 清理旧版本..."
        brew cleanup --dry-run
        echo ""
        read -p "确认清理? (y/n) " confirm
        if [ "$confirm" == "y" ]; then
            brew cleanup
            echo "✅ 清理完成"
        else
            echo "已取消"
        fi
        ;;
    4|doctor)
        echo "🔧 诊断 Homebrew..."
        brew doctor
        ;;
    5|backup)
        BACKUP_FILE="$HOME/.openclaw/workspace/brew-backup-$(date +%Y%m%d).txt"
        brew list --formula > "$BACKUP_FILE"
        echo "💾 包列表已备份到:"
        echo "   $BACKUP_FILE"
        ;;
    *)
        show_menu
        ;;
esac

echo ""
echo "═══════════════════════════════════════"
