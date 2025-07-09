FROM registry.access.redhat.com/ubi8/go-toolset@sha256:615c6390ad4ef744e8209f0db3054e0e3224a6e10aece767e95dfeff76333f77
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
