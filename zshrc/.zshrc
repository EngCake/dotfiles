# Oh My ZSH Config
#
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="fino"
zstyle ':omz:update' mode reminder
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Aliases
#
alias v=nvim
alias ls="eza -1 --tree --level 2 --icons --git-ignore"

# Integrations
#
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
