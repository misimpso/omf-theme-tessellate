# Tessellate Oh My Fish Theme
#   Inspired by `bobthefish` and `ocean` themes


function __pwd -d 'Get a normalized $PWD'
    # The pwd builtin accepts `-P` on at least Fish 3.x, but fall back to $PWD if that doesn't work
    builtin pwd -P 2>/dev/null
    or echo $PWD
end

function __tilde_path -S -a pth
    echo -ns (string replace $HOME '~' $pth)
end

function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

# ------------------------------------
# Main

function fish_prompt;

    set -l blue (set_color blue)
    set -l green (set_color green)
    set -l red (set_color red)
    set -l normal (set_color normal)

    set VIRTUAL_ENV_DIR ""
    set CURRENT_DIR (__tilde_path (__pwd))
    set GIT_BRANCH (_git_branch_name)

    if test -n "$VIRTUAL_ENV";
        set VIRTUAL_ENV_DIR (__tilde_path (path dirname $VIRTUAL_ENV))
        set CURRENT_DIR (string replace $VIRTUAL_ENV_DIR "" $CURRENT_DIR)
        set CURRENT_DIR (string join "" $blue $VIRTUAL_ENV_DIR $normal $CURRENT_DIR)
    end

    # PRINT - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    echo -ns "[ "

    if test -n "$GIT_BRANCH";
        if [ (_is_git_dirty) ];
            echo -ns $red
        else
            echo -ns $green
        end
        echo -ns "($GIT_BRANCH) " $normal
    end

    echo -ns $CURRENT_DIR
    echo -ns " ] " $normal
end