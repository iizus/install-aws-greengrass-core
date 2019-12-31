#!/bin/bash

apt update
apt install -y ec2-instance-connect

repo=setup-greengrass-installed-ec2-instance
git clone https://github.com/iizus/$repo.git

cd $repo
chmod +x *

./setup-greengrass.sh bash set-credentials.sh
./set-tag.sh bash set-credentials.sh
