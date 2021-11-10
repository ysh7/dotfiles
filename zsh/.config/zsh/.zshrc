# vim:foldlevel=0
# vim:foldmethod=marker

# Zinit {{{

if [[ ! -d ~/.config/zsh/.zinit ]]; then
  mkdir -p ~/.config/zsh/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.config/zsh/.zinit/bin
fi

source ~/.config/zsh/.zinit/bin/zinit.zsh
# }}}

# Prezto {{{
# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

zinit snippet PZTM::environment
zinit snippet PZTM::gnu-utility
zinit snippet PZTM::utility
zinit ice wait'1' lucid; zinit snippet PZTM::directory
zinit snippet PZTM::history
zinit ice wait'1' lucid; zinit snippet PZTM::completion

zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:editor' key-bindings 'emacs'
zstyle ':prezto:module:editor' ps-context 'yes'
zinit snippet PZTM::editor

zstyle ':prezto:module:terminal' auto-title 'yes'
zinit snippet PZTM::terminal

#zstyle ':prezto:module:prompt' theme 'spaceship'
zstyle ':prezto:module:prompt' managed 'yes'
#zinit snippet PZTM::prompt
# }}}

# Vi-Mode (Disabled because it slowed down shell) {{{
#zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
# }}}

# Misc {{{
# Make ctrl+w work as it were in bash, should be loaded before syntax-highlighting
#autoload -U select-word-style
#select-word-style bash
# }}}

# autosuggestions / syntax-highlighting {{{
zinit ice lucid wait"1" lucid atload"!_zsh_autosuggest_start"
zinit load "zsh-users/zsh-autosuggestions"
zinit ice wait"1" atinit"zpcompinit; zpcdreplay" lucid
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zmodload zsh/terminfo
[ -n "${terminfo[kcuu1]}" ] && bindkey "${terminfo[kcuu1]}" history-substring-search-up
[ -n "${terminfo[kcud1]}" ] && bindkey "${terminfo[kcud1]}" history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}}

# Spaceship prompt {{{
zinit light spaceship-prompt/spaceship-prompt
SPACESHIP_PROMPT_ORDER=(
  dir
  host
  jobs
  line_sep
  char
)
#SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_RPROMPT_ORDER=(
  venv
  git
  exit_code
)
SPACESHIP_CHAR_SYMBOL='❯'
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL='✘ '
SPACESHIP_GIT_STATUS_PREFIX=' '
SPACESHIP_GIT_STATUS_SUFFIX=''
SPACESHIP_GIT_STATUS_COLOR='magenta'
 # }}}

# Import Aliases/Functions {{{
for file in ${HOME}/.config/zsh/scripts/*.zsh; do
  source $file
done
#}}}
