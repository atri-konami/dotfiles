export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

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
    `mkdir $1 && cd $1`
}

alias \:q='exit'
alias g++11='g++ -std=c++11'
alias cp='cp -ir'
alias gosh='rlwrap gosh'
alias xclip='xclip -selection clipboard'

alias less='less -XF'

alias tmux="TERM=xterm-256color tmux"
