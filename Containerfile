FROM registry.access.redhat.com/ubi8/go-toolset@sha256:258e9a3fb96c4cf4ed0a7947e26f47f1af0a548ecd5d22b3a029a41328a90409
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
