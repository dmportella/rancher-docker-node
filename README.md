# rancher-docker-node

Express JS app build to run on kubernetes, RANCHER and aws EKS docker management platforms.

## DOCKERHUB

[![dockeri.co](http://dockeri.co/image/dmportella/expressjs)](https://hub.docker.com/r/dmportella/expressjs/)

> Thank you for over 350,000+ downloads

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/U6U4K8YU0)

## ExpressJs

Simple espress js site with route to simulate site failure.

Built for testing *kubernetes*, *EKS* and *rancher* instances.

### Normal route

Web site should be available on port `8080` when in docker if you are running the site individually it will be served on port `3000`.

### Health check
```
GET /__health
{
version: "1.0.0",
status: "OK"
}
```
#### routes
* Health check url.: `/__health/`
* Set to throw 500: `/__health/throw500`
* Set to time out: `/__health/timeout`
* Set kill the process: `/__health/killprocess`

## Building

The shell file `build.sh` will run npm install, install and run grunt and it will build and run the docker image.

> $ `./build.sh`

Builds docker image and tags it.

> $ `./build-image.sh`

* Installs npm and grunt

> $ `./setup.sh`