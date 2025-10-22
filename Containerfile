FROM registry.access.redhat.com/ubi8/go-toolset@sha256:7c4b1510d225e40456b4391619752bbab92862f21ac1d6385c8b8e92f350566f
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
