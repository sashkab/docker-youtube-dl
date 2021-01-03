FROM alpine:3.12

LABEL \
  maintainer="github@compuix.com" \
  version="2021.01.02" \
  description="youtube-dl in a container."


RUN set -x \
  && apk add --no-cache ca-certificates ffmpeg openssl python3 \
  && python3 -mensurepip \
  && python3 -mpip install -U pip setuptools wheel youtube-dl

COPY yt /yt

WORKDIR /downloads

ENTRYPOINT ["/yt"]
CMD ["--help"]
