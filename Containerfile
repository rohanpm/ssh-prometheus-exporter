FROM registry.access.redhat.com/ubi8/go-toolset@sha256:366303d0b4bf43e837264845293f1add0975cbece3660ee9f76e026d46c8591c
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
