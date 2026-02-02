#!/bin/bash
# Wayen Security Audit
# macOS 安全审计脚本

echo "═══════════════════════════════════════"
echo "  Wayen Security Audit"
echo "═══════════════════════════════════════"
echo ""

# 1. 系统完整性检查
echo "🔐 系统完整性:"
echo "   Gatekeeper: $(/usr/sbin/spctl --status 2>/dev/null)"

csr_status=$(csrutil status 2>/dev/null | grep -o "enabled\|disabled" || echo "unknown")
echo "   SIP (系统完整性保护): $csr_status"
echo ""

# 2. 防火墙状态
echo "🧱 防火墙状态:"
# 使用 pfctl 检查防火墙
pf_status=$(sudo pfctl -s info 2>/dev/null | head -1 || echo "Status: unknown")
echo "   $pf_status"
echo ""

# 3. 用户账户检查
echo "👤 用户账户:"
users=$(dscl . list /Users 2>/dev/null | grep -v "^_" | tr '\n' ', ')
echo "   系统用户: $users"
echo ""

# 4. Sudo 配置检查
echo "⚡ Sudo 权限:"
if [ -f /etc/sudoers.d/wayen ]; then
    echo "   ✅ Wayen sudo 配置存在"
else
    echo "   ⚠️  Wayen sudo 配置未找到"
fi
echo ""

# 5. SSH 检查
echo "🔑 SSH 配置:"
if [ -d ~/.ssh ]; then
    key_count=$(ls ~/.ssh/*.pub 2>/dev/null | wc -l)
    echo "   公钥数量: $key_count"
    ls ~/.ssh/*.pub 2>/dev/null | while read key; do
        echo "     - $(basename $key)"
    done
else
    echo "   ⚠️  ~/.ssh 目录不存在"
fi
echo ""

# 6. 最近登录
echo "🚪 最近登录记录:"
last -5 2>/dev/null | head -6 | tail -5 || echo "   无记录"
echo ""

# 7. 开放端口检查
echo "🌐 监听端口:"
netstat -an 2>/dev/null | grep LISTEN | wc -l | xargs echo "   监听端口数:"
echo ""

# 8. 安全建议
echo "📋 安全建议:"
echo "   1. 定期更新系统和软件"
echo "   2. 检查 ~/.ssh 权限 (应为 700)"
echo "   3. 审查 sudo 日志"
echo "   4. 启用 FileVault (如果未启用)"
echo ""

echo "═══════════════════════════════════════"
echo "  审计完成: $(date)"
echo "═══════════════════════════════════════"
