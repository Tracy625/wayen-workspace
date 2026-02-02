#!/bin/bash
# 下载 GPT-SoVITS 预训练模型

MODEL_DIR="/tmp/GPT-SoVITS/GPT_SoVITS/pretrained_models"
mkdir -p "$MODEL_DIR"

echo "📥 下载预训练模型..."

# V4 模型（推荐）
echo "下载 V4 模型..."
curl -L "https://huggingface.co/lj1995/GPT-SoVITS/resolve/main/gsv-v4-pretrained/s2v4.pth" -o "$MODEL_DIR/s2v4.pth" 2>/dev/null &

# V3 模型
echo "下载 V3 模型..."
curl -L "https://huggingface.co/lj1995/GPT-SoVITS/resolve/main/s1v3.ckpt" -o "$MODEL_DIR/s1v3.ckpt" 2>/dev/null &
curl -L "https://huggingface.co/lj1995/GPT-SoVITS/resolve/main/s2Gv3.pth" -o "$MODEL_DIR/s2Gv3.pth" 2>/dev/null &

echo ""
echo "⏳ 模型下载中（在后台运行）..."
echo "完成后可在 $MODEL_DIR 查看"
