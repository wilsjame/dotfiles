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

function parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'\e[0m'
#COLOR_USR=$'\e[38;5;243m'
COLOR_DIR=$'\e[38;5;197m'
COLOR_GIT=$'\e[38;5;39m'
setopt PROMPT_SUBST
export PROMPT='%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/james/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/james/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/james/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/james/google-cloud-sdk/completion.zsh.inc'; fi
