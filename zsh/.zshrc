# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# poetry
export PATH="$HOME/.poetry/bin:$PATH"
# rust
 export PATH="$HOME/.cargo/bin:$PATH"
# clangd path
export PATH="$HOME/.config/coc/extensions/coc-clangd-data/install/12.0.0/clangd_12.0.0/bin:$PATH"
# go
export PATH="$GOPATH/bin:$PATH"
# pip install path
export PATH="$HOME/.local/bin:$PATH"
# risc-v toolchain
export PATH="/opt/riscv/bin:$PATH"
# ghcup
#[ -f "/home/toson/.ghcup/env"] && source "/home/toson/.ghcup/env"
# xserver
 export DISPLAY=:0.0
# ghidra
 export GHIDRA_INSTALL_DIR="$HOME/Desktop/ghidra_10.0.1_PUBLIC"
# no beep
 setopt no_beep
# alius
alias sao='nvim $(fzf)'
alias ide="~/dotfiles/scripts/ide.sh"
alias upcd='(){source ~/dotfiles/scripts/upcd.sh $1}'
source ~/enhancd/init.sh
export ENHANCD_FILTER="fzf --height 40%:fzy:$ENHANCD_FILTER"
#alias zd='(){source ~/dotfiles/scripts/extra.sh $1}'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# DON'T WRITE BELOW
