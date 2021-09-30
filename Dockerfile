FROM sfiligoi/osg-ce:ce-condor

ADD condor.d/11_schedd_tune.config  /etc/condor/config.d/11_schedd_tune.config 
ADD condor.d/98_security.config /etc/condor/config.d/98_security.config
ADD condor.d/90-map-namespace.conf /etc/condor/config.d/90-map-namespace.conf
