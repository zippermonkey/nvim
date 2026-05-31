# Neovim Configuration

A personal Neovim configuration using Lua with lazy.nvim as the plugin manager. This config focuses on speed, minimalism, and powerful fuzzy finding capabilities.

## 📦 Plugins

### Core Plugin Management
- **lazy.nvim** - Plugin manager and configuration system
- **which-key.nvim** - Shows pending keybinds and helps with key combinations
- **nvim-web-devicons** - File type icons (dependency for various plugins)

### Editing & Navigation
- **blink.cmp** - Modern completion engine with intelligent tab handling
- **nvim-treesitter** - Syntax highlighting, parsing, and incremental selection
- **indent-blankline.nvim** - Visual indentation guides
- **flash.nvim** - Quick navigation and search with `s` and `S`

### Language Support
- **nvim-lspconfig** - Language Server Protocol support
- **mason.nvim** - Automatic LSP server installation
- **mason-lspconfig.nvim** - Bridge between Mason and nvim-lspconfig
- **friendly-snippets** - Snippet collection for blink.cmp

### Fuzzy Finding & Search
- **fzf-lua** - Fast fuzzy finder for files, buffers, grep, and LSP features
- **trouble.nvim** - Pretty diagnostics, references, and quickfix lists

### Git Integration
- **gitsigns.nvim** - Git signs in the gutter
- **neogit.nvim** - Magit-like Git interface
- **diffview.nvim** - Git diff viewer
- **blame.nvim** - Git blame information

### File Management
- **nvim-tree.lua** - File explorer sidebar

### Code Formatting
- **conform.nvim** - Asynchronous code formatting with LSP fallback

### Terminal Management
- **toggleterm.nvim** - Terminal manager with horizontal/vertical/float layouts

### Session Management
- **auto-session.nvim** - Automatic session management (only in git/project directories)
  - Handles nvim-tree close/reopen on session restore
  - Handles toggleterm close/reinit on session restore
  - Manually triggers `BufReadPost` for restored buffers to fix treesitter highlighting

### Colorscheme
- **rose-pine** - Clean, elegant colorscheme

## ⌨️ Key Mappings

### Leader Key
- `<Space>` - Leader key

### Window Navigation
- `<C-h/j/k/l>` - Navigate between windows
- `<leader>wh/j/k/l` - Alternative window navigation
- `<leader>ws` - Split window horizontally
- `<leader>wv` - Split window vertically
- `<leader>wc` - Close window

### Buffer Management
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bd` - Delete buffer

### Tab Management
- `<leader>tn` - Next tab
- `<leader>tp` - Previous tab
- `<leader>tc` - Close tab

### File & Project Navigation (`<leader>f` - Find)
- `<leader>ff` - Find files
- `<leader>fn` - Find Neovim config files
- `<leader>fb` - Find buffers
- `<leader>fw` - Find word under cursor
- `<leader>fW` - Find WORD under cursor
- `<leader>fg` - Live grep
- `<leader>f/` - Search in current buffer
- `<leader>fk` - Find keymaps
- `<leader>fl` - Open FZF-Lua picker
- `<leader>rr` - Resume last search

### LSP (`<leader>g` - Goto, `<leader>f` - Find)
- `<leader>gd` - Go to definition
- `<leader>gD` - Go to declaration
- `<leader>gi` - Go to implementation
- `<leader>gt` - Go to type definition
- `<leader>gr` - Find references
- `<leader>ga` - Code actions
- `<leader>fd` - Find document symbols
- `<leader>fs` - Find workspace symbols
- `<leader>fr` - Find references (alternative)
- `K` - Hover documentation

### Flash Navigation
- `s` - Flash jump
- `S` - Flash treesitter
- `r` - Remote flash (operator mode)
- `R` - Treesitter search
- `<C-s>` - Toggle Flash search (command mode)

### Code Quality
- `<leader>ft` - Format buffer
- `<leader>xx` - Toggle Trouble diagnostics
- `<leader>xX` - Toggle buffer diagnostics
- `<leader>cs` - Toggle symbols (Trouble)
- `<leader>cl` - Toggle LSP definitions/references
- `<leader>xL` - Toggle location list
- `<leader>xQ` - Toggle quickfix list

### File Management
- `<leader>te` - Toggle file tree

### Terminal
- `<C-t>` - Toggle terminal
- `<leader>th` - Horizontal terminal
- `<leader>tv` - Vertical terminal
- `<leader>tf` - Floating terminal

### Git (Neogit)
- `:Neogit` - Open Git interface

### Convenience
- `jj` / `kk` - Exit insert mode
- `<ESC>` - Clear search highlight
- Visual mode `<` / `>` - Maintain selection after indent

## 🔧 Configuration Files Structure

```
nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua      # Basic Neovim options
│   │   ├── keymap.lua       # Core key mappings
│   │   └── lazy.lua         # Plugin manager setup
│   └── plugins/
│       ├── lsp.lua          # LSP configuration
│       ├── blink.lua        # Completion engine
│       ├── treesitter.lua   # Syntax highlighting
│       ├── colorscheme.lua  # Theme
│       ├── fzf-lua.lua      # Fuzzy finder
│       ├── whichkey.lua     # Which-key configuration
│       ├── trouble.lua      # Diagnostics
│       ├── gitsigns.lua     # Git signs
│       ├── neogit.lua       # Git interface
│       ├── diffview.lua     # Git diff viewer
│       ├── tree.lua         # File explorer
│       ├── conform.lua      # Code formatting
│       ├── auto-session.lua # Session management
│       ├── blame.lua        # Git blame
│       ├── flash.lua        # Quick navigation
│       ├── toggleterm.lua   # Terminal manager
│       └── ibl.lua          # Indent guides
├── CLAUDE.md               # Claude Code guidance
└── README.md               # This file
```

## 🚀 Getting Started

1. Backup your existing Neovim config:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. Clone this configuration:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. Open Neovim and let lazy.nvim install plugins:
   ```bash
   nvim
   ```

4. Install LSP servers (optional):
   ```bash
   :Mason
   ```
   Then install desired servers (e.g., `rust_analyzer`, `lua_ls`)

## 🎨 Features

- **Fast startup** with lazy loading
- **Intelligent completion** with blink.cmp
- **Powerful fuzzy finding** with fzf-lua
- **Modern LSP experience** with automatic server management
- **Git integration** with multiple tools
- **Session management** that respects git repositories with proper plugin restore
- **Clean visual indicators** with treesitter and indent guides
- **Minimal distractions** with carefully chosen defaults