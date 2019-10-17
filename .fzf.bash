# Setup fzf
# ---------
if [[ ! "$PATH" == */home/bjartek/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/bjartek/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/bjartek/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/bjartek/.fzf/shell/key-bindings.bash"
