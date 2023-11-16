FROM registry.access.redhat.com/ubi8/go-toolset@sha256:c78305ff7360bdacdd790225ca10478e08dd6fcbc037bcd176acdf4a552995da
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
