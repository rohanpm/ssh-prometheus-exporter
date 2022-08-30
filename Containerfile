FROM registry.access.redhat.com/ubi8/go-toolset@sha256:bf454a9df291ce148da763d5e5ada6ae64e1d7ff946fb02c119f93e21f4a0c6b
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
