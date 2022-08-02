FROM registry.access.redhat.com/ubi8/go-toolset@sha256:fbfc90030b00549ecfe59fc84fc6a095189a59d8dc23ff698ebae48e084855ec
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
