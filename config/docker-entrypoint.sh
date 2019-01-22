#!/bin/sh

exec nginx -g 'pid /tmp/nginx.pid; daemon off;'
