source ~/.profile
source ~/.aliases

unset all_proxy
unset ALL_PROXY

export EDITOR='nvim'

export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

autoload -Uz compinit
compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Plugin history-search-multi-word loaded with investigating.
#zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light Aloxaf/fzf-tab

# Snippet
#zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

# Load powerlevel10k theme
source ${HOME}/.p10k.zsh
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"


setopt NO_BEEP

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# key binding
 source $HOME/.zsh_keybindings

# fzf 
source ${HOME}/.fzf/key-bindings.zsh
source ${HOME}/.fzf/completion.zsh
export FZF_DEFAULTS_OPT="--extended"
export FZF_DEFAULTS_COMMAND="fd --type f"        
export FZF_CTRL_T_COMMAND="$FZF_DEFAULTS_COMMAND"

# yazi
y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

take () {
        mkdir -p $@ && cd ${@:$#}
}

# Turso
export PATH="$PATH:/home/sergey/.turso"
