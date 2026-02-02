#!/bin/bash
# GPT-SoVITS Mac M2 Setup Script
# 一键配置脚本

echo "🎙️  GPT-SoVITS Mac M2 部署脚本"
echo "================================"
echo ""

WORK_DIR="$HOME/.openclaw/workspace/gpt-sovits"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

# 检查 Python
if ! command -v python3 &> /dev/null; then
    echo "❌ 需要安装 Python 3.10"
    echo "运行: brew install python@3.10"
    exit 1
fi

echo "✅ Python 已安装"

# 检查 FFmpeg
if ! command -v ffmpeg &> /dev/null; then
    echo "⚠️  FFmpeg 未安装，正在安装..."
    brew install ffmpeg
fi

echo "✅ FFmpeg 已安装"

# 克隆仓库
if [ ! -d "GPT-SoVITS" ]; then
    echo "📥 克隆 GPT-SoVITS 仓库..."
    git clone https://github.com/RVC-Boss/GPT-SoVITS.git
fi

cd GPT-SoVITS

# 创建虚拟环境
if [ ! -d "venv" ]; then
    echo "🐍 创建虚拟环境..."
    python3 -m venv venv
fi

# 激活虚拟环境
echo "🔄 激活虚拟环境..."
source venv/bin/activate

# 安装依赖
echo "📦 安装依赖..."
pip install --upgrade pip
pip install torch torchvision torchaudio
pip install -r requirements.txt

echo ""
echo "================================"
echo "✅ 基础环境配置完成！"
echo ""
echo "下一步：下载预训练模型"
echo "运行: bash download-models.sh"
echo ""
