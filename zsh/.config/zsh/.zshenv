# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- Pager ----------
export MANROFFOPT="-c"

if command -v bat >/dev/null 2>&1; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
fi

# Fix golang default shitty paths
export GOPATH="$HOME/.local/share/go"
export GOMODCACHE="$HOME/.cache/go/pkg/mod"
export GOCACHE="$HOME/.cache/go-build"
export PATH="$PATH:$GOPATH/bin"

# ---------- PATH ----------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.npm-global/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

