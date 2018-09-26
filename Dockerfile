# Build:
# docker build -t youtube-dl:latest .
# Add alias:
# alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/downloads -t youtube-dl:latest'

FROM alpine:3.8

RUN set -x \
  && apk add --no-cache ca-certificates ffmpeg openssl python3 \
  && pip3 install -U pip setuptools wheel youtube-dl

WORKDIR /downloads

ENTRYPOINT ["youtube-dl", "--no-playlist", "--ffmpeg-location=/usr/bin/ffmpeg"]
CMD ["--help"]
