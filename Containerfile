FROM registry.access.redhat.com/ubi8/go-toolset@sha256:0f5a2e2b6008a9117a53b55481e4a423b71c27cac047ee7be3a2cae29622b05e
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
