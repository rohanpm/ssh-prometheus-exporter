FROM registry.access.redhat.com/ubi8/go-toolset@sha256:c0d55dbaa26d2f2de93f5d7be61d1d3d003e42ed6ba87480eb927da82541f124
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
