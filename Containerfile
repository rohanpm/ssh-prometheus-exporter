FROM registry.access.redhat.com/ubi8/go-toolset@sha256:f9189d8c8d01601c79855e946929380becd6733db71e3fb78b79fcee78c7081a
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
