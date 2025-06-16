FROM registry.access.redhat.com/ubi8/go-toolset@sha256:f79e40e156b5c887b1e12ae7a2f6c59b0f720e9fc7874a328a1d76e558297f48
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
