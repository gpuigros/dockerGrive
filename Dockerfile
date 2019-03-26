FROM ubuntu
MAINTAINER gpuigros

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:nilarimogard/webupd8 && \
    apt-get update && \
    apt-get install -y grive && \
    apt-get clean && rm -rf /var/lib/apt/lists

ADD entrypoint.sh /service/bin/

RUN chmod +x /service/bin/entrypoint.sh

ENTRYPOINT ["/service/bin/entrypoint.sh"]


