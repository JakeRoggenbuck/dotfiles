export EDITOR="nvim"
export CALCURSE_EDITOR="nvim"
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.yflat/bin
export PATH=$PATH:~/Repos/better-scripts/bin

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

# Google test framework colorful output
export GTEST_COLOR=1
export PATH="$PATH:/home/jake/.local/share/coursier/bin"

HISTSIZE=100000
HISTFILESIZE=200000

bash ~/.bashrc

. "$HOME/.cargo/env"
