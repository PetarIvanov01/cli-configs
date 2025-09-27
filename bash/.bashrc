#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# eval "$(brew --prefix)/bin/brew shellenv)"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# -----------
# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return;;
esac
echo -n -e "\033]0;Cool Terminal\007"
# change prompt
export PROMPT_COMMAND='
branch=$(git branch --show-current 2>/dev/null)
                blue="\[\e[34m\]"
                green="\[\e[32m\]"
                reset="\[\e[0m\]"
                if [ -n "$branch" ]; then
                PS1="<\A:\u> ${blue}\w${reset} ${green}($branch)${reset} \\$ "
                else
                PS1="<\A:\u> ${blue}\w${reset} \\$ "
                fi
                '
# use blue for dirs
            #   export CLICOLOR=1
            #   export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# quick edit and source .bash_profile
                alias vb="vi ~/.bash_profile"
                alias sb="source ~/.bash_profile; echo '~/.bash_profile sourced'"
                alias grep='grep --color'
                alias c="clear"
                alias ll="ls -lah"
                alias lh="ls -a | egrep '^\.'"
                alias f="find . | grep"
# IP alias and functions
                alias ip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[ 0-9]*).*/\2/    p'"
                alias myip="curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g'"
                alias path='echo; tr ":" "\n" <<< "$PATH"; echo;'
                export OSH='/Users/petarivanov/.oh-my-bash'
