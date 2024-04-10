FROM registry.access.redhat.com/ubi8/go-toolset@sha256:254b4231e43a338473c230ff94844675df4785c533d7a8a85a648cb22a7cbe8d
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
