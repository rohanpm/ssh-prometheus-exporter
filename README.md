ssh-prometheus-exporter
=======================

This repository provides container images for an ssh prometheus exporter.
The sole purpose of this repository is to provide a reproducible image build
with all dependencies pinned and automatically updated.

Inputs
------

- exporter: [treydock/ssh_exporter](https://github.com/treydock/ssh_exporter)
- base image: [ubi8/go-toolset](https://catalog.redhat.com/software/containers/ubi8/go-toolset/5ce8713aac3db925c03774d1)

Outputs
-------

- output image: [quay.io/rmcgover/ssh-prometheus-exporter](https://quay.io/repository/rmcgover/ssh-prometheus-exporter)

