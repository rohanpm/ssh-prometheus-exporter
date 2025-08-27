FROM registry.access.redhat.com/ubi8/go-toolset@sha256:4842bf7e31849a442f4c6d00f00fe3a6d4793525764e0ddb3ba098c6649a7f67
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
