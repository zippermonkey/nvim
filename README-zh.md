# Neovim 配置

一个使用 Lua 的个人 Neovim 配置，以 lazy.nvim 作为插件管理器。此配置专注于速度、极简主义和强大的模糊查找功能。

## 📦 插件

### 核心插件管理
- **lazy.nvim** - 插件管理器和配置系统
- **which-key.nvim** - 显示待定按键组合，帮助记忆快捷键
- **nvim-web-devicons** - 文件类型图标（多个插件的依赖）

### 编辑与导航
- **blink.cmp** - 现代补全引擎，具有智能 Tab 处理
- **nvim-treesitter** - 语法高亮、解析和增量选择
- **indent-blankline.nvim** - 可视化缩进指引
- **flash.nvim** - 使用 `s` 和 `S` 进行快速导航和搜索

### 语言支持
- **nvim-lspconfig** - 语言服务器协议支持
- **mason.nvim** - 自动 LSP 服务器安装
- **mason-lspconfig.nvim** - Mason 和 nvim-lspconfig 之间的桥梁
- **friendly-snippets** - blink.cmp 的代码片段集合

### 模糊查找与搜索
- **fzf-lua** - 用于文件、缓冲区、grep 和 LSP 功能的快速模糊查找器
- **trouble.nvim** - 美观的诊断、引用和快速修复列表

### Git 集成
- **gitsigns.nvim** - 行号旁的 Git 标记
- **neogit.nvim** - 类似 Magit 的 Git 接口
- **diffview.nvim** - Git 差异查看器
- **blame.nvim** - Git 指责信息

### 文件管理
- **nvim-tree.lua** - 文件浏览器侧边栏

### 代码格式化
- **conform.nvim** - 异步代码格式化，支持 LSP 回退

### 会话管理
- **auto-session.nvim** - 自动会话管理（仅在 git/项目目录中）

### 配色方案
- **nightfox** - 当前使用的现代暗色主题

## ⌨️ 快捷键映射

### Leader 键
- `<Space>` - Leader 键

### 窗口管理 (`<leader>w`)
- `<C-h/j/k/l>` - 在窗口间导航
- `<leader>wh/j/k/l` - 备用窗口导航
- `<leader>ws` - 水平分割窗口
- `<leader>wv` - 垂直分割窗口
- `<leader>wc` - 关闭窗口

### 缓冲区管理 (`<leader>b`)
- `<leader>bn` - 下一个缓冲区
- `<leader>bp` - 上一个缓冲区
- `<leader>bd` - 删除缓冲区

### 标签页管理 (`<leader>t`)
- `<leader>tn` - 下一个标签页
- `<leader>tp` - 上一个标签页
- `<leader>tc` - 关闭标签页

### 文件与项目搜索 (`<leader>f`)
- `<leader>ff` - 查找文件
- `<leader>fn` - 查找 Neovim 配置文件
- `<leader>fb` - 查找缓冲区
- `<leader>fw` - 查找光标下的单词
- `<leader>fW` - 查找光标下的 WORD
- `<leader>fg` - 实时 grep 搜索
- `<leader>f/` - 在当前缓冲区中搜索
- `<leader>fk` - 查找快捷键映射
- `<leader>fl` - 打开 FZF-Lua 选择器

### LSP 跳转与查找 (`<leader>l` 及非 Leader 按键)
- `gd` - 跳转到定义
- `gD` - 跳转到声明
- `gr` - 查找引用
- `gi` - 跳转到实现
- `gy` - 跳转到类型定义
- `K` - 悬停文档
- `<leader>ld` - 定义 (fzf-lua)
- `<leader>lD` - 声明 (fzf-lua)
- `<leader>lr` - 引用 (fzf-lua)
- `<leader>li` - 实现 (fzf-lua)
- `<leader>lt` - 类型定义 (fzf-lua)
- `<leader>ls` - 文档符号 (fzf-lua)
- `<leader>lS` - 工作区符号 (fzf-lua)
- `<leader>ln` - 重命名
- `<leader>la` - 代码操作

### 代码操作 (`<leader>c`)
- `<leader>cf` - 格式化缓冲区
- `<leader>ca` - 代码操作
- `<leader>cn` - 重命名符号

### Git (`<leader>g`)
- `<leader>gg` - Git 状态 (Neogit)
- `<leader>gb` - Git 指责

### 诊断 (`<leader>x`)
- `<leader>xx` - 切换 Trouble 诊断列表
- `<leader>xX` - 切换缓冲区诊断
- `<leader>xL` - 切换位置列表
- `<leader>xQ` - 切换快速修复列表

### 文件浏览器
- `<leader>e` - 切换文件树 (nvim-tree)

### 搜索恢复
- `<leader>rr` - 恢复上次搜索

### Flash 导航
- `s` - Flash 跳转
- `S` - Flash treesitter
- `r` - 远程 flash（操作符模式）
- `R` - Treesitter 搜索
- `<C-s>` - 切换 Flash 搜索（命令模式）

### 便利功能
- `jj` / `kk` - 退出插入模式
- `<ESC>` - 清除搜索高亮
- 可视模式 `<` / `>` - 缩进后保持选择

## 🔧 配置文件结构

```
nvim/
├── init.lua                 # 主入口点
├── lua/
│   ├── config/
│   │   ├── options.lua      # 基本 Neovim 选项
│   │   ├── keymap.lua       # 核心按键映射
│   │   └── lazy.lua         # 插件管理器设置
│   └── plugins/
│       ├── lsp.lua          # LSP 配置
│       ├── blink.lua        # 补全引擎
│       ├── treesitter.lua   # 语法高亮
│       ├── colorscheme.lua  # 主题
│       ├── fzf-lua.lua      # 模糊查找器
│       ├── whichkey.lua     # Which-key 配置
│       ├── trouble.lua      # 诊断
│       ├── gitsigns.lua     # Git 标记
│       ├── neogit.lua       # Git 接口
│       ├── diffview.lua     # Git 差异查看器
│       ├── tree.lua         # 文件浏览器
│       ├── conform.lua      # 代码格式化
│       ├── auto-session.lua # 会话管理
│       ├── blame.lua        # Git 指责
│       ├── flash.lua        # 快速导航
│       └── ibl.lua          # 缩进指引
├── lsp/                     # LSP 服务器配置（未自动加载）
│   ├── rust_analyzer.lua
│   └── lua_ls.lua
└── README-zh.md            # 此文件
```

## 🚀 开始使用

1. 备份现有的 Neovim 配置：
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. 克隆此配置：
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. 打开 Neovim 并让 lazy.nvim 安装插件：
   ```bash
   nvim
   ```

4. LSP 服务器（已自动安装）：
   - Mason 会自动安装 `rust_analyzer` 和 `lua_ls`。
   - 如需其他服务器，运行 `:Mason` 手动安装。

## 🎨 特性

- **快速启动**，支持懒加载
- **智能补全**，使用 blink.cmp
- **强大的模糊查找**，使用 fzf-lua
- **现代 LSP 体验**，支持自动服务器管理
- **Git 集成**，包含多个工具
- **会话管理**，识别 git 仓库
- **清晰的视觉指示器**，使用 treesitter 和缩进指引
- **极简干扰**，精心选择的默认设置
