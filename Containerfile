FROM registry.access.redhat.com/ubi8/go-toolset@sha256:a1a37882bbcf1c0f1115d478d5ea9f74b496b8c753d5e4e431a70786e2dbcbfc
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
