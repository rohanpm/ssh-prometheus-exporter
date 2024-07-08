FROM registry.access.redhat.com/ubi8/go-toolset@sha256:00a64493787c0839c221d320dbed90593cba5da93d1b8d16ca132de33b7cc1c6
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
