FROM registry.access.redhat.com/ubi8/go-toolset@sha256:042360a375fef1cd0d893b81efc78fc70659f68f16b93103c9c4ff8b558b063d
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
