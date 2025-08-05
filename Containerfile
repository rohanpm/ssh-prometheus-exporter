FROM registry.access.redhat.com/ubi8/go-toolset@sha256:f6c6c2d02b72ceab262e219e3f956953a02de4470c4dabc73e9aad7a94da68c4
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
