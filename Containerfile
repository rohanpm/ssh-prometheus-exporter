FROM registry.access.redhat.com/ubi8/go-toolset@sha256:331d914e44eb8bbe61498e0261abb29c75761566e47166453cf5148217cdfca2
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
