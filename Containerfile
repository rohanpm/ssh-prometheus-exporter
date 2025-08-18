FROM registry.access.redhat.com/ubi8/go-toolset@sha256:1aca2594af2eedac4a6a28a79fad24f018e6d71f3dbfec5d1167435e9bef85c4
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
