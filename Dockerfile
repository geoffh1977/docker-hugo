# Build Hugo Container
ARG IMAGE_USER=geoffh1977
ARG IMAGE_NAME=alpine
ARG IMAGE_VERSION=latest

FROM ${IMAGE_USER}/${IMAGE_NAME}:${IMAGE_VERSION}
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

ARG HUGO_VERSION

# Install Software
RUN wget -O /tmp/hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
  tar zxvf /tmp/hugo.tar.gz -C /tmp && \
  mv /tmp/hugo /usr/bin/hugo && \
  rm -rf /tmp/* && \
  mkdir /project && \
  chown "${ALPINE_USER}":"${ALPINE_USER}" /project

USER ${ALPINE_USER}
EXPOSE 1330/tcp
VOLUME /project
WORKDIR /project

# Configure Hugo To Start In Default Mode
ENTRYPOINT ["/usr/bin/hugo"]
CMD ["help"]
