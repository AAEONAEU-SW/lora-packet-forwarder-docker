# LoRA Packet Forwarder

This git describes how to deploy a LoRA Packet Forwarder using Docker and [UP Squared LoRa Edge Computing](https://up-shop.org/up-systems/292-up-squared-lora-edge-computing.html)

## Installation

```
$ git clone https://github.com/AAEONAEU-SW/lora-packet-forwarder-docker.git
$ sudo apt-get install docker docker-compose
```

## Build the image

The first step is to create the docker image
```
$ cd lora-packet-forwarder-docker/Docker
$ sudo docker build -t lora-packet-forwarder:latest .
```

## Configuration

In the "config/global_conf.json" JSON file, change this informatiion to connect your gateway with your LoRaServer:
- "gateway_ID"
- "server_address"
- "serv_port_up"
- "serv_port_down"
- (...)

```JSON
{
  ...
    "gateway_conf": {
        "gateway_ID": "AA555A0000000000",
        /* change with default server address/ports, or overwrite in local_conf.json */
        "server_address": "127.0.0.1",
        "serv_port_up": 1700,
        "serv_port_down": 1700,
        /* adjust the following parameters for your network */
        "keepalive_interval": 10,
        "stat_interval": 30,
        "push_timeout_ms": 100,
        /* forward only valid packets */
        "forward_crc_valid": true,
        "forward_crc_error": false,
        "forward_crc_disabled": false
    }
}
```

__Warning__ : keep the same `gateway_ID` in the 'local_conf.json' and 'global_conf.json'

## Run the container

### 1. Docker Compose

```
$ cd lora-packet-forwarder-docker
$ sudo docker-compose up -d
```
__Warning__ : If you work with your own DNS, add the docker DNS option to change the _nameserver_ in the container configuration : `dns - YOUR_DNS_IP_ADDR`

### 2. Docker

#### Docker RUN

```
$ sudo docker build -t lora-packet-forwarder:latest .
$ sudo docker run -it --rm --privileged --device=/dev/spidev1.0 -v /sys:/sys -v $(pwd)/config:/opt/pf-config lora-packet-forwarder:latest bash
```
__Warning__ : If you work with your own DNS, add the docker DNS option to change the _nameserver_ in the container configuration : `--dns=YOUR_DNS_IP_ADDR`

## License

[License: BSD-3](https://github.com/AAEONAEU-SW/lora-packet-forwarder-docker/blob/master/LICENSE)

## Credit

- [Lora-net/packet_forwarder](https://github.com/Lora-net/packet_forwarder) - License: BSD-3
- [Lora-net/lora_gateway](https://github.com/Lora-net/lora_gateway) - License: BSD-3
- [cetic/lora-packet-forwarder-docker](https://github.com/cetic/lora-packet-forwarder-docker) - License: BSD-3

