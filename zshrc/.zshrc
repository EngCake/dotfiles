# Oh My ZSH Config
#
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode reminder
plugins=(git zsh-vi-mode)
source $ZSH/oh-my-zsh.sh

# Source other files
#
source ~/.linux.zshrc

# Config Oh My POSH
#
eval "$(oh-my-posh init zsh --config ~/.omp-themes/robbyrussell.omp.json)"

# Aliases
#
alias vi=nvim
alias ls="eza -1 --tree --level 2 --git-ignore"
alias lg="lazygit"

# Integrations
#
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(gh completion -s zsh)

# zoxide
eval "$(zoxide init zsh)"

