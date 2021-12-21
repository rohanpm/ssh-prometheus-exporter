FROM registry.access.redhat.com/ubi8/go-toolset@sha256:287d341349331a19866a2862a55e0cc5c412f21a86ba80629f59579ef6a38c03
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
