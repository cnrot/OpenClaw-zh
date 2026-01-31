# ============================================================
# OpenClaw 汉化发行版 - Docker 镜像
# 武汉晴辰天下网络科技有限公司 | https://qingchencloud.com/
# ============================================================
#
# 构建方式：
#   docker build -t openclaw-zh:latest .
#
# 运行方式：
#   docker run -d --name openclaw -p 18789:18789 -v openclaw-data:/root/.openclaw openclaw-zh:latest
#
# ============================================================

FROM node:22-slim AS builder

# 安装构建依赖
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# 安装 pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# 设置工作目录
WORKDIR /app

# 复制源代码
COPY . .

# 安装依赖并构建
RUN pnpm install --frozen-lockfile || pnpm install
RUN pnpm run build

# ============================================================
# 运行时镜像
# ============================================================
FROM node:22-slim

LABEL org.opencontainers.image.source="https://github.com/1186258278/OpenClawChineseTranslation"
LABEL org.opencontainers.image.description="OpenClaw 汉化发行版 - 开源个人 AI 助手中文版"
LABEL org.opencontainers.image.licenses="MIT"
LABEL maintainer="武汉晴辰天下网络科技有限公司 <contact@qingchencloud.com>"

# 安装运行时依赖
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    chromium \
    && rm -rf /var/lib/apt/lists/*

# 设置 Chromium 环境变量（用于浏览器自动化）
ENV CHROME_BIN=/usr/bin/chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# 设置工作目录
WORKDIR /app

# 从构建阶段复制构建产物
COPY --from=builder /app/package.json /app/
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/openclaw.mjs /app/

# 全局链接
RUN npm link

# 创建配置目录
RUN mkdir -p /root/.openclaw

# 暴露端口
EXPOSE 18789

# 数据持久化目录
VOLUME ["/root/.openclaw"]

# 默认启动命令
CMD ["openclaw"]
