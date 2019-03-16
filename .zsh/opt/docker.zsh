

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


# Stop all containers
dstop() { docker stop $(docker ps -aq); }
# Remove all containers
drm() { docker rm $(docker ps -aq); }
drmf() { dstop; drm; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Aliases
#

alias dcup='docker-compose up'

function docker-run-kaggle-python-jupyter-notebook {
  docker run --rm -it \
    -v $PWD:/tmp/working -w=/tmp/working \
    -p 8888:8888 \
    kaggle/python-build \
    jupyter lab --no-browser --ip="0.0.0.0" \
    --notebook-dir=/tmp/working \
    --allow-root
}

function docker-run-openjny-notebook {
  docker run --rm -it \
    -v $PWD:/home/jovyan/work \
    -p 8888:8888 \
    -e JUPYTER_ENABLE_LAB=1 \
    -e GRANT_SUDO="no" \
    -e JUPYTER_TOKEN="openjny" \
    openjny/datascience-notebook:latest \
    start.sh jupyter lab --NotebookApp.token=''
}