FROM registry.access.redhat.com/ubi8/go-toolset@sha256:8a9106cba56ffee4f0de6ecb1953aaac50460a0406d06db3db99e7d182cc1908
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
