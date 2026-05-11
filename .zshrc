fastfetch
export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin/python3:$PATH"
eval "$(starship init zsh)"

#antidote

autoload -Uz compinit && compinit

if [[ "$(uname)" == "Darwin" ]]; then
    source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
elif [[ "$(uname)" == "Linux" ]]; then
    source ~/.antidote/antidote.zsh
fi
antidote load ~/.config/antidote/.zsh_plugins.txt


# Aliases
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Replace defaults with better tools
alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias lt='eza --tree --icons --level=2'
alias cat='bat'
alias grep='rg'
alias find='fd'
alias top='btop'
alias vim='nvim'
alias y='yazi'

# Git shortcuts
alias g='git'
alias gs='git status'
alias lg='lazygit'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
