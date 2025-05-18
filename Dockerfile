FROM alpine:3.21.3

LABEL \
    maintainer="github@compuix.com" \
    version="2025.05.18" \
    description="youtube-dl in a container."

RUN set -x \
    && apk add --no-cache ca-certificates ffmpeg openssl python3 py3-pycryptodomex aria2 \
    && addgroup -g 501 yt \
    && adduser -D -H -h "/home/yt" -g yt -u 501 -G yt yt \
    && mkdir -p /home/yt \
    && chown yt:yt /home/yt


COPY yt /yt

USER yt

RUN set -x \
    && python3 -mvenv /home/yt/py --upgrade-deps --system-site-packages \
    && source /home/yt/py/bin/activate \
    && python3 -mpip install yt-dlp \
    && python -c "import sys;print(sys.prefix)" \
    && mkdir -p /home/yt/.config/yt-dlp \
    && echo '-f "bestvideo[height<=?1080]+bestaudio/best" --all-subs --convert-subs srt --embed-subs --external-downloader aria2c' | tee -a "/home/yt/.config/yt-dlp/config"

WORKDIR /downloads

ENTRYPOINT ["/home/yt/py/bin/python3", "/yt"]
CMD ["--help"]
