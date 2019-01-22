# Packer+Ansible nginx Docker image 

The versatility offered by Packer is amazing. With this proof of concept, we are going to build a Docker image with nginx via Packer, provision with Ansible and finally commit the final image.

Ansible run the playbook on localhost outside the Docker container, so it's neccesary that the image have Python installed if you don't want to use raw commands.

## Building image with Packer

You will need to install Packer into your computer, the instructions are here: https://www.packer.io/docs/installation.html

Afther that, you can start the build:

    $ packer build nginx.json

I'm using alpine:latest base image which does not contain Bash installed by default, so it's mandatory to use the next line to use /bin/sh instead /bin/bash:

```
"run_command": [ "-d", "-t", "-i", "{{.Image}}", "/bin/sh" ],
```

## Running Docker container

Well, we need to test the container finally:

    $ docker run -d -p 8080:80 --name=nginx-packer nidr0x/nginx-packer

Let's do a curl to see if it works:

    $ curl -I 127.0.0.1:8080

```
HTTP/1.1 404 Not Found
Server: nginx
Date: Tue, 22 Jan 2019 12:52:36 GMT
Content-Type: text/html
Content-Length: 162
Connection: keep-alive
