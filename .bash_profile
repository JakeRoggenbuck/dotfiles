#
# ~/.bash_profile
#


export EDITOR=/usr/bin/nvim
export CALCURSE_EDITOR=/usr/bin/nvim
export PATH=/home/jake/.scripts/:$PATH
export PATH=/home/jake/.local/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
