FROM openshift/base-centos7

MAINTAINER Ralph Bean <rbean@redhat.com>

ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="Platform for building umb fedmsg apps" \
      io.k8s.display-name="umb fedmsg builder 1.0" \
      io.openshift.tags="builder,umb,fedmsg"

RUN yum install -y epel-release && yum -y install python-pip python-virtualenv fedmsg-hub fedmsg-irc && yum clean all -y

RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

# Also, configs.
COPY fedmsg.d/* /etc/fedmsg.d/

# Basic stuff
COPY ./s2i/bin/ /usr/libexec/s2i

CMD ["usage"]
