FROM registry.access.redhat.com/ubi8/go-toolset@sha256:c2e8443126cf5c9e7f40c93a15f155f5290c04fd7073da2a69fb87588e85ad86
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
