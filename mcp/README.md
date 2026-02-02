# Wayen MCP Server

将 Wayen 的系统工具暴露为 MCP (Model Context Protocol) 服务。

## 工具列表

| 工具名 | 功能 |
|--------|------|
| `system_overview` | 系统概览（macOS 版本、主机名） |
| `storage_info` | 存储空间使用 |
| `cache_analysis` | 缓存占用分析 |
| `security_status` | 安全状态检查 |
| `network_info` | 网络接口信息 |
| `list_tools` | 列出 shell 工具 |

## 使用方式

### 1. 独立运行
```bash
/tmp/mcp-env/bin/python wayen-server.py
```

### 2. 配置 Claude Desktop
复制配置到:
```
~/Library/Application Support/Claude/claude_desktop_config.json
```

### 3. 测试
启动后，Claude Desktop 会自动检测到工具。

## 技术栈
- Python 3.14
- MCP SDK (FastMCP)
- STDIO 传输

## 未来扩展
- [ ] 添加更多系统工具
- [ ] 支持文件系统操作
- [ ] 集成 Homebrew 管理
- [ ] 添加实时监控
