#!/bin/sh
set -eu
port="${PORT:-10000}"
case "$port" in
    ''|*[!0-9]*) echo "PORT must be a number" >&2; exit 1 ;;
esac
sed -i "s/port=\"8080\" protocol=\"HTTP\/1.1\"/port=\"$port\" protocol=\"HTTP\/1.1\"/" /usr/local/tomcat/conf/server.xml
exec catalina.sh run
