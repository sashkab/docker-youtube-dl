FROM alpine:3.15

LABEL \
  maintainer="github@compuix.com" \
  version="2021.12.31" \
  description="youtube-dl in a container."


RUN set -x \
  && apk add --no-cache ca-certificates ffmpeg openssl python3 py3-pycryptodomex aria2 \
  && python3 -mensurepip \
  && python3 -mpip install -U pip setuptools wheel \
  && python3 -mpip install yt-dlp \
  && addgroup -g 501 yt \
  && adduser -D -H -h "/home/yt" -g yt -u 501 -G yt yt \
  && mkdir -p /home/yt/.config/yt-dlp \
  && echo '-f "bestvideo[height<=?1080]+bestaudio/best" --all-subs --convert-subs srt --embed-subs --external-downloader aria2c' | tee -a "/home/yt/.config/yt-dlp/config" \
  && chown -R yt:yt /home/yt

COPY yt /yt

USER yt

WORKDIR /downloads

ENTRYPOINT ["/yt"]
CMD ["--help"]
