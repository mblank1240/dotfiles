# Plugins in this config

Based on Kickstart.nvim, one file per plugin in `lua/plugins/`. Leader = `<Space>`.
Press `<Space>` and pause to see available keys (which-key), or `<Space>sk` to search all keymaps.

## Navigation and finding things

### telescope.nvim
Fuzzy finder for files, text, buffers, help, diagnostics and more. Uses `fd` for files and `rg` for grep, so both must be installed.
Extensions: `fzf-native` (faster, better matching) and `ui-select` (selection menus such as code actions become dropdowns).

| Keys | Action |
|---|---|
| `<Space>sf` | Search files |
| `<Space>sg` | Live grep across the project |
| `<Space>sw` | Grep the word under the cursor |
| `<Space><Space>` | Switch between open buffers |
| `<Space>s.` | Recent files |
| `<Space>/` | Fuzzy search in the current buffer |
| `<Space>s/` | Grep in open files only |
| `<Space>sh` | Search help |
| `<Space>sk` | Search keymaps |
| `<Space>sc` | Search commands |
| `<Space>sd` | Search diagnostics |
| `<Space>sr` | Resume the last search |
| `<Space>sn` | Search your Neovim config files |

In a prompt: type to filter, `Ctrl-n`/`Ctrl-p` or arrows to move, `Enter` to open, `Esc` to close.
The Telescope file browser extension was removed (use neo-tree instead).

### neo-tree.nvim
Sidebar file explorer. Depends on `plenary`, `nvim-web-devicons` and `nui` (libraries it uses).

- `<Space>e` toggle the tree
- `<Space>o` focus the tree
- `\` reveal the current file in the tree; inside the tree, close it
- `<Space>ge` floating git-status view
- In the tree (neo-tree defaults): `Enter`/`o` open, `s`/`S` open in vertical/horizontal split, `t` new tab, `w` window picker, `P` preview, `a` add (end with `/` for a folder), `d` delete, `r` rename, `c` copy, `m` move, `H` hidden files, `?` all mappings

### vim-tmux-navigator
`Ctrl-h/j/k/l` move between Neovim splits and tmux panes as one grid. Needs the matching plugin in `tmux.conf`; without it, the keys only move between Neovim splits.

## Coding

### nvim-lspconfig + mason, mason-lspconfig, mason-tool-installer
Language intelligence (definitions, diagnostics, rename). Mason auto-installs: `pyright` (Python), `taplo` (TOML), `hyprls` (Hyprland), `qmlls` (QML), `lua_ls` (Lua), `stylua` (Lua formatter). `:Mason` browses and installs more.

| Keys | Action |
|---|---|
| `grd` | Go to definition |
| `grr` | References |
| `gri` | Implementation |
| `grt` | Type definition |
| `grD` | Declaration |
| `grn` | Rename |
| `gra` | Code action |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `K` | Hover docs (Neovim default) |
| `<Space>th` | Toggle inlay hints |
| `<Space>q` | Diagnostics list |

Only active once a language server is attached. References to the symbol under the cursor highlight automatically.

### fidget.nvim
Shows LSP progress ("indexing...") as a small corner notification. Nothing to use.

### blink.cmp + LuaSnip
Autocompletion popup (LSP, file paths, snippets). `super-tab` preset:
- `Tab` accept / next snippet field; `Shift-Tab` previous
- `Ctrl-n`/`Ctrl-p` or arrows move through the list
- `Ctrl-Space` open the menu manually / toggle docs
- `Ctrl-e` dismiss
- `Ctrl-k` toggle signature help

### conform.nvim
Formatter. Formats on save (except C/C++); uses `stylua` for Lua and the LSP formatter otherwise. `<Space>f` formats on demand; `:ConformInfo` shows what is in use.
Note: Python has no formatter configured. Add one (e.g. `ruff`) to `formatters_by_ft` if wanted.

### nvim-treesitter (main branch)
Syntax highlighting and indentation from real parse trees. Auto-installs parsers for bash, c, lua, python, json, toml, markdown, html, hyprlang, qmljs and more. Run `:TSUpdate` after upgrades. Nothing to use directly.

### mini.nvim
- `mini.ai`: better text objects. `va)` select around parentheses, `ci'` change inside quotes, `daf` delete a function call. `an`/`in` next object, `al`/`il` last.
- `mini.surround`: `saiw)` add `)` around a word, `sd'` delete surrounding quotes, `sr)'` replace `)` with `'`.
- `mini.statusline`: the bottom bar.

### guess-indent.nvim
Detects tabs vs spaces and indent width per file. Nothing to use.

## Git and annotations

### gitsigns.nvim
Gutter signs: `+` added, `~` changed, `_` deleted. Hunk keymaps live in `lua/disabled-plugins/gitsigns-keymaps.lua` and are not active (the `<Space>h` group in which-key is empty). Move that file into `lua/plugins/` to enable stage/reset/blame keys, or run `:Gitsigns preview_hunk` / `:Gitsigns blame_line` by hand.

### todo-comments.nvim
Highlights `TODO`, `FIXME`, `NOTE`, `HACK`, `WARN` in comments. `]t` / `[t` jump between them. `:TodoTelescope` lists all; `:TodoQuickFix` uses the quickfix list.

## UI and quality of life

### which-key.nvim
Pops up available keys after a prefix. Groups: Search (`s`), Toggle (`t`), Git Hunk (`h`), LSP Actions (`gr`).

### gruvbox.nvim
The active colorscheme.

### tokyonight.nvim
Installed but never applied. Switch with `:colorscheme tokyonight` or change the line in `gruvbox.lua`.

### scrollEOF.nvim
Lets the cursor scroll past the last line so the end of a file is not pinned to the window bottom. Nothing to use.

## Not active

`lua/disabled-plugins/` (`lint`, `debug`, `indent_line`, `autopairs`, `gitsigns-keymaps`) is not loaded; Lazy only reads `lua/plugins/`. Move a file into `plugins/` to enable it.
`lua/keymaps.lua` and `lua/autocmds.lua` contain only comments and are not loaded.

See also: `CHEATSHEET-windows.md` for buffers, windows, splits and tabs.
