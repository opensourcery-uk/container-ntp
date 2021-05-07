FROM debian:buster-slim
LABEL maintainer "open.source@opensourcery.uk"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get dist-upgrade -y \
 && apt-get install -y ntp \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh \
 && mkdir /entrypoint.d

EXPOSE 123/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/ntpd", "-n"]
