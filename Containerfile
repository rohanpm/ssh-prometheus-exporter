FROM registry.access.redhat.com/ubi8/go-toolset@sha256:7618390597b5393c38c0d4a71af15c7af0fd497dbf9707e4fbe64e9e507c6081
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
