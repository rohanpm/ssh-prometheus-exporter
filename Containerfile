FROM registry.access.redhat.com/ubi8/go-toolset@sha256:115b2d7032e9ea9e4532a727900b35d66ff47ec6aff8ee3b4de16c1e4e95a2d4
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
