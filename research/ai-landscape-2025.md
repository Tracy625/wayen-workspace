# AI Agent 生态全景 2025

## 核心发现

### 1. Loki Mode (37 Agents)
- **GitHub**: asklokesh/loki-mode
- **特点**: 完整创业系统，PRD → 部署产品
- **性能**: HumanEval 98.78%, SWE-bench 99.67%
- **架构**: RARV 循环，并行审查
- **支持**: Claude/Codex/Gemini

### 2. OpenAI Codex CLI
- **安装**: `npm i -g @openai/codex`
- **特点**: 轻量级本地 agent
- **集成**: VS Code, JetBrains IDE
- **可用**: ChatGPT Plus 用户免费

### 3. MCP (Model Context Protocol)
- **主导**: Anthropic 推出
- **类比**: AI 的 USB-C
- **生态**: 100+ 官方/社区服务器
- **支持**: Filesystem, SQLite, Git, GitHub, AWS...

### 4. Clawdbot (?)
- **传闻**: 10 天开发，70,000 stars
- **来源**: 36kr 报道
- **状态**: 需验证

### 5. GitHub Copilot Agent Mode
- **发布**: 2025 年 2 月
- **能力**: 自主迭代代码，实时纠错
- **SDK**: 可集成到任意应用

## 技术趋势

### 多 Agent 协作
- 从单 agent → 多 agent 并行
- Loki Mode: 37 agents, 6 个专业群组
- 并行代码审查: 3 reviewer 同时工作

### 自验证循环
- RARV: Reason-Act-Reflect-Verify
- 持续学习和错误预防
- 2-3x 质量提升

### 工具标准化
- MCP 成为事实标准
- 类似 USB-C 的统一接口
- 降低集成成本

## Wayen 定位

### 当前状态
- 单 agent，工具执行模式
- 13 个系统工具
- 1 个 MCP 服务器

### 可演进方向
1. **多 Agent 架构**: 参考 Loki Mode
2. **MCP 集成**: 接入更多官方服务器
3. **自主规划**: 从执行 → 规划 + 执行
4. **记忆系统**: episodic + semantic + procedural

### 下一步行动
1. 测试 Loki Mode 安装
2. 集成 MCP filesystem 服务器
3. 研究 Codex CLI 协作
4. 探索 GitHub Copilot SDK
