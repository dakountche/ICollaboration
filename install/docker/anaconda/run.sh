#!/bin/bash
docker run -i -t -p 8888:8888 -v PAHTTOE4SE/reviews:/opt/reviews  \
e4se /bin/bash -c "/opt/conda/bin/conda install jupyter -y &&\
/opt/conda/bin/conda create -n ipykernel_py2 python=2 ipykernel &&\
/opt/conda/bin/jupyter notebook --notebook-dir=/opt/reviews --ip='*' \
--port=8888 --no-browser "
