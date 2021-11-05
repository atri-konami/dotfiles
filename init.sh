set -eux
files=$(\ls -a | grep -e "^\.[a-zA-Z0-9]" | grep -v "^\.git*")
path="$(dirname "$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)")"

for file in ${files}; do
    if [ -f ${HOME}/${file} -a ! -L ${HOME}/${file} ]; then
        #echo "${file} is exist. you should rename it like *.old."
        echo "${file} is exist. make ${file}.old."
        mv ${HOME}/${file} "${HOME}/${file}.old" && rm ${HOME}/${file} && ln -s ${path}/${file} ${HOME}/${file}
    else
        ln -sf ${path}/${file} ${HOME}/${file}
        echo "${path}/${file} -> ${HOME}/${file}"
    fi
done
