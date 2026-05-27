# AGENTS.md

Neovim config — personal, managed by lazy.nvim (auto-bootstraps on first launch).

## Structure

```
init.lua                          # entrypoint: requires config/* then sets colorscheme
lua/config/
  options.lua                     # vim opts, mapleader, autocommands (autosave), diagnostics
  keymap.lua                      # core keymaps (window, buffer, tab, indent)
  lazy.lua                        # lazy.nvim bootstrap + plugin spec import
lua/plugins/*.lua                 # one file per plugin (lazy.nvim spec)
lsp/                              # LSP server configs (NOT auto-loaded — unused)
.stylua.toml                      # Lua formatter config
```

## Conventions

- Leader is `<Space>`, localleader is `\` — set in `lua/config/options.lua` (not in keymap.lua or lazy.lua)
- `jj` / `kk` exits insert mode
- Plugin configs are lazy.nvim specs returning tables. When writing a new plugin file, follow the pattern: `return { 'author/name', dependencies = {...}, opts = {...}, keys = {...}, config = ... }`
- Always give plugins a lazy-load trigger (`event`, `cmd`, `keys`, or `ft`). Never use `lazy = false` unless the plugin must load at startup.
- Prefer `opts = {}` over `config = function() require(...).setup {} end` where the plugin supports it.
- Formatter: stylua (see `.stylua.toml`). Run with `stylua .`

## Key facts an agent would miss

### Startup & loading
- lazy.nvim bootstraps itself on first run (clones to `stdpath('data')/lazy/lazy.nvim`)
- Plugins are imported via `{ import = 'plugins' }` — every `.lua` in `lua/plugins/` is auto-discovered
- `lazy-lock.json` is in `.gitignore` — do not commit or reference it

### Colorscheme
- Set in `init.lua` line 6 as `vim.cmd 'colorscheme nightfox'`
- `lua/plugins/colorscheme.lua` lists multiple themes as dependencies but does nothing to activate them. The active scheme is purely the `vim.cmd` in `init.lua`.
- The README claims rose-pine is the colorscheme — that is stale/incorrect.

### Autosave & session
- Autosave runs on `BufLeave`/`InsertLeave` for writable modified buffers
- auto-session **only** creates sessions when `.git`, `.project`, or `.root` exists in the working directory

### Clipboard
- `vim.g.clipboard = 'osc52'` — uses OSC52 escape sequences for clipboard (terminal-only, no system clipboard daemon needed)

### Formatting
- Conform formats on save (async, LSP fallback) except for C/C++ (explicitly disabled)
- Manual format: `<leader>cf`

### Linting
- Only C linting is active (checkpatch via nvim-lint). Lints on `BufEnter`, `BufWritePost`, `InsertLeave`.

### Keymap groups
- Leader keymaps follow a strict group layout:
  - `<leader>a` — AI/Claude Code
  - `<leader>b` — Buffer
  - `<leader>c` — Code (format `cf`, code action `ca`, rename `cn` — via lsp.lua)
  - `<leader>e` — File explorer toggle
  - `<leader>f` — Find (fzf-lua)
  - `<leader>g` — Git (status `gg`, blame `gb`)
  - `<leader>l` — LSP (definition, references, symbols, rename, code action)
  - `<leader>r` — Resume search
  - `<leader>t` — Tab
  - `<leader>w` — Window
  - `<leader>x` — Diagnostics/Trouble
- Do NOT add keymaps under `<leader>g` for "goto" — that prefix is reserved for Git

### LSP
- Mason auto-installs `rust_analyzer` and `lua_ls`
- Non-leader LSP keys (normal mode): `gd` (definition), `gD` (declaration), `gr` (references), `gi` (implementations), `gy` (type definition), `K` (hover)
- All non-leader LSP keys use fzf-lua, except `gD` (built-in) and `K` (hover)
- Leader LSP keys are under `<leader>l`: `ld`, `lD`, `lr`, `li`, `lt`, `ls`, `lS`, `ln`, `la`
- The files in `lsp/rust_analyzer.lua` and `lsp/lua_ls.lua` are NOT currently `require`d anywhere

### Completion
- Uses blink.cmp (not nvim-cmp). Super-Tab: Tab selects next, Shift-Tab selects previous, Enter accepts.

### Misc
- `which-key` has a 1000ms delay before opening
- Treesitter `incremental_selection` is enabled: Enter to init/expand selection, Tab for scope, Backspace to shrink
- `updatetime = 300`, `timeoutlen = 300`, `mouse = 'a'` — set in options.lua
- `splitright` and `splitbelow` are enabled; `scrolloff = 4`, `undofile = true`
- The README is duplicated in Chinese (`README-zh.md`) and references a non-existent `CLAUDE.md` — adding to that file has no effect
