FROM registry.access.redhat.com/ubi8/go-toolset@sha256:4a6e255603f845fac799ee017edf69c972de3e5cf30ba740f183548a38ec1180
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
