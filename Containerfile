FROM registry.access.redhat.com/ubi8/go-toolset@sha256:292c09f5962fed4ea5c239c6901cd14f21d97efbec55788637212bc5ada01707
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
