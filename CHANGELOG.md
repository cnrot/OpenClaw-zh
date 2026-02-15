<!--
 * @Author: cnrot
 * @Date: 2026-02-14 00:53:54
 * @LastEditors: Rowe inetech@zohomail.com
 * @LastEditTime: 2026-02-15 21:25:39
 * @FilePath: \OpenClaw-zh\CHANGELOG.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# 更新日志

## [2026.2.14-zh.1] - 2026-02-15

### ✨ 汉化更新
- **申算云 (ShengSuanYun) Provider**: 新增完整的申算云 Provider 汉化支持，包括 13 个翻译文件和 4 个 TypeScript 源文件。
  - 新增文件: `providers/shengsuanyun-*.json` (13 个)
  - 新增源文件: `providers/files/agents/shengsuanyun-models.ts` 及相关工具文件

### 📝 文档更新
- 更新翻译配置，确保所有 ShengSuanYun 相关功能正确汉化。

### 🐛 已知问题
- **OpenClaw 官方 Bug**: OpenClaw 2026.2.14 版本存在权限错误问题
  - **问题**: 通过局域网 IP 访问 WebUI 时，除 Overview 页面外其他页面报错 `Error: missing scope: operator.read`
  - **影响**: 无法通过 IP 地址直接使用 WebUI
  - **临时方案**: 使用 `localhost` 或 `127.0.0.1` 访问
  - **官方修复**: PR #17127 已提交，等待官方发布新版本修复
  - **参考**: [GitHub Issue #16862](https://github.com/openclaw/openclaw/issues/16862)

##  [2026.2.9-zh.1] - 2026-02-13

### 项目二开
- **Fork 源项目**：本项目基于源 1186258278/OpenClawChineseTranslation 进行 fork 二次修改。
- **移除推广内容**：移除了广告和推广内容。


## [2026.2.9-zh.1] - 2026-02-10

### ✨ 汉化更新
- **CLI 命令行**: 汉化了 `openclaw --help` 中的大部分子命令说明（如 `acp`, `gateway`, `tui` 等 25 个命令）。

### 🐛 问题修复
- **构建修复**: 修复了上游 v2026.2.9 代码中存在的 TypeScript 类型错误 (`ChatType` vs `"dm"`)，确保稳定版能正常构建。

## [2026.2.9] - 2026-02-10

### 🔄 同步更新
- 同步上游 OpenClaw 代码至 **v2026.2.9** 版本。
- 确保所有核心功能与官方最新版保持一致。

### ✨ 新增翻译
- **语音通话 (Voice Call)**: 新增扩展及其 CLI 命令的完整汉化。
- **飞书 (Feishu)**:
    - 适配新版插件架构，迁移并更新了飞书集成翻译。
    - 新增飞书多维表格 (Bitable) 和入职流程 (Onboarding) 的汉化。
- **向导 (Wizard)**:
    - 完成初始化向导中网关配置 (Gateway Config) 的翻译。
    - 更新入职流程相关命令。
- **CLI 命令行**:
    - 新增模型管理 (Models CLI) 的汉化。
    - 更新认证提供商 (Auth Providers) 选择界面的汉化。

### 🐛 问题修复
- **仪表盘 (Dashboard)**: 修复了“用量统计” (Usage) 页面翻译丢失/错误的问题，现在可正常显示。

### 🐳 Docker 镜像
- Nightly 构建已包含上述所有更新。
- 推荐使用标签: `coryrowe/openclaw-zh:nightly` (或等待稳定版发布)。
