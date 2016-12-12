files=$(\ls -a | grep -e "^\.[a-zA-Z0-9]" | grep -v "^\.git*")
path=$(cd $(dirname $0) && pwd)

linker ()
{
    for file in ${files}; do
        if [ -f ${HOME}/${file} ]; then
            echo "${file} is exist. you should rename it like *.old."
        else
            ln -s ${path}/${file} ${HOME}/${file}
            echo "${path}/${file} -> ${HOME}/${file}"
        fi
    done
}

linker
