# Oh My ZSH Config
#
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="refined"
zstyle ':omz:update' mode reminder
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Aliases
#
alias vi=nvim
alias ls="eza -1 --tree --level 2 --icons --git-ignore"
alias lg="lazygit"

# Integrations
#
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(gh completion -s zsh)

# zoxide
eval "$(zoxide init zsh)"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		z "$cwd"
	fi
	rm -f -- "$tmp"
}

