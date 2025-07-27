---
title: Web开发演示页面
layout: page
---

<style>
/* 页面专用样式 */
.demo-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.hero-section {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 60px 20px;
    text-align: center;
    border-radius: 15px;
    margin-bottom: 40px;
}

.hero-section h1 {
    font-size: 3rem;
    margin-bottom: 20px;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
}

.feature-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;
    margin: 40px 0;
}

.feature-card {
    background: white;
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
    border: 1px solid #e1e5e9;
}

.feature-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.interactive-demo {
    background: #f8f9fa;
    border-radius: 10px;
    padding: 25px;
    margin: 20px 0;
    border-left: 4px solid #007bff;
}

.canvas-container {
    text-align: center;
    margin: 30px 0;
}

#demoCanvas {
    border: 2px solid #ddd;
    border-radius: 8px;
    background: white;
}

.control-panel {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    justify-content: center;
    margin: 20px 0;
}

.control-btn {
    background: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease;
}

.control-btn:hover {
    background: #0056b3;
}

.control-btn.danger {
    background: #dc3545;
}

.control-btn.danger:hover {
    background: #c82333;
}

.control-btn.success {
    background: #28a745;
}

.control-btn.success:hover {
    background: #218838;
}

.animation-demo {
    height: 200px;
    background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
    border-radius: 10px;
    position: relative;
    overflow: hidden;
    margin: 20px 0;
}

.animated-element {
    position: absolute;
    width: 50px;
    height: 50px;
    background: white;
    border-radius: 50%;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation: bounce 2s infinite;
}

@keyframes bounce {
    0%, 20%, 50%, 80%, 100% {
        transform: translate(-50%, -50%) translateY(0);
    }
    40% {
        transform: translate(-50%, -50%) translateY(-30px);
    }
    60% {
        transform: translate(-50%, -50%) translateY(-15px);
    }
}

.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
}

.modal-content {
    background-color: white;
    margin: 15% auto;
    padding: 30px;
    border-radius: 10px;
    width: 80%;
    max-width: 500px;
    position: relative;
}

