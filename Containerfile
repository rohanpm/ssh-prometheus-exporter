FROM registry.access.redhat.com/ubi8/go-toolset@sha256:1709a811d8a90f9470b684a3c67610971bd5bedf9fcb7edde988c5372678c49f
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
