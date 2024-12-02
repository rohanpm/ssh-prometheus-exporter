FROM registry.access.redhat.com/ubi8/go-toolset@sha256:64917b531ab4f2996c340aeb74e1f3551221cc779ceb3c6cfcefef0463914777
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
