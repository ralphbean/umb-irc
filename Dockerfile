# umb-irc
#FROM openshift/base-centos7
FROM rhscl/s2i-base-rhel7

MAINTAINER Ralph Bean <rbean@redhat.com>

ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="Platform for building umb-irc" \
      io.k8s.display-name="builder 1.0" \
      io.openshift.tags="builder,umb,irc"

RUN yum install -y epel-release && yum -y install python-pip fedmsg-irc && yum clean all -y

# Basic stuff
COPY ./* /opt/app-root/
COPY ./s2i/bin/ /usr/libexec/s2i

# Also, configs.
COPY fedmsg.d/* /etc/fedmsg.d/

RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

CMD ["usage"]
