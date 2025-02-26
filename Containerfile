FROM registry.access.redhat.com/ubi8/go-toolset@sha256:3cc2c32b5fd9a060e4705c04032af69cf27228c6f0f3be18189485641ef0e240
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
