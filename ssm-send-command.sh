#!/usr/bin/env sh

# Check for the required arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <instance_id> <script_path>"
    exit 1
fi

# Assign the arguments to variables
instance_id=$1
script_path=$2

# Read and encode the script content
if [ ! -f "$script_path" ]; then
    echo "Error: Script file does not exist at path '$script_path'"
    exit 2
fi
script_content=$(<$script_path)
encoded_script=$(echo "$script_content" | base64 -w 0)

# Send the command to SSM
aws ssm send-command \
    --document-name "AWS-RunShellScript" \
    --targets "Key=instanceids,Values=$instance_id" \
    --parameters '{"commands":["echo '"'"$encoded_script"'"' | base64 --decode | bash"]}' \
    --comment "Executing a large script encoded in base64"
