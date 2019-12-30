#!/bin/bash

base=https://raw.githubusercontent.com/iizus/setup-greengrass-installed-ec2-instance/master
scripts=(
    "set-credentials.sh"
    "set-tag.sh"
    "setup-greengrass.sh"
)

for script in "${scripts[@]}" ; do
    url=$base/$script
    curl -s $url | bash
done
