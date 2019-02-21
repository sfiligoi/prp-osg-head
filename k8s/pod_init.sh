#!/bin/bash

# Point to the collector
# The value is porpagated in the environment by the osg_collector_prp service 
echo "CONDOR_HOST = ${OSG_COLLECTOR_PRP_SERVICE_HOST}" > /etc/condor/config.d/50_condor_host.config

# List of all supported users
groupadd -g 3001 osg && useradd -u 3001 -g 3001 -s /bin/bash osg
groupadd -g 3002 icecube && useradd -u 3002 -g 3002 -s /bin/bash icecube
groupadd -g 3003 glow && useradd -u 3003 -g 3003 -s /bin/bash glow

echo ${OSG_COLLECTOR_PRP_SERVICE_HOST} /etc/condor/cond
