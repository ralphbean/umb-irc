# We are basing our builder image on openshift base-centos7 image
FROM openshift/base-centos7

# Inform users who's the maintainer of this builder image
MAINTAINER Ralph Bean <rbean@redhat.com>

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Unified Message Bus IRC Bot, #umb-firehose" \
      io.k8s.display-name="umb-irc" \
      io.openshift.tags="builder,irc,umb"
      #io.openshift.expose-services="8080:http" \

# Stuff needed for the assemble step
RUN yum install -y epel-release git python-pip && yum -y install fedmsg-irc

# Copy the S2I scripts when making the builder image.
COPY ./assemble /usr/local/s2i/assemble
COPY ./run /usr/local/s2i/run

# Also, configuration
COPY fedmsg.d/* /etc/fedmsg.d/.

# Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:1001 /opt/app-root

# Set the default user for the image, the user itself was created in the base image
USER 1001

# Set the default CMD to print the usage of the image, if somebody does docker run
CMD ["usage"]
