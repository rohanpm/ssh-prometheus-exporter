FROM registry.access.redhat.com/ubi8/go-toolset@sha256:43cf2468d9ebecbdf69503ca9cfb4a7c58ee86c94b64fb024c8aebd1bedc816e
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
