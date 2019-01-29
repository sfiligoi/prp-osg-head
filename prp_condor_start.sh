#!/bin/bash
condor_configure --prefix=/var/run --type=manager,submit --central-manager=$HOSTNAME
condor_master

