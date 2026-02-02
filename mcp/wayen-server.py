#!/usr/bin/env python3
"""
Wayen MCP Server
将系统工具暴露为 MCP 服务
"""
import subprocess
import json
import logging
from typing import Any
from mcp.server.fastmcp import FastMCP

# 初始化 MCP 服务器
mcp = FastMCP("wayen-tools")

# 配置日志到 stderr
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[logging.StreamHandler()]
)
logger = logging.getLogger(__name__)


@mcp.tool()
def system_overview() -> str:
    """获取系统概览信息（macOS 版本、主机名等）"""
    try:
        sw_vers = subprocess.run(
            ["sw_vers", "-productVersion"], 
            capture_output=True, text=True
        ).stdout.strip()
        
        build = subprocess.run(
            ["sw_vers", "-buildVersion"],
            capture_output=True, text=True
        ).stdout.strip()
        
        hostname = subprocess.run(
            ["hostname", "-s"],
            capture_output=True, text=True
        ).stdout.strip()
        
        return f"""系统概览:
- macOS 版本: {sw_vers} ({build})
- 主机名: {hostname}
- 时间: {subprocess.run(['date'], capture_output=True, text=True).stdout.strip()}"""
    except Exception as e:
        return f"错误: {str(e)}"


@mcp.tool()
def storage_info() -> str:
    """获取存储空间使用情况"""
    try:
        result = subprocess.run(
            ["df", "-h", "/"],
            capture_output=True, text=True
        )
        lines = result.stdout.strip().split('\n')
        if len(lines) > 1:
            parts = lines[1].split()
            return f"""存储状态:
- 总容量: {parts[1]}
- 已用: {parts[2]} ({parts[4]})
- 可用: {parts[3]}"""
        return "无法获取存储信息"
    except Exception as e:
        return f"错误: {str(e)}"


@mcp.tool()
def cache_analysis() -> str:
    """分析缓存占用情况"""
    try:
        caches = [
            ("Homebrew", "~/Library/Caches/Homebrew"),
            ("Google", "~/Library/Caches/Google"),
            ("Node", "~/Library/Caches/node-gyp"),
        ]
        
        results = []
        total_mb = 0
        
        for name, path in caches:
            result = subprocess.run(
                ["du", "-sk", path.replace("~", "/Users/kapibaltest")],
                capture_output=True, text=True
            )
            if result.returncode == 0:
                size_kb = int(result.stdout.split()[0])
                size_mb = size_kb / 1024
                total_mb += size_mb
                results.append(f"- {name}: {size_mb:.1f}MB")
        
        return f"""缓存分析:
{chr(10).join(results)}

总计: {total_mb:.1f}MB

使用 cacheclean.sh 可清理"""
    except Exception as e:
        return f"错误: {str(e)}"


@mcp.tool()
def security_status() -> str:
    """获取安全状态（Gatekeeper、SIP 等）"""
    try:
        gatekeeper = subprocess.run(
            ["/usr/sbin/spctl", "--status"],
            capture_output=True, text=True
        ).stdout.strip()
        
        sip = subprocess.run(
            ["csrutil", "status"],
            capture_output=True, text=True
        ).stdout.strip()
        sip_status = "enabled" if "enabled" in sip else "disabled"
        
        return f"""安全状态:
- Gatekeeper: {gatekeeper}
- SIP (系统完整性保护): {sip_status}
- Wayen sudo: 已配置"""
    except Exception as e:
        return f"错误: {str(e)}"


@mcp.tool()
def network_info() -> str:
    """获取网络接口信息"""
    try:
        result = subprocess.run(
            ["/usr/sbin/networksetup", "-listallhardwareports"],
            capture_output=True, text=True
        )
        
        interfaces = []
        for line in result.stdout.split('\n'):
            if 'Hardware Port' in line:
                interfaces.append(line.split(': ')[1])
        
        return f"""网络接口:
{chr(10).join(['- ' + i for i in interfaces[:3]])}

使用 networkQuality 测试网速"""
    except Exception as e:
        return f"错误: {str(e)}"


@mcp.tool()
def list_tools() -> str:
    """列出可用的系统工具"""
    return """Wayen 系统工具集:

1. sysdiag.sh - 完整系统诊断
2. cacheclean.sh - 缓存清理
3. secaudit.sh - 安全审计
4. quickcommit.sh - Git 快速提交
5. macos-tuner.sh - macOS 配置微调

位置: ~/.openclaw/workspace/tools/"""


if __name__ == "__main__":
    logger.info("Starting Wayen MCP Server...")
    mcp.run(transport="stdio")
