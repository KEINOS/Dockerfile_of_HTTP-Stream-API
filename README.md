[![](https://images.microbadger.com/badges/image/keinos/http-stream-api.svg)](https://microbadger.com/images/keinos/http-stream-api "View image ifno on microbadger.com") [![](https://img.shields.io/docker/cloud/automated/keinos/http-stream-api.svg)](https://hub.docker.com/r/keinos/http-stream-api "View on Docker Hub") [![](https://img.shields.io/docker/cloud/build/keinos/http-stream-api.svg)](https://hub.docker.com/r/keinos/http-stream-api/builds "View builds on Docker Hub")

# Dockerfile of HTTP-Stream-API

Sample of a **simple HTTP Stream API Server in PHP7**.

```bash
docker pull keinos/http-stream-api
```

This is a sample of HTTP Stream API which just counts up to 10 in JSON format such as `{"response":"foo","count":0}`.

- Base Image: [keinos/php7-alpine](https://hub.docker.com/r/keinos/alpine/) @ Docker Hub
- Container Info:
  - ENTRYPOINT: `/app/run-server.sh`
  - Server: PHP's built-in web server
  - Port: 80
  - Root directory: `/app`
  - Router file: `/app/router.php`
- Repositories:
  - Image: https://hub.docker.com/r/keinos/http-stream-api @ Docker Hub
  - Source: https://github.com/KEINOS/Dockerfile_of_HTTP-Stream-API @ GitHub
- Issues: https://github.com/KEINOS/Dockerfile_of_HTTP-Stream-API/issues @ GitHub

## Usage

### `docker`

```shellsession
$ # Build image
$ # or Pull image as below
$ #   $ docker pull keinos/http-stream-api
$ docker build -t http-stream .
...
$ # Run server in background (detached) and expose port 80 (container) to 8888 (host)
$ docker run --rm -d -p 8888:80 http-stream
...
$ # cURL the API Endpoint (See stream work)
$ curl http://localhost:8888/
{"response":"foo","count":0}
...
{"response":"foo","count":1}
...
{"response":"foo","count":9}
...

$ # Check only headers
$ curl -I http://localhost:8888/
HTTP/1.1 200 OK
Host: localhost:8888
Date: Mon, 27 May 2019 14:02:24 GMT
Connection: close
Access-Control-Allow-Origin: *
Content-type: application/octet-stream
Transfer-encoding: chunked

$ # Or open the html file with your browser.
$ # On macOS it would be as so:
$ open ./client_local.html
...
```

### `docker-compose`

```shellsession
$ # Boot container with docker-compose
$ docker-compose up -d --build stream
...

$ # cURL the API Endpoint (See stream work)
$ curl http://localhost:8888/
{"response":"foo","count":0}
...
{"response":"foo","count":1}
...
{"response":"foo","count":9}
...

$ # Check only headers
$ curl -I http://localhost:8888/
HTTP/1.1 200 OK
Host: localhost:8888
Date: Mon, 27 May 2019 14:02:24 GMT
Connection: close
Access-Control-Allow-Origin: *
Content-type: application/octet-stream
Transfer-encoding: chunked

$ # Or open the html with your browser.
$ # On macOS it would be as so:
$ open ./client_local.html
...
```
