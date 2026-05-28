#!/usr/bin/env bash 



VAULT_DIR="$HOME/secure_vault"


mkdir -p "$VAULT_DIR"


echo "Welcome to  the keys vault" > "$VAULT_DIR/keys.txt"
echo "Welcome to the secrets vault" > "$VAULT_DIR/secrets.txt"
echo "Welcome to the logs vault" > "$VAULT_DIR/logs.txt"

echo "Secure valut setup completed" 

ls -l "$VAULT_DIR"
