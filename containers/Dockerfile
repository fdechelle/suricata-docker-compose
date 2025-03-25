FROM ubuntu:noble AS base

# install git and python
RUN apt-get update -qq; apt-get install -y git python3 python3-pip ; apt-get clean

# install IDMEFv2 python library
RUN pip install --break-system-packages --extra-index-url https://test.pypi.org/simple/ idmefv2

# install IDMEFv2 connectors
WORKDIR /
ARG IDMEFV2_CONNECTORS_GIT=./files/base/idmefv2-connectors
COPY ${IDMEFV2_CONNECTORS_GIT} /idmefv2-connectors/
WORKDIR /idmefv2-connectors
RUN pip install --break-system-packages .

FROM base AS suricata

# suricata install and configure
RUN apt-get update -qq; apt-get install -y software-properties-common ; apt-get clean
RUN add-apt-repository ppa:oisf/suricata-stable
RUN apt-get update -qq ; apt-get install -y suricata ; apt-get clean
RUN suricata-update

# extra utils
RUN apt-get update -qq; apt-get install -y curl ; apt-get clean

COPY --chown=suricata:suricata ./files/suricata/suricata.yaml /etc/suricata

ARG CONNECTOR_CONFIG_FILE=./files/suricata/suricata-idmefv2.conf
COPY ${CONNECTOR_CONFIG_FILE} /etc/suricata-idmefv2.conf

COPY --chmod=0755 ./files/suricata/docker-entrypoint.sh /
CMD [ "/docker-entrypoint.sh" ]

FROM base AS testserver

CMD [ "python3", "-m", "idmefv2.connectors.testserver", "--port", "9999", "--log-level", "DEBUG" ]
