FROM ubuntu:noble

RUN apt-get update -qq && apt-get install -y \
    syslog-ng \
    net-tools

COPY ./files/syslog-ng.conf /etc/syslog-ng/

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

HEALTHCHECK --interval=2m --timeout=5s --start-period=30s CMD /usr/sbin/syslog-ng-ctl healthcheck --timeout 5

ENTRYPOINT ["/usr/sbin/syslog-ng", "--no-caps", "-F"]
