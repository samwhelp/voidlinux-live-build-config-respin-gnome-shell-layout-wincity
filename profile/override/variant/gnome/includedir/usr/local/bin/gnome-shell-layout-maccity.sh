#!/usr/bin/env bash




#echo "run: ${0}"


##
## ## Link
##
## * https://github.com/samwhelp/gnome-shell-enhance/blob/main/prototype/gnome-shell-layout-switcher/switcher/gnome-shell-layout-maccity.sh
##




REF_GNOME_SHELL_EXTENSIONS_ENABLE=(
	"blur-my-shell@aunetx"
	"arcmenu@arcmenu.com"
	"dash-to-dock@micxgx.gmail.com"
)



REF_GNOME_SHELL_EXTENSIONS_DISABLE=(
	"apps-menu@gnome-shell-extensions.gcampax.github.com"
	"places-menu@gnome-shell-extensions.gcampax.github.com"
	"window-list@gnome-shell-extensions.gcampax.github.com"
	"dash-to-panel@jderose9.github.com"
)



##
## ## Model
##

sys_gnome_shell_extensions_enable () {

	local the_extension_list=${REF_GNOME_SHELL_EXTENSIONS_ENABLE[@]}

	local the_extension_id

	for the_extension_id in ${the_extension_list[@]}; do
		echo
		echo gext enable "${the_extension_id}"
		gext enable "${the_extension_id}"
		echo
	done

}

sys_gnome_shell_extensions_disable () {

	local the_extension_list=${REF_GNOME_SHELL_EXTENSIONS_DISABLE[@]}

	local the_extension_id

	for the_extension_id in ${the_extension_list[@]}; do
		echo
		echo gext enable "${the_extension_id}"
		gext disable "${the_extension_id}"
		echo
	done

}




##
## ## Portal
##

mod_gnome_shell_layout_switch () {

	sys_gnome_shell_extensions_enable

	sys_gnome_shell_extensions_disable

}


##
## ## Main
##

__main__ () {

	mod_gnome_shell_layout_switch

}

__main__
