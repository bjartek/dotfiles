export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH=$PATH:/usr/local/bin
. "$HOME/.cargo/env"
