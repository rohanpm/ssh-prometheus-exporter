FROM registry.access.redhat.com/ubi8/go-toolset@sha256:bfe21597d4bcdd5dee75b84b8358260e21818bb13946302a8a4c16d33aea4570
ADD treydock-ssh_exporter /src
USER root
RUN cd /src && go build && mv ssh_exporter / && go clean -r -cache -modcache
USER 1001
EXPOSE 9312
ENTRYPOINT ["/ssh_exporter"]
