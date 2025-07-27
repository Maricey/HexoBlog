---
title: Hexo博客更新部署完全指南
date: 2025-01-20 15:00:00
updated: 2025-01-20 15:00:00
categories:
  - Blog
  - Hexo
tags:
  - Hexo
  - 博客部署
  - GitHub Pages
  - 静态网站
  - 网站维护
  - 内容管理
keywords:
  - Hexo更新
  - 博客部署
  - GitHub Pages部署
  - 静态网站维护
  - 内容更新
description: 详细介绍如何更新和部署 Hexo 博客，包括创建新文章、编辑内容、本地预览、一键部署等完整流程。
---

# Hexo博客更新部署完全指南

## 前言

搭建好 Hexo 博客后，日常的内容更新和部署是维护博客的重要环节。本文将详细介绍如何高效地更新和部署你的 Hexo 博客，让你轻松管理个人网站。

## 目录

- [快速开始](#快速开始)
- [创建新文章](#创建新文章)
- [编辑文章内容](#编辑文章内容)
- [本地预览](#本地预览)
- [部署上线](#部署上线)
- [常用命令速查](#常用命令速查)
- [最佳实践](#最佳实践)
- [故障排除](#故障排除)

## 快速开始

### 🚀 一键更新部署（推荐）

最简单的更新方式，一条命令完成所有操作：

```bash
hexo clean && hexo generate && hexo deploy
```

这个命令会：
1. **清理**：删除旧的生成文件
2. **生成**：重新生成静态文件
3. **部署**：自动推送到 GitHub Pages

## 创建新文章

### 1. 使用命令行创建

```bash
hexo new "文章标题"
```

这会在 `source/_posts/` 目录下创建一个新的 Markdown 文件。

### 2. 手动创建

你也可以直接在 `source/_posts/` 目录下手动创建 `.md` 文件。

### 3. 文章 Front-matter

每篇文章的头部需要包含以下信息：

```yaml
---
title: 文章标题
date: 2025-01-20 15:00:00
updated: 2025-01-20 15:00:00
categories:
  - 技术教程
  - Hexo
tags:
  - Hexo
  - 博客部署
  - GitHub Pages
keywords:
  - 关键词1
  - 关键词2
description: 文章描述
---
```

## 编辑文章内容

### 1. 使用 Markdown 语法

Hexo 支持完整的 Markdown 语法：

```markdown
# 一级标题
## 二级标题
### 三级标题

**粗体文本**
*斜体文本*

- 列表项1
- 列表项2

[链接文本](URL)

![图片描述](图片URL)

`代码片段`

```javascript
// 代码块
function hello() {
    console.log("Hello World!");
}
```
```

### 2. 插入图片

将图片放在 `source/img/` 目录下，然后在文章中引用：

```markdown
![图片描述](/img/图片名称.jpg)
```

### 3. 使用 Fluid 主题标签

Fluid 主题提供了丰富的标签功能：

```markdown
{% note primary %}
这是一个提示框
{% endnote %}

{% tabs 标签页 %}
<!-- tab 标签1 -->
内容1
<!-- endtab -->
<!-- tab 标签2 -->
内容2
<!-- endtab -->
{% endtabs %}
```

## 本地预览

### 启动本地服务器

```bash
hexo server
```

然后访问 `http://localhost:4000` 预览你的博客。

### 实时预览

```bash
hexo server --draft
```

这会显示草稿文章。

## 部署上线

### 1. 生成静态文件

```bash
hexo generate
# 或简写
hexo g
```

### 2. 部署到 GitHub Pages

```bash
hexo deploy
# 或简写
hexo d
```

### 3. 一键部署（推荐）

```bash
hexo clean && hexo generate && hexo deploy
```

## 常用命令速查

| 命令 | 简写 | 说明 |
|------|------|------|
| `hexo new "标题"` | - | 创建新文章 |
| `hexo new page "页面名"` | - | 创建新页面 |
| `hexo clean` | - | 清理生成文件 |
| `hexo generate` | `hexo g` | 生成静态文件 |
| `hexo deploy` | `hexo d` | 部署到 GitHub Pages |
| `hexo server` | `hexo s` | 启动本地服务器 |
| `hexo clean && hexo g && hexo d` | - | 一键更新部署 |

## 最佳实践

### 1. 工作流程

1. **创建文章**：`hexo new "标题"`
2. **编辑内容**：使用你喜欢的编辑器
3. **本地预览**：`hexo server` 检查效果
4. **部署上线**：`hexo clean && hexo g && hexo d`

### 2. 版本管理

```bash
# 提交源代码到 Git
git add .
git commit -m "添加新文章：文章标题"
git push
```

### 3. 自动化脚本

创建 `update.bat` 文件（Windows）：

```batch
@echo off
echo 正在更新博客...
hexo clean && hexo generate && hexo deploy
echo 更新完成！
pause
```

创建 `update.sh` 文件（Linux/Mac）：

```bash
#!/bin/bash
echo "正在更新博客..."
hexo clean && hexo generate && hexo deploy
echo "更新完成！"
```

### 4. 定期备份

- 定期将源代码推送到 GitHub
- 备份重要的配置文件
- 保存自定义的主题文件

## 故障排除

### 1. 部署失败

**问题**：`hexo deploy` 失败
**解决**：
- 检查网络连接
- 确认 GitHub 仓库权限
- 检查 SSH 密钥配置

### 2. 页面显示异常

**问题**：部署后页面显示不正确
**解决**：
- 运行 `hexo clean` 清理缓存
- 检查主题配置
- 查看浏览器控制台错误

### 3. 图片无法显示

**问题**：图片显示 404 错误
**解决**：
- 确认图片路径正确
- 检查图片是否在 `source/img/` 目录
- 重新生成和部署

### 4. 搜索功能异常

**问题**：本地搜索不工作
**解决**：
- 确认生成了 `local-search.xml` 文件
- 检查 Fluid 主题搜索配置
- 清除浏览器缓存

## 高级技巧

### 1. 草稿功能

```bash
# 创建草稿
hexo new draft "草稿标题"

# 发布草稿
hexo publish "草稿标题"
```

### 2. 多环境部署

可以配置多个部署目标：

```yaml
deploy:
  - type: git
    repo: git@github.com:username/repo.git
    branch: main
  - type: git
    repo: git@gitlab.com:username/repo.git
    branch: main
```

### 3. 自定义域名

在 `source/` 目录下创建 `CNAME` 文件：

```
yourdomain.com
```

### 4. 性能优化

- 压缩图片
- 使用 CDN
- 启用 Gzip 压缩
- 优化 CSS 和 JS

## 总结

通过本文的指南，你应该能够：

1. ✅ 熟练创建和编辑文章
2. ✅ 使用本地预览功能
3. ✅ 一键部署到 GitHub Pages
4. ✅ 掌握常用命令和最佳实践
5. ✅ 解决常见问题

记住，**一键更新命令**是你的好朋友：
```bash
hexo clean && hexo generate && hexo deploy
```

现在开始写你的博客吧！🎉

---

**相关文章**：
- [Hexo + Fluid 主题配置完全指南](/2025/07/26/hexo-fluid-configuration-guide/)
- [About 页面配置完全指南](/2025/01/20/about-page-configuration-guide/)

**最后更新**：2025年1月20日
