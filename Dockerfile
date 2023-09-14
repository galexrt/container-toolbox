FROM fedora:40

ARG BUILD_DATE="N/A"
ARG REVISION="N/A"

LABEL org.opencontainers.image.authors="Alexander Trost <galexrt@googlemail.com>" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.title="galexrt/container-toolbox" \
    org.opencontainers.image.description="A toolbox container for debugging and stuff in containers." \
    org.opencontainers.image.documentation="https://github.com/galexrt/container-toolbox/blob/main/README.md" \
    org.opencontainers.image.url="https://github.com/galexrt/container-toolbox" \
    org.opencontainers.image.source="https://github.com/galexrt/container-toolbox" \
    org.opencontainers.image.revision="${REVISION}" \
    org.opencontainers.image.vendor="galexrt" \
    org.opencontainers.image.version="N/A"

COPY packages /packages
COPY installscripts /installscripts

ENV DATA_DIR="/data"

RUN dnf -q update -y && \
    PACKAGES_TO_INSTALL=$(grep -v '^$\|^\s*\#' /packages) && \
    echo "Will install the following packages: ${PACKAGES_TO_INSTALL}" && \
    dnf --setopt=install_weak_deps=False --best install -y ${PACKAGES_TO_INSTALL} && \
    dnf clean all && \
    for f in /installscripts/*.sh; do \
        echo "-> Running installscript: $f"; bash "$f" || \
        { echo "Failed to run installscript $1"; exit 1; }; \
    done && \
    mkdir "${DATA_DIR}"

USER root

WORKDIR "${DATA_DIR}"

VOLUME ["${DATA_DIR}"]
