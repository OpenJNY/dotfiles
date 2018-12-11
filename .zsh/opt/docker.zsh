

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


# Aliases
#

function docker-run-kaggle-python-jupyter-notebook {
  docker run --rm -it \
    -v $PWD:/tmp/working -w=/tmp/working \
    -p 8888:8888 kaggle/python jupyter notebook \
    --no-browser --ip="0.0.0.0" \
    --notebook-dir=/tmp/working \
    --allow-root
}

