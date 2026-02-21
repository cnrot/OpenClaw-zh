# OpenClaw 汉化发行版

[![Release](https://img.shields.io/github/v/release/cnrot/OpenClaw-zh?label=稳定版)](https://github.com/cnrot/OpenClaw-zh/releases)
[![npm](https://img.shields.io/npm/v/@coryrowe/openclaw-zh?label=npm)](https://www.npmjs.com/package/@coryrowe/openclaw-zh)
[![Platform](https://img.shields.io/badge/平台-Windows%20|%20macOS%20|%20Linux-blue)](https://github.com/cnrot/OpenClaw-zh/releases)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

> **稳定版 (`@latest`)** 自动同步 OpenClaw 官方**稳定版**。

---

## 介绍

[OpenClaw](https://openclaw.ai/) 是 **适用于任何操作系统的 AI 智能体 Gateway 网关**。它运行在你的电脑上，通过 WhatsApp、Telegram、Discord 等聊天应用与你的 AI 助手交互，帮你处理邮件、日历、文件等日常事务。

**本项目 = OpenClaw + 中文界面**，CLI 命令行和 Dashboard 网页控制台均已深度汉化。

---

## 4 步上手

> **前提条件**：需要 **Node.js >= 22**（[下载 Node.js](https://nodejs.org/)）
>
> 检查版本：`node -v`

### 第 1 步：安装

```bash
npm install -g @coryrowe/openclaw-zh@latest
```

### 第 2 步：初始化（推荐守护进程模式）

```bash
openclaw onboard --install-daemon
```

初始化向导会引导你完成：选择 AI 模型 → 配置 API 密钥 → 设置聊天通道

### 第 3 步：启动网关

```bash
openclaw gateway
```

### 第 4 步：打开控制台

```bash
openclaw dashboard
```

浏览器会自动打开全中文的 Dashboard 控制台。完成！

> 想了解每一步的详细说明？查看 **[详细安装指南](docs/INSTALL_GUIDE.md)**（包含 Node.js 安装、模型配置、守护进程、内网访问等）

---

## 汉化效果预览

<p align="center">
  <img src="docs/image/5.png" alt="概览仪表板" width="100%">
  <br>
  <em>概览仪表板 - 网关状态、实例监控、快捷操作一目了然</em>
</p>

<details>
<summary><b>查看更多截图</b></summary>

<p align="center">
  <img src="docs/image/1.png" alt="对话界面" width="100%">
  <br>
  <em>对话界面 - 与 AI 助手实时交互</em>
</p>

<p align="center">
  <img src="docs/image/4.png" alt="渠道管理" width="100%">
  <br>
  <em>渠道管理 - WhatsApp、Telegram、Discord 等全平台支持</em>
</p>

<p align="center">
  <img src="docs/image/2.png" alt="配置中心" width="100%">
  <br>
  <em>配置中心 - 完整汉化</em>
</p>

<p align="center">
  <img src="docs/image/3.png" alt="节点配置" width="100%">
  <br>
  <em>节点配置 - 执行审批、安全策略管理</em>
</p>

<p align="center">
  <img src="docs/image/6.png" alt="技能插件" width="100%">
  <br>
  <em>技能插件 - 1Password、Apple Notes 等丰富扩展</em>
</p>

</details>

---

## 常用命令

```bash
openclaw                    # 启动 OpenClaw
openclaw onboard            # 初始化向导
openclaw dashboard          # 打开网页控制台
openclaw config             # 查看/修改配置
openclaw skills             # 管理技能
openclaw --help             # 查看帮助

# 网关管理
openclaw gateway run        # 前台运行（挂终端，用于调试）
openclaw gateway start      # 后台守护进程（不挂终端，推荐！）
openclaw gateway stop       # 停止网关
openclaw gateway restart    # 重启网关
openclaw gateway status     # 查看网关状态
openclaw gateway install    # 安装为系统服务（开机自启）

# 常用操作
openclaw update             # 检查并更新 CLI
openclaw doctor             # 诊断问题（自动修复）
```

> **Windows 用户注意**：如果 `gateway install` 失败（提示 schtasks 不可用），可使用 `gateway start` 启动后台进程，或使用 Docker 部署方案。

> **Dashboard 语言设置**：首次打开网页控制台后，前往 **Overview** 页面底部，将 **Language** 切换为 **简体中文 (Simplified Chinese)**，即可显示中文界面。设置后刷新页面生效。

---

## 网关重启

```bash
# 方式 1：使用 gateway 子命令（推荐）
openclaw gateway restart

# 方式 2：先停止再启动
openclaw gateway stop
openclaw gateway start

# 方式 3：守护进程模式（后台运行，不挂终端）
openclaw daemon start       # 启动后台守护
openclaw daemon stop        # 停止守护
openclaw daemon restart    # 重启守护
openclaw daemon status     # 查看状态

# Docker 容器重启
docker restart openclaw
```

---

## 卸载教程

### CLI 卸载

```bash
# 卸载汉化版
npm uninstall -g @coryrowe/openclaw-zh

# 如果之前安装过原版，也一并卸载
npm uninstall -g openclaw
```

### 数据清理（可选）

```bash
# 删除配置和缓存（不可恢复！）
rm -rf ~/.openclaw

# Docker 清理
docker rm -f openclaw                # 删除容器
docker volume rm openclaw-data       # 删除数据卷
```

### 守护进程卸载

```bash
# macOS
launchctl unload ~/Library/LaunchAgents/com.openclaw.plist
rm ~/Library/LaunchAgents/com.openclaw.plist

# Linux (systemd)
sudo systemctl stop openclaw
sudo systemctl disable openclaw
sudo rm /etc/systemd/system/openclaw.service
sudo systemctl daemon-reload
```

---

---

## 更新升级

```bash
npm update -g @coryrowe/openclaw-zh
```

> 查看当前版本：`openclaw --version`

| 版本 | 安装命令 | 说明 |
|------|----------|------|
| **稳定版** | `npm install -g @coryrowe/openclaw-zh@latest` | **推荐**：同步 OpenClaw 官方**稳定版**|

---

## Docker 部署

> **推荐使用 Docker Hub 镜像**，拉取速度快，无需翻墙！

| 镜像源 | 拉取命令 |
|--------|----------|
| **Docker Hub** | `docker pull coryrowe/openclaw-zh:latest` |
| GitHub Container Registry | `docker pull ghcr.io/cnrot/openclaw-zh:latest` |

### 一键部署（最简单）

```bash
# Linux/macOS — 加 --china 自动使用国内镜像
curl -fsSL https://cdn.jsdelivr.net/gh/cnrot/OpenClaw-zh@main/docker-deploy.sh | bash -s -- --china
```

```powershell
# Windows PowerShell — 加 -China 自动使用国内镜像
irm https://cdn.jsdelivr.net/gh/cnrot/OpenClaw-zh@main/docker-deploy.ps1 | iex
# 或: .\docker-deploy.ps1 -China
```

### 手动 Docker 部署

```bash
# 推荐使用 Docker Hub 镜像
IMAGE=coryrowe/openclaw-zh:latest
# 海外使用: IMAGE=ghcr.io/cnrot/openclaw-zh:latest

# 1. 初始化（首次运行）
# Docker 需要交互式运行来配置 AI 模型和 API 密钥
docker run --rm -it -v openclaw-data:/root/.openclaw $IMAGE openclaw onboard

# 按向导完成：选择模型 → 配置 API 密钥 → 设置聊天通道

# 2. 配置网关模式
docker run --rm -v openclaw-data:/root/.openclaw $IMAGE openclaw config set gateway.mode local

# 3. 启动（守护进程模式，容器会一直运行）
docker run -d --name openclaw -p 18789:18789 \
  -v openclaw-data:/root/.openclaw --restart unless-stopped \
  $IMAGE openclaw gateway run
```

**参数说明：**
- `-d`: 后台运行（守护进程模式）
- `--name openclaw`: 给容器取名，方便管理
- `-p 18789:18789`: 端口映射
- `--restart unless-stopped`: 除非手动停止，否则一直运行
- `openclaw gateway run`: 启动网关（容器启动命令）

访问：`http://localhost:18789`

> 完整指南（远程部署、Nginx 反代、Docker Compose、内网访问等）请查看 **[Docker 部署指南](docs/DOCKER_GUIDE.md)**

---

## 其他安装方式

<details>
<summary><b>一键安装脚本（npm）</b></summary>

**Linux / macOS：**
```bash
curl -fsSL -o install.sh https://cdn.jsdelivr.net/gh/cnrot/OpenClaw-zh@main/install.sh &amp;&amp; bash install.sh
```

**Windows PowerShell：**
```powershell
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/gh/cnrot/OpenClaw-zh@main/install.ps1" -OutFile "install.ps1" -Encoding UTF8; powershell -ExecutionPolicy Bypass -File ".\install.ps1"
```

> 如遇中文乱码，直接用 npm 安装：`npm install -g @coryrowe/openclaw-zh@latest`

</details>

<details>
<summary><b>npm 国内加速安装</b></summary>

```bash
# 使用 npmmirror 镜像源（国内推荐）
npm install -g @coryrowe/openclaw-zh@latest --registry=https://registry.npmmirror.com

# 或全局设置镜像源后再安装
npm config set registry https://registry.npmmirror.com
npm install -g @coryrowe/openclaw-zh@latest
```

</details>

<details>
<summary><b>pnpm / yarn 安装</b></summary>

```bash
# pnpm
pnpm add -g @coryrowe/openclaw-zh@latest

# yarn
yarn global add @coryrowe/openclaw-zh@latest
```

</details>

<details>
<summary><b>Git 克隆加速</b></summary>

```bash
# 方案 1: 使用 GitHub 代理
git clone https://ghproxy.net/https://github.com/cnrot/OpenClaw-zh.git

# 方案 2: 无需 git，直接用 npx 运行
npx @coryrowe/openclaw-zh@latest
```

</details>

---


---

## 📱 手机端 — ClawApp

> **想用手机和 AI 智能体聊天？** [ClawApp](https://github.com/qingchencloud/clawapp) 是 OpenClaw 的移动端 H5 聊天客户端，打开浏览器就能用，不需要装 App。

OpenClaw Gateway 默认只监听本机（`127.0.0.1:18789`），手机无法直接连接。ClawApp 通过 WebSocket 代理解决了这个问题：

```
手机浏览器（任意网络）
    ↓ WebSocket (WS / WSS)
ClawApp 代理服务端（端口 3210）
    ↓ WebSocket (localhost)
OpenClaw Gateway（端口 18789）
```

**核心特性**：实时流式聊天 · 图片发送 · Markdown 渲染 + 代码高亮 · 快捷指令 · 会话管理 · 暗色/亮色主题 · 中英文切换 · PWA 支持 · Android APK

**快速部署**（Docker 一键启动）：

```bash
git clone https://github.com/qingchencloud/clawapp.git
cd clawapp

# 创建 .env，填入你的 Token
echo 'PROXY_TOKEN=设置一个连接密码' > .env
echo 'OPENCLAW_GATEWAY_TOKEN=你的gateway-token' >> .env

docker compose up -d --build
```

手机浏览器打开 `http://你的电脑IP:3210` 即可使用。

> 详细文档（外网访问、Cloudflare Tunnel、Nginx 反代等）请查看 **[ClawApp 项目主页](https://github.com/qingchencloud/clawapp)** | **[产品官网](https://clawapp.qt.cool/)**

---

## 常见问题

### 🔥 Top 3 高频问题

<details open>
<summary><b>❶ 安装卡住 / 下载慢</b></summary>

**原因**：npm 默认从国外源下载，国内网络可能很慢。

**解决**：加 `--registry` 参数使用国内镜像源，或直接用 Docker 部署：
```bash
# 方案 1：npm 加镜像源
npm install -g @coryrowe/openclaw-zh@latest --registry=https://registry.npmmirror.com

# 方案 2：用 Docker
docker pull coryrowe/openclaw-zh:latest
```

> [详细说明 →](docs/FAQ.md#安装卡住不动--下载很慢)

</details>

<details open>
<summary><b>❷ 安装后还是英文界面</b></summary>

**原因**：系统上还残留了英文原版 `openclaw`，它的优先级高于汉化版。

**解决**：先卸载原版，再重装汉化版：
```bash
npm uninstall -g openclaw
npm install -g @coryrowe/openclaw-zh@latest
```

验证：`openclaw --version` 输出应包含 `-zh` 后缀。

> [详细说明 →](docs/FAQ.md#安装后运行还是英文)

</details>

<details open>
<summary><b>❸ 打开 Dashboard 报 `pairing required` 或 `token mismatch`</b></summary>

**原因**：OpenClaw 的安全机制要求设备配对或 Token 验证。

**解决**：

```bash
# token mismatch —— 用 dashboard 命令自动带 Token 打开：
openclaw dashboard

# pairing required —— 批准设备：
openclaw devices list           # 查看待批准设备 ID
openclaw devices approve <ID>   # 批准该设备

# Docker 用户如果无法运行 CLI，可以一键关闭设备认证：
docker run --rm -v openclaw-data:/root/.openclaw \
  coryrowe/openclaw-zh:latest \
  openclaw config set gateway.controlUi.dangerouslyDisableDeviceAuth true
# 然后重启容器
```

> [token mismatch 详细说明 →](docs/FAQ.md#gateway-token-mismatch--unauthorized) | [pairing required 详细说明 →](docs/FAQ.md#pairing-required--设备配对)

</details>

### 其他常见问题

| 问题 | 快速解决 | 详情 |
|------|----------|------|
| **安装报 `Permission denied (publickey)`** | `git config --global url."https://github.com/".insteadOf ssh://git@github.com/` | [查看 →](docs/FAQ.md#安装报错-permission-denied-publickey--git-error-code-128) |
| **远程 / 内网访问不了** | `openclaw config set gateway.bind lan` 然后重启 | [查看 →](docs/FAQ.md#npm-安装后内网其他电脑无法访问) |
| **镜像源版本落后** | 去掉 `--registry` 参数直接安装，或等待镜像同步（已自动触发） | [#32](https://github.com/1186258278/OpenClawChineseTranslation/issues/32) |
| **`Missing config`** | 运行 `openclaw onboard` 初始化配置 | [查看 →](docs/FAQ.md#missing-config-run-openclaw-setup) |
| **`Missing workspace template`** | 升级到最新版即可：`npm install -g @coryrowe/openclaw-zh@latest` | [查看 →](docs/FAQ.md#missing-workspace-template-agentsmd) |
| **Ollama 无响应** | 检查 baseURL 是否为 `http://localhost:11434/v1` | [查看 →](docs/FAQ.md#本地-ollama-模型调用无响应) |
| **Docker 容器启动后退出** | 确保启动命令包含 `openclaw gateway run` | [查看 →](docs/DOCKER_GUIDE.md#常见错误排查) |
| **Docker 打不开 Dashboard** | 设置 `gateway.bind lan` 监听所有网卡 | [查看 →](docs/DOCKER_GUIDE.md#常见错误排查) |

> **[完整排查手册 (25+ 个问题)](docs/FAQ.md)** | **[Docker 问题排查](docs/DOCKER_GUIDE.md#常见错误排查)**

---

## 插件扩展

```bash
# 安装更新检测插件
npm install -g @coryrowe/openclaw-updater
```

---

## 相关链接

| 汉化版 | 上游项目 |
|--------|----------|
| [npm 包](https://www.npmjs.com/package/@coryrowe/openclaw-zh) | [OpenClaw GitHub](https://github.com/openclaw/openclaw) |
| [GitHub 仓库](https://github.com/cnrot/OpenClaw-zh) | [ClawHub 技能市场](https://clawhub.dev/) |
| [GitHub Pages](https://cnrot.github.io/OpenClaw-zh/) | [Discord 社区](https://discord.gg/openclaw) |

---



<!-- AI Translation Tools: Claude, Copilot, Codex, Devin, Amazon Q, CodeRabbit -->