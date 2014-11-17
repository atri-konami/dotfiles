export PATH="/opt/eclipse:/opt/Qt/Tools/QtCreator/bin:/opt/Twitama/bin:$HOME/.rbenv/bin:$PATH"

export DROPBOX="/windows/Dropbox"
export DB="/windows/Dropbox"

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

alias \:q='exit'
alias g++11='g++ -std=c++11'
alias cp='cp -ir'
alias gosh='rlwrap gosh'
