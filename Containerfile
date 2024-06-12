FROM registry.access.redhat.com/ubi8/go-toolset@sha256:cfa65bd71ea0bb01d043851135ed7ff2a8ec6bb9abda35706f2ea53eb404ddec
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
