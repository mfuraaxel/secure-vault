#!/usr/bin/env bash



VAULT_DIR="$HOME/secure_vault"
SECRETS="$VAULT_DIR/secrets.txt"
LOGS="$VAULT_DIR/logs.txt"


while true; do 
	echo 
	echo "===== SECURE VAULT MENU ====="
	echo "1) add secret"
       	echo "2) update secret"
	echo "3) Add log entry"
	echo "4) Access keys"
	echo "5) Exit"
	read -p "choose an option: " option 


	case "$option" in 
		1) 

			read -p "Enter a secret: " secret 
			echo "$secret" >> "$SECRETS"
			echo "secret added"
			;;


		2) 
			read -p "Enter text to replace: " old
			read -p "Enter new text: " new
			if grep -q "$old" "$SECRETS"; then
				sed -i "s/$old/$new/g" "$SECRETS"
				echo "secret updated"

			else 
				echo "no match found."

			fi
			;;

		3) 
			echo "$(date '+%Y-%m-%d %H:%M:%S') - Log entry added" >> "$LOGS"
			echo "Log entry added."
			;;

		4) 
			echo "ACCESS DENIED"

			;;

		5)
			echo "Exiting vault."
			exit 0
			;;
		*) 
			echo "Invalid option"
			;;

	esac



done 
