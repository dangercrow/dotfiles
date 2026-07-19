# ~/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# BEGIN CUDA setup
PATH=/usr/local/cuda-13.3/bin${PATH:+:${PATH}}
export PATH

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export LD_LIBRARY_PATH
# END CUDA setup

# BEGIN aliases
alias d='docker'
alias dc='docker compose'  # /usr/bin/dc if you really need GNU dc
alias g='git'
alias k='kubectl'
alias ll='ls -alF'
alias screen='screen -U'
alias scp='scp -C -p'
alias tf='terraform'
# END aliases
