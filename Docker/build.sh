#!/bin/bash

mkdir -p /app/build
cd /app/build
git clone -b up_squared https://github.com/AAEONAEU-SW/lora_gateway.git
cd lora_gateway
make clean && make all

cd /app/build
git clone https://github.com/AAEONAEU-SW/packet_forwarder.git
cd packet_forwarder
make

cd /app
cp build/packet_forwarder/lora_pkt_fwd/lora_pkt_fwd .

## Next steps defined by the LoRa Software Stack to be used
