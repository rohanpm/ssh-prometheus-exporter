FROM registry.access.redhat.com/ubi8/go-toolset@sha256:fdd7420a4c55381c05c09adb8f8288a56dbe3f3cedb46e9cd58e6f6eb3b316f7
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
