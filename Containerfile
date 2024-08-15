FROM registry.access.redhat.com/ubi8/go-toolset@sha256:907203b4ed450b6ad2b50912df801245b0146d87c593b77dbb6751293351a3d1
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
