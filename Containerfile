FROM registry.access.redhat.com/ubi8/go-toolset@sha256:88338f9b485c7b3d3267dda3a7c70d71ff940b6361e6418ddcaa8848080c4069
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
