set -U fish_key_bindings fish_vi_key_bindings
set -x PS4 '+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

set -g theme_date_format "+%H:%M"
set -g theme_nerd_fonts yes
set -x LANG en_US.UTF-8
set -g GOPATH ~/go
set -g GOROOT /usr/local/opt/go/libexec

set -x JAVA_HOME (/usr/libexec/java_home -v 11)
set -x PATH  $HOME/bin $GOPATH $GOROOT $HOME/.cargo/bin $JAVA_HOME/bin /usr/local/opt/gnu-sed/libexec/gnubin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin $PATH

set -g theme_display_vi no
set -g theme_display_k8s_context yes
set -g default_user m89870
set -g theme_color_scheme solarized-dark
alias ping='prettyping --nolegend'
alias p="fzf --preview 'bat --color \"always\" {}'"
alias help='tldr'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias l="exa -lG --git"
alias ..="cd .."
alias ...="cd ../.."
set -U FZF_COMPLETE 1
set -g -x BAT_THEME TwoDark
