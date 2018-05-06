export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Load theme file
zplug 'dracula/zsh', as:theme

# auto suggestion
zplug 'zsh-users/zsh-autosuggestions'


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose


####################################################################

# 環境変数
export LANG=ja_JP.UTF-8
export KCODE=u           # KCODEにUTF-8を設定

# export PYTHONPATH=$HOME/Work/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=$HOME/work/tool/google-cloud-sdk/platform/google_appengine:$PYTHONPATH

# GAE: CredentialのPath
#export GOOGLE_APPLICATION_CREDENTIALS="/Users/namco/Work/python/gae/credentials/WineRed-Staging-834b56ae443d.json"


# alias
alias bootmysetting='osascript /Users/namco/Boot/terminal20170919.scpt'

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH


## 色を使用出来るようにする
autoload -Uz colors
colors

## 補完機能を有効にする
autoload -Uz compinit
compinit

## タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd

# コマンド訂正
setopt correct

## ヒストリの設定
source /Users/stnamco/work/tool/zaw/zaw.zsh
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt hist_ignore_dups # 重複を記録しない
setopt EXTENDED_HISTORY # 開始と終了を記録
setopt hist_ignore_space # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_save_no_dups # 古いコマンドと同じものは無視
setopt hist_no_store # historyコマンドは履歴に登録しない
setopt hist_expand # 補完時にヒストリを自動的に展開
setopt inc_append_history # 履歴をインクリメンタルに追加

### history - zaw
bindkey '^h' zaw-history
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward


## PROMPT
# vcs_infoロード    
autoload -Uz vcs_info    

# PROMPT変数内で変数参照する    
setopt prompt_subst    

# vcsの表示    
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' formats '(%b%c%u)'    
zstyle ':vcs_info:*' actionformats '(%b(%a)%c%u)'    

# プロンプト表示直前にvcs_info呼び出し    
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}    

#add-zsh-hook precmd _update_vcs_info_msg
PROMPT="%{${fg[green]}%}%n%{${reset_color}%}@%F{yellow}localhost%f:%1(v|%F{red}%1v%f|) $ "
RPROMPT='[%F{green}%d%f]'

## Aliasの設定
# core
alias his='history'


# git
alias gs='git status'
alias gl='git log --graph'
alias git_branch_old='git branch --sort=authordate'
alias git_branch_new='git branch --sort=-authordate'
alias git_push_origin='git push origin HEAD'
alias git_first='git commit --allow-empty -m "first commit"'

# rails
alias srake='spring rake'

# brew
#alias brew="env PATH=${PATH/\/Users\/namco\/\.phpenv\/shims:/} brew"

# nodebrew
export PATH=/usr/local/var/nodebrew/current/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH


CLOUDSDK_PYTHON_SITEPACKAGES=./install.sh

source '/Users/stnamco/work/tool/google-cloud-sdk/completion.zsh.inc'
source '/Users/stnamco/work/tool/google-cloud-sdk/path.zsh.inc'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stnamco/work/tool/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/stnamco/work/tool/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stnamco/work/tool/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/stnamco/work/tool/google-cloud-sdk/completion.zsh.inc'; fi

# jenv
# state -> failed
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

export PATH=$PATH:/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home/bin
export JAVA_HOME=/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home
eval "$(rbenv init -)"

export ANDROID_HOME=/Users/stnamco/Library/Android/sdk
