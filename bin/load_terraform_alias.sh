#!/usr/bin/env bash

# Check to see if the alias exists
grep -q 'alias tf="terraform"' ~/.bash_profile

# $? is as special variable in bash that holds the exit status of the last line completed
if [[ $? -ne 0 ]]; then
    # If the alias doesn't exist, append it
    echo -e '\nalias tf="terraform"' >> ~/.bash_profile
    echo "Terraform Alias added."
else
    # In form the user the terraform alias exists already.
    echo "Terraform alias, exists already."
fi

# Check if the "tf" alias works
if tf; then
    echo "Terraform shortcut is ready to use."
else
    echo "Terraform shortcut is exists, but not ready. Refreshing the session." 
    source ~/.bash_profile # Refreshes session so, the alias will work    
    echo "Refresh complete."
fi
    
