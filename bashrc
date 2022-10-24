#!/usr/bin/env bash
# ~/.bashrc

ANASTASIUS=0
LEV=1

case "$(uname -n)" in
 "anastasius") PROFILE=$ANASTASIUS ;;
 "lev") PROFILE=$LEV ;;
esac

export PROFILE=$PROFILE

if [[ $PROFILE -eq $ANASTASIUS ]]; then
	CHEAT_SHEET=0
	ALIAS_SHOW=1
	RUBY=0
	FASD=0
	STARSHIP=0
elif [[ $PROFILE -eq $LEV ]]; then
	CHEAT_SHEET=0
	ALIAS_SHOW=1
	RUBY=0
	FASD=0
	STARSHIP=0
else
	CHEAT_SHEET=0
	ALIAS_SHOW=0
	RUBY=0
	FASD=0
	STARSHIP=0
fi

start_cheat_sheet () {
	cheat_sheet_startup print
	(cheat_sheet_startup pull &)
}

start_alias_show () {
	bash_startup_cpp
}

start_ruby () {
	eval "$(rbenv init -)"
}

start_fasd () {
	eval "$(fasd --init auto)"
}

start_starship() {
    eval "$(starship init bash)"
}

git_color () {
	# Inspired by function from https://github.com/jishnusen/dots
	local git_status="`git status 2>&1`"
	if [[ ! "$git_status" =~ not\ a\ git\ repo ]]; then
		if [[ "$git_status" =~ Changes\ not\ staged\ for\ commit ]]; then
			local color='\e[1;31m'
		elif [[ "$git_status" =~ Changes\ to\ be\ committed ]]; then
			local color='\e[1;33m'
		else
			local color='\e[1;34m'
		fi
		echo -e $color
	fi
}

get_greek_symbol () {
	echo "
	Α α	alpha
	Β β	beta
	Γ γ	gamma
	Δ δ	delta
	Ε ε	epsilon
	Ζ ζ	zeta
	Η η	eta
	Θ θ	theta
	Ι ι	iota
	Κ κ	kappa
	Λ λ	lambda
	Μ μ	mu
	Ν ν	nu
	Ξ ξ	xi
	Ο ο	omicron
	Π π	pi
	Ρ ρ	rho
	Σ σ	sigma
	Τ τ	tau
	Υ υ	upsilon
	Φ φ	phi
	Χ χ	chi
	Ψ ψ	psi
	Ω ω	omega" | dmenu | awk '{printf $1 "\n" $2}' | dmenu | tr -d "\n" | xclip -sel clip
}

HISTSIZE=100000
HISTFILESIZE=200000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ ${EUID} == 0 ]]; then
	PS1='\[\e[00;00m\]\W\[$(git_color)\]$(__git_ps1) \[\e[01;31m\]Λ\[\e[m\] '
else
	PS1='\[\e[00;00m\]\W\[$(git_color)\]$(__git_ps1) \[\e[01;32m\]λ\[\e[m\] '
fi

export SCRIPTS="/home/jake/.scripts/"
export WALLPAPER="/home/jake/.config/wallpaper"

if [[ ! -d $SCRIPTS ]]; then
    echo "$SCRIPTS doesn't exist"
	echo "set the var to it's actual location if it does exist"
fi

# Git auto complete
source $SCRIPTS/git-completion

# Git promt config
source $SCRIPTS/git-prompt

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Note: The aliases are all documented so a future unnamed program
# can extract a bit of context for each alias

# Open my draft
alias drafts='v ~/Library/drafts/$(ls ~/Library/drafts/ | fzf)'
# start x server with bspwm as window manager
alias bstr='WM=bspwm startx'
# start x server with dwm as window manager
alias dstr='WM=dwm startx'

# get greek character
alias gg='get_greek_symbol'

# autoignore by adamhutchings - https://github.com/adamhutchings/autoignore
alias autoignore='python3 /home/jake/Build/autoignore/src/main.py'

# list directories
alias ls='exa'
# search contents of files
alias grep='grep --colour=auto'
# search contents of files with extended regex, same as 'grep -E'
alias egrep='egrep --colour=auto'
# search contents of a file with a fixed-character string
alias fgrep='fgrep --colour=auto'

# gcc with all, error, extra
alias gccc='gcc -Wall -Werror -Wextra'

# python3 alias
alias p='python3'

# julia interactive mode
alias j='julia'

# open a fizzy finder
alias pe='fzf --exact --reverse'

# open a file in vim selected by a fizzy finder
alias n='nvim $(pe)'

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

# color highlight of diff by default
alias diff='diff --color=auto'

# nvim command
alias v='nvim'

# open nvim with sudo permission
alias sv='sudo nvim'

# v compiler has the same name as my nvim
alias vc='/usr/local/bin/v'

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
# Git diff but each char
alias gdp='git diff --word-diff=color --word-diff-regex=.'
# git status, unstages, staged, modified, etc
alias gstat='git status'
# switch to another branch
alias gswitch='git switch -c'

# get https link for git repo origin
alias gt="git remote -v | grep origin | head -1 | awk '{ print \$2}' | sed 's/com:/com\//g' | sed 's/git@/https:\/\//g'"

# go to gt
alias gto='xdg-open $(gt)'

# tmux
alias t="tmux"

# any
alias a='fasd -a'
# show / search / select
alias s='fasd -si'
# directory
alias d='fasd -d'
# file
alias f='fasd -f'
# interactive directory selection
alias sd='fasd -sid'
# interactive file selection
alias sf='fasd -sif'
# cd, same functionality as j in autojump
alias z='fasd_cd -d'
# cd with interactive selection
alias zz='fasd_cd -d -i'

# A cat(1) clone with wings.
alias b='bat'
# Bat without line numbers or decorators
alias bp='bat -p'

# View the contents of a file
alias c='cat'

# View mongo database with mongoc-rs
alias m='mongoc-rs'

# Hex viewer
alias x='hexyl'

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

alias rec="ffmpeg -f x11grab -y -framerate 30 -s 1920x1080 -i :0.0 -c:v libx264 -preset superfast -crf 18 out.mp4"

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

if [[ $CHEAT_SHEET -eq 1 ]]; then
	if [[ $(which cheat_sheet_startup & >/dev/null 2>&1) ]]; then
		start_cheat_sheet
	else
		echo "Install cheat_sheet_startup and add it to your PATH"
	fi
fi

if [[ $ALIAS_SHOW -eq 1 ]]; then
	if [[ $(which bash_startup_cpp & >/dev/null 2>&1) ]]; then
		start_alias_show
	else
		echo "Install bash_startup_cpp and add it to your PATH"
	fi
fi

if [[ $RUBY -eq 1 ]]; then
	if [[ $(which rbenv & >/dev/null 2>&1) ]]; then
		start_ruby
	fi
fi

if [[ $FASD -eq 1 ]]; then
	if [[ $(which fasd & >/dev/null 2>&1) ]]; then
		start_fasd
	fi
fi

if [[ $STARSHIP -eq 1 ]]; then
	if [[ $(which starship & >/dev/null 2>&1) ]]; then
		start_starship
	fi
fi

2>/dev/null 1>/dev/null eval "$(ssh-agent -s)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
