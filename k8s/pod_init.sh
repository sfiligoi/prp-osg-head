#!/bin/bash

groupadd -g 3001 osg && useradd -u 3001 -g 3001 -s /bin/bash osg
groupadd -g 3002 icecube && useradd -u 3002 -g 3002 -s /bin/bash icecube


