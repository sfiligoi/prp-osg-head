#!/bin/bash

# Give the chance to the pod to initialize users etc.
/usr/bin/pod_init.sh

# Now we can actually start the supervisor
exec /usr/bin/supervisord -c /etc/supervisord.conf

