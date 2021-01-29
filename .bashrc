# ~/.bashrc

bash_startup

HISTSIZE=100000
HISTFILESIZE=200000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ ${EUID} == 0 ]] ; then
        PS1='\[\e[01;34m\]\W\[\e[m\]$(__git_ps1) \[\e[01;32m\]▲\[\e[m\] '
else
        PS1='\[\e[00;00m\]\W\[\e[01;34m\]$(__git_ps1) \[\e[01;32m\]▲\[\e[m\] '
fi

# Git auto complete
source ~/.scripts/git-completion

# Git promt config
source ~/.scripts/git-prompt

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Note: The aliases are all documented so a future unnamed program
# can extract a bit of context for each alias

# start x server with bspwm as window manager
alias bstr='WM=bspwm startx'
# start x server with dwm as window manager
alias dstr='WM=dwm startx'

# list directories
alias ls='ls --color=auto'
# search contents of files
alias grep='grep --colour=auto'
# search contents of files with extended regex, same as 'grep -E'
alias egrep='egrep --colour=auto'
# search contents of a file with a fixed-character string
alias fgrep='fgrep --colour=auto'

# python3 alias
alias p='python3'

# open a fizzy finder
alias pe='fzf --exact --reverse'

# open a file in vim selected by a fizzy finder
alias j='nvim $(pe)'

# copy a file from path to path
alias cp="cp -i"
# show disc usage with the human readable flag
alias df='df -h'
# show files in a tree like structure
alias tree="tree -C"
# show a better tree with exa
alias btree="exa -T --level 2"

# list each file with it's human readable size 
alias lt='ls --human-readable --size -1 -S --classify'
# list files by last edited
alias lastt='ls -t1l'

# nvim command
alias v='nvim'
# open nvim with sudo permission
alias sv='sudo nvim'

# open ranger file manager
alias ra='ranger'
# open ranger file manager with sudo permission
alias sr='sudo ranger'

# clear the screen
alias cl='clear'

# open emacs
alias em='emacs'
# open emacs with sudo permission
alias sem='sudo emacs'

# rename git
alias g='git'
# add file in git
alias ga='git add'
# git branch prefix, or show branches
alias gb='git branch'
# switch to another branch
alias gsw='git switch'
# git commit
alias gc='git commit'
# show git diff
alias gd='git diff'
# git fetch prefix, => git fetch upstream pull/22/head
alias gf='git fetch'
# checkout the FETCH_HEAD
alias gcf='git checkout FETCH_HEAD'
# git pull
alias gpull='git pull'
# git push
alias gpush='git push'
# add a remote
alias gra='git remote add'
# check the cached diff, after you commit changes
alias gdc='git diff --cached'
# git status, unstages, staged, modified, etc
alias gstat='git status'
# switch to another branch
alias gswitch='git switch -c'

# push current branch to origin
alias pusho='git push origin $(git symbolic-ref --short HEAD)'
# pull curent branch from origin
alias pullo='git pull origin $(git symbolic-ref --short HEAD)'
# pull current default branch
alias pullm='git pull upstream $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
# pull current branch from upstream
alias pullu='git pull upstream $(git symbolic-ref --short HEAD)'

# show very short git log, commit hash first six, and commit message
alias gls='git log --pretty=oneline --abbrev-commit'
# show cool graph of git log
alias logg='git log --graph --decorate --all'
# change background using feh with fill
alias bgd='feh --bg-fill'
# compile groff file using me format
alias groffme='groff -Tps -me'
# count the files in a dir
alias count="find . -type f | wc -l"
# download youtube audio from youtube-dl
alias ytau="youtube-dl -x --audio-format mp3"
# make voice crazy using sox
alias vos="sox -t pulseaudio default -t pulseaudio null pitch -200 rate -v -L -b 90 20k gain -10"
# update the dotfiles
alias dotup="cd ~/Repos/ConfigFiles/; python ../dot_drop/main.py"

function ckpull () {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
	git fetch upstream pull/"$1"/head && git checkout FETCH_HEAD
    else
	if [ -n "$2" ]; then
	    if [[ "$2" =~ ^[0-9]+$ ]]; then
		git fetch "$1" pull/"$2"/head && git checkout FETCH_HEAD
	    else
		echo "To specify a branch and a PR, do branch first, then PR #"
	    fi
	else
	    echo "Specify PR and branch name"
	fi
    fi
}


if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
eval "$(rbenv init -)"