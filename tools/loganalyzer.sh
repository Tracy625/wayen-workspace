#!/bin/bash
# Wayen Log Analyzer
# 系统日志分析工具

echo "═══════════════════════════════════════"
echo "  Wayen Log Analyzer"
echo "═══════════════════════════════════════"
echo ""

# 参数: 分析类型
TYPE="${1:-summary}"

 case "$TYPE" in
    summary)
        echo "📊 今日日志摘要:"
        echo ""
        echo "错误数量 (24h):"
        log show --last 24h --predicate 'eventType == logEvent' 2>/dev/null | \
            grep -c "Error" || echo "  需要授权"
        
        echo ""
        echo "崩溃报告:"
        ls ~/Library/Logs/DiagnosticReports/*.crash 2>/dev/null | wc -l | xargs echo "  文件数:"
        ;;
    
    errors)
        echo "❌ 最近错误 (10条):"
        log show --last 1h 2>/dev/null | grep -i "error" | tail -10 | cut -c1-120 || \
            echo "  需要 sudo 授权查看系统日志"
        ;;
    
    crashes)
        echo "💥 崩溃报告列表:"
        ls -lt ~/Library/Logs/DiagnosticReports/*.crash 2>/dev/null | head -10 | awk '{print $9}' | xargs -I {} basename {}
        ;;
    
    wifi)
        echo "📡 WiFi 诊断:"
        /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null || \
            echo "  airport 工具已弃用，使用 wdutil:"
        wdutil info 2>/dev/null | head -10 || echo "  需要 sudo"
        ;;
    
    *)
        echo "用法: $0 [summary|errors|crashes|wifi]"
        echo ""
        echo "  summary  - 日志摘要"
        echo "  errors   - 最近错误"
        echo "  crashes  - 崩溃报告"
        echo "  wifi     - WiFi 诊断"
        ;;
esac

echo ""
echo "═══════════════════════════════════════"
