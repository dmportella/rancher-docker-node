# rancher-docker-node

Express JS app build to run on RANCHER a docker management platform.

## DOCKERHUB

[![dockeri.co](http://dockeri.co/image/dmportella/expressjs)](https://hub.docker.com/r/dmportella/expressjs/)

## ExpressJs

Simple espress js site with route to simulate site failure.

Built for testing *kubernetes* and *rancher* instances.
### Normal route

Web site should be available on port `8080`.

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