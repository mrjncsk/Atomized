ARG BASE_IMAGE=ghcr.io/ublue-os/base-main:stable
FROM scratch AS ctx
COPY Build/ /ctx/
FROM ${BASE_IMAGE}
COPY Data/atomized/ /
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/1_atomized.sh
ARG DESKTOP
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/${DESKTOP}.sh
COPY Data/${DESKTOP}/ /etc/skel
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx /ctx/x_atomized.sh
#RUN ls -l /usr
#RUN rm -rf /usr/etc
#RUN rm -rf /var/log/dnf5.log /var/lib/dnf /var/roothome /var/tmp /var/cache
#RUN ls -l /usr
RUN ostree container commit
#RUN bootc container lint
