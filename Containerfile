FROM registry.access.redhat.com/ubi8/go-toolset@sha256:402dd292845dcda2da1a59b1025ef044ab6c95a6b6593d99becbafa7ffa32ddf
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
