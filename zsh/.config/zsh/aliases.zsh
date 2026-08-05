# sudo without disabling subsequent alias expansion
alias sudo='sudo '

# systemctl shorthand
alias sys='systemctl'

# ---- eza (modern ls replacement) ----
# Default listing with icons
alias ls='eza --icons --color=always --group-directories-first --git'

# Tree view with icons
alias lt='eza --icons --color=always --group-directories-first -T --git'

# Long format with hidden files and git status
alias ll='eza -alF --icons --color=always --group-directories-first --git'

# Show all files (including hidden)
alias la='eza -a --icons --color=always --group-directories-first --git'

# Short format with file type indicators
alias l='eza -F --icons --color=always --group-directories-first --git'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# ---- bat (better cat) ----
# Plain output without pager for quick viewing
alias cat='bat --plain --paging=never'

# Clear screen
alias c='clear'

alias help='tldr'

# =======================
# Core utilities
# =========================================================

#alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias free='free -h'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory
alias ..='cd ..'
alias ...='cd ../..'

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# =========================================================
# Editor
# =========================================================

alias vim='nvim'
alias v='nvim'

# =========================================================
# Git
# =========================================================

alias g='git'
alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# =========================================================
# Docker
# =========================================================

# ---- Docker ----
alias d='docker'
alias dps='docker ps'              # List running containers
alias dpsa='docker ps -a'          # List all containers (including stopped)
alias dcu='docker compose up -d'   # Start services in background
alias dcd='docker compose down'    # Stop and remove services
alias dcs='docker compose stop'    # Stop services
alias dcp='docker compose pull'    # Pull latest images
alias dcr='docker compose restart' # Restart services
alias dce='docker compose exec'    # Execute command in running service
alias dcl='docker compose logs'    # 

# ---- Kubernetes ----
alias k='kubectl'

# =========================================================
# Tools
# =========================================================

alias dropcache='echo 3 | sudo tee /proc/sys/vm/drop_caches'

alias md='mkdir -p'

# Create directory and jump to it
take () {
    mkdir -p $@ && cd ${@:$#}
}

# Extract archives
function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

