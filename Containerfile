# Stage 1: Nur das Skript ins Image kopieren
FROM scratch AS ctx
COPY build/ /ctx/

# Stage 2: Basis-Image als Grundlage
ARG BASE_IMAGE=ghcr.io/ublue-os/bazzite:stable
FROM ${BASE_IMAGE}

# Skript aus Stage 1 mounten und ausführen
RUN --mount=type=bind,from=ctx,source=/ctx,target=/ctx \
    /ctx/system.sh

# Hier dann weitere Befehle, z.B. ostree commit, bootc lint etc.
RUN ostree container commit
RUN bootc container lint

# Falls noch rootfs nötig, dann kopieren
COPY rootfs/ /
