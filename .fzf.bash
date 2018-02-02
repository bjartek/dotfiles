# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/m89870/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/m89870/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/m89870/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/m89870/.fzf/shell/key-bindings.bash"

