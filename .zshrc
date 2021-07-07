# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
if [ ${USER} = 'denis' ]; then
    export ZSH="/home/denis/.oh-my-zsh"
else
    export ZSH="~/.oh-my-zsh"
fi

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##################################################################################################
### zsh configuration
##################################################################################################

### Aliases
##################################################################################################
alias vim='nvim'
alias bashconf='vim ~/.bash_profile'
alias bashreload='source ~/.bash_profile'
alias zshconf='vim ~/.zshrc'
alias zshreload='source ~/.zshrc'
alias vimconf='vim ~/.config/nvim/init.vim'
alias tmuxconf='vim ~/.tmux.conf'
alias tmuxreload='tmux source ~/.tmux.conf'
alias tmuxnew='tmux new -s'
alias tmuxnewdetached='tmux new -d -s'
alias tmuxattach='tmux a -t'
alias kube='kubectl'

# dotfiles repo configuration
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfilesupload() {
    USER = echo $USER
dotfiles add ~/.zshrc ~/.config/nvim/init.vim ~/.tmux.conf ~/.alacritty.yml
    dotfiles commit -m "Update from ${USER}"
    dotfiles push -u origin main
}
dotfilesdownload() {
    dotfiles fetch
    dotfiles pull
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

### Apps
##################################################################################################
alias sublime='~/./Apps/sublime_text/sublime_text'

### Plugins
##################################################################################################
plugins=(
  git
  zsh-autosuggestions
)

### Local Configuration
##################################################################################################
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile;
fi

### Oh My Zsh
##################################################################################################
source $ZSH/oh-my-zsh.sh

