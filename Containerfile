FROM ghcr.io/ublue-os/bazzite-dx:latest@sha256:bd100cf596f95d8d29c3f87889ce0aacaa4936762e93dc4a294a03c3e2046708


COPY build.sh /tmp/build.sh
COPY scripts/* /tmp/

#COPY etc/containers/ /etc/containers/
#COPY usr/bin/ /usr/bin/

#COPY cosign.pub /etc/pki/containers/xlion-private.pub


RUN mkdir -p /var/lib/alternatives && \
    #/usr/bin/update-containers-policy.sh && \
    /tmp/zerotier.sh &&\
    /tmp/build.sh && \
    ostree container commit
## NOTES:
# - /var/lib/alternatives is required to prevent failure with some RPM installs
# - All RUN commands must end with ostree container commit
#   see: https://coreos.github.io/rpm-ostree/container/#using-ostree-container-commit

