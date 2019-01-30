FROM centos:centos7

RUN yum -y install https://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm && \
    yum -y install epel-release \
                   yum-plugin-priorities && \
    yum -y install  \
                   condor \
                   redhat-lsb-core && \
    yum -y install supervisor


RUN yum clean all

ADD 98_security.config /etc/condor/config.d/98_security.config
ADD 99_daemons.config /etc/condor/config.d/99_daemons.config

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
