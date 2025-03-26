FROM registry.access.redhat.com/ubi8/go-toolset@sha256:825c51a21564019c8859645612c4c085f7b7dc485957729d9245cdc06a24cf1e
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
