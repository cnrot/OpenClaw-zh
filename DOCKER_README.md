<!--
 * @Author: cnrot
 * @Date: 2026-02-14 00:53:54
 * @LastEditors: Rowe inetech@zohomail.com
 * @LastEditTime: 2026-02-15 22:01:51
 * @FilePath: \OpenClaw-zh\DOCKER_README.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# OpenClaw 汉化发行版 - Docker 镜像

> OpenClaw (Clawdbot/Moltbot) 中文汉化版。`latest` 标签同步官方稳定版。

## 快速启动

```bash
# 初始化配置
docker run --rm -v openclaw-data:/root/.openclaw \
  coryrowe/openclaw-zh:latest openclaw setup

docker run --rm -v openclaw-data:/root/.openclaw \
  coryrowe/openclaw-zh:latest openclaw config set gateway.mode local

# 启动容器
docker run -d --name openclaw -p 18789:18789 \
  -v openclaw-data:/root/.openclaw \
  --restart unless-stopped \
  coryrowe/openclaw-zh:latest \
  openclaw gateway run
```

访问: `http://localhost:18789`

## 可用标签

| 标签 | 说明 |
|------|------|
| `latest` | **稳定版**：同步 OpenClaw 官方发布的**稳定版本**，推荐日常使用。 |

## Docker Compose

```yaml
version: '3.8'
services:
  openclaw:
    image: coryrowe/openclaw-zh:latest
    container_name: openclaw
    ports:
      - "18789:18789"
    volumes:
      - openclaw-data:/root/.openclaw
    restart: unless-stopped
    command: openclaw gateway run

volumes:
  openclaw-data:
```

- [GitHub 仓库](https://github.com/cnrot/OpenClaw-zh)
- [项目更新日志](https://github.com/cnrot/OpenClaw-zh/blob/main/CHANGELOG.md)
- [完整 Docker 部署指南](https://github.com/cnrot/OpenClaw-zh/blob/main/docs/DOCKER_GUIDE.md)
- [npm 包](https://www.npmjs.com/package/@coryrowe/openclaw-zh)
