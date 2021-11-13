FROM alpine:3.14.3

LABEL \
  maintainer="github@compuix.com" \
  version="2021.11.13" \
  description="youtube-dl in a container."


RUN set -x \
  && apk add --no-cache ca-certificates ffmpeg openssl python3 py3-pycryptodomex \
  && python3 -mensurepip \
  && python3 -mpip install -U pip setuptools wheel \
  && python3 -mpip install yt-dlp

COPY yt /yt

WORKDIR /downloads

ENTRYPOINT ["/yt"]
CMD ["--help"]
