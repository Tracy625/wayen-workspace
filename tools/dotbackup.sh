#!/bin/bash
# Wayen Dotfiles Backup
# 配置文件备份工具

BACKUP_DIR="$HOME/.openclaw/workspace/dotfiles-backup-$(date +%Y%m%d)"

echo "═══════════════════════════════════════"
echo "  Wayen Dotfiles Backup"
echo "═══════════════════════════════════════"
echo ""

mkdir -p "$BACKUP_DIR"

# 要备份的配置文件
FILES=(
    "$HOME/.zshrc"
    "$HOME/.bashrc"
    "$HOME/.gitconfig"
    "$HOME/.ssh/config"
    "$HOME/.openclaw/openclaw.json"
)

COPIED=0

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        cp "$file" "$BACKUP_DIR/"
        echo "✓ $(basename $file)"
        ((COPIED++))
    else
        echo "✗ $(basename $file) - 不存在"
    fi
done

# 备份 Homebrew 包列表
brew list --formula > "$BACKUP_DIR/brew-packages.txt" 2>/dev/null
echo "✓ brew-packages.txt"

# 备份系统偏好设置
defaults read > "$BACKUP_DIR/macos-defaults.plist" 2>/dev/null
echo "✓ macos-defaults.plist"

# 创建恢复脚本
cat > "$BACKUP_DIR/restore.sh" << 'EOF'
#!/bin/bash
# 恢复脚本
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "从 $DOTFILES_DIR 恢复配置..."
# 恢复命令...
EOF
chmod +x "$BACKUP_DIR/restore.sh"
echo "✓ restore.sh"

echo ""
echo "═══════════════════════════════════════"
echo "备份完成: $BACKUP_DIR"
echo "文件数: $((COPIED + 3))"
echo "═══════════════════════════════════════"
