# ============ Bash Configuration ============

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ============ Aliases ============

# Clear screen
alias c='clear'
alias cl='clear'

# ls aliases with colors
alias ls='ls --color=auto'
alias l='ls -lh'
alias la='ls -lAh'
alias ll='ls -lh'
alias lsa='ls -lah'
alias lt='ls -lhtr'
alias lS='ls -lhS'
alias ld='ls -lhd */'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Safety nets
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias ln='ln -iv'
alias mkdir='mkdir -pv'

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'
alias gb='git branch'

# System info
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

# Package management
alias syu='yay -Syu'
alias install='yay -S'
alias remove='yay -Rns'
alias search='yay -Ss'
alias pkginfo='yay -Qi'

# Shortcuts
alias v='nvim'
alias vim='nvim'
alias nv='nvim'
alias e='nvim'
alias lg='lazygit'
alias ld='lazydocker'
alias cat='cat -v'
alias h='history'
alias j='jobs -l'
alias path='echo "$PATH" | tr ":" "\n"'
alias ports='netstat -tulanp'

# Docker shortcuts
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias drm='docker rm'
alias drmi='docker rmi'

# Quickly edit configs
alias bashrc='nvim ~/.bashrc'
alias hyprconf='nvim ~/.config/hypr/hyprland.conf'
alias alacrittyconf='nvim ~/.config/alacritty/alacritty.toml'

# Misc
alias wget='wget -c'
alias fastfetch='fastfetch'
alias ff='fastfetch'
alias reload='source ~/.bashrc'

# ============ Advanced Tools Configuration ============

# fzf - Fuzzy Finder
if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
    source /usr/share/fzf/key-bindings.bash
fi
if [[ -f /usr/share/fzf/completion.bash ]]; then
    source /usr/share/fzf/completion.bash
fi
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zoxide - Smarter cd
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

# eza - Modern ls replacement
if command -v eza &> /dev/null; then
    alias ls='eza --color=auto --icons'
    alias l='eza -lh --icons'
    alias la='eza -lah --icons'
    alias ll='eza -lh --icons'
    alias lsa='eza -lah --icons'
    alias lt='eza -lh --icons --sort=modified'
    alias lS='eza -lh --icons --sort=size'
    alias tree='eza --tree --icons'
fi

# bat - Better cat
if command -v bat &> /dev/null; then
    alias cat='bat --style=auto'
    alias catp='bat --style=plain'
    export BAT_THEME="Monokai Extended"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Qt Theming
export QT_QPA_PLATFORMTHEME=qt6ct

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Bash completion
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

# History configuration
HISTFILE=~/.bash_history
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# ASCII Art Greeting
cat << 'EOF'
        _..._
      .'     '.      _
     /    .-""-\   _/ \
   .-|   /:.   |  |   |
   |  \  |:.   /.-'-./
   | .-'-;:__.'    =/
   .'=  *=|Dj   _.='
  /   _.  |    ;
 ;-.-'|    \   |
/   | \    _\  _\
\__/'._;.  ==' ==\
         \    \   |
         /    /   /
         /-._/-._/
         \   `\  \
          `-._/._/
EOF

# Fastfetch
fastfetch
