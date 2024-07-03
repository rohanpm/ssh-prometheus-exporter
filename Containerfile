FROM registry.access.redhat.com/ubi8/go-toolset@sha256:0d225ecac1c92434c221948ca3743bddedd27ea3642532e169697548d0da0a00
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
