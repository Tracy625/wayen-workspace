#!/bin/bash
# Wayen Voice Module
# TTS (Text-to-Speech) 控制脚本

VOICE_CONFIG="$HOME/.openclaw/workspace/identity/voice.json"
DEFAULT_VOICE="Ting-Ting"

# 读取配置
get_voice() {
    if [ -f "$VOICE_CONFIG" ]; then
        cat "$VOICE_CONFIG" | grep "voice_preset" | cut -d'"' -f4
    else
        echo "$DEFAULT_VOICE"
    fi
}

# 说话函数
say_text() {
    local text="$1"
    local voice=$(get_voice)
    
    echo "🗣️  Wayen: $text"
    
    # 使用 macOS say 命令
    if command -v say > /dev/null 2>&1; then
        say -v "$voice" "$text" 2>/dev/null || \
        say -v "Ting-Ting" "$text" 2>/dev/null || \
        say "$text"
    else
        echo "[TTS 不可用 - 文本模式]"
    fi
}

# 测试不同声音
test_voices() {
    echo "测试可用声音..."
    local test_text="你好，我是 Wayen"
    
    for voice in Ting-Ting Meijia Sinji; do
        echo "测试: $voice"
        say -v "$voice" "$test_text" 2>/dev/null &
        sleep 2
    done
}

# 主逻辑
case "${1:-say}" in
    say)
        if [ -z "$2" ]; then
            echo "用法: $0 say '要说的内容'"
            exit 1
        fi
        say_text "$2"
        ;;
    test)
        test_voices
        ;;
    list)
        echo "可用中文声音:"
        say -v '?' | grep -E "(Ting-Ting|Meijia|Sinji)"
        ;;
    *)
        echo "Wayen Voice Module"
        echo ""
        echo "用法:"
        echo "  $0 say '内容'    - 说话"
        echo "  $0 test          - 测试声音"
        echo "  $0 list          - 列出声音"
        ;;
esac
