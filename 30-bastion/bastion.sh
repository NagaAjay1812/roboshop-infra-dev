#!/bin/bash

# Extend the disk partition (partition 4 on /dev/nvme0n1) to use the newly added disk space.
# growpart resizes the partition so the OS can see the additional capacity.
growpart /dev/nvme0n1 4

# Increase the Logical Volume (homeVol) inside the RootVG volume group by 30GB.
# -L+30G means "add 30GB more to the current logical volume size".
# -r automatically resizes the filesystem after extending the logical volume.
lvextend -r -L+30G /dev/mapper/RootVG-homeVol

# Grow the XFS filesystem on /home so it can use the newly allocated space.
# This makes the extra 30GB available inside the /home directory.
xfs_growfs /home

#Install terffaorm
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

