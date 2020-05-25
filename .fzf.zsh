# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/m89870/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/m89870/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/m89870/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/m89870/.fzf/shell/key-bindings.zsh"
