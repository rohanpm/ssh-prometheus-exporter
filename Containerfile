FROM registry.access.redhat.com/ubi8/go-toolset@sha256:03e00d5dbc731b92d34c8cfaaa78c46766c205bfa77543692b64ab4ac25fca31
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
