#!/bin/bash

metadata=http://169.254.169.254/latest/meta-data
id=$(curl -s $metadata/instance-id)
group=$(grep "Greengrass group name" $output)
name=$(echo $group | cut -c 33-)

apt update
apt install -y awscli
aws ec2 create-tags --resources $id --tags Key=Name,Value=$name --region $region
