HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT='%~ > '
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -e
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
export EDITOR="hx"
export VISUAL="hx"
export GTK_THEME=Adwaita-dark
export DISPLAY=:1
