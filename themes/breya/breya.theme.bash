SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY="${bold_red}"
SCM_THEME_PROMPT_CLEAN="${bold_green}"

case $TERM in
	xterm*)
	TITLEBAR="\[\033]0;\w\007\]"
	;;
	*)
	TITLEBAR=""
	;;
esac

PS3=">> "

is_vim_shell() {
	if [ ! -z "$VIMRUNTIME" ]
	then
		echo "[${cyan}vim shell${normal}]"
	fi
}

breya_scm_prompt() {
	CHAR=$(scm_char)
	scm_prompt_vars
	if [ $CHAR = $SCM_NONE_CHAR ]
	then
		return
	else
		echo "$SCM_STATE$SCM_BRANCH${normal}"
	fi
}

breya_prompt() {
	PS1="${bold_purple}\h${normal}:${bold_green}\w${normal} $(breya_scm_prompt) $(battery_charge)$(is_vim_shell)
$ "
}

PROMPT_COMMAND=breya_prompt
