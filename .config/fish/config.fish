set -U fish_key_bindings fish_vi_key_bindings
set -x PATH $PATH $HOME/bin
set -x PS4 '+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

set -g theme_date_format "+%H:%M"
set -g theme_nerd_fonts yes
set -x LANG en_US.UTF-8

set -g theme_display_vi no
set -g default_user m89870
set -g theme_color_scheme solarized-dark
