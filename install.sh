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



script=gg-device-setup-latest.sh
url=https://d1onfpft10uf5o.cloudfront.net/greengrass-device-setup/downloads/$script
option=bootstrap-greengrass
region=us-east-1
new=new-$script
output=output.txt
dir=/tmp

cd $dir
wget -q -O ./$script $url
sed -e s/us-west-2/$region/g $script > $new
chmod +x ./$new
./$new $option > $output





repo=setup-greengrass-installed-ec2-instance
git clone https://github.com/iizus/$repo.git

cd $repo
chmod +x *

./setup-greengrass.sh bash set-credentials.sh
./set-tag.sh bash set-credentials.sh
