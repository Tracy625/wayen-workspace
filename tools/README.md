# Wayen 工具集文档

## 快速开始

```bash
# 查看所有工具
ls ~/.openclaw/workspace/tools/

# 运行系统诊断
~/.openclaw/workspace/tools/sysdiag.sh

# 清理缓存（预览模式）
~/.openclaw/workspace/tools/cacheclean.sh

# 启动进程监控
~/.openclaw/workspace/tools/procmon.sh
```

## 工具列表

### 系统监控
| 工具 | 功能 | 用法 |
|------|------|------|
| sysdiag.sh | 系统诊断 | `./sysdiag.sh` |
| procmon.sh | 进程监控 | `./procmon.sh [间隔秒数]` |
| secaudit.sh | 安全审计 | `./secaudit.sh` |
| loganalyzer.sh | 日志分析 | `./loganalyzer.sh [summary|errors|crashes|wifi]` |

### 系统维护
| 工具 | 功能 | 用法 |
|------|------|------|
| cacheclean.sh | 缓存清理 | `./cacheclean.sh [--execute]` |
| macos-tuner.sh | 系统微调 | `./macos-tuner.sh [--check|--apply]` |
| brewman.sh | Homebrew 管理 | `./brewman.sh [1-5]` |
| dotbackup.sh | 配置备份 | `./dotbackup.sh` |

### 开发工具
| 工具 | 功能 | 用法 |
|------|------|------|
| quickcommit.sh | Git 快速提交 | `./quickcommit.sh` |
| devsetup.sh | 开发环境配置 | `./devsetup.sh` |
| quicksearch.sh | 快速搜索 | `./quicksearch.sh "查询内容"` |
| agent-launcher.sh | 多 Agent 启动器 | `./agent-launcher.sh [list|launch|status]` |
| ai-installer.sh | AI 工具安装 | `./ai-installer.sh` |

## MCP 服务器

```bash
# 启动 Wayen MCP 服务器
cd /tmp/mcp-env && source bin/activate
python ~/.openclaw/workspace/mcp/wayen-server.py

# 配置 Claude Desktop
# 复制 ~/.openclaw/workspace/mcp/claude_desktop_config.json
# 到 ~/Library/Application Support/Claude/claude_desktop_config.json
```

## 研究文档

- `research/multi-agent-analysis.md` - Loki Mode 架构分析
- `research/ai-landscape-2025.md` - 2025 AI Agent 生态

## 更新

```bash
# 拉取最新代码
cd ~/.openclaw/workspace && git pull

# 查看提交历史
git log --oneline -10
```
