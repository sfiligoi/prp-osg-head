OSG head node for PRP

This directory contains the files to start the HTCondor-CE on the PRP k8s cluster.

It relies on the OSG HTCondor pool being already up and running.
See pgp-osg-pool for detail.

# You will need to use the same pool_password file as the rest of the condor pool.
# Note: Do not check this file into git, as it is the base of the Condor security
cp ../../pgp-osg-pool/k8s/pool_password .

# create the k8s secrets
make

# Start the HTCondor-CE pod
# The namespace is hardcoded to osg
kubectl create -f osg-head.yaml

