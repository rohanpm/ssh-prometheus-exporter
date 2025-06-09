FROM registry.access.redhat.com/ubi8/go-toolset@sha256:adcc6785461528a902661d1abb6700491a69bc710e35d22bd7b91239c53c9d40
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
