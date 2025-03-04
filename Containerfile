FROM registry.access.redhat.com/ubi8/go-toolset@sha256:25f2884bcf8ba92eca7613c8dbcbdfb3e4951db2875732b01486628d57623745
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
