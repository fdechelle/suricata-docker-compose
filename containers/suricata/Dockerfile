ARG BASE_IMAGE

FROM ${BASE_IMAGE}

RUN yum --assumeyes install syslog-ng

COPY --chown=suricata:suricata ./files/suricata.yaml /etc/suricata

COPY ./files/syslog-ng-opts /etc/sysconfig/syslog-ng
