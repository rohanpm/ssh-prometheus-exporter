FROM registry.access.redhat.com/ubi8/go-toolset@sha256:a213dfdcdcefe53c1fd12c89678360f7e237cb032c2b58ce3748bbf6ef404d3e
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
