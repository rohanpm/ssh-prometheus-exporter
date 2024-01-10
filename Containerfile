FROM registry.access.redhat.com/ubi8/go-toolset@sha256:dbfd6fbe47b735360fbd674b125ec93f8bfdc41387b2c14163f2a137d28512af
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
