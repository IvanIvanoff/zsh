# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/ivan/.oh-my-zsh
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/home/ivan/.asdf/installs/elixir/1.6.4/.mix/escripts
PATH=$PATH:~/.cargo/bin

ZSH_THEME="robbyrussell"
#ZSH_THEME="amuse"
#ZSH_THEME="agnoster"

HYPHEN_INSENSITIVE="true"
export UPDATE_ZSH_DAYS=5
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
RPROMPT="[%D{%f/%m/%y}|%*]"

plugins=(git)

# bash completion compatibility
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

DEFAULT_USER=ivan

rgrep()
{
  grep "${1}" ./ -rn --color
}

irgrep()
{
  grep -i "${1}" ./ -rn --color
}

replacerecur()
{
  find ./ -type f -print0 | xargs -0 sed -i "s/${1}/${2}/g"
}

# NEEDED
alias tmux='tmux -2' #start with 256 color
alias vun='vim'
alias les='less'

# Useful aliases
alias ..='cd ..'
alias ,,='cd -'
alias smi='sudo make install && sudo to64'
alias sy='sudo yum'
alias ports='netstat -tulanp'
alias rm='rm -I --preserve-root'
alias fhere="find . -name "
alias mkdir="mkdir -pv"


alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

alias maek='make'
export SSLKEYLOGFILE=~/work/ssl/sslkeylog.log

alias sanupdate='mix deps.get && cd assets/ && yarn install && cd .. && cd app/ && yarn install && cd ..'


. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash


vimgitshow() { git show "$1" | vim - "+set filetype=${1##*.}"; }
# Git aliases
alias g='git'
alias gs='git status'
alias gcm='git checkout master'
alias gp='git pull'
alias gfa='git fetch -a'
alias exformat='git diff master --name-only | grep "ex$\|exs$" | xargs mix format'

# Elixir stuff
alias ectomigrate='mix ecto.migrate && MIX_ENV=test mix ecto.migrate'
alias im='iex --erl "-kernel shell_history enabled" -S mix'
alias imps='iex --erl "-kernel shell_history enabled" -S mix phx.server'
alias iex='iex --erl "-kernel shell_history enabled"'
alias mc='mix compile'
alias mt='mix test'
alias mta='MIX_ENV=test mix test_all'
alias mf='mix format'
alias mdg='mix deps.get'
remote_console(){
  kubectl exec -it $1 /app/bin/sanbase remote_console
}

mtc()
{
  MIX_ENV=test mix coveralls.detail --filter $1
}

alias myip='curl ipinfo.io'
alias cdsan='cd ~/work/sanbase2'
alias cddev='cd ~/work/devops'

alias did="vim +'normal Go' +'r!date' ~/did/did.txt"

# kubectl
alias kgp='kubectl get pods'
alias kgps='kubectl get pods | grep sanbase'
alias kgpi='kubectl get pods | grep influxdb'
alias klf='kubectl logs -f'
alias klft='kubectl logs -f --tail=100'
alias klp='kubectl logs -p'
klftn(){
kubectl logs -f --tail=200 $1 | sed 's/\\n/\n/g'
}
