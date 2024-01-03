# Stand With Ukraine 🇺🇦

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

# Opcache Dashboard Docker Builder

[![docker](https://img.shields.io/docker/pulls/gometric/opcache-dashboard.svg?style=flat)](https://hub.docker.com/r/gometric/opcache-dashboard/)

Builder of Docker image for [Opcache Dashboard](https://github.com/GoMetric/opcache-dashboard)

# Run

```
docker run \
  -p 42042:42042 \
  -v "$(pwd)"/config.yaml:/config.yaml:ro \
  gometric/opcache-dashboard:latest \
  --config="/config.yaml"
```

# Build

Run build:

```
make docker-build
```

Publish build on hub:
```
make docker-publish
```

To publish image to hub you need to be logged in:

```
make docker-login
```
