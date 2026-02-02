#!/bin/bash
# Wayen System Diagnostic Toolkit
# 轻量级 macOS 系统诊断脚本

print_header() {
    echo "═══════════════════════════════════════"
    echo "  $1"
    echo "═══════════════════════════════════════"
}

# 1. 系统概览
system_overview() {
    print_header "系统概览"
    echo "macOS: $(sw_vers -productVersion 2>/dev/null) ($(sw_vers -buildVersion 2>/dev/null))"
    echo "主机: $(hostname -s 2>/dev/null)"
    echo "时间: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
}

# 2. 存储分析
storage_analysis() {
    print_header "存储分析"
    df -h / 2>/dev/null | tail -1 | awk '{print "总容量: "$2" | 已用: "$3" | 可用: "$4" | 使用率: "$5}'
    echo ""
    echo "大文件缓存:"
    du -sh ~/Library/Caches/* 2>/dev/null | sort -hr | head -5 | while read size path; do
        echo "  $size - $(basename $path)"
    done
    echo ""
}

# 3. 网络状态
network_status() {
    print_header "网络状态"
    /usr/sbin/networksetup -listallhardwareports 2>/dev/null | grep -E "(Hardware Port|Ethernet Address)" | head -6
    echo ""
}

# 4. 系统服务
service_check() {
    print_header "关键服务状态"
    echo "Gatekeeper: $(/usr/sbin/spctl --status 2>/dev/null)"
    echo "系统扩展: $(systemextensionsctl list 2>/dev/null | wc -l) 个"
    echo "启动代理: $(find ~/Library/LaunchAgents /Library/LaunchAgents -name "*.plist" 2>/dev/null | wc -l) 个"
    echo ""
}

# 5. 最近错误
recent_errors() {
    print_header "最近系统错误 (1小时内)"
    log show --last 1h 2>/dev/null | grep -E "(Error|error|fail)" | tail -5 | cut -c1-100 || echo "  无异常"
    echo ""
}

# 6. 优化建议
optimization_tips() {
    print_header "优化建议"
    
    # 检查缓存
    cache_size=$(du -sk ~/Library/Caches 2>/dev/null | awk '{print $1}')
    if [ "$cache_size" -gt 1048576 ]; then
        echo "⚠️  缓存超过 1GB，建议清理"
    else
        echo "✓ 缓存状态正常"
    fi
    
    # 检查可用空间
    free_pct=$(df / 2>/dev/null | tail -1 | awk '{print $5}' | tr -d '%')
    if [ "$free_pct" -gt 80 ]; then
        echo "⚠️  磁盘使用率超过 80%"
    else
        echo "✓ 磁盘空间充足"
    fi
    
    echo ""
}

# 主执行
main() {
    clear
    system_overview
    storage_analysis
    network_status
    service_check
    recent_errors
    optimization_tips
    
    print_header "诊断完成"
    echo "生成时间: $(date)"
    echo "脚本位置: $0"
}

main
