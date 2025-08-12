FROM registry.access.redhat.com/ubi8/go-toolset@sha256:c218414da3d9414029321d64b1b2e45b6089d0714bf571836474134b63f0b7e9
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
