FROM registry.access.redhat.com/ubi8/go-toolset@sha256:c7c95c4e0a1b1b0ff30d6da0eb3ae9502b2d68fdcc45a446d108066a470f4ba6
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
