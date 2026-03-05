# zshrc

Utilities for shell (using ohmyzsh)

Now use fnm instead nvm, for faster boot new session

```bash
# to run profile cmd: 
# time ZSH_DEBUGRC=1 zsh -i -c exit
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

# Performance optimizations
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Cache completions aggressively
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# config dir
export XDG_CONFIG_HOME="$HOME/.config"
# enable when nvm dir is not under root/custom dir location

# Aliasing
alias v="nvim"
alias lg="lazygit"
alias gvm="~/.g/bin/g" # macos

# fuzzy find
export FZF_DEFAULT_COMMAND='fd --type file -H -E .git' # list hidden files but ignores .git
f() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && v "${files[@]}"
}

# yazi
export EDITOR='nvim'
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# simple zsh theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh
# zsh-autosuggestions installed with brew
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Autosuggest settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#1bfd9c,bg=black,bold"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# source omz
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
```
