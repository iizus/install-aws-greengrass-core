#!/bin/bash

apt update
apt install -y ec2-instance-connect

base=https://raw.githubusercontent.com/iizus/setup-greengrass-installed-ec2-instance/master
scripts=(
    "set-credentials"
    "setup-greengrass"
    "set-tag"
)
concat=install.sh

for script in "${scripts[@]}" ; do
    url=$base/$script.sh
    curl -s $url >> $concat
done

bash $concat
