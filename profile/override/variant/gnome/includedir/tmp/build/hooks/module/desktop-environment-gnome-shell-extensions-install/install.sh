#/usr/bin/env bash


## path
base_dir_path="$(dirname "$(realpath "${0}")")"
plan_dir_path="$(realpath "${base_dir_path}/../..")"


## init
. "${plan_dir_path}/lib/init.sh"


## args
. "${plan_dir_path}/lib/args.sh"


## check for root permissions.
#check_root_user_required


## sub
. "${base_dir_path}/sub/init.sh"


## info
echo "run: ${0}"


## mod
mod_gnome_shell_extensions_all_install () {

	echo
	echo "##"
	echo "## ## 'gnome-extensions' Installing ..."
	echo "##"
	echo

	sub_gnome_shell_extensions_all_install

}



## main
__main__ () {

	mod_gnome_shell_extensions_all_install

}

__main__
