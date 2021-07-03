# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/denis/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##################################################################################################
### zsh configuration
##################################################################################################

### Aliases
##################################################################################################
alias vim='nvim'
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
    dotfiles add ~/.config/nvim/init.vim ~/.tmux.conf
    dotfiles commit -m 'automated commit'
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

