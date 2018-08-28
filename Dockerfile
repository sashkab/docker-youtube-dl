# Build:
# docker build -t youtube-dl:latest .
# Add alias:
# alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/downloads youtube-dl:latest'

FROM alpine:3.7

RUN set -x \
  && apk add --no-cache ca-certificates ffmpeg openssl python3 \
  && pip3 install -U pip setuptools wheel youtube-dl

COPY yt /yt

WORKDIR /downloads

ENTRYPOINT ["/yt"]
CMD ["--help"]
