FROM alpine:3.12

RUN set -x \
  && apk add --no-cache ca-certificates ffmpeg openssl python3 \
  && python3 -mensurepip \
  && python3 -mpip install -U pip setuptools wheel youtube-dl

COPY yt /yt

WORKDIR /downloads

ENTRYPOINT ["/yt"]
CMD ["--help"]
