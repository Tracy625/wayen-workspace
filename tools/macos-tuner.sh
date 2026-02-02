#!/bin/bash
# Wayen macOS Tuner
# macOS 系统微调脚本

echo "═══════════════════════════════════════"
echo "  Wayen macOS Tuner"
echo "═══════════════════════════════════════"
echo ""

# 检查是否传入参数
MODE=${1:-"--check"}

if [ "$MODE" == "--check" ]; then
    echo "🔍 检查当前配置..."
    echo ""
    
    # Dock 设置
    echo "Dock 设置:"
    defaults read com.apple.dock tilesize 2>/dev/null | xargs echo "  图标大小:"
    defaults read com.apple.dock autohide 2>/dev/null | xargs echo "  自动隐藏:"
    
    # Finder 设置
    echo ""
    echo "Finder 设置:"
    defaults read com.apple.finder AppleShowAllFiles 2>/dev/null | xargs echo "  显示隐藏文件:"
    defaults read com.apple.finder ShowPathbar 2>/dev/null | xargs echo "  显示路径栏:"
    
    # 键盘设置
    echo ""
    echo "键盘设置:"
    defaults read NSGlobalDomain KeyRepeat 2>/dev/null | xargs echo "  按键重复速度:"
    defaults read NSGlobalDomain InitialKeyRepeat 2>/dev/null | xargs echo "  初始延迟:"
    
    echo ""
    echo "💡 使用 --apply 参数应用推荐配置"
    
elif [ "$MODE" == "--apply" ]; then
    echo "⚙️  应用推荐配置..."
    echo ""
    
    # Dock 优化
    echo "配置 Dock..."
    defaults write com.apple.dock tilesize -int 45
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 0
    
    # Finder 优化
    echo "配置 Finder..."
    defaults write com.apple.finder AppleShowAllFiles -bool true
    defaults write com.apple.finder ShowPathbar -bool true
    defaults write com.apple.finder ShowStatusBar -bool true
    
    # 键盘优化
    echo "配置键盘..."
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 15
    
    # 截图设置
    echo "配置截图..."
    defaults write com.apple.screencapture location -string "${HOME}/Desktop"
    defaults write com.apple.screencapture type -string "png"
    
    echo ""
    echo "✅ 配置已应用"
    echo "🔄 重启 Finder 和 Dock 生效..."
    
    killall Finder 2>/dev/null
    killall Dock 2>/dev/null
    
    echo ""
    echo "完成！"
    
else
    echo "用法: $0 [--check|--apply]"
    echo ""
    echo "  --check   检查当前配置"
    echo "  --apply   应用推荐配置"
fi

echo ""
echo "═══════════════════════════════════════"
