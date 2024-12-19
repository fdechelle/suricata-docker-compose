FROM ubuntu:noble

# suricata install and configure
RUN apt-get update -qq; apt-get install -y software-properties-common ; apt-get clean
RUN add-apt-repository ppa:oisf/suricata-stable
RUN apt-get update -qq ; apt-get install -y suricata ; apt-get clean
COPY --chown=suricata:suricata ./files/suricata.yaml /etc/suricata
RUN suricata-update

# extra utils
RUN apt-get update -qq; apt-get install -y curl ; apt-get clean

# install IDMEFv2 suricata connector
RUN apt-get update -qq; apt-get install -y git python3 python3-pip ; apt-get clean
RUN git clone https://github.com/fdechelle/python-idmefv2.git
# change the git url in order to allow anonymous clone
WORKDIR /python-idmefv2
RUN git submodule set-url idmefv2/schemas/drafts https://github.com/IDMEFv2/IDMEFv2-Drafts.git
WORKDIR /python-idmefv2/idmefv2/schemas/drafts
RUN git submodule init ; git submodule update
WORKDIR /
RUN git clone https://github.com/IDMEFv2/idmefv2-connectors.git
WORKDIR /python-idmefv2
RUN pip install --break-system-packages .
WORKDIR /idmefv2-connectors
RUN pip install --break-system-packages .

COPY --chmod=0755 ./files/docker-entrypoint.sh /
CMD [ "/docker-entrypoint.sh" ]
