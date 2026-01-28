# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# User requested to ignore loading time, so we disable instant prompt to fix logo issues.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  :
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# ============ Aliases ============

# Clear screen
alias c='clear'
alias cl='clear'

# ls aliases with colors
alias ls='ls --color=auto'
alias l='ls -lh'              # List in long format
alias la='ls -lAh'            # List all files including hidden
alias ll='ls -lh'             # Long listing
alias lsa='ls -lah'           # Long listing with hidden files
alias lt='ls -lhtr'           # Sort by modification time (newest last)
alias lS='ls -lhS'            # Sort by size (largest first)
alias ld='ls -lhd */'         # List only directories

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'             # Go to previous directory

# grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Safety nets
alias cp='cp -iv'             # Interactive & verbose copy
alias mv='mv -iv'             # Interactive & verbose move
alias rm='rm -Iv'             # Interactive remove (prompt before deleting >3 files)
alias ln='ln -iv'             # Interactive & verbose link
alias mkdir='mkdir -pv'       # Create parent directories & verbose

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
alias df='df -h'              # Human-readable disk usage
alias du='du -h'              # Human-readable file sizes
alias free='free -h'          # Human-readable memory info
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e' # Search running processes

# Package management
alias syu='yay -Syu'          # Update all packages
alias install='yay -S'        # Install package
alias remove='yay -Rns'       # Remove package & dependencies
alias search='yay -Ss'        # Search for package
alias pkginfo='yay -Qi'       # Package info

# Shortcuts
alias v='nvim'
alias vim='nvim'
alias nv='nvim'
alias e='nvim'
alias lg='lazygit'
alias ld='lazydocker'
alias cat='cat -v'            # Show non-printing characters
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'  # Print PATH nicely
alias ports='netstat -tulanp' # Show active ports

# Docker shortcuts (you have docker installed)
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias drm='docker rm'
alias drmi='docker rmi'

# Quickly edit configs
alias zshrc='nvim ~/.zshrc'
alias hyprconf='nvim ~/.config/hypr/hyprland.conf'
alias kittyconf='nvim ~/.config/kitty/kitty.conf'

# Misc
alias wget='wget -c'          # Resume downloads by default
alias fastfetch='fastfetch'
alias ff='fastfetch'
alias reload='source ~/.zshrc' # Reload zsh config


# ============ Advanced Plugins Configuration ============

# fzf - Fuzzy Finder
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
fi
if [[ -f /usr/share/fzf/completion.zsh ]]; then
    source /usr/share/fzf/completion.zsh
fi
# fzf configuration
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Keybindings: Ctrl+T (files), Ctrl+R (history), Alt+C (cd)

# zoxide - Smarter cd
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    # Usage: z <directory_substring> - jumps to most frecent directory matching the pattern
    # Example: z proj -> cd ~/projects
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
    alias catp='bat --style=plain'  # Plain cat without line numbers
    export BAT_THEME="Monokai Extended"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"  # Use bat for man pages
fi

# zsh-you-should-use - Reminds you to use aliases
if [[ -f /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
    export YSU_MESSAGE_POSITION="after"
    export YSU_MODE=ALL
fi

# Qt Theming
export QT_QPA_PLATFORMTHEME=qt6ct

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

# Zsh Plugins Configuration

# 1. zsh-completions - Additional completion definitions
if [[ -d /usr/share/zsh/plugins/zsh-completions ]]; then
    fpath=(/usr/share/zsh/plugins/zsh-completions/src $fpath)
fi

# Enable completion system
autoload -Uz compinit
compinit

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 2. zsh-autosuggestions - Fish-like autosuggestions
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
fi

# 3. zsh-history-substring-search - History search with up/down arrows
if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
    # Bind keys for history substring search
    bindkey '^[[A' history-substring-search-up     # Up arrow
    bindkey '^[[B' history-substring-search-down   # Down arrow
    bindkey '^P' history-substring-search-up       # Ctrl+P
    bindkey '^N' history-substring-search-down     # Ctrl+N
fi

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

# 4. zsh-syntax-highlighting - Must be loaded last
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Powerlevel10k Theme
if [[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
elif [[ -f ~/powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fastfetch
# Fastfetch
fastfetch
