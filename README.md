# Clone down to a new machine

Clone as bare repo into ~/.dotfiles
```
git clone --bare git@github.com:yourname/dotfiles.git $HOME/.dotfiles

```
Set the alias (same as above, temporarily or in your shell rc)
```
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

```
Checkout your files
```
dots checkout

```

Suppress untracked noise
```
dots config --local status.showUntrackedFiles no

```
