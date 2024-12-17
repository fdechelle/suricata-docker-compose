FROM ubuntu:noble

# suricata install and configure
RUN apt-get update -qq; apt-get install -y software-properties-common ; apt-get clean
RUN add-apt-repository ppa:oisf/suricata-stable
RUN apt-get update -qq ; apt-get install -y suricata ; apt-get clean
COPY --chown=suricata:suricata ./files/suricata.yaml /etc/suricata

COPY --chmod=0755 ./files/docker-entrypoint.sh /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
