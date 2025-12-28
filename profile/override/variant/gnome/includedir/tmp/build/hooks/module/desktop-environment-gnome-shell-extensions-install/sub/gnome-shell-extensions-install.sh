

sub_gnome_shell_extensions_all_install () {

	sub_gnome_shell_extensions_all_install_via_gext

	sub_gnome_shell_extensions_all_enabled_via_gext

	sub_gnome_shell_extensions_all_disabled_via_gext

}

sub_gnome_shell_extensions_all_enabled_via_gext () {

	local the_extension_list=${opt_gnome_shell_extensions_enabled}

	local the_extension_id

	for the_extension_id in ${the_extension_list}; do

		sys_gnome_shell_extensions_each_enabled_via_gext "${the_extension_id}"

	done

}


sys_gnome_shell_extensions_each_enabled_via_gext () {

	local the_extension_id="${1}"

	echo
	echo gext enable "${the_extension_id}"
	gext enable "${the_extension_id}"
	echo

}

sub_gnome_shell_extensions_all_disabled_via_gext () {

	local the_extension_list=${opt_gnome_shell_extensions_disabled}

	local the_extension_id

	for the_extension_id in ${the_extension_list}; do

		sys_gnome_shell_extensions_each_disabled_via_gext "${the_extension_id}"

	done

}

sys_gnome_shell_extensions_each_disabled_via_gext () {

	local the_extension_id="${1}"

	echo
	echo gext disable "${the_extension_id}"
	gext disable "${the_extension_id}"
	echo

}

sub_gnome_shell_extensions_all_install_via_gext () {

	#echo sub_gnome_shell_extensions_all_install_via_gext

	local the_extension_list=${opt_gnome_shell_extensions_install}

	local the_extension_id

	for the_extension_id in ${the_extension_list}; do

		sys_gnome_shell_extensions_each_install_via_gext "${the_extension_id}"

	done

}

sys_gnome_shell_extensions_each_install_via_gext () {

	local the_extension_id="${1}"

	echo
	echo gext -F install "${the_extension_id}"
	gext -F install "${the_extension_id}"
	echo


	local the_extensions_root_dir_path="${HOME}/.local/share/gnome-shell/extensions"
	local the_extension_schemas_dir_path="${the_extensions_root_dir_path}/${the_extension_id}/schemas"

	mkdir -p "${the_extension_schemas_dir_path}"

	echo
	echo glib-compile-schemas "${the_extension_schemas_dir_path}"
	glib-compile-schemas "${the_extension_schemas_dir_path}"
	echo


	#sys_gnome_shell_extensions_each_copy_to_skel_dir "${the_extension_id}"

	sys_gnome_shell_extensions_each_dconf_load_config "${the_extension_id}"

}

sys_gnome_shell_extensions_each_copy_to_skel_dir () {

	local the_extension_id="${1}"

	local src_extensions_root_dir_path="${HOME}/.local/share/gnome-shell/extensions"
	local des_extensions_root_dir_path="/etc/skel/.local/share/gnome-shell/extensions"

	local src_extension_dir_path="${src_extensions_root_dir_path}/${the_extension_id}"
	local des_extension_dir_path="${des_extensions_root_dir_path}/${the_extension_id}"

	mkdir -p "${src_extension_dir_path}"
	sudo mkdir -p "${des_extension_dir_path}"

	echo
	echo sudo cp -rfT "${src_extension_dir_path}" "${des_extension_dir_path}"
	sudo cp -rfT "${src_extension_dir_path}" "${des_extension_dir_path}"
	echo

}

sys_gnome_shell_extensions_each_dconf_load_config () {

	local the_extension_id="${1}"

	local the_config_file_path="${base_dir_path}/asset/config/${the_extension_id}/dconf-db/gnome-shell-extension-${the_extension_id}.conf"

	if ! [ -e "${the_config_file_path}" ]; then
		return
	fi

	echo
	echo 'dconf load -f / < '"${the_config_file_path}"
	dconf load -f / < "${the_config_file_path}"
	echo
}
