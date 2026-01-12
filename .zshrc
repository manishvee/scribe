# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --------------------------------------------------

# OH-MY-ZSH CONFIGURATIONS
# ------------------------
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set oh-my-zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"


# Set oh-my-zsh plugins
# Standard plugins can be found in $ZSH/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# --------------------------------------------------

# PERSONAL CONFIGURATIONS
# -----------------------


# --------------------------------------------------
# POWERLEVEL10K CONFIG
# --------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

scribe() {
  local mount_dir

  if [[ -n "$1" ]]; then
    if [[ -d "$1" ]]; then
      mount_dir="$(cd "$1" && pwd)"
    elif [[ -f "$1" ]]; then
      mount_dir="$(cd "$(dirname "$1")" && pwd)"
    fi
    shift
  else
    mount_dir="$PWD"
  fi

  docker run --rm -it \
    -v "${mount_dir}:/workspace" \
    nvim "$@"
}
