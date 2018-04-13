

# docker env
# ----------


function docker-stop-all() {
  docker ps -q | xargs docker stop $@
}

function docker-start-all() {
  docker ps -aq | xargs docker stop
}

function docker-rm-all() {
  docker ps -aq | xargs docker rm
}

function docker-rmi-all() {
  docker images -aq | xargs docker rm
}
