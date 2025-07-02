FROM registry.access.redhat.com/ubi8/go-toolset@sha256:d7d5a44b6f80c0c365c9d21ded6f97edf7a7503c15066b770db8b37d2deebccd
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