.close {
    position: absolute;
    right: 20px;
    top: 15px;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover {
    color: #999;
}

.todo-list {
    background: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.todo-item {
    display: flex;
    align-items: center;
    padding: 10px;
    border-bottom: 1px solid #eee;
    transition: background 0.3s ease;
}

.todo-item:hover {
    background: #f8f9fa;
}

.todo-item.completed {
    opacity: 0.6;
    text-decoration: line-through;
}

.todo-checkbox {
    margin-right: 10px;
}

.todo-text {
    flex: 1;
}

.todo-delete {
    background: #dc3545;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 3px;
    cursor: pointer;
    font-size: 12px;
}

.todo-delete:hover {
    background: #c82333;
}
</style>

<div class="demo-container">
    <div class="hero-section">
        <h1>🎨 Web开发演示</h1>
        <p>展示Hexo Fluid主题中的HTML、CSS、JavaScript功能</p>
    </div>

    <div class="feature-grid">
        <div class="feature-card">
            <h3>🎯 Canvas绘图</h3>
            <p>使用HTML5 Canvas进行图形绘制和动画</p>
            <div class="canvas-container">
                <canvas id="demoCanvas" width="400" height="300"></canvas>
                <div class="control-panel">
                    <button class="control-btn" onclick="clearCanvas()">清空</button>
                    <button class="control-btn" onclick="drawRandomShapes()">随机图形</button>
                    <button class="control-btn" onclick="startAnimation()">开始动画</button>
                    <button class="control-btn danger" onclick="stopAnimation()">停止动画</button>
                </div>
            </div>
        </div>

        <div class="feature-card">
            <h3>📝 待办事项</h3>
            <p>简单的待办事项管理功能</p>
            <div class="todo-list">
                <div style="margin-bottom: 15px;">
                    <input type="text" id="todoInput" placeholder="输入待办事项..." 
                           style="width: 70%; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
                    <button class="control-btn success" onclick="addTodo()" style="margin-left: 10px;">添加</button>
                </div>
                <div id="todoList"></div>
            </div>
        </div>

        <div class="feature-card">
            <h3>🎭 动画效果</h3>
            <p>CSS动画和JavaScript交互</p>
            <div class="animation-demo">
                <div class="animated-element" id="animatedElement"></div>
            </div>
            <div class="control-panel">
                <button class="control-btn" onclick="changeAnimation('bounce')">弹跳</button>
                <button class="control-btn" onclick="changeAnimation('rotate')">旋转</button>
                <button class="control-btn" onclick="changeAnimation('pulse')">脉冲</button>
            </div>
        </div>

        <div class="feature-card">
            <h3>🔧 工具面板</h3>
            <p>实用的Web开发工具</p>
            <div class="control-panel">
                <button class="control-btn" onclick="showModal('颜色选择器')">颜色选择器</button>
                <button class="control-btn" onclick="showModal('代码生成器')">代码生成器</button>
                <button class="control-btn" onclick="showModal('响应式测试')">响应式测试</button>
            </div>
        </div>
    </div>

    <div class="interactive-demo">
        <h3>🎮 交互式演示</h3>
        <p>点击下面的按钮体验不同的交互效果：</p>
        <div class="control-panel">
            <button class="control-btn" onclick="changeTheme('light')">浅色主题</button>
            <button class="control-btn" onclick="changeTheme('dark')">深色主题</button>
            <button class="control-btn" onclick="changeTheme('colorful')">彩色主题</button>
            <button class="control-btn" onclick="resetTheme()">重置主题</button>
        </div>
    </div>
</div>

<!-- 模态框 -->
<div id="modal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="modalTitle">模态框标题</h2>
        <div id="modalContent">
            <p>模态框内容将在这里显示...</p>
        </div>
    </div>
</div>

<script>
// Canvas相关变量
let canvas, ctx;
let animationId;
let isAnimating = false;

// 页面加载完成后初始化
document.addEventListener('DOMContentLoaded', function() {
    // 初始化Canvas
    canvas = document.getElementById('demoCanvas');
    ctx = canvas.getContext('2d');
    
    // 初始化待办事项
    loadTodos();
    
    // 绘制初始图形
    drawInitialShapes();
    
    console.log('Web开发演示页面已加载完成！');
});

// Canvas功能
function drawInitialShapes() {
    ctx.fillStyle = '#4ecdc4';
    ctx.fillRect(50, 50, 100, 100);
    
    ctx.fillStyle = '#ff6b6b';
    ctx.beginPath();
    ctx.arc(300, 100, 50, 0, 2 * Math.PI);
    ctx.fill();
    
    ctx.strokeStyle = '#45b7d1';
    ctx.lineWidth = 3;
    ctx.beginPath();
    ctx.moveTo(100, 200);
    ctx.lineTo(300, 200);
    ctx.stroke();
}

function clearCanvas() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
}

function drawRandomShapes() {
    const colors = ['#ff6b6b', '#4ecdc4', '#45b7d1', '#96ceb4', '#feca57'];
    
    for (let i = 0; i < 5; i++) {
        const x = Math.random() * canvas.width;
        const y = Math.random() * canvas.height;
        const size = Math.random() * 50 + 20;
        const color = colors[Math.floor(Math.random() * colors.length)];
        
        ctx.fillStyle = color;
        
        if (Math.random() > 0.5) {
            ctx.fillRect(x, y, size, size);
        } else {
            ctx.beginPath();
            ctx.arc(x, y, size/2, 0, 2 * Math.PI);
            ctx.fill();
        }
    }
}

function startAnimation() {
    if (isAnimating) return;
    isAnimating = true;
    
    let angle = 0;
    function animate() {
        if (!isAnimating) return;
        
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        
        // 绘制旋转的图形
        ctx.save();
        ctx.translate(canvas.width/2, canvas.height/2);
        ctx.rotate(angle);
        
        ctx.fillStyle = '#ff6b6b';
        ctx.fillRect(-25, -25, 50, 50);
        
        ctx.fillStyle = '#4ecdc4';
        ctx.beginPath();
        ctx.arc(0, 0, 30, 0, 2 * Math.PI);
        ctx.fill();
        
        ctx.restore();
        
        angle += 0.02;
        animationId = requestAnimationFrame(animate);
    }
    animate();
}

function stopAnimation() {
    isAnimating = false;
    if (animationId) {
        cancelAnimationFrame(animationId);
    }
}

// 待办事项功能
let todos = JSON.parse(localStorage.getItem('todos') || '[]');

function addTodo() {
    const input = document.getElementById('todoInput');
    const text = input.value.trim();
    
    if (text) {
        todos.push({
            id: Date.now(),
            text: text,
            completed: false
        });
        
        input.value = '';
        saveTodos();
        renderTodos();
    }
}

function toggleTodo(id) {
    const todo = todos.find(t => t.id === id);
    if (todo) {
        todo.completed = !todo.completed;
        saveTodos();
        renderTodos();
    }
}

function deleteTodo(id) {
    todos = todos.filter(t => t.id !== id);
    saveTodos();
    renderTodos();
}

function renderTodos() {
    const todoList = document.getElementById('todoList');
    todoList.innerHTML = '';
    
    todos.forEach(todo => {
        const item = document.createElement('div');
        item.className = `todo-item ${todo.completed ? 'completed' : ''}`;
        
        item.innerHTML = `
            <input type="checkbox" class="todo-checkbox" 
                   ${todo.completed ? 'checked' : ''} 
                   onchange="toggleTodo(${todo.id})">
            <span class="todo-text">${todo.text}</span>
            <button class="todo-delete" onclick="deleteTodo(${todo.id})">删除</button>
        `;
        
        todoList.appendChild(item);
    });
}

function saveTodos() {
    localStorage.setItem('todos', JSON.stringify(todos));
}

function loadTodos() {
    renderTodos();
}

// 动画功能
function changeAnimation(type) {
    const element = document.getElementById('animatedElement');
    element.style.animation = 'none';
    
    setTimeout(() => {
        switch(type) {
            case 'bounce':
                element.style.animation = 'bounce 2s infinite';
                break;
            case 'rotate':
                element.style.animation = 'rotate 2s linear infinite';
                break;
            case 'pulse':
                element.style.animation = 'pulse 1s ease-in-out infinite';
                break;
        }
    }, 10);
}

// 添加新的CSS动画
const style = document.createElement('style');
style.textContent = `
@keyframes rotate {
    from { transform: translate(-50%, -50%) rotate(0deg); }
    to { transform: translate(-50%, -50%) rotate(360deg); }
}

@keyframes pulse {
    0%, 100% { transform: translate(-50%, -50%) scale(1); }
    50% { transform: translate(-50%, -50%) scale(1.2); }
}
`;
document.head.appendChild(style);

// 主题切换功能
function changeTheme(theme) {
    const body = document.body;
    
    switch(theme) {
        case 'light':
            body.style.background = '#ffffff';
            body.style.color = '#333333';
            break;
        case 'dark':
            body.style.background = '#1a1a1a';
            body.style.color = '#ffffff';
            break;
        case 'colorful':
            body.style.background = 'linear-gradient(45deg, #ff6b6b, #4ecdc4, #45b7d1)';
            body.style.color = '#ffffff';
            break;
    }
}

function resetTheme() {
    document.body.style.background = '';
    document.body.style.color = '';
}

// 模态框功能
function showModal(title) {
    const modal = document.getElementById('modal');
    const modalTitle = document.getElementById('modalTitle');
    const modalContent = document.getElementById('modalContent');
    
    modalTitle.textContent = title;
    
    switch(title) {
        case '颜色选择器':
            modalContent.innerHTML = `
                <div style="display: grid; grid-template-columns: repeat(5, 1fr); gap: 10px; margin: 20px 0;">
                    ${['#ff6b6b', '#4ecdc4', '#45b7d1', '#96ceb4', '#feca57', 
                       '#ff8a80', '#b39ddb', '#81c784', '#ffb74d', '#a1887f'].map(color => 
                        `<div style="width: 40px; height: 40px; background: ${color}; border-radius: 50%; cursor: pointer; border: 2px solid #ddd;" 
                              onclick="changeThemeColor('${color}')"></div>`
                    ).join('')}
                </div>
                <p>点击颜色圆圈来改变页面主题色</p>
            `;
            break;
        case '代码生成器':
            modalContent.innerHTML = `
                <div style="margin: 20px 0;">
                    <label>选择语言：</label>
                    <select id="codeLang" style="margin: 0 10px; padding: 5px;">
                        <option value="html">HTML</option>
                        <option value="css">CSS</option>
                        <option value="javascript">JavaScript</option>
                    </select>
                    <button class="control-btn" onclick="generateCode()">生成代码</button>
                </div>
                <pre id="generatedCode" style="background: #f8f9fa; padding: 15px; border-radius: 5px; overflow-x: auto;"></pre>
            `;
            break;
        case '响应式测试':
            modalContent.innerHTML = `
                <div style="margin: 20px 0;">
                    <p>当前窗口宽度：<span id="windowWidth">${window.innerWidth}px</span></p>
                    <p>当前窗口高度：<span id="windowHeight">${window.innerHeight}px</span></p>
                    <div style="background: #e9ecef; padding: 10px; border-radius: 5px; margin: 10px 0;">
                        <p>设备类型：<span id="deviceType">${getDeviceType()}</span></p>
                    </div>
                </div>
            `;
            break;
    }
    
    modal.style.display = 'block';
}

function closeModal() {
    document.getElementById('modal').style.display = 'none';
}

function changeThemeColor(color) {
    document.documentElement.style.setProperty('--primary-color', color);
}

function generateCode() {
    const lang = document.getElementById('codeLang').value;
    const codeElement = document.getElementById('generatedCode');
    
    const codeSnippets = {
        html: `<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>生成的HTML页面</title>
</head>
<body>
    <h1>Hello World!</h1>
    <p>这是一个自动生成的HTML页面。</p>
</body>
</html>`,
        css: `/* 生成的CSS样式 */
body {
    font-family: 'Arial', sans-serif;
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
}`,
        javascript: `// 生成的JavaScript代码
document.addEventListener('DOMContentLoaded', function() {
    console.log('页面加载完成！');
    
    // 添加一些交互功能
    const button = document.createElement('button');
    button.textContent = '点击我';
    button.onclick = function() {
        alert('Hello from generated JavaScript!');
    };
    
    document.body.appendChild(button);
});`
    };
    
    codeElement.textContent = codeSnippets[lang];
}

function getDeviceType() {
    const width = window.innerWidth;
    if (width < 768) return '移动设备';
    if (width < 1024) return '平板设备';
    return '桌面设备';
}

// 窗口大小改变时更新显示
window.addEventListener('resize', function() {
    const widthSpan = document.getElementById('windowWidth');
    const heightSpan = document.getElementById('windowHeight');
    const deviceSpan = document.getElementById('deviceType');
    
    if (widthSpan) widthSpan.textContent = window.innerWidth + 'px';
    if (heightSpan) heightSpan.textContent = window.innerHeight + 'px';
    if (deviceSpan) deviceSpan.textContent = getDeviceType();
});

// 点击模态框外部关闭
window.onclick = function(event) {
    const modal = document.getElementById('modal');
    if (event.target === modal) {
        closeModal();
    }
}
</script> 