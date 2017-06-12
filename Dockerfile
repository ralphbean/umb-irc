FROM centos:7
LABEL \
    name="WaiverDB application" \
    vendor="WaiverDB developers" \
    license="GPLv2+" \
    build-date=""
RUN yum -y install epel-release && yum -y clean all
RUN yum -y install --setopt=tsflags=nodocs \
    fedmsg-irc \
    git \
    python-pip \
    && yum -y clean all
RUN cd /var/tmp \
    && git clone https://github.com/release-engineering/fedmsg_meta_umb \
    && cd fedmsg_meta_umb
RUN cd /var/tmp/fedmsg_meta_umb \
    && git fetch \
    && git checkout 61f7815 \
    && python setup.py install
ADD fedmsg.d /etc/fedmsg.d/
USER 1001
ENTRYPOINT fedmsg-irc
