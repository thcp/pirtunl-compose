FROM mongo:4.0

LABEL maintainer="Thales Pereira"

RUN \
    echo "* hard nofile 64000" >> /etc/security/limits.conf \
    && echo "* soft nofile 64000" >> /etc/security/limits.conf \
    && echo "root hard nofile 64000" >> /etc/security/limits.conf \
    && echo "root soft nofile 64000" >> /etc/security/limits.conf