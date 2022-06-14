FROM registry.access.redhat.com/ubi8/go-toolset@sha256:8add930c13bf47f47b1481241d1c3ca641b896bcc18f34d54408cce3031670bb
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
