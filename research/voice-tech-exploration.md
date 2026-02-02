# Wayen 语音技术探索笔记

## 已发现的技术方向

### 1. 文本转语音 (TTS)
| 方案 | 质量 | 特点 | 适用场景 |
|------|------|------|----------|
| macOS 婷婷 | ⭐⭐ | 本地、快速 | 简单提示 |
| **Edge TTS** | ⭐⭐⭐⭐⭐ | 免费、自然 | 日常使用 ✅ |
| ElevenLabs | ⭐⭐⭐⭐⭐ | API、多语言 | 高质量需求 |
| Azure TTS | ⭐⭐⭐⭐⭐ | 免费额度 | 企业级 |

### 2. 语音克隆 (Voice Cloning)
| 工具 | 特点 |
|------|------|
| **GPT-SoVITS** | 本地、5秒样本、开源 |
| **Fish Audio** | 实时流、20万+声音库 |
| ElevenLabs | 32+语言、加密保护 |
| Real-Time-Voice-Cloning | 5秒克隆、实时生成 |

### 3. AI 歌声合成 (Singing)
| 工具 | 特点 |
|------|------|
| **Synthesizer V** | DAW插件、MIDI编辑、情感控制 |
| ACE Studio | 类似功能、旋律雕刻 |
| Soundverse | AI歌手排名第一 |

### 4. 实时语音变声 (RVC)
- 实时变声、游戏/直播使用
- 支持唱歌、保持音准
- 本地运行、低延迟

### 5. 语音转文字 (ASR)
- Whisper - OpenAI 开源
- FunASR - 阿里达摩院
- Faster Whisper - 优化版

## 下一步可尝试

1. **Edge TTS 集成** - 作为默认语音方案
2. **Fish Audio 测试** - 实时语音克隆
3. **Whisper 本地部署** - 语音输入能力
4. **RVC 配置** - 实时变声/唱歌
5. **Synthesizer V** - AI唱歌 (如果需要)

## 最实用的组合
- **Edge TTS** (输出) + **Whisper** (输入) = 完整语音交互
