FROM registry.access.redhat.com/ubi8/go-toolset@sha256:8bdcfa606506e1343fcda2777b7171da9d59c9537396a2454b7e9dc1e855be3e
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
