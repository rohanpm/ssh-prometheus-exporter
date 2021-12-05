FROM registry.access.redhat.com/ubi8/go-toolset@sha256:166567ea3920687f6c0b9b09fbb77fe60456b095cca51d77aa2724a19e6827b3
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
