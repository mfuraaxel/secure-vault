#!/usr/bin/env bash

VAULT_DIR="$HOME/secure_vault"

if [[ ! -d "$VAULT_DIR" ]]; then 
	echo "ERROR: secure_vault does not exist"
	exit 1


fi


update_permission() {
	local file="$1"
	local default_perm="$2"


	echo 
	ls -l "$file"
	read -p "update permission for $(basename "$file")? (y/n): " choice 


	if [[ "$choice" == "y" ]]; then
		read -p "Enter new permission (e.g 600): " perm
		chmod "$perm" "$file"

	elif [[ -z "$choice" ]]; then
		chmod "$default_perm" "$file"

	fi

}

update_permission "$VAULT_DIR/keys.txt" 600
update_permission "$VAULT_DIR/secrets.txt" 640
update_permission "$VAULT_DIR/logs.txt" 644


echo 
echo "final permissions of files:"
ls -l "$VAULT_DIR"
