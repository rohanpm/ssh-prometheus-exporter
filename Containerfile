FROM registry.access.redhat.com/ubi8/go-toolset@sha256:844dfc3af513533d9fc4c836bfd1c52455b4ed55d05c6ee942dc140f0903d0ae
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
