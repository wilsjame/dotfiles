#alias ls='ls -aGFhp'
alias ls='ls --color'
alias ll='ls -alF'

# git
alias lg='git log --pretty=oneline'
alias nuke='git reset --hard HEAD'

# docker
alias ld='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.State}}"'
alias ldi='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.ID}}"'
alias ldp='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}"'
alias ldm='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Mounts}}"'

# prompt
# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
#prompt='%F{green}%2/ $(git_branch_name) > '
export PROMPT='%F{green}%~%f $(git_branch_name) > '

export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/james/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/james/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/james/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/james/google-cloud-sdk/completion.zsh.inc'; fi

# This loads nvm bash_completion.
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

eval $(thefuck --alias)
# Try not to swear.
eval $(thefuck --alias nah)

# https://stackoverflow.com/questions/39606031/intellij-key-repeating-idea-vim
defaults write -g ApplePressAndHoldEnabled 0

# This has to be set before installing the .NET SDK
export DOTNET_CLI_TELEMETRY_OPTOUT=1
