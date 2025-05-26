FROM registry.access.redhat.com/ubi8/go-toolset@sha256:f28b875248f01fec44db5a5a0d842c89540c702144b341ee826d336bed5edaca
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
