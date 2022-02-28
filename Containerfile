FROM registry.access.redhat.com/ubi8/go-toolset@sha256:31c5ffb3228ce65cc6eb10b0ec8881e89d074a8c65c3498352852d347cf0786e
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
