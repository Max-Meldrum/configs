export ZSH="/home/meldrum/.oh-my-zsh" 
ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias cat="bat"
alias ls="exa"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT='%{$fg_bold[green]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='$(git_prompt_status)%{$reset_color%}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Qt
export PATH="$HOME/Qt5.11.3/5.11.3/:${PATH}"

# Android
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/home/meldrum/android-ndk-r16b
export ANDROID_NDK_ROOT=$HOME/android-ndk-r16b


export PROMPT_COMMAND="pwd > /tmp/whereami"
precmd() { eval "$PROMPT_COMMAND" }
