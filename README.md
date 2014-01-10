# docker-xpressengine

This is Dockerfile for building
[moniwiki](http://dev.naver.com/projects/moniwiki/) application
image. This Dockerfile based on Moniwiki 1.2.1.

# Building Dockerfile

1. Clone this repository.

```sh
$ git clone https://github.com/nacyot/docker-moniwiki.git
$ cd docker-moniwiki
```

1. Building image from Dockerfile.

```sh
$ docker build -t nacyot/moniwiki .
```

# Starting Server

```
$ docker run -d -p <PUBLIC_PORT>:80 nacyot/moniwiki
```

Replace `<PUBLIC_PORT>` with the number. You can access your Moniwiki
application on `http://127.0.0.1:<PUBLIC_PORT>/moniwiki`

# Installing Moniwiki

`http://127.0.0.1:<PUBLIC_PORT>/moniwiki`

# Setting up Nginx Proxy

```nginx
upstream moniwiki_server {
  server 127.0.0.1:<PUBILC_PORT>;
}

server {
  server_name <YOUR_DOMAIN>;

  location / {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://moniwiki_server;
  }
}
```

# Author
Daekwon Kim(nacyot) <propellerheaven@gmail.com>.

# License
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
