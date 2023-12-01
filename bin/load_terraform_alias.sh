#!/usr/bin/env bash

# Check to see if the alias exists
grep -q 'alias tf="terraform"' ~/.bash_profile

# $? is as special variable in bash that holds the exit status of the last line completed
if [[ $? -ne 0 ]]; then
    # If the alias doesn't exist, append it
    echo 'alias tf="terraform"' >> ~/.bash_profile
    #source ~/.bash_aliases # Refreshes session so, the alias will work
    echo "Terraform Alias added."
else
    # In form the user the terraform alias exists already.
    echo "Terraform alias, exists already."
fi
