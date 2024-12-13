FROM registry.access.redhat.com/ubi8/go-toolset@sha256:3494f435c2f573bdb7ed4d59eadc7ec9dde3e088907de5cd6f2fdf4a57206615
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
