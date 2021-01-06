#!/bin/bash


#
# Make symlinks
#

# Point to the collector
# The value is porpagated in the environment by the osg_collector_prp service 
echo "CONDOR_HOST = ${OSG_COLLECTOR_PRP_SERVICE_HOST}" > /etc/condor/config.d/50_condor_host.config

# If this is the first use of the persistent disk areas, create the necessary dirs
# This dirs are normally created by the RPM in the base image

if [ -n "/mnt/ceph/condor" ]; then
  mkdir /mnt/ceph/condor && chown condor:condor /mnt/ceph/condor
fi
mv -f /var/lib/condor /var/lib/condor.org
ln -s /mnt/ceph/condor /var/lib/condor && chown -h condor:condor /var/lib/condor

if [ -n "/var/lib/condor/spool" ]; then
  mkdir /var/lib/condor/spool   && chown condor:condor /var/lib/condor/spool
  mkdir /var/lib/condor/execute && chown condor:condor /var/lib/condor/execute
fi


###

if [ -n "/mnt/ceph/condor-ce" ]; then
  mkdir /mnt/ceph/condor-ce && chown condor:condor /mnt/ceph/condor-ce
fi
mv -f /var/lib/condor-ce /var/lib/condor-ce.org
ln -s /mnt/ceph/condor-ce /var/lib/condor-ce && chown -h condor:condor /var/lib/condor-ce


if [ -n "/var/lib/condor-ce/spool" ]; then
  mkdir /var/lib/condor-ce/spool   && chown condor:condor /var/lib/condor-ce/spool
  mkdir /var/lib/condor-ce/execute && chown condor:condor /var/lib/condor-ce/execute
fi

###

if [ -n "/mnt/ceph/home" ]; then
  mkdir /mnt/ceph/home
fi
mv -f /home /home.org
ln -s /mnt/ceph/home /home


if [ -n "/home/condor" ]; then
  mkdir /home/condor && chown condor:condor /home/condor
fi

# List of all supported users
groupadd -g 3001 osg && useradd -u 3001 -g 3001 -s /bin/bash osg
groupadd -g 3002 icecube && useradd -u 3002 -g 3002 -s /bin/bash icecube
groupadd -g 3003 glow && useradd -u 3003 -g 3003 -s /bin/bash glow
groupadd -g 3004 ligo && useradd -u 3004 -g 3004 -s /bin/bash ligo
groupadd -g 3005 xenon.biggrid.nl && useradd -u 3005 -g 3005 -s /bin/bash xenon.biggrid.nl
groupadd -g 3006 fermigli && useradd -u 3006 -g 3006 -s /bin/bash fermigli

echo ${OSG_COLLECTOR_PRP_SERVICE_HOST} /etc/condor/cond
