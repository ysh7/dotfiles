# vim:foldlevel=0
# vim:foldmethod=marker

export OS="$(uname -s)"

# editors / browser {{{
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export BROWSER="firefox"
# }}}
 
# xdg {{{
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# }}}

# zsh {{{
export ZDOTDIR="$HOME/.config/zsh"
export KEYTIMEOUT=1
# }}}

# x {{{
if [ "$OS" = "Linux" ]; then
	export XAUTHORITY="$XDG_RUNTIME_DIR/.Xauthority"
	export XINITRC="$XDG_CONFIG_HOME/xorg/.xinitrc"
	export XSERVERRC="$XDG_CONFIG_HOME/xorg/.xserverrc"
	export XRESOURCES="$XDG_CONFIG_HOME/xorg/.Xresources"
fi
# }}}

# path {{{
export PATH="$PATH:$HOME/.local/bin"

# deduplicate entries in PATH
typeset -U PATH
export PATH
# }}}

# ~ cleanup {{{
export LESSHISTFILE="$XDG_CACHE_HOME"/lesshst
# }}}

# misc {{{
if [ "$OS" = "Darwin" ]; then
	export HOMEBREW_NO_ANALYTICS=1
fi
# }}}
