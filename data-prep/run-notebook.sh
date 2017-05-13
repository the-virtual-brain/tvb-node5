#!/bin/bash

docker run --rm -it \
    -v $(pwd):/opt/work \
    -p 127.0.0.1:8888:8888 -p 127.0.0.1:8000:8000 \
    maedoc/recon jupyter notebook --allow-root --ip=0.0.0.0
