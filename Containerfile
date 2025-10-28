FROM registry.access.redhat.com/ubi8/go-toolset@sha256:00339f16dfb093888616e7aae345c8fbfdd56b2ca57439c02744e83a04066b95
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
