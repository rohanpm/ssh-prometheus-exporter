FROM registry.access.redhat.com/ubi8/go-toolset@sha256:05afab207bab65d4d3e8ec186d69f9ed6da9e2180ed65e9e198c7fecaa20ece3
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
