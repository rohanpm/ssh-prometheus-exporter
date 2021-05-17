FROM golang@sha256:6f0b0a314b158ff6caf8f12d7f6f3a966500ec6afb533e986eca7375e2f7560f
ADD treydock-ssh_exporter /src
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
