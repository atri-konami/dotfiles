# 環境変数
export LANG=ja_JP.UTF-8

######################################
# History
#######################################
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=1000000            # メモリに保存されるヒストリの件数
SAVEHIST=1000000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
 
 
 
#######################################
# 補完関係
#######################################
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
/usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
 
#######################################
# Prompt
#######################################
autoload -Uz colors;colors
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats "[${fg[green]}%b${reset_color}]"
zstyle ':vcs_info:*' actionformats "[${fg[green]}%b${reset_color}|${fg[red]}%a${reset_color}]"
precmd (){ vcs_info }
#PROMPT="
# %{${fg[yellow]}%}%~%{${reset_color}%}
#[%n]$ "
#PROMPT2='[%n]> '
#プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
#PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %# "
#PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~ 
#%# "
PROMPT='%{${fg[red]}%}[%n@%m]%{${reset_color}%} [%~] ${vcs_info_msg_0_}
%# '
#RPROMPT='[%~] ${vcs_info_msg_0_}'

 
#######################################
# Color
#######################################
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
bindkey "^[[Z" reverse-menu-complete  

# alias #
#
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color"
  ;;
esac

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mkdir='mkdir -p'

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# beep を無効にする
setopt no_beep
 
# フローコントロールを無効にする
setopt no_flow_control
 
# '#' 以降をコメントとして扱う
setopt interactive_comments
 
# ディレクトリ名だけでcdする
setopt auto_cd
 
# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
 
# = の後はパス名として補完する
setopt magic_equal_subst
 
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
 
# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups
 
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# 高機能なワイルドカード展開を使用する
setopt extended_glob

# vim風キーバインド
bindkey -v
 
########################################


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
