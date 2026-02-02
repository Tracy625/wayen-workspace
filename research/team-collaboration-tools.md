# AI 全栈团队协作工具方案

## 团队配置
- **3 人分工**: 管理+救火、全栈迭代、产品
- **工作方式**: AI 写代码、按板块分工、互相支援
- **核心需求**: 项目管理 + 实时协作 + 知识沉淀

---

## 推荐组合方案

### 方案 A: 轻量高效 (推荐)
| 用途 | 工具 | 费用 | 理由 |
|------|------|------|------|
| 项目管理 | **Linear** | 免费 | 比 Jira 快 10 倍，GitHub 集成好，适合小团队 |
| 文档/知识 | **Notion** | $10/人/月 | AI 支持好，database 功能强，产品文档+技术文档合一 |
| 沟通 | **Slack** | 免费 | Huddles 快速语音，Async standup 支持跨时区 |
| 代码协作 | **GitHub** | 免费 | Copilot $10/人/月，Code review + Projects 看板 |

**月费**: ~$30 (3人 Notion) + $30 (3人 Copilot) = $60

### 方案 B: 深度集成
| 用途 | 工具 | 费用 | 理由 |
|------|------|------|------|
| 全流程 | **GitHub Projects** | 免费 | 代码+Issue+Project 一体化，无需切换 |
| 文档 | **GitHub Wiki** | 免费 | 与代码仓库绑定，MD 支持好 |
| 沟通 | **Slack + Axolo** | Axolo $2/人/月 | Slack 中直接 Code review，适合救火场景 |
| 设计协作 | **Figma** | $12/人/月 | 产品和全栈协作设计，Dev Mode 直接生成代码 |

**月费**: ~$36 (3人 Figma) + $6 (3人 Axolo) = $42

### 方案 C: AI 原生 (实验性)
| 用途 | 工具 | 费用 | 理由 |
|------|------|------|------|
| AI 协作开发 | **v0 by Vercel** | $30/人/月 | AI 直接生成可运行代码，产品+开发同时协作 |
| 项目管理 | **Linear** | 免费 | 配合 v0 的生成节奏 |
| 沟通 | **Slack** | 免费 | 常规沟通 |

**月费**: $90 (3人 v0 Team)

---

## 关键工具详解

### 1. Linear (项目管理)
**为什么选它**:
- 键盘操作，速度极快（比 Jira 快 10x）
- 与 GitHub 双向同步，代码提交自动更新任务状态
- Cycle 功能自动规划 sprint，适合迭代节奏
- 救火场景： urgent 标签自动提到最前

**分工场景**:
- 管理：设置 Cycles、看进度、标记 Blocked
- 全栈：从 GitHub commit 自动关联任务
- 产品：写需求、attach Figma 链接

### 2. Notion (知识库)
**为什么选它**:
- AI 自动整理会议记录 → 行动项
- Database 功能：产品 roadmap + 技术文档 + bug 追踪合一
- 救火日志：建立"事故复盘"数据库，可查询历史

**模板推荐**:
- 产品需求文档 (PRD)
- 技术架构决策 (ADR)
- 事故复盘 (Postmortem)
- 每日站会记录

### 3. Slack + Async Standup
**为什么选它**:
- **Geekbot** 或 **Axolo**: 自动化每日站会
- 救火场景：/remind 功能快速拉群
- Huddles: 比 Zoom 快，一键语音

**推荐 Workflow**:
```
每天早上 Geekbot 问：
1. 昨天完成了什么？
2. 今天计划做什么？
3. 有 Blocker 需要支援吗？
```

### 4. GitHub Copilot Workspace (新功能)
**为什么关注**:
- Copilot 不只是代码补全，现在可以：
  - 从 Issue 自动生成 PR
  - 多文件同时修改
  - 自动跑测试验证

**适合你们**:
- 全栈迭代：描述功能，Copilot 生成前后端代码
- 救火：快速定位 bug，生成修复方案

---

## 进阶选项

### Liveblocks (如果你们自建工具)
- 实时协作基础设施
- 支持 AI copilots
- 有 MCP 服务器，可集成到 Claude Code

### Loki Mode (如果你们想实验)
- 37 个 AI agent 自主运行
- 可部署到你们的基础设施
- 适合探索多 agent 协作

---

## 实施建议

### 第一周 (Setup)
1. 开 Linear workspace，导入 GitHub Issues
2. 建 Notion workspace，导入模板
3. 配置 Slack + Geekbot 站会
4. 全员装 Copilot 插件

### 第二周 (Workflow)
1. 产品：在 Notion 写第一个 PRD
2. 全栈：用 Copilot 从 PRD 生成代码骨架
3. 管理：在 Linear 设置第一个 Cycle
4. 每日：Slack 异步站会

### 第三周 (优化)
1. 回顾 Linear 数据：平均解决时间？
2. 优化 Notion 模板：哪些字段没用？
3. Slack 反馈：站会质量如何？

---

## 对比总结

| 维度 | 方案 A | 方案 B | 方案 C |
|------|--------|--------|--------|
| 月费 | $60 | $42 | $90 |
| 上手难度 | 低 | 中 | 中 |
| AI 集成 | 中 | 低 | 高 |
| 救火响应 | 快 | 快 | 中 |
| 适合 | 平衡型 | 技术型 | 产品驱动 |

**我的建议**: 先试用方案 A 一个月，Linear+Notion+Slack 都有免费版，Copilot 是刚需。如果团队习惯后，再考虑 v0 或 Liveblocks。

---

## 相关链接
- Linear: https://linear.app
- Notion: https://notion.so
- Slack: https://slack.com
- GitHub Copilot: https://github.com/features/copilot
- v0 Team: https://v0.app
- Liveblocks: https://liveblocks.io
