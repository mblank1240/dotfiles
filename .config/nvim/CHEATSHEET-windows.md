# Neovim Cheatsheet: Buffers, Windows, Splits, Tabs

Leader = `<Space>`. Keys marked **(cfg)** come from this config; the rest are Neovim defaults.

## Concepts

| Term | Meaning |
|---|---|
| Buffer | A file loaded in memory (think "open file") |
| Window | A viewport onto a buffer. Splits create more windows. |
| Tab | A layout of windows. Not a file tab. |

## Buffers

| Keys / command | Action |
|---|---|
| `<Space><Space>` **(cfg)** | Telescope buffer picker |
| `<Space>sf` **(cfg)** | Find a file and open it |
| `<Space>s.` **(cfg)** | Recent files |
| `:e path/file` | Open a file in a new buffer |
| `:ls` / `:buffers` | List buffers |
| `Ctrl-^` (or `Ctrl-6`) | Toggle between current and previous buffer |
| `:bn` / `:bp` | Next / previous buffer |
| `:b 3` | Go to buffer number 3 |
| `:b name` | Go to a buffer by partial name (Tab completes) |
| `:bf` / `:bl` | First / last buffer |
| `:bd` | Close the current buffer |
| `:bd 3` | Close buffer 3 |
| `:bd!` | Close and discard changes |
| `:%bd` | Close all buffers |
| `:%bd\|e#` | Close all buffers except the current one |
| `:w` / `:wa` | Write current / write all modified buffers |
| `:wqa` | Write all and quit |

`:ls` flags: `%` current, `#` alternate, `a` active (visible), `h` hidden, `+` modified.

## Splits and windows

| Keys / command | Action |
|---|---|
| `:sp` / `:vsp` | Split horizontally / vertically (same buffer) |
| `:sp file` / `:vsp file` | Split and open a file |
| `Ctrl-w s` / `Ctrl-w v` | Same as `:sp` / `:vsp` |
| `Ctrl-h/j/k/l` **(cfg)** | Move to the left / lower / upper / right window (also crosses into tmux panes) |
| `Ctrl-w w` | Cycle through windows |
| `Ctrl-w c` | Close the current window |
| `Ctrl-w o` | Close all other windows |
| `:q` | Close the window (exits if it is the last one) |
| `Ctrl-w =` | Equalize window sizes |
| `Ctrl-w _` / `Ctrl-w \|` | Maximize height / width |
| `Ctrl-w +` / `Ctrl-w -` | Taller / shorter |
| `Ctrl-w >` / `Ctrl-w <` | Wider / narrower |
| `Ctrl-w H/J/K/L` | Move the window to the far left / bottom / top / right |
| `Ctrl-w r` | Rotate windows |
| `Ctrl-w T` | Move the window into its own tab |

New splits open **below** and to the **right** **(cfg)**. Prefix a resize key with a count, e.g. `10 Ctrl-w +`.

## Tabs

| Keys / command | Action |
|---|---|
| `:tabnew` | New empty tab |
| `:tabe file` | Open a file in a new tab |
| `gt` / `gT` | Next / previous tab |
| `3gt` | Go to tab 3 |
| `:tabc` | Close the current tab |
| `:tabo` | Close all other tabs |
| `:tabs` | List tabs and their windows |

## Neo-tree (file explorer)

| Keys | Action |
|---|---|
| `<Space>e` **(cfg)** | Toggle the tree |
| `<Space>o` **(cfg)** | Focus the tree |
| `\` **(cfg)** | Reveal the current file in the tree; inside the tree, close it |
| `<Space>ge` **(cfg)** | Floating git-status view |
| `Enter` / `o` | Open the file as a buffer in the last-used window |
| `s` / `S` | Open in a vertical / horizontal split |
| `t` | Open in a new tab |
| `w` | Open using the window picker |
| `P` | Toggle preview |
| `Space` | Expand / collapse a folder |
| `a` | Add a file (end the name with `/` for a folder) |
| `d` / `r` / `c` / `m` | Delete / rename / copy / move |
| `H` | Toggle hidden files |
| `?` | Show all neo-tree mappings |

## Navigation helpers

| Keys | Action |
|---|---|
| `Ctrl-o` / `Ctrl-i` | Jump back / forward through the jump list (works across buffers) |
| `grd` **(cfg)** | Go to definition (LSP). Use `Ctrl-o` to come back. |
| `<Space>sk` **(cfg)** | Search all keymaps |

## Typical workflow

1. `<Space>sf` to open a file, or `Enter` on it in neo-tree.
2. `<Space><Space>` or `Ctrl-^` to hop between open files.
3. `:vsp` and `Ctrl-h/l` to view two files side by side.
4. `:bd` to close buffers you're done with.
