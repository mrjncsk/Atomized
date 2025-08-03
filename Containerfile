ARG BASE_IMAGE=ghcr.io/ublue-os/bazzite:stable
FROM scratch AS ctx
COPY build/ /ctx/
FROM ${BASE_IMAGE}
COPY files/ /
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/system.sh
RUN ostree container commit
RUN bootc container lint
