FROM centos:7
LABEL \
    name="IRC bot for the Unified Message Bus (UMB)" \
    vendor="Factory 2.0" \
    license="GPLv2+" \
    build-date=""
RUN yum -y install epel-release && yum -y clean all
RUN yum -y install --setopt=tsflags=nodocs --enablerepo=epel-testing\
    python-twisted-words \
    fedmsg-irc \
    git \
    python-pip \
    && yum -y clean all
RUN cd /var/tmp \
    && git clone https://github.com/release-engineering/fedmsg_meta_umb \
    && cd fedmsg_meta_umb \
    && python setup.py install
ADD fedmsg.d /etc/fedmsg.d/
USER 1001
ENTRYPOINT fedmsg-irc
