FROM registry.access.redhat.com/ubi8/go-toolset@sha256:72aec87b00b0eca51c7be956197fcbdcdaa65271e14d8065a485a0717154bbd5
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
