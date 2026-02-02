#!/bin/bash
# Wayen Chinese Voice
# 生成标准中文语音

TEXT="$1"
OUTPUT="${2:-/tmp/wayen-voice.ogg}"

if [ -z "$TEXT" ]; then
    echo "用法: $0 '中文内容' [输出文件]"
    exit 1
fi

# 使用婷婷（zh_CN）生成 AIFF
say -v Tingting "$TEXT" -o /tmp/wayen-temp.aiff

# 转换为 OGG/Opus
ffmpeg -i /tmp/wayen-temp.aiff -c:a libopus -b:a 16k "$OUTPUT" -y 2>/dev/null

# 清理
rm -f /tmp/wayen-temp.aiff

echo "$OUTPUT"
