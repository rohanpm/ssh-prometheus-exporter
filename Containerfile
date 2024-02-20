FROM registry.access.redhat.com/ubi8/go-toolset@sha256:dd52f6715f7f4d96987d373ca64e0eaf90bf069ff904470e7aaed6b0960d8316
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
