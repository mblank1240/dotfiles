# tmux cheat sheet

Prefix is **Ctrl+Space** (set in `tmux.conf`), not the default Ctrl+b. Below, `Prefix` means Ctrl+Space.
Items marked ★ are custom bindings from this config.

**Terms:** a *window* is a tab; a *pane* is a split inside a window. Windows and panes are numbered from 1.

## Windows (tabs)
| Keys | Action |
|---|---|
| `Prefix c` ★ | New window, opened in the current directory |
| `Alt+1`…`Alt+9` ★ | Jump to window N (no prefix needed) |
| `Alt+←` / `Alt+→` ★ | Previous / next window (no prefix needed) |
| `Prefix n` / `Prefix p` | Next / previous window |
| `Prefix l` | Toggle to the last window |
| `Prefix w` | Interactive window and session picker |
| `Prefix ,` | Rename window |
| `Prefix &` | Kill window (asks first) |
| `Prefix .` | Move window to another index |

## Panes (splits)
| Keys | Action |
|---|---|
| `Prefix \|` ★ | Split side by side (left/right), keeping the current directory |
| `Prefix -` ★ | Split top/bottom, keeping the current directory |
| `Prefix ←↑↓→` | Move between panes |
| `Prefix o` | Cycle to the next pane |
| `Prefix ;` | Toggle to the last pane |
| `Prefix q` | Show pane numbers; press a number to jump |
| `Prefix H/J/K/L` ★ | Resize left/down/up/right by 5 (repeatable) |
| `Prefix z` | Zoom or unzoom the current pane |
| `Prefix x` | Kill pane (asks first) |
| `Prefix !` | Break the pane out into its own window |
| `Prefix {` / `Prefix }` | Swap pane with the previous / next one |
| `Prefix Space` | Cycle through preset layouts |
| `Prefix Alt+1`…`5` | Pick a specific layout |

## Sessions
| Keys / command | Action |
|---|---|
| `Prefix d` | Detach (the session keeps running) |
| `Prefix $` | Rename session |
| `Prefix s` | Session picker |
| `Prefix (` / `Prefix )` | Previous / next session |
| `tmux new -s name` | Start a named session |
| `tmux ls` | List sessions |
| `tmux a -t name` | Attach to a session |
| `tmux kill-session -t name` | Kill a session |

## Copy mode and misc
| Keys | Action |
|---|---|
| `Prefix [` | Enter copy/scroll mode; `q` exits |
| `Prefix ]` | Paste the tmux buffer |
| `Prefix :` | Command prompt |
| `Prefix ?` | List all key bindings |
| `Prefix t` | Show a clock |

## Tips
- Reload config: `tmux source-file ~/.config/tmux/tmux.conf` (or `Prefix :` then the same command).
- In copy mode, `/` searches forward and `?` backward. Keys are Emacs style unless `mode-keys vi` is set.
- To send a literal Ctrl+Space to a program inside tmux, press it twice (`bind C-Space send-prefix`).
- Run `tmux list-keys` to see the real bindings if something doesn't behave as listed.
