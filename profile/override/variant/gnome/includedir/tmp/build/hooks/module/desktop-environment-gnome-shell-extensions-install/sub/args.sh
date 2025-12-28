

## args

if [ "${IS_DEBUG}" = "true" ]; then
	echo
	echo "##"
	echo "## ## Load Args"
	echo "##"
	echo
fi


opt_gnome_shell_extensions_install=$(core_args_load "${base_dir_path}/args/gnome_shell_extensions_install.txt")
opt_gnome_shell_extensions_enabled=$(core_args_load "${base_dir_path}/args/gnome_shell_extensions_enabled.txt")
opt_gnome_shell_extensions_disabled=$(core_args_load "${base_dir_path}/args/gnome_shell_extensions_disabled.txt")



if [ "${IS_DEBUG}" = "true" ]; then

	echo
	echo "##"
	echo "## ## Option"
	echo "##"
	echo
	echo


	echo "opt_gnome_shell_extensions_install=${opt_gnome_shell_extensions_install}"
	echo "opt_gnome_shell_extensions_enabled=${opt_gnome_shell_extensions_enabled}"
	echo "opt_gnome_shell_extensions_disabled=${opt_gnome_shell_extensions_disabled}"


	echo
	echo

fi
