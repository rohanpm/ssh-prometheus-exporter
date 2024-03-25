FROM registry.access.redhat.com/ubi8/go-toolset@sha256:041d0cd34be473392239263c5a435510557cb88364f6f86404829c2ba0bdbe73
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
