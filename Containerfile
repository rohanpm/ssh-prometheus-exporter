FROM registry.access.redhat.com/ubi8/go-toolset@sha256:3a1231fa652216bd95be53b6276b0a74504477b07a481b1eb2bde5f252984009
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
