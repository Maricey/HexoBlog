---
title: Git使用操作手册 - 从入门到精通
date: 2025-07-27 17:00:00
categories: 
  - 开发工具
  - 版本控制
tags:
  - Git
  - 版本控制
  - 开发工具
  - 命令行
  - 协作开发
---

# Git使用操作手册 - 从入门到精通

Git是目前最流行的分布式版本控制系统，广泛应用于软件开发中。本手册将带你从零开始学习Git，掌握日常开发中常用的操作。

## 📋 目录

- [Git基础概念](#git基础概念)
- [Git安装与配置](#git安装与配置)
- [基础操作](#基础操作)
- [分支管理](#分支管理)
- [远程仓库](#远程仓库)
- [高级操作](#高级操作)
- [常见问题解决](#常见问题解决)
- [最佳实践](#最佳实践)

---

## 🎯 Git基础概念

### 什么是Git？

Git是一个分布式版本控制系统，由Linux之父Linus Torvalds在2005年创建。它能够：

- **跟踪文件变化**：记录每次代码修改的历史
- **协作开发**：多人同时开发同一项目
- **版本回退**：随时回到之前的版本
- **分支管理**：创建不同的开发分支

### Git工作流程

```
工作区 (Working Directory)
    ↓ git add
暂存区 (Staging Area)
    ↓ git commit
本地仓库 (Local Repository)
    ↓ git push
远程仓库 (Remote Repository)
```

### 核心概念

- **工作区**：你直接编辑文件的地方
- **暂存区**：准备提交的文件临时存储区
- **本地仓库**：本地的版本历史记录
- **远程仓库**：网络上的代码仓库（如GitHub）

---

## ⚙️ Git安装与配置

### 安装Git

#### Windows
```bash
# 下载并安装Git for Windows
# https://git-scm.com/download/win
```

#### macOS
```bash
# 使用Homebrew安装
brew install git

# 或使用Xcode Command Line Tools
xcode-select --install
```

#### Linux
```bash
# Ubuntu/Debian
sudo apt-get install git

# CentOS/RHEL
sudo yum install git
```

### 初始配置

```bash
# 设置用户名和邮箱
git config --global user.name "你的姓名"
git config --global user.email "你的邮箱@example.com"

# 设置默认编辑器
git config --global core.editor "code --wait"  # VS Code
git config --global core.editor "vim"          # Vim

# 查看配置
git config --list
```

### SSH密钥配置

```bash
# 生成SSH密钥
ssh-keygen -t rsa -b 4096 -C "你的邮箱@example.com"

# 启动ssh-agent
eval "$(ssh-agent -s)"

# 添加SSH密钥
ssh-add ~/.ssh/id_rsa

# 复制公钥到剪贴板（Windows）
clip < ~/.ssh/id_rsa.pub

# 复制公钥到剪贴板（macOS）
pbcopy < ~/.ssh/id_rsa.pub

# 复制公钥到剪贴板（Linux）
cat ~/.ssh/id_rsa.pub
```

---

## 🚀 基础操作

### 创建仓库

```bash
# 初始化新仓库
git init

# 克隆现有仓库
git clone <repository-url>
git clone <repository-url> <directory-name>

# 克隆特定分支
git clone -b <branch-name> <repository-url>
```

### 文件操作

```bash
# 查看仓库状态
git status

# 查看文件变化
git diff
git diff <filename>

# 添加文件到暂存区
git add <filename>
git add .                    # 添加所有文件
git add *.js                 # 添加所有JS文件
git add -A                   # 添加所有变化

# 提交更改
git commit -m "提交信息"
git commit -am "提交信息"    # 跳过暂存区直接提交

# 查看提交历史
git log
git log --oneline           # 简洁显示
git log --graph             # 图形化显示
git log -p                  # 显示详细变化
```

### 文件管理

```bash
# 删除文件
git rm <filename>           # 删除文件并暂存
git rm --cached <filename>  # 从暂存区删除，保留文件

# 重命名文件
git mv <old-name> <new-name>

# 忽略文件
# 在.gitignore文件中添加规则
echo "*.log" >> .gitignore
echo "node_modules/" >> .gitignore
```

---

## 🌿 分支管理

### 分支基础

```bash
# 查看分支
git branch                  # 本地分支
git branch -r               # 远程分支
git branch -a               # 所有分支

# 创建分支
git branch <branch-name>
git checkout -b <branch-name>  # 创建并切换

# 切换分支
git checkout <branch-name>
git switch <branch-name>    # Git 2.23+新命令

# 删除分支
git branch -d <branch-name>     # 安全删除
git branch -D <branch-name>     # 强制删除
```

### 分支合并

```bash
# 合并分支
git merge <branch-name>     # 合并到当前分支
git merge --no-ff <branch-name>  # 禁用快进合并

# 解决冲突
# 1. 编辑冲突文件
# 2. 添加解决后的文件
git add <filename>
# 3. 完成合并
git commit

# 取消合并
git merge --abort
```

### 变基操作

```bash
# 变基操作
git rebase <branch-name>

# 交互式变基
git rebase -i HEAD~3        # 修改最近3次提交

# 取消变基
git rebase --abort
```

---

## 🌐 远程仓库

### 远程仓库管理

```bash
# 查看远程仓库
git remote -v

# 添加远程仓库
git remote add origin <repository-url>

# 修改远程仓库
git remote set-url origin <new-url>

# 删除远程仓库
git remote remove origin
```

### 推送和拉取

```bash
# 推送到远程仓库
git push origin <branch-name>
git push -u origin <branch-name>  # 设置上游分支

# 从远程仓库拉取
git pull origin <branch-name>
git fetch origin                  # 只下载不合并

# 强制推送（谨慎使用）
git push --force origin <branch-name>
git push --force-with-lease origin <branch-name>  # 更安全
```

### 标签管理

```bash
# 创建标签
git tag <tag-name>
git tag -a <tag-name> -m "标签信息"  # 带注释的标签

# 查看标签
git tag
git show <tag-name>

# 推送标签
git push origin <tag-name>
git push origin --tags            # 推送所有标签

# 删除标签
git tag -d <tag-name>
git push origin :refs/tags/<tag-name>  # 删除远程标签
```

---

## 🔧 高级操作

### 提交管理

```bash
# 修改最后一次提交
git commit --amend

# 重置提交
git reset --soft HEAD~1     # 保留更改在暂存区
git reset --mixed HEAD~1    # 保留更改在工作区
git reset --hard HEAD~1     # 完全删除更改

# 查看提交详情
git show <commit-hash>
git show HEAD               # 查看最新提交
```

### 暂存操作

```bash
# 暂存当前工作
git stash
git stash push -m "暂存信息"

# 查看暂存列表
git stash list

# 应用暂存
git stash apply             # 应用但不删除
git stash pop               # 应用并删除
git stash apply stash@{n}   # 应用特定暂存

# 删除暂存
git stash drop stash@{n}
git stash clear             # 删除所有暂存
```

### 子模块

```bash
# 添加子模块
git submodule add <repository-url> <path>

# 克隆包含子模块的仓库
git clone --recursive <repository-url>
git submodule update --init --recursive

# 更新子模块
git submodule update --remote
```

---

## 🛠️ 常见问题解决

### 撤销操作

```bash
# 撤销工作区的修改
git checkout -- <filename>
git restore <filename>      # Git 2.23+

# 撤销暂存区的修改
git reset HEAD <filename>
git restore --staged <filename>  # Git 2.23+

# 撤销提交
git revert <commit-hash>    # 创建新提交撤销
git reset --hard <commit-hash>  # 直接回退
```

### 冲突解决

```bash
# 查看冲突文件
git status

# 手动解决冲突后
git add <filename>
git commit

# 使用工具解决冲突
git mergetool
```

### 找回丢失的提交

```bash
# 查看操作历史
git reflog

# 找回丢失的提交
git reset --hard HEAD@{n}
```

---

## 📚 最佳实践

### 提交信息规范

```bash
# 使用清晰的提交信息
git commit -m "feat: 添加用户登录功能"
git commit -m "fix: 修复登录页面样式问题"
git commit -m "docs: 更新README文档"
git commit -m "style: 格式化代码"
git commit -m "refactor: 重构用户模块"
git commit -m "test: 添加登录功能测试"
```

### 分支命名规范

```bash
# 功能分支
feature/user-login
feature/payment-system

# 修复分支
hotfix/critical-bug
bugfix/login-error

# 发布分支
release/v1.2.0
```

### 工作流程

#### Git Flow
```bash
# 主分支
main/master    # 生产环境代码
develop        # 开发环境代码

# 功能分支
feature/*      # 新功能开发
hotfix/*       # 紧急修复
release/*      # 版本发布
```

#### GitHub Flow
```bash
# 简化的工作流程
main           # 主分支
feature/*      # 功能分支
```

### 安全建议

```bash
# 定期备份
git push origin main

# 使用SSH密钥
# 避免在代码中存储敏感信息

# 定期清理
git gc
git prune
```

---

## 🎯 常用命令速查

### 日常操作
```bash
git status              # 查看状态
git add .               # 添加所有文件
git commit -m "信息"     # 提交更改
git push                # 推送到远程
git pull                # 拉取更新
```

### 分支操作
```bash
git branch              # 查看分支
git checkout -b 分支名   # 创建并切换分支
git merge 分支名         # 合并分支
git branch -d 分支名     # 删除分支
```

### 查看信息
```bash
git log --oneline       # 查看提交历史
git diff                # 查看文件变化
git show 提交哈希        # 查看提交详情
```

### 撤销操作
```bash
git checkout -- 文件名   # 撤销文件修改
git reset HEAD 文件名    # 撤销暂存
git revert 提交哈希      # 撤销提交
```

---

## 📖 学习资源

### 官方文档
- [Git官方文档](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)

### 在线教程
- [Git教程 - 廖雪峰](https://www.liaoxuefeng.com/wiki/896043488029600)
- [Learn Git Branching](https://learngitbranching.js.org/)

### 图形化工具
- **GitHub Desktop**：GitHub官方桌面客户端
- **SourceTree**：免费的Git图形化工具
- **GitKraken**：功能强大的Git客户端
- **VS Code Git**：编辑器内置Git功能

---

## 🎉 总结

Git是一个强大的版本控制工具，掌握它对于现代软件开发至关重要。通过本手册的学习，你应该能够：

1. ✅ 理解Git的基本概念和工作原理
2. ✅ 熟练使用Git的常用命令
3. ✅ 掌握分支管理和合并策略
4. ✅ 学会与远程仓库协作
5. ✅ 解决常见的Git问题
6. ✅ 遵循Git的最佳实践

记住，Git的学习是一个渐进的过程，建议在实际项目中多加练习。随着经验的积累，你会越来越熟练地使用Git来管理你的代码。

**Happy Coding! 🚀** 