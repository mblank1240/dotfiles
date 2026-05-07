fastfetch
export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin/python3:$PATH"
eval "$(starship init zsh)"

#antidote

autoload -Uz compinit && compinit

if [[ "$(uname)" == "Darwin" ]]; then
    source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
elif [[ "$(uname)" == "Linux" ]]; then
    source /usr/share/antidote/antidote.zsh
fi
antidote load ~/.config/antidote/.zsh_plugins.txt
