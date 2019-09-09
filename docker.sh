#!/usr/bin/env bash
set -e
CURRENT=$(cd $(dirname ${BASH_SOURCE}) && pwd)
build() {
  docker build --tag=stupid-image $CURRENT
}
run() {
  local times=${1:-40000}
  docker system prune --force
  docker run --name=stupidInstance --network="delphiNetwork" --mount source=MSPROOT,destination=/root/MSPROOT/ --mount source=$CURRENT/config.json,destination=/root/config.json stupid-image /root/stupid config.json $times # --detach
}
$1 $2
