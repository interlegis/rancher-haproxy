
rancher-haproxy
==============

Haproxy dynamic configuration (confd) for Rancher. From [rawmind/rancher-tools][rancher-tools].

## Build

```
docker build -t interlegis/rancher-haproxy:<version> .
```

## Versions

- `0.0.1` [(Dockerfile)](https://github.com/interlegis/rancher-haproxy/blob/master/Dockerfile)


## Usage

This image has to be run as a sidekick of [rawmind/alpine-haproxy][alpine-haproxy], making available /opt/tools volume. It scans rancher-metadata for a services that has haproxy labels, and generates haproxy frontend and backends to expose the services in TCP mode, supporting SSL/TLS pass-through and hostnames via SNI.

## Configuration labels

Haproxy labels, has to be created in your service, in order to get included in haproxy dynamic config. 

- haproxy.enable = true # Enable haproxy publication
- haproxy.publish = < domain.name >:< port > # Domain and port to publish. Multiple domains separated by ","

WARNING: Only services with healthy state are added to haproxy, so health checks are mandatory.

## Docker-compose and Rancher-compose example

See rancher folder.

## References 

[alpine-haproxy]: https://github.com/rawmind0/alpine-haproxy
[rancher-tools]: https://github.com/rawmind0/rancher-tools
