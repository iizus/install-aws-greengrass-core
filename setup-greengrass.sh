#!/bin/bash

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
