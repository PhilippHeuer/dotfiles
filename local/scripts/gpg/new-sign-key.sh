#!/usr/bin/env bash

# arguments
read -p "Enter your name (e.g., Max Mustermann): " NAME
read -p "Enter your email (e.g., max.mustermann@example.com): " EMAIL
read -p "Enter a comment (e.g., key-comment): " COMMENT
read -p "Enter expiration (e.g., 1y, 2y, 0 for no expiration): " EXPIRATION

# key configuration
cat > /tmp/gpg-batch <<EOF
%echo Generating new GPG key
Key-Type: eddsa
Key-Curve: ed25519
Name-Real: $NAME
Name-Comment: $COMMENT
Name-Email: $EMAIL
Expire-Date: $EXPIRATION
Key-Usage: sign
%no-protection
%commit
%echo GPG key generation completed
EOF

# generate key
gpg --batch --generate-key /tmp/gpg-batch

# remove batch file
rm /tmp/gpg-batch

# print key
echo "Your public key:"
gpg --list-keys "$EMAIL"
gpg --armor --export "$EMAIL"

# help
echo "Add a password to your key with 'gpg --edit-key $EMAIL' and 'passwd'"
