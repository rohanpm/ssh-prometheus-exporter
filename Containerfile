FROM registry.access.redhat.com/ubi8/go-toolset@sha256:fa14b2bb1ef146d6d07ab0bcf1db80545b243c85991c96d40f4847999521c7b9
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
