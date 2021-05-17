FROM registry.access.redhat.com/ubi8/go-toolset@sha256:ba3cf7eb028024730e91fb99835e0a84623ed6d550084dfd064f93e5263d6cf6
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
