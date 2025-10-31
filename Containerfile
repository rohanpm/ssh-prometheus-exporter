FROM registry.access.redhat.com/ubi8/go-toolset@sha256:552ec1d8e59276da57bcc01c81784e9ec31c93f225f2c8206372bb6e71455664
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
