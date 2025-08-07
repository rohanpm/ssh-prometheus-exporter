FROM registry.access.redhat.com/ubi8/go-toolset@sha256:45c232cb9eb2400b8c7a9906daee381b057a55ee60b6a59b7035b471b4d919f4
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
