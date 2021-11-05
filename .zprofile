echo "Read .zprofile..."
# Attache tmux
#if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
#    if ( tmux has-session ); then
#    session=`tmux list-sessions | grep -e '^[0-9].*]$' | head -n 1 | sed -e 's/^\([0-9]\+\).*$/\1/'`
#        if [ -n "$session" ]; then
#            echo "Attache tmux session $session."
#                tmux attach-session -t $session
#        else
#            echo "Session has been already attached."
#            tmux list-sessions
#        fi
#    else
#        echo "Create new tmux session."
#        exec tmux
#    fi
#fi

#paths=(
#)
#
#for p in ${paths[@]}; do
#    export PATH="$p:$PATH"
#done
#
if [ -z "$NODE_PATH" ]; then
    export NODE_PATH="$HOME/.config/yarn/global/node_modules"
fi


if [ -d $HOME/.anyenv ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi
