FROM registry.access.redhat.com/ubi8/go-toolset@sha256:1cfdf0c57886426cfd322b438f2c87612d034a7121a3e70bf897162415b42216
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
