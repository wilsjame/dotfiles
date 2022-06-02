#alias ls='ls -aGFhp'
alias ls='ls --color'
alias ll='ls -alF'
alias lg='git log --pretty=oneline'

export PROMPT='%F{green}%~%f > '
export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
