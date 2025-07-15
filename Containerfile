# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx

COPY build /

# Base Image from https://github.com/orgs/ublue-os/packages
FROM ghcr.io/ublue-os/bazzite:stable

RUN find /usr/share/wallpapers/ -maxdepth 1 -type f -delete

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/image.sh && \
    ostree container commit

COPY rootfs /

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/initramfs.sh && \
    ostree container commit

RUN bootc container lint
