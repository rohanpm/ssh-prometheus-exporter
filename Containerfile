FROM registry.access.redhat.com/ubi8/go-toolset@sha256:3b55bd3a4aec7f72e088af4d2a507b1f9c81b573d180ddb580d051cb544bf1a4
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
