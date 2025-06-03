FROM registry.access.redhat.com/ubi8/go-toolset@sha256:655e5a3a907f29f9ea69ec070247ec9cdb2e0e227a0fbe5f0b41e3259bf31715
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
