FROM fedora:30
LABEL maintainer="Alexander Trost <galexrt@googlemail.com>"

COPY packages /packages

RUN dnf -q update -y && \
    PACKAGES_TO_INSTALL=$(grep -v '^$\|^\s*\#' /packages) && \
    echo "Will install the following packages: ${PACKAGES_TO_INSTALL}" && \
    dnf --setopt=install_weak_deps=False --best install -y ${PACKAGES_TO_INSTALL} && \
    dnf clean all && \
    mkdir /workdir

USER root
WORKDIR /workdir

VOLUME ["/workdir"]
