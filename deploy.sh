#!/bin/bash

# Hexo博客一键部署脚本
# 使用方法: ./deploy.sh [commit_message]

echo "🚀 开始部署Hexo博客..."

# 检查是否在main分支
current_branch=$(git branch --show-current)
if [ "$current_branch" != "main" ]; then
    echo "❌ 错误：请在main分支上运行此脚本"
    echo "当前分支: $current_branch"
    echo "请运行: git checkout main"
    exit 1
fi

# 清理之前的构建
echo "🧹 清理之前的构建文件..."
npx hexo clean

# 生成静态文件
echo "📝 生成静态文件..."
npx hexo generate

# 检查生成是否成功
if [ ! -d "public" ]; then
    echo "❌ 错误：静态文件生成失败"
    exit 1
fi

# 获取提交信息
if [ -z "$1" ]; then
    commit_msg="Site updated: $(date '+%Y-%m-%d %H:%M:%S')"
else
    commit_msg="$1"
fi

# 部署到GitHub Pages
echo "🚀 部署到GitHub Pages..."
npx hexo deploy

# 检查部署是否成功
if [ $? -eq 0 ]; then
    echo "✅ 部署成功！"
    echo "📝 提交信息: $commit_msg"
    echo "🌐 你的博客应该很快就能在 https://Maricey.github.io/HexoBlog 访问了"
else
    echo "❌ 部署失败，请检查错误信息"
    exit 1
fi

echo "🎉 部署完成！" 