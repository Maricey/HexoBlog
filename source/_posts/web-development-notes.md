---
title: Web开发笔记 - HTML/CSS/JavaScript示例
date: 2025-07-27 16:30:00
categories: 
  - Web开发
  - 前端技术
tags:
  - HTML
  - CSS
  - JavaScript
  - 前端开发
---

# Web开发笔记

这是一个展示如何在Hexo Fluid主题中使用HTML、CSS、JavaScript的示例文章。

## 1. 内联HTML示例

<div style="background: linear-gradient(45deg, #ff6b6b, #4ecdc4); padding: 20px; border-radius: 10px; color: white; text-align: center; margin: 20px 0;">
  <h3 style="margin: 0;">🎨 渐变背景卡片</h3>
  <p style="margin: 10px 0 0 0;">这是一个使用内联CSS样式的HTML元素</p>
</div>

## 2. 自定义CSS样式

<style>
.custom-card {
  background: #f8f9fa;
  border: 2px solid #e9ecef;
  border-radius: 8px;
  padding: 20px;
  margin: 20px 0;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.custom-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.code-demo {
  background: #2d3748;
  color: #e2e8f0;
  padding: 15px;
  border-radius: 6px;
  font-family: 'Courier New', monospace;
  margin: 15px 0;
}

.interactive-button {
  background: #4299e1;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.interactive-button:hover {
  background: #3182ce;
}

.color-picker {
  display: flex;
  gap: 10px;
  margin: 15px 0;
}

.color-option {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  cursor: pointer;
  border: 2px solid #ddd;
  transition: transform 0.2s ease;
}

.color-option:hover {
  transform: scale(1.1);
}
</style>

<div class="custom-card">
  <h4>📝 自定义样式卡片</h4>
  <p>这个卡片使用了自定义CSS类，具有悬停效果和阴影。</p>
  <div class="code-demo">
    &lt;div class="custom-card"&gt;
    <br>&nbsp;&nbsp;自定义内容
    <br>&lt;/div&gt;
  </div>
</div>

## 3. JavaScript交互示例

<div class="custom-card">
  <h4>🎮 交互式功能</h4>
  
  <p>点击按钮改变背景颜色：</p>
  <button class="interactive-button" onclick="changeBackground()">改变背景</button>
  <button class="interactive-button" onclick="resetBackground()">重置背景</button>
  
  <p>颜色选择器：</p>
  <div class="color-picker">
    <div class="color-option" style="background: #ff6b6b;" onclick="changeColor('#ff6b6b')"></div>
    <div class="color-option" style="background: #4ecdc4;" onclick="changeColor('#4ecdc4')"></div>
    <div class="color-option" style="background: #45b7d1;" onclick="changeColor('#45b7d1')"></div>
    <div class="color-option" style="background: #96ceb4;" onclick="changeColor('#96ceb4')"></div>
    <div class="color-option" style="background: #feca57;" onclick="changeColor('#feca57')"></div>
  </div>
  
  <p>计数器：<span id="counter">0</span></p>
  <button class="interactive-button" onclick="incrementCounter()">+1</button>
  <button class="interactive-button" onclick="decrementCounter()">-1</button>
  <button class="interactive-button" onclick="resetCounter()">重置</button>
</div>

## 4. 代码高亮示例

```html
<!DOCTYPE html>
<html>
<head>
    <title>示例页面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: #f0f0f0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hello World!</h1>
        <p>这是一个HTML示例。</p>
    </div>
</body>
</html>
```

```css
/* 自定义样式 */
.custom-button {
    background: linear-gradient(45deg, #667eea, #764ba2);
    color: white;
    border: none;
    padding: 12px 24px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
    transition: all 0.3s ease;
}

.custom-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.animated-card {
    animation: fadeInUp 0.6s ease-out;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
```

```javascript
// JavaScript功能示例
function createInteractiveElement() {
    const element = document.createElement('div');
    element.innerHTML = `
        <div style="
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            margin: 20px 0;
        ">
            <h3>动态创建的元素</h3>
            <p>这个元素是通过JavaScript动态创建的！</p>
            <button onclick="this.parentElement.remove()" 
                    style="background: rgba(255,255,255,0.2); 
                           border: 1px solid white; 
                           color: white; 
                           padding: 8px 16px; 
                           border-radius: 4px; 
                           cursor: pointer;">
                删除此元素
            </button>
        </div>
    `;
    document.body.appendChild(element);
}

// 添加一个按钮来测试动态创建
document.addEventListener('DOMContentLoaded', function() {
    const button = document.createElement('button');
    button.textContent = '创建动态元素';
    button.className = 'interactive-button';
    button.onclick = createInteractiveElement;
    button.style.marginTop = '20px';
    
    // 找到合适的位置插入按钮
    const container = document.querySelector('.custom-card');
    if (container) {
        container.appendChild(button);
    }
});
```

## 5. 响应式设计示例

<div style="
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin: 20px 0;
">
    <div style="
        background: #ff6b6b;
        color: white;
        padding: 20px;
        border-radius: 8px;
        text-align: center;
    ">
        <h4>📱 响应式卡片 1</h4>
        <p>这个卡片会根据屏幕大小自动调整布局</p>
    </div>
    <div style="
        background: #4ecdc4;
        color: white;
        padding: 20px;
        border-radius: 8px;
        text-align: center;
    ">
        <h4>💻 响应式卡片 2</h4>
        <p>使用CSS Grid实现响应式布局</p>
    </div>
    <div style="
        background: #45b7d1;
        color: white;
        padding: 20px;
        border-radius: 8px;
        text-align: center;
    ">
        <h4>🖥️ 响应式卡片 3</h4>
        <p>在不同设备上都有良好的显示效果</p>
    </div>
</div>

<script>
// JavaScript功能实现
let counter = 0;
let originalBackground = document.body.style.background;

function changeBackground() {
    const colors = ['#ff6b6b', '#4ecdc4', '#45b7d1', '#96ceb4', '#feca57'];
    const randomColor = colors[Math.floor(Math.random() * colors.length)];
    document.body.style.background = randomColor;
    document.body.style.transition = 'background 0.5s ease';
}

function resetBackground() {
    document.body.style.background = originalBackground;
}

function changeColor(color) {
    document.body.style.background = color;
    document.body.style.transition = 'background 0.3s ease';
}

function incrementCounter() {
    counter++;
    document.getElementById('counter').textContent = counter;
}

function decrementCounter() {
    counter--;
    document.getElementById('counter').textContent = counter;
}

function resetCounter() {
    counter = 0;
    document.getElementById('counter').textContent = counter;
}

// 页面加载完成后的初始化
document.addEventListener('DOMContentLoaded', function() {
    console.log('页面加载完成，JavaScript功能已激活！');
    
    // 添加一些动画效果
    const cards = document.querySelectorAll('.custom-card');
    cards.forEach((card, index) => {
        card.style.animationDelay = `${index * 0.1}s`;
        card.classList.add('animated-card');
    });
});
</script> 