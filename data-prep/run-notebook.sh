#!/bin/bash

# default installation of Docker on Linux requires root privileges
if [[ "$(uname)" == "Linux" ]]
then
    docker_cmd="sudo docker"
elif [[ "$(uname)" == "Darwin" ]]
then
    docker_cmd="docker"
else
    echo "Who _are_ you?"
    exit 1
fi

echo "invoking Docker with '$docker_cmd'" 

exit 0

$docker_cmd pull maedoc/recon

$docker_cmd run --rm -it \
    -v $(pwd):/opt/work \
    -v /Users/maedoc/Data/ol/fs/ol:/opt/freesurfer/subjects/ol \
    -p 127.0.0.1:8888:8888 -p 127.0.0.1:8000:8000 \
    maedoc/recon jupyter notebook --allow-root --ip=0.0.0.0
