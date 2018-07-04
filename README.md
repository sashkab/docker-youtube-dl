# youtube-dl in a docker

## Build

```sh
docker build -t youtube-dl:latest .
```

## Create alias

Add alias into your `.bash_profile` or `.zshrc` files:

```sh
alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/downloads youtube-dl:latest'
```

## Automatically update via crontab

```sh
docker build --rm --no-cache -t youtube-dl:$(date +\%Y%m%d) -t youtube-dl:latest path-to/docker-youtube-dl
```
