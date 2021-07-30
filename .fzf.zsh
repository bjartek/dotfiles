# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/bjartek/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/bjartek/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/bjartek/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/bjartek/.fzf/shell/key-bindings.zsh"
