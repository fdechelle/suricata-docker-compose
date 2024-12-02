ARG BASE_IMAGE=jasonish/suricata:latest

FROM ${BASE_IMAGE}

RUN yum --assumeyes install syslog-ng

COPY --chmod=0755 ./files/docker-entrypoint.sh /

COPY --chown=suricata:suricata ./files/suricata.yaml /etc/suricata

COPY ./files/syslog-ng-opts /etc/sysconfig/syslog-ng

COPY ./files/syslog-ng-suricata.conf /etc/syslog-ng/conf.d/
