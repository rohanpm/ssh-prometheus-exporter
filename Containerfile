FROM registry.access.redhat.com/ubi8/go-toolset@sha256:9d0300e1db21c21606a24bbef76235aba027235b00fa123f72b7816f3bffb274
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
