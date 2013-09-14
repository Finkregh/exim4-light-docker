<!-- -*- mode: Markdown; -*- -->

exim4-light-docker
============

Run exim4 in a docker, configured to send all mails to the "root"-machine (default) or somewhere else (user-config).

```bash
# get this repo
git clone git clone https://github.com/finkregh/exim4-light-docker-docker.git

# show default config
cat etc/env

# OPTIONAL: set different smarthost
#echo "export EXIM_SMARTHOST=<ip>" >> .env

# OPTIONAL: build docker
#docker build -t "finkregh/exim4-light" .

# start docker
./docker-bin/start-exim
```

Debuging
--------

```bash

docker run -i -t -entrypoint="/bin/sh" finkregh/exim4-light -c /bin/bash
```
