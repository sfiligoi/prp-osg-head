FROM centos:centos7

RUN groupadd -g 2000 condor && useradd -u 2000 -g 2000 -s /sbin/nologin condor

RUN yum -y install https://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm && \
    yum -y install epel-release \
                   yum-plugin-priorities && \
    yum -y install  \
                   osg-ca-certs \
                   cilogon-openid-ca-cert && \
    yum -y install  \
                   condor \
                   redhat-lsb-core && \
    yum -y install osg-ce-condor && \
    yum -y install supervisor


RUN yum clean all

ADD condor.d/98_security.config /etc/condor/config.d/98_security.config
ADD condor.d/99_daemons.config /etc/condor/config.d/99_daemons.config

ADD osg.d/20-condor.ini /etc/osg/config.d/20-condor.ini

ADD cron.d/fetch-crl.cron /etc/cron.d/fetch-crl.cron

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf
ADD supervisord.d/condor.conf /etc/supervisord.d/condor.conf

ADD dummy_pod_init.sh /usr/bin/pod_init.sh
ADD supervisord_startup.sh /usr/bin/supervisord_startup.sh

CMD ["/usr/bin/supervisord_startup.sh"]
