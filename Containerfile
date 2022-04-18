FROM registry.access.redhat.com/ubi8/go-toolset@sha256:11ec7d639fad3eb633cafe034bf6b8adca4cd75948ce7b8a04718e00c13883b5
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
