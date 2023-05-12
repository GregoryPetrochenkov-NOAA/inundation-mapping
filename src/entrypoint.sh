#!/bin/bash

umask 002
echo "Group ID: $GID | Group Name: $GN"
newgrp $GN
exec "$@"
jupyter notebook --notebook-dir=/foss_fim/notebooks --ip='*' --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.max_buffer_size=1000000000000

#/foss_fim/tools/inundate_gms.py -y /outputs/ -f /outputs/12020001/ble_huc_12020001_flows_500yr.csv -i /data/fim_outputs/inundation.tif -o /data/fim_outputs/map_file.csv -u 12020001
#/foss_fim/tools/mosaic_inundation.py -i /data/fim_outputs/map_file.csv -t inundation_rasters -m /data/fim_outputs/inundation.tif -a /outputs/12020001/wbd.gpkg

# /foss_fim/tools/inundate_gms.py -y /foss_fim/outputs/fim_4_3_3_4/ -f /foss_fim/outputs/ble_huc_12020001_flows_500yr.csv -i /foss_fim/outputs/fim_files/inundation.tif -o /foss_fim/outputs/fim_files/map_file.csv -u 12020001

#/foss_fim/tools/mosaic_inundation.py -i /foss_fim/outputs/fim_files/map_file.csv -t inundation_rasters -m /foss_fim/outputs/fim_files/inundation.tif -a /foss_fim/outputs/fim_4_3_3_4/12020001/wbd.gpkg
