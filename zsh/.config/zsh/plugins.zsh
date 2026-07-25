# =========================================================
# Plugins
# =========================================================

# Directory where plugins are stored
ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"

# Load a plugin from GitHub by cloning it if not present
# Usage: _zplugin_load <github-user> <repo-name>
_zplugin_load() {
  local plugin_path="${ZPLUGINDIR}/${2}"
  if [[ ! -d "$plugin_path" ]]; then
    mkdir -p "$ZPLUGINDIR"
    echo "Installing ${2}..."
    git clone --depth=1 "https://github.com/${1}/${2}" "$plugin_path" \
      || { echo "ERROR: failed to install ${2}" >&2; return 1; }
  fi
  source "${plugin_path}/${2}.plugin.zsh"
}

# Update all installed plugins by pulling latest changes
zplugin-update() {
  local dir
  for dir in "${ZPLUGINDIR}"/*/; do
    echo "Updating ${dir:t}..."
    git -C "$dir" pull --ff-only
  done
}

# ---- Plugins ----
# Autosuggestions: show ghost-text suggestions from history
_zplugin_load zsh-users zsh-autosuggestions

# History substring search: type part of a command, press Up/Down to cycle matches
_zplugin_load zsh-users zsh-history-substring-search

# fzf-tab: replace Tab completion with fzf-powered fuzzy selection
_zplugin_load Aloxaf fzf-tab

# Fast syntax highlighting: colorize commands as you type (fast variant)
_zplugin_load zdharma-continuum fast-syntax-highlighting
