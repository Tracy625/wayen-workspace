#!/bin/bash
# Wayen Multi-Agent Launcher
# 多 Agent 协作启动器（受 Loki Mode 启发）

echo "═══════════════════════════════════════"
echo "  Wayen Multi-Agent Launcher"
echo "═══════════════════════════════════════"
echo ""

# Agent 定义
AGENTS=(
    "sys:System Analyst:系统分析"
    "dev:Developer:开发实现"  
    "sec:Security Reviewer:安全审查"
    "ops:DevOps Engineer:部署运维"
    "doc:Technical Writer:文档编写"
)

# 显示 Agent 列表
show_agents() {
    echo "可用 Agents:"
    for agent in "${AGENTS[@]}"; do
        IFS=':' read -r id name desc <<< "$agent"
        printf "  [%s] %-20s - %s\n" "$id" "$name" "$desc"
    done
}

# 启动 Agent
launch_agent() {
    local agent_id=$1
    local task=$2
    
    echo "🚀 启动 Agent: $agent_id"
    echo "   任务: $task"
    
    # 创建 Agent 工作目录
    mkdir -p "$HOME/.openclaw/workspace/agents/$agent_id"
    
    # 写入任务文件
    echo "$task" > "$HOME/.openclaw/workspace/agents/$agent_id/task.txt"
    
    echo "   状态: 已启动 (工作目录: agents/$agent_id)"
}

# 主逻辑
 case "${1:-help}" in
    list)
        show_agents
        ;;
    launch)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "用法: $0 launch [agent-id] [任务描述]"
            echo ""
            show_agents
            exit 1
        fi
        launch_agent "$2" "$3"
        ;;
    status)
        echo "📊 Agent 状态:"
        for dir in $HOME/.openclaw/workspace/agents/*/; do
            if [ -d "$dir" ]; then
                agent=$(basename "$dir")
                task=$(cat "$dir/task.txt" 2>/dev/null || echo "无任务")
                echo "  [$agent] $task"
            fi
        done
        ;;
    *)
        echo "用法: $0 [list|launch|status]"
        echo ""
        echo "  list              - 列出可用 agents"
        echo "  launch [id] [task] - 启动指定 agent"
        echo "  status            - 查看运行状态"
        echo ""
        show_agents
        ;;
esac

echo ""
echo "═══════════════════════════════════════"
