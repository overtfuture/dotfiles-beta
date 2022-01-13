# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nate/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/nate/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nate/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/nate/.fzf/shell/key-bindings.zsh"