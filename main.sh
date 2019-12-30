#!/bin/bash

apt update
apt install -y ec2-instance-connect

base=https://raw.githubusercontent.com/iizus/setup-greengrass-installed-ec2-instance/master
# scripts=(
#     "set-credentials"
#     "setup-greengrass"
#     "set-tag"
# )

# for script in "${scripts[@]}" ; do
#     url=$base/$script.sh
#     curl -s $url | bash
# done

url=$base/set-credentials.sh
curl -s $url | bash

url=$base/setup-greengrass.sh
curl -s $url | bash

url=$base/set-tag.sh
curl -s $url | bash
