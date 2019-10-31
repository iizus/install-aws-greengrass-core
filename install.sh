echo "start setup"
adduser --system ggc_user
groupadd --system ggc_group

echo "update kernel"
config_file_path=/etc/sysctl.d/00-defaults.conf
echo "fs.protected_hardlinks = 1" >> ${config_file_path}
echo "fs.protected_symlinks = 1" >> ${config_file_path}
sysctl -p

echo "update cgroups"
curl https://raw.githubusercontent.com/tianon/cgroupfs-mount/951c38ee8d802330454bdede20d85ec1c0f8d312/cgroupfs-mount | sh
# mount_file=cgroupfs-mount.sh
# script_file=https://raw.githubusercontent.com/tianon/cgroupfs-mount/951c38ee8d802330454bdede20d85ec1c0f8d312/cgroupfs-mount
# curl ${script_file} > ${mount_file}
# chmod +x ${mount_file}
# bash ./${mount_file}

echo "download check tool"
checker=greengrass-dependency-checker-GGCv1.9.x
checker_zip=${checker}.zip
wget https://github.com/aws-samples/aws-greengrass-samples/raw/master/${checker_zip}
unzip ${checker_zip}
cd ${checker}
./check_ggc_dependencies
cd ..

echo "install ggc"
version=1.9.4
GGC=greengrass-linux-x86-64-${version}.tar.gz
wget https://d1onfpft10uf5o.cloudfront.net/greengrass-core/downloads/${version}/${GGC}
tar -zxvf ${GGC} -C /

# echo "reboot"
# reboot
