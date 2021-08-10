FROM registry.access.redhat.com/ubi8/go-toolset@sha256:db74be244cbf62081667253dbafeb0af75c3410982a45767d1dca6a3eb86f49b
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
