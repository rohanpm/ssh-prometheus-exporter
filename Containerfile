FROM golang@sha256:f7a5c5872d4bb68e152be72e4a4bf9a142a47ec2dcbb4074798d4feb6197abd7
ADD treydock-ssh_exporter /src
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
