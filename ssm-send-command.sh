#!/bin/bash

# Path to the script you want to execute on the EC2 instance
script_path="your_script.sh"

# Read and encode the script content
script_content=$(<$script_path)
encoded_script=$(echo "$script_content" | base64)

# Target instance ID
instance_id="i-0123456789abcdef0"

# Send the command to SSM
aws ssm send-command \
    --document-name "AWS-RunShellScript" \
    --targets "Key=instanceids,Values=$instance_id" \
    --parameters '{"commands":["echo $encoded_script | base64 --decode | bash"]}' \
    --comment "Executing a large script encoded in base64"
