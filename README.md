# youtube-dl in a docker

[![Build Status](https://dev.azure.com/sashka1/sashkab/_apis/build/status/sashkab.docker-youtube-dl?branchName=master)](https://dev.azure.com/sashka1/sashkab/_build/latest?definitionId=6&branchName=master)

## Pull

```sh
docker pull docker.pkg.github.com/sashkab/docker-youtube-dl/docker-youtube-dl:latest
```

## Create alias

Add alias into your `.bash_profile` or `.zshrc` files:

```sh
alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/downloads -t docker.pkg.github.com/sashkab/docker-youtube-dl/docker-youtube-dl:latest'
```

## Automatically update via crontab

Add a schedule to update via crontab:

```sh
docker pull docker.pkg.github.com/sashkab/docker-youtube-dl/docker-youtube-dl:latest
```
