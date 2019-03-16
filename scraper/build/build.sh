#!/usr/bin/env sh

set -e

apk update 

# Must deal with [`wget` bug](https://bugs.alpinelinux.org/issues/5376).
apk upgrade libssl1.0 --update-cache
apk add --no-cache wget ca-certificates
# Now we can download the Pip installer.
wget https://bootstrap.pypa.io/get-pip.py -P /tmp

apk add --no-cache python3
python3 /tmp/get-pip.py
pip install "beautifulsoup4>=4.0.0<5.0.0"
