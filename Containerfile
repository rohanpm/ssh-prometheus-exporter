FROM registry.access.redhat.com/ubi8/go-toolset@sha256:4ec05fd5b355106cc0d990021a05b71bbfb9231e4f5bdc0c5316515edf6a1c96
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
