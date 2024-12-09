


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]

# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=/Library/Frameworks/Python.framework/Versions/3.11/lib/python3.11/site-packages:$HOME/bin:/usr/local/bin:$HOME/.jenv/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
export GOOGLE_APPLICATION_CREDENTIALS=/Users/isaacparsons/.config/gcloud/application_default_credentials.json
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



if [ -f '/Users/isaacparsons/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/isaacparsons/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/isaacparsons/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/isaacparsons/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(jenv init -)"

unsetopt inc_append_history
unsetopt share_history

autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# paths
REPO_DIR="/Users/isaacparsons/Documents"
SCRIPTS_DIR="/Users/isaacparsons/Desktop/scripts"

# aliases
alias zshrc="vim ~/.zshrc"


# aliases for TOKU things
alias npm-auth="npx --registry https://registry.npmjs.org google-artifactregistry-auth"
alias ni="npm-auth && npm install"
alias build-docs="cd ${REPO_DIR}/new-mareland-docs && docker run -d --rm -it -p 8000:8000 -v ".:/docs" squidfunk/mkdocs-material"

alias rumble="cd ${REPO_DIR}/rumble"

alias applejack="cd ${REPO_DIR}/applejack"
alias applejack-reset="${SCRIPTS_DIR}/applejack/resetDbV2.sh -d ~/Desktop/db_stuff/db_dumps -c e2e-kit-sqldb-1"
alias applejack-init="applejack && scripts/up.sh && scripts/server-local-init-db.sh"

alias gilda="cd ${REPO_DIR}/gilda"
alias meadowbrook="cd ${REPO_DIR}/meadowbrook"
alias microservices="cd ${REPO_DIR}/microservices"
alias spike="cd ${REPO_DIR}/spike"
alias rumble-common-objects="cd ${REPO_DIR}/rumble-common-objects"
alias new-mareland-docs="cd ${REPO_DIR}/new-mareland-docs"
alias e2e-kit="cd ${REPO_DIR}/e2e-kit"
alias mistmane="cd ${REPO_DIR}/mistmane"
alias fluttershy="cd ${REPO_DIR}/fluttershy"
alias grpc-node="cd ${REPO_DIR}/grpc-node"
alias trixie="cd ${REPO_DIR}/trixie"

alias sunspot="cd ${REPO_DIR}/sunspot"
alias sunspot-local-rivet="${SCRIPTS_DIR}/sunspot/use-local-rivet.sh"
alias sunspot-scripts="code ${SCRIPTS_DIR}/sunspot"

alias crystal-mirror="cd ~/documents/crystal-mirror"
alias braeburn="cd ~/documents/braeburn"
alias da-brinci="cd ~/documents/da-brinci"
alias rivet="cd ~/documents/rivet"
alias celestia="cd ~/documents/celestia"


alias config="~/Desktop/config"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
