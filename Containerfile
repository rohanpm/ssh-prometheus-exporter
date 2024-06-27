FROM registry.access.redhat.com/ubi8/go-toolset@sha256:071dc3945f67690737832fbb101c055170f32bd31cf4bc88b78fe321cdf0c62f
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
