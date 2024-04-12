#!/bin/bash

# The path to the local public SSH key
public_key_path="$HOME/.ssh/id_rsa.pub"

# Ensure the public key file exists
if [ ! -f "$public_key_path" ]; then
    echo "Public key not found at $public_key_path"
    exit 1
fi

# Read the local public SSH key
public_key=$(<$public_key_path)

# Append the public SSH key to the root's authorized_keys
echo "$public_key" >> /root/.ssh/authorized_keys
