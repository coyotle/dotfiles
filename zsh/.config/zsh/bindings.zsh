# =========================================================
# Keybindings
# =========================================================

# Use '*?_-.[]~=/&;!#$%^(){}<>'  as a stop chars for word deleting
WORDCHARS=

# Use emacs key bindings
#bindkey -e

# Home
bindkey  "^[[F"   end-of-line

# End
bindkey  "^[[H"   beginning-of-line

# [Backspace] - delete backward
bindkey '^?' backward-delete-char

# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char
else
  bindkey "^[[3~" delete-char

  bindkey "^[3;5~" delete-char
fi

# [Ctrl-Delete] - delete whole forward-word
bindkey '^[[3;5~' kill-word

# [Ctrl-Backspace]
bindkey "^H" backward-kill-word

# [Ctrl-Delete] - delete whole forward-word
bindkey '^[[3;5~' kill-word

# Ctrl+Right -> move forward one word (^[[1;5C is the terminal escape code)
bindkey '^[[1;5C' forward-word

# Ctrl+Left -> move backward one word (^[[1;5D is the terminal escape code)
bindkey '^[[1;5D' backward-word

# Ctrl+F -> fzf file picker (no hidden files)
(( $+widgets[fzf-file-widget] )) && bindkey '^F' fzf-file-widget

# Ctrl+\ -> toggle autosuggestions (useful for screen recordings)
bindkey '^\' autosuggest-toggle

# Up/Down -> history search by substring (^[[A/^[[B are up/down arrow escape codes)
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

