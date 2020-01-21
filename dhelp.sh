#! /bin/bash

run() {
  docker run --rm -it --name=zigdock -d -v $(pwd)/app:/app zigdock /bin/bash
}

stop() {
  docker stop zigdock
}

build() {
  docker build . -t zigdock
}

connect() {
  docker exec -it zigdock /bin/bash
}

save() {
  docker save zigdock >zigdock.tar
}

load() {
  docker load --input zigdock.tar
}

"$@"
