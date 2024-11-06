FROM registry.access.redhat.com/ubi8/go-toolset@sha256:bd2057262d0876188976f79d2246717994de9e03dd589b1e6471dd2b2777204f
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
