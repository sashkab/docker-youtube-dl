# Build:
# docker build -t youtube-dl:latest .
# Add alias:
# alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/downloads -t youtube-dl:latest'

FROM alpine:3.11

RUN set -x \
  && apk add --no-cache ca-certificates ffmpeg openssl python3 \
  && python3 -mpip install -U pip setuptools wheel youtube-dl

COPY yt /yt

WORKDIR /downloads

ENTRYPOINT ["/yt"]
CMD ["--help"]
