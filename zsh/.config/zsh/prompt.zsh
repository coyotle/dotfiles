# ~/.config/zsh/prompt.zsh

# Prevent Python virtualenv from polluting the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Increase max nested function calls (needed by some tools/plugins)
FUNCNEST=100

# Prompt engine: oh-my-posh with custom theme
#eval "$(starship init zsh)"
command -v oh-my-posh &>/dev/null && eval "$(oh-my-posh init zsh --config $ZDOTDIR/themes/amro.omp.json)"
