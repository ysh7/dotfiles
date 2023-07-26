# import fzf keybinds and completions {{{
if [ "${OS}" = "Darwin" ]; then
	FZF_BASE_PATH="/usr/local/opt/fzf/shell"
else
	FZF_BASE_PATH="/usr/share/fzf"
fi

source "${FZF_BASE_PATH}/completion.zsh"
source "${FZF_BASE_PATH}/key-bindings.zsh"
# }}}


# Use fd (https://github.com/sharkdp/fd) instead of the default find
# for fzf '**' shell completions {{{
_fzf_compgen_path() {
  command fd --hidden --follow --exclude .git --exclude node_modules . "$1"
}

_fzf_compgen_dir() {
  command fd --type d --hidden --follow --exclude .git --exclude node_modules . "$1"
}

export FZF_DEFAULT_OPTS="--no-mouse --height 40% --layout=reverse --border --info=inline"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard 2>/dev/null || fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export MANPATH="/usr/local/share/fzf/man:$MANPATH"

#}}}

