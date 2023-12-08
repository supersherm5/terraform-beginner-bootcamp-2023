#!/usr/bin/env bash 
TF_CREDS_FILE="/home/gitpod/.terraform.d/credentials.tfrc.json"

# Check if terraform_cloud_token is set (-z means non-defined or empty)
if [ -z "$TERRAFORM_CLOUD_TOKEN" ]; then
    echo "Error: TERRAFORM_CLOUD_TOKEN enviornment varible is not set."
fi

# Check if the credetials.trfc.json file exist
if [[ -f "$TF_CREDS_FILE" ]]; then
    echo "Terrorform Credentials file exists."   
else
    echo "Terraform credentials file doesn't exist, so I'll create it."
    # Create the credentials.tfrc.json file
    touch $TF_CREDS_FILE
    echo "Terraform credentials file created."
fi

# Check if the TF_CREDS_FILE is empty
if [ -z $(cat $TF_CREDS_FILE) ]; then
cat > $TF_CREDS_FILE << EOF
{
	"credentials": { 
		"app.terraform.io": {
			"token": "$TERRAFORM_CLOUD_TOKEN"
		}
	}
}
EOF

echo "$TF_CREDS_FILE has been generated."
fi
