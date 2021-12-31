# youtube-dl in a docker

![Build youtube-dl image](https://github.com/sashkab/docker-youtube-dl/workflows/Build%20youtube-dl%20image/badge.svg)

## Pull

```sh
docker pull docker pull ghcr.io/sashkab/docker-youtube-dl/docker-youtube-dl:latest
```

## Create alias

Add alias into your `.bash_profile` or `.zshrc` files:

```sh
alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/downloads -t docker pull ghcr.io/sashkab/docker-youtube-dl/docker-youtube-dl:latest'
```

## Automatically update via crontab

Add a schedule to update via crontab:

```sh
0 1 * * 0 docker pull docker pull ghcr.io/sashkab/docker-youtube-dl/docker-youtube-dl:latest
```
