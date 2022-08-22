# Path to your oh-my-zsh installation.
if [ ${USER} = 'denis' ]; then
    # export ZSH="/home/denis/.oh-my-zsh"
    export PATH="$PATH:/home/denis/.cargo/bin"

else
    # export ZSH="/Users/denis.stroobants/.oh-my-zsh"
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
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
alias starshipconf='vim ~/.config/starship.toml'
alias vimconf='vim ~/.config/nvim/'
alias tmuxconf='vim ~/.tmux.conf'
alias tmuxreload='tmux source ~/.tmux.conf'
alias tmuxnew='tmux new -s'
alias tmuxnewdetached='tmux new -d -s'
alias tmuxattach='tmux a -t'
alias alacrittyconf='vim ~/.alacritty.yml'
alias alacrittyupdate='cd ~/Apps/alacritty/ && git pull'
alias kube='kubectl'
alias drun='docker run -it --rm'
alias tf='terraform'

# dotfiles repo configuration
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfilesupload() {
    dotfiles add ~/.zshrc ~/.config/nvim/init.vim ~/.tmux.conf ~/.alacritty.yml
    case $USER in
        "dstroobants")
            dotfiles commit -m "Update from work"
            ;;
        "denis")
            dotfiles commit -m "Update from home"
            ;;
    esac
    dotfiles push -u origin main
}

dotfilesdownload() {
    dotfiles fetch
    dotfiles pull
}

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

### Apps
##################################################################################################
alias sublime='~/./Apps/sublime_text/sublime_text'

### Plugins
##################################################################################################
plugins=(git zsh-autosuggestions)

### Local Configuration
##################################################################################################
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile;
fi

# ### Kubectl auto completion
# ##################################################################################################
# [[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# ### Terraform auto completion
# ##################################################################################################
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/terraform terraform

### Bash autocompletion
##################################################################################################
# if [ ${USER} = 'denis.stroobants' ]; then
#     [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
# fi

### Init Cargo - Rust Package Manager
##################################################################################################
. "$HOME/.cargo/env"

### Starship - Keep at the end
##################################################################################################
eval "$(starship init zsh)"

