FROM centos:centos7

RUN yum -y install https://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm && \
    yum -y install epel-release \
                   yum-plugin-priorities && \
    yum -y install  \
                   condor \
                   redhat-lsb-core

RUN yum clean all

ADD prp_condor_start.sh /usr/sbin/prp_condor_start.sh

CMD ["/usr/sbin/prp_condor_start.sh"]
