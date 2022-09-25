# ------------------------------------
# Colors

# https://github.com/misimpso/misimpso.github.io/blob/master/LyricChart/scss/main.scss#L101
set -l white  DCDCCC
set -l grey   2a2a2e
set -l red    e81f1f
set -l orange e8941e
set -l yellow E3CEAB
set -l green  51c742
set -l blue   42acc7
set -l black  ffffff

set -x color_path $grey $white
set -x color_path_basename $grey $white --bold
set -x color_venv $blue $grey --bold


# ------------------------------------
# Main

# Inspired by bobthefish
# https://github.com/oh-my-fish/theme-bobthefish/blob/master/functions/fish_prompt.fish#L1138
function fish_prompt;
    # set -l last_status $status;

    # Start each line with a blank slate
    # set -l __bobthefish_current_bg black
    # set -l real_pwd (__bobthefish_pwd)

    echo -ns $PWD ' !! '
end