#!/bin/bash

apt update
apt install -y ec2-instance-connect

base=https://raw.githubusercontent.com/iizus/setup-greengrass-installed-ec2-instance/master
scripts=(
    "set-credentials.sh"
    "set-tag.sh"
    "setup-greengrass.sh"
)

for script in "${scripts[@]}" ; do
    url=$base/$script
    curl $url | bash
done
