FROM registry.access.redhat.com/ubi8/go-toolset@sha256:ac82a9ce2ed74296bbb468ab25447c11c9de6d52ee0f5dc6da2645b5889a43f3
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
