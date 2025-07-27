@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo 🚀 开始部署Hexo博客...

REM 检查是否在main分支
for /f "tokens=*" %%i in ('git branch --show-current') do set current_branch=%%i
if not "%current_branch%"=="main" (
    echo ❌ 错误：请在main分支上运行此脚本
    echo 当前分支: %current_branch%
    echo 请运行: git checkout main
    pause
    exit /b 1
)

REM 清理之前的构建
echo 🧹 清理之前的构建文件...
call npx hexo clean

REM 生成静态文件
echo 📝 生成静态文件...
call npx hexo generate

REM 检查生成是否成功
if not exist "public" (
    echo ❌ 错误：静态文件生成失败
    pause
    exit /b 1
)

REM 获取提交信息
if "%1"=="" (
    for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set commit_msg=Site updated: %%c-%%a-%%b %time%
) else (
    set commit_msg=%1
)

REM 部署到GitHub Pages
echo 🚀 部署到GitHub Pages...
call npx hexo deploy

REM 检查部署是否成功
if %errorlevel% equ 0 (
    echo ✅ 部署成功！
    echo 📝 提交信息: %commit_msg%
    echo 🌐 你的博客应该很快就能在 https://Maricey.github.io/HexoBlog 访问了
) else (
    echo ❌ 部署失败，请检查错误信息
    pause
    exit /b 1
)

echo 🎉 部署完成！
pause 