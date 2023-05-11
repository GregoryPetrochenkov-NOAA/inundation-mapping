#!/bin/bash

umask 002
echo "Group ID: $GID | Group Name: $GN"
newgrp $GN
exec "$@"
jupyter notebook --notebook-dir=/foss_fim/notebooks --ip='*' --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''
