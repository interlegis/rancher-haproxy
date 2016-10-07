
rancher-haproxy
==============

This image is the haproxy dynamic conf for rancher. It comes from [rawmind/rancher-tools][rancher-tools].

## Build

```
docker build -t rawmind/rancher-haproxy:<version> .
```

## Versions

- `0.0.1` [(Dockerfile)](https://github.com/interlegis/rancher-haproxy/blob/Dockerfile)


## Usage

This image has to be run as a sidekick of [rawmind/alpine-haproxy][alpine-haproxy], and makes available /opt/tools volume. It scans from rancher-metadata, for a services that has haproxy labels, and generates haproxy frontend and backends to expose the services.


## Configuration labels

Haproxy labels, has to be created in your service, in order to get included in haproxy dynamic config. 

- haproxy.enable = true # Enable or not haproxy publication
- haproxy.publish = < domain.name >:< port > # Domain and port to publish. Multiple domains separated by ","

WARNING: Only services with healthy state are added to haproxy, so health checks are mandatory.

[alpine-haproxy]: https://github.com/rawmind0/alpine-haproxy
[rancher-tools]: https://github.com/rawmind0/rancher-tools
