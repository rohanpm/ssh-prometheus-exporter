FROM registry.access.redhat.com/ubi8/go-toolset@sha256:02f3a14a5da5d31d84ff702476f66e57c12dc511b2d35eb77db71d61448df8ff
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
