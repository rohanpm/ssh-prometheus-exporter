FROM registry.access.redhat.com/ubi8/go-toolset@sha256:9b7b1a47d31de7c15966a1c63141f985d8c0b100a768ece74c5a7262dc0e6e27
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
