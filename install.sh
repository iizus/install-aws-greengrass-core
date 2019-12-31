#!/bin/bash

apt update
apt install -y ec2-instance-connect

apt install -y jq

metadata=http://169.254.169.254/latest/meta-data
role="curl -s $metadata/iam/security-credentials"
cred=$(echo $role/$($role))

export AWS_ACCESS_KEY_ID=$($cred | jq -r .AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$($cred | jq -r .SecretAccessKey)
export AWS_SESSION_TOKEN=$($cred | jq -r .Token)




repo=setup-greengrass-installed-ec2-instance
git clone https://github.com/iizus/$repo.git

cd $repo
chmod +x *

./setup-greengrass.sh bash set-credentials.sh
./set-tag.sh bash set-credentials.sh
