FROM ubuntu

WORKDIR /app
ADD . /app

RUN ./prepare-build.sh && ./build.sh

## CMD cd /opt/pf-config && /app/lora_pkt_fwd
