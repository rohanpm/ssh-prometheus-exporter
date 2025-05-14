FROM registry.access.redhat.com/ubi8/go-toolset@sha256:f3bf69c758f35d8ed28ed608bf63cb44a741c06444e4b55e0fbb3044e3a47ada
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
