FROM fedora:31
LABEL maintainer="Alexander Trost <galexrt@googlemail.com>"

COPY packages /packages
COPY installscripts /installscripts

RUN dnf -q update -y && \
    PACKAGES_TO_INSTALL=$(grep -v '^$\|^\s*\#' /packages) && \
    echo "Will install the following packages: ${PACKAGES_TO_INSTALL}" && \
    dnf --setopt=install_weak_deps=False --best install -y ${PACKAGES_TO_INSTALL} && \
    dnf clean all && \
    for f in /installscripts/*.sh; do bash "$f"; done && \
    mkdir /workdir

USER root
WORKDIR /workdir

VOLUME ["/workdir"]
