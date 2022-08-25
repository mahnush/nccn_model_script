#!/bin/bash

WORKDIR_MODEL_LEVELS=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/model_levels/
WORKDIR_SURFACE=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/surface/
model_nc=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/model_nc/
#mkdir $SURFACE_nc

cd $WORKDIR_SURFACE
conda activate cdo

DATAFILELIST=$(find ${WORKDIR_SURFACE}/*.grib)
for datafilename in ${DATAFILELIST} ; do
    datafile="${datafilename##*/}"  # get filename without path                                                                                                                                                  
    outdatafile=${datafile%.*}      # get filename without suffix
    cdo setgridtype,regular ${datafile} ${model_nc}/${outdatafile}_1.grib
    cdo -f nc setgridtype,regular ${model_nc}/${outdatafile}_1.grib ${model_nc}/${outdatafile}.nc
    rm ${model_nc}/${outdatafile}_1.grib
    
done
#-----------------------------------------------------------------------------                                                                                                                                    
exit
#-----------------------------------------------------------------------------  
