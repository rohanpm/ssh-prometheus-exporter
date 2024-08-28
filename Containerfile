FROM registry.access.redhat.com/ubi8/go-toolset@sha256:9ef622111d4c1dc47d2fa1da2f43552766301d25cbe264c54dd7f8348b6d52bd
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
