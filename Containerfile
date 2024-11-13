FROM registry.access.redhat.com/ubi8/go-toolset@sha256:fe1c5eee22c78e1a9806323ee46329a41ac99521c5022c84765c4d698abb4e81
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
