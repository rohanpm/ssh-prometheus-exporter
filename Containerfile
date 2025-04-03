FROM registry.access.redhat.com/ubi8/go-toolset@sha256:f9e02daed92706e91af576e4858f09f76be7b8a35c66a554337209c694beb125
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
