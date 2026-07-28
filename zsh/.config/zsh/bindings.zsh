# =========================================================
# Keybindings
# =========================================================

# Use '*?_-.[]~=/&;!#$%^(){}<>'  as a stop chars for word deleting
WORDCHARS=

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

# Up/Down -> history search 
autoload -Uz up-line-or-beginning-search 
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search

bindkey '^[[B' down-line-or-beginning-search
