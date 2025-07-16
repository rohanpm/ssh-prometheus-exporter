FROM registry.access.redhat.com/ubi8/go-toolset@sha256:e51bf480e820ec4c656c916b837aefe4ab93c3a7c4eee030f4aa8e842a0a3c9d
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
