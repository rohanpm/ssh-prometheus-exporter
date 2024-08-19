FROM registry.access.redhat.com/ubi8/go-toolset@sha256:9101d6753ede39212a1019712f35a9f50e0d033e28d932bac0f1704bcffc63a2
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
