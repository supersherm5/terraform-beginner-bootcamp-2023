#!/usr/bin/env bash

AWS_FOLDER='/workspace/aws/'
AWS_ZIP='/workspace/awscliv2.zip'

cd /workspace

# Remove the folder containing aws cli (-d is for directory)
if [[ -d $AWS_FOLDER ]]; then
    echo 'Removing the aws folder'
    rm -rf $AWS_FOLDER
    echo 'AWS Folder removed.'
fi

# Remove the AWS CLI zip file (-f is for file)
if [[ -f $AWS_ZIP ]]; then
    echo 'Removing the aws zip file.'
    rm -f $AWS_ZIP
    echo 'AWS zip file removed.'
fi


# Downloading the latest aws cli zip into a zip file named awscliv2.zip"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Verication step
aws sts get-caller-identity

cd $PROJECT_ROOT