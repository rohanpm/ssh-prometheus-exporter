FROM registry.access.redhat.com/ubi8/go-toolset@sha256:9bc3b79dd43a00d353a89cf04594583d5f5f4cbf43d01f6bbbd44775f50b68c1
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
