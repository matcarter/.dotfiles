eval $(ssh-agent)

# Aliases
alias zshconfig="vim ~/.zshrc"
alias tmuxconfig="vim ~/.tmux.conf"
alias vimconfig="vim ~/.vimrc"
alias sshconfig="vim ~/.ssh/config"
alias fzfconfig="vim ~/.fzf.zsh"
alias ls="ls -G"
alias la="ls -la"
alias ll="ls -l"

# Fuzzy finder function FFF
function fim {
    vim $(fzf)
}

# Install vim-plug
function pluginstall {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# Source research virtualenv
function pyenv {
    source /research/hutchinson/workspace/dawc/venv/bin/activate
}

# Set up the prompt
autoload -Uz promptinit
promptinit
#prompt adam1

# Ensure history of commands is clean
setopt histignorealldups noincappendhistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2

if whence dircolors >/dev/null; then
  eval "$(dircolors -b)"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  alias ls='ls --color'
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi

zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

cd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User defined variables
PATH=$PATH:$HOME/bin
