ARG BASE_IMAGE=ghcr.io/ublue-os/bazzite:stable
FROM scratch AS ctx
COPY build/ /ctx/
FROM ${BASE_IMAGE}
COPY rootfs/ /
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/01_software.sh
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/02_caelestia.sh
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/03_cleanup.sh
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/04_config.sh
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/05_boot.sh
RUN ostree container commit
RUN bootc container lint
