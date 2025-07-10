FROM registry.access.redhat.com/ubi8/go-toolset@sha256:621eebfdfc044df4bd4b50ec11f8791bc68986a7b0aa00089777b17bd2e9c751
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
