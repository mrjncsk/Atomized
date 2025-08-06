ARG BASE_IMAGE=ghcr.io/ublue-os/base-main:stable
FROM scratch AS ctx
COPY Build/ /ctx/
FROM ${BASE_IMAGE}
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/atomized.sh
COPY Data/atomized/ /
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/${DESKTOP}.sh
COPY Data/${DESKTOP}/ /etc/skel
RUN ostree container commit
RUN bootc container lint
