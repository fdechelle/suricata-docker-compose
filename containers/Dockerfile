FROM ubuntu:noble AS base

# install git and python
RUN apt-get update -qq; apt-get install -y git python3 python3-pip ; apt-get clean

# install IDMEFv2 python library
RUN git clone https://github.com/fdechelle/python-idmefv2.git
# change the git url in order to allow anonymous clone
WORKDIR /python-idmefv2
RUN git submodule set-url idmefv2/schemas/drafts https://github.com/IDMEFv2/IDMEFv2-Drafts.git
WORKDIR /python-idmefv2/idmefv2/schemas/drafts
RUN git submodule init ; git submodule update
WORKDIR /python-idmefv2
RUN pip install --break-system-packages .

# install IDMEFv2 connectors
WORKDIR /
RUN git clone https://github.com/IDMEFv2/idmefv2-connectors.git
WORKDIR /idmefv2-connectors
RUN pip install --break-system-packages .

FROM base AS suricata

ARG CONNECTOR_CONFIG_FILE=./suricata/files/suricata-idmefv2.conf

# suricata install and configure
RUN apt-get update -qq; apt-get install -y software-properties-common ; apt-get clean
RUN add-apt-repository ppa:oisf/suricata-stable
RUN apt-get update -qq ; apt-get install -y suricata ; apt-get clean
RUN suricata-update

# extra utils
RUN apt-get update -qq; apt-get install -y curl ; apt-get clean

COPY --chown=suricata:suricata ./suricata/files/suricata.yaml /etc/suricata

COPY ${CONNECTOR_CONFIG_FILE} /etc/suricata-idmefv2.conf

COPY --chmod=0755 ./suricata/files/docker-entrypoint.sh /
CMD [ "/docker-entrypoint.sh" ]

FROM base AS testserver

CMD [ "python3", "-m", "idmefv2.connectors.testserver", "--port", "9999", "--log-level", "DEBUG" ]
