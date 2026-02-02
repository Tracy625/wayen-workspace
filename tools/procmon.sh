#!/bin/bash
# Wayen Process Monitor
# 实时进程监控工具

INTERVAL=${1:-5}

show_header() {
    clear
    echo "═══════════════════════════════════════════════════"
    echo "  Wayen Process Monitor (刷新间隔: ${INTERVAL}s)"
    echo "═══════════════════════════════════════════════════"
    echo ""
}

show_stats() {
    # CPU 和内存占用前 5 的进程
    echo "🔥 CPU 占用最高:"
    ps -eo pid,pcpu,pmem,comm -r | head -6 | tail -5 | while read pid cpu mem comm; do
        printf "  PID %-6s | CPU %5s%% | MEM %5s%% | %s\n" "$pid" "$cpu" "$mem" "$comm"
    done
    
    echo ""
    echo "💾 内存占用最高:"
    ps -eo pid,pmem,pcpu,comm -m | head -6 | tail -5 | while read pid mem cpu comm; do
        printf "  PID %-6s | MEM %5s%% | CPU %5s%% | %s\n" "$pid" "$mem" "$cpu" "$comm"
    done
    
    echo ""
    echo "📊 系统负载:"
    uptime | awk '{print "  " $0}'
    
    echo ""
    echo "🧠 内存状态:"
    vm_stat | grep -E "(free|active|inactive|wired)" | awk '{print "  " $0}'
}

# 单次模式或循环模式
if [ "$2" == "--once" ]; then
    show_header
    show_stats
else
    while true; do
        show_header
        show_stats
        echo ""
        echo "按 Ctrl+C 退出 | 用法: $0 [间隔秒数] --once (单次运行)"
        sleep $INTERVAL
    done
fi
