# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
if [ ${USER} = 'denis' ]; then
    export ZSH="/home/denis/.oh-my-zsh"
else
    export ZSH="/Users/denis.stroobants/.oh-my-zsh"
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    export PATH="$PATH:/Users/denis.stroobants/Library/Python/3.10/bin"
fi

##################################################################################################
### zsh configuration
##################################################################################################

### Aliases
##################################################################################################
if [ ${USER} = 'denis' ]; then
    alias vim='~/nvim0.7.2/nvim-linux64/bin/nvim'
else
    alias vim='nvim'
fi
alias f='vim $(fzf)'
alias bashconf='vim ~/.bash_profile'
alias bashreload='source ~/.bash_profile'
alias zshconf='vim ~/.zshrc'
alias zshreload='source ~/.zshrc'
alias vimconf='vim ~/.config/nvim/'
alias tmuxconf='vim ~/.tmux.conf'
alias tmuxreload='tmux source ~/.tmux.conf'
alias tmuxnew='tmux new -s'
alias tmuxnewdetached='tmux new -d -s'
alias tmuxattach='tmux a -t'
alias kube='kubectl'
alias tf='terraform'

# Git
gitreload() {
    git stash
    if [ ${USER} = denis ]; then
        git checkout main
    else
        git checkout master
    fi
    git fetch
    git pull
    git stash pop
}

function gitpushall() {
    git add *
    git commit -m "$1"
    git push
}
### Functions
##################################################################################################
# http://cheat.sh/
function cheat(){
    curl cheat.sh/$1
}

# Call the function: ec2IP<space><instance_name> eg: ec2IP i-0edb9adfe373a6ebf
# Requires to be logged in via the aws cli
function ec2IP(){
    ec2_ip=$(
        aws ec2 describe-instances \
        --instance-id $1
    )
    echo $ec2_ip | jq '.[][0]["Instances"][0]["PrivateIpAddress"]' | tr -d '"'
}

# SSH to the raspberry pi
raspberry-ssh () {
    ping raspberrypi.local
    echo "ssh denis@ipv6address"
}

### Local Configuration
##################################################################################################
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile;
fi

### Set Theme to P10K
##################################################################################################
ZSH_THEME="powerlevel10k/powerlevel10k"

### Init Oh my ZSH
###################################################################################################
source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
