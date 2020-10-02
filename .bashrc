# ~/.bashrc

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

# Aliases
alias bstr='WM=bspwm startx'
alias dstr='WM=dwm startx'

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias p='python3'

alias pe='fzf --exact --reverse'

alias j='nvim $(pe)'

alias cp="cp -i"
alias df='df -h'
alias tree="tree -C"
# Ls
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lah'
alias lt='ls --human-readable --size -1 -S --classify'
alias lastt='ls -t1l'
alias lview='ls -lhFA > /tmp/list && nvim /tmp/list'
# Nvim
alias v='nvim'
alias nv='nvim'
alias snv='sudo nvim'
# Ranger
alias ra='ranger'
alias sr='sudo ranger'

alias cl='clear'
alias cls='clear && ls'
# Emacs
alias em='emacs'
alias sem='sudo emacs'
# Git
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gsw='git switch'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gra='git remote add'
alias gdc='git diff --cached'
alias gst='git status'
alias gswc='git switch -c'
# Push
alias pusho='git push origin $(git symbolic-ref --short HEAD)'
alias pullo='git pull origin $(git symbolic-ref --short HEAD)'
alias pullm='git pull upstream master'
alias pullu='git pull upstream $(git symbolic-ref --short HEAD)'
# Extra
alias gls='git log --pretty=oneline --abbrev-commit'
alias logg='git log --graph --decorate --all'
alias bgd='feh --bg-fill'
alias groffme='groff -Tps -me'
alias count="find . -type f | wc -l"
alias gp="bgd ~/.gp"
alias ytau="youtube-dl -x --audio-format mp3"
alias lintit='git ls-files *.py | xargs pylint'
alias vos="sox -t pulseaudio default -t pulseaudio null pitch -200 rate -v -L -b 90 20k gain -10"
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

ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   echo -e "tar -xjf\ntar -cjvf"   ;;
      *.tar.gz)    echo -e "tar -xzf\ntar -czvf"   ;;
      *.bz2)       echo -e "bunzip2\nbzip2 -zk"   ;;
      *.rar)       echo -e "unrar -x"   ;;
      *.gz)        echo -e "gunzip"    ;;
      *.tar)       echo -e "tar -xf"    ;;
      *.tbz2)      echo -e "tar -xjf"   ;;
      *.tgz)       echo -e "tar -xzf"   ;;
      *.zip)       echo -e "unzip"     ;;
      *.Z)         echo -e "uncompress";;
      *.7z)        echo -e "7z -x"      ;;
      *.xz)        echo -e "xz -d\nxz\nuse num 1-9 as flag for compression rate"      ;;
      *)           echo -e "cannot be extracted via ex()" ;;
    esac
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
eval "$(rbenv init -)"
