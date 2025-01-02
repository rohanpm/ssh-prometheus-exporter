FROM registry.access.redhat.com/ubi8/go-toolset@sha256:be796155c0908cd48375bf1f7150036bcd3ad415dfb6cae135f1cf184d61964c
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
