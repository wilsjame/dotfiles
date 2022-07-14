#alias ls='ls -aGFhp'
alias ls='ls --color'
alias ll='ls -alF'
alias lg='git log --pretty=oneline'
alias ld='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.State}}"'
alias ldi='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.ID}}"'
alias ldp='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}"'
alias ldm='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Mounts}}"'

export PROMPT='%F{green}%~%f > '
export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
