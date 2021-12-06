FROM registry.access.redhat.com/ubi8/go-toolset@sha256:b075bc5fb51f5e4afd3de4cc1f2000d26e714d4ffe55e5d1c7e0c400e929ab26
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
