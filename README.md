# mblank1240/dotfiles

Personal dotfiles for Arch Linux and macOS, managed with a bare git repository. Includes Neovim, Zsh, Tmux, and Yazi configurations.

---

## How it works

This repo uses a **bare git repository** pointed at `$HOME` as its working tree. This means config files live in their actual locations — no symlinks needed. The `dots` alias is used instead of `git` to interact with the repo.

---

## Fresh install

### 1. Install dependencies

**Arch Linux:**
```bash
sudo pacman -S git openssh zsh neovim tmux yazi fzf tree-sitter tree-sitter-cli base-devel rust
yay -S antidote stylua
```

**macOS:**
```bash
brew install git neovim tmux yazi fzf antidote stylua tree-sitter
```

### 2. Clone the repo

```bash
git clone --bare git@github.com:mblank1240/dotfiles.git $HOME/.dotfiles
```

### 3. Set up the alias

Add this to your `.zshrc` temporarily (or just run it in your shell):
```bash
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### 4. Check out your files

```bash
dots checkout
```

If you get errors about existing files conflicting, back them up and retry:
```bash
mkdir -p ~/.dotfiles-backup
dots checkout 2>&1 | grep "^\s" | awk '{print $1}' | xargs -I{} mv {} ~/.dotfiles-backup/{}
dots checkout
```

### 5. Suppress untracked file noise

```bash
dots config --local status.showUntrackedFiles no
```

### 6. Add the alias permanently

The alias is already in your `.zshrc` from checkout, but if not, add it manually:
```bash
# ~/.zshrc
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

---

## Zsh plugins

Plugins are managed by **Antidote** and defined in `~/.zsh_plugins.txt`.

### Install Antidote

**Arch:**
```bash
yay -S antidote
```

**macOS:**
```bash
brew install antidote
```

Plugins install automatically on first shell launch after cloning. No manual step needed.

### Plugin list

| Plugin | Purpose |
|---|---|
| `zsh-users/zsh-autosuggestions` | Suggests commands as you type based on shell history |
| `zsh-users/zsh-syntax-highlighting` | Colors commands green/red as you type |
| `zsh-users/zsh-completions` | Expanded tab completion definitions |
| `ohmyzsh/ohmyzsh path:plugins/history-substring-search` | Fuzzy search through history with Ctrl+R |
| `rupa/z` | Jump to frecent directories by partial name |
| `Aloxaf/fzf-tab` | Replaces tab completion UI with fzf fuzzy finder |

### Updating plugins

```bash
antidote update
```

---

## Neovim

Config lives at `~/.config/nvim/`. Uses **Lazy.nvim** as the plugin manager.

### Structure

```
~/.config/nvim/
├── init.lua                  # entry point
└── lua/
    ├── options.lua           # vim settings
    ├── keymaps.lua           # key bindings
    └── plugins/              # one file per plugin
        ├── vim-tmux-navigator.lua
        └── ...
```

### First launch

Lazy.nvim will automatically install all plugins on first launch. Just open Neovim:
```bash
nvim
```

Watch the install progress with:
```
:Lazy
```

### Mason (LSP + formatter management)

Mason manages language servers and formatters. Open the Mason UI with:
```
:Mason
```

Check Mason health:
```
:checkhealth mason
```

### Treesitter

Install or update language parsers:
```
:TSUpdate
```

### Key plugins

| Plugin | Purpose |
|---|---|
| `christoomey/vim-tmux-navigator` | Unified pane navigation between Neovim and Tmux with `Ctrl+h/j/k/l` |

### Switching configs for testing

Neovim supports multiple configs via `NVIM_APPNAME`:
```bash
# Copy current config to a test directory
cp -r ~/.config/nvim ~/.config/nvim-test

# Launch with test config
NVIM_APPNAME=nvim-test nvim
```

Add a shell alias for convenience:
```bash
alias nvim-test='NVIM_APPNAME=nvim-test nvim'
```

---

## Tmux

Config lives at `~/.config/tmux/tmux.conf`. Uses **TPM** (Tmux Plugin Manager).

### Install TPM

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Install plugins

Start a tmux session, then press:
```
Ctrl+Space I
```

### Key bindings

| Binding | Action |
|---|---|
| `Ctrl+Space` | Prefix key |
| `Prefix c` | New window |
| `Prefix %` | Split pane vertically |
| `Prefix "` | Split pane horizontally |
| `Prefix arrow` | Move between panes |
| `Prefix d` | Detach from session |
| `Prefix H/J/K/L` | Resize pane (repeatable) |
| `Ctrl+h/j/k/l` | Move between panes and Neovim splits (vim-tmux-navigator) |

### Session management

```bash
tmux new -s name        # new named session
tmux ls                 # list sessions
tmux attach -t name     # attach to session
```

### Reload config

```bash
tmux source ~/.config/tmux/tmux.conf
# or from inside tmux:
# Prefix :source ~/.config/tmux/tmux.conf
```

---

## Yazi

Config lives at `~/.config/yazi/yazi.toml`.

### Openers

| File type | Action |
|---|---|
| Archives (zip, rar, 7z, tar, gz, bz2, xz) | Extract with `unar` |
| Text / code files | Open in Neovim |

### Install dependencies

**Arch:**
```bash
sudo pacman -S unar 7zip
```

**macOS:**
```bash
brew install unar sevenzip
```

### Shell wrapper

The `y` function in `.zshrc` makes Yazi change your working directory on quit:
```bash
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
```

Launch with `y` instead of `yazi`.

---

## Dotfiles management

Daily commands use the `dots` alias (same as `git`, just pointed at the bare repo).

```bash
dots status                        # see tracked changes
dots add ~/.config/nvim/           # stage a file or folder
dots commit -m "message"           # commit staged changes
dots push                          # push to GitHub
dots pull origin master --rebase   # pull remote changes
```

### Adding new files

```bash
dots add ~/.config/some-new-tool/
dots commit -m "add some-new-tool config"
dots push
```

### Branch workflow for safe changes

```bash
dots branch refactor-nvim          # create a branch
dots checkout refactor-nvim        # switch to it
# make changes...
dots checkout master               # switch back to stable
dots merge refactor-nvim           # merge when happy
```

---

## Starship prompt

Config lives at `~/.config/starship.toml`. Initialized at the bottom of `.zshrc`:
```bash
eval "$(starship init zsh)"
```

No plugin manager needed — Starship is a standalone binary.

**Arch:**
```bash
sudo pacman -S starship
```

**macOS:**
```bash
brew install starship
```
