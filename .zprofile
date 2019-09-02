echo "Read .zprofile..."
# Attache tmux
if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
    if ( tmux has-session ); then
    session=`tmux list-sessions | grep -e '^[0-9].*]$' | head -n 1 | sed -e 's/^\([0-9]\+\).*$/\1/'`
        if [ -n "$session" ]; then
            echo "Attache tmux session $session."
                tmux attach-session -t $session
        else
            echo "Session has been already attached."
            tmux list-sessions
        fi
    else
        echo "Create new tmux session."
        exec tmux
    fi
fi

paths=(
    "$HOME/.go/bin"
    "$HOME/.local/bin"
    "/usr/local/go/bin"
    "/opt/mit-scheme/bin"
    "/opt/openjml"
    "/opt/Isabelle2016/bin"
    "/opt/eclipse"
    "/opt/marp"
)

for p in ${paths[@]}; do
    export PATH="$p:$PATH"
done

#export PATH="/opt/mit-scheme/bin:/opt/openjml:/opt/Isabelle2016/bin:/opt/marp:/home/atri/bin:/home/atri/0xDBE-143.324.5/bin:/opt/eclipse-indigo:/opt/eclipse:$PATH"
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"

if [ -d $HOME/.anyenv ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

function comprun(){
    mes=`g++ $1 -o cmprn -Wall 2>&1`
    if [ ! mes ]; then
        echo 'compile finished. running...'
        sleep 1s
        ./cmprn
    else
        `g++ $1 -o cmprn -Wall`
    fi
}

function mkcd(){
    mkdir $1 && cd $1
}

function java(){
    /usr/bin/java $@ 2>&1 | grep -v "Picked up JAVA_TOOL_OPTIONS:"
}

function javac(){
    /usr/bin/javac $@ 2>&1 | grep -v "Picked up JAVA_TOOL_OPTIONS:"
}

function zathura(){
    echo $1
    /usr/bin/zathura $1 1>/dev/null 2>&1 &
}

function weka(){
    java -jar /opt/weka-3-8-1/weka.jar >/dev/null 2>&1 &
}

alias \:q='exit'
alias g++14='g++ -std=c++14'
alias cp='cp -ir'
alias gosh='rlwrap gosh'
alias scheme='rlwrap scheme'
alias less='less -XF'
alias mozc-config='/usr/lib/mozc/mozc_tool -mode=config_dialog'
alias mozc-dict='/usr/lib/mozc/mozc_tool -mode=dictionary_tool'
alias tmux="TERM=xterm-256color tmux"
alias rake="noglob rake"
alias open="xdg-open >/dev/null 2>&1"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias jisabelle="/opt/Isabelle2016/Isabelle2016 > /dev/null 2>&1 &"
alias cont="fg %1"
