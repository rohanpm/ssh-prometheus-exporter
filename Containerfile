FROM registry.access.redhat.com/ubi8/go-toolset@sha256:3a69fafad98efdf3ec283aa9ad5e3a6445e53acf4a86ae9e69bff9475107c411
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
