#!/bin/bash

apt update
apt install -y jq

metadata=http://169.254.169.254/latest/meta-data
role="curl $metadata/iam/security-credentials"
cred=$(echo $role/$($role))

export AWS_ACCESS_KEY_ID=$($cred | jq -r .AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$($cred | jq -r .SecretAccessKey)
export AWS_SESSION_TOKEN=$($cred | jq -r .Token)
