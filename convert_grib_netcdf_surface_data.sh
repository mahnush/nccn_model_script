#!/bin/bash

WORKDIR_MODEL_LEVELS=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/model_levels/
WORKDIR_SURFACE=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/surface/
SURFACE_nc=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/surface_nc/
#mkdir $SURFACE_nc

cd $WORKDIR_SURFACE
conda activate cdo

DATAFILELIST=$(find ${WORKDIR_SURFACE}/*.grib)
for datafilename in ${DATAFILELIST} ; do
    datafile="${datafilename##*/}"  # get filename without path                                                                                                                                                  
    outdatafile=${datafile%.*}      # get filename without suffix
    cdo -t ecmwf -f nc setgridtype,regular ${datafile} ${SURFACE_nc}/${outdatafile}.nc
    
done
#-----------------------------------------------------------------------------                                                                                                                                    
exit
#-----------------------------------------------------------------------------  
