#!/bin/bash
MODEL_LEVELS=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/model_nc/2006
SURFACE=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/surface_nc/2006
OUTPUT_nccn=/poorgafile1/climate/mhaghigh/OUTPUTS_nccn/
#exaple date day= 2006-12-31, last_day=2007-12-30

day="2006-05-31"
last_day="2006-12-30"

while [[ $(date +%s -d "$day") -le $(date +%s -d "${last_day}") ]];do
    day=$(date -d "$day next day" +%Y-%m-%d);
    year=${day:0:4}
    mon=${day:5:2}
    dd=${day:8:2}
    echo ${day}
    echo ${SURFACE}/${day}.nc>> boxfile.txt                                                                                                                                                                     
    echo ${MODEL_LEVELS}/${day}.nc>> boxfile.txt
    echo ${OUTPUT_nccn}/${day}_NCCN.nc>> boxfile.txt
    echo ${year} >> boxfile.txt                                                                                                                                                                                  
    echo ${mon} >> boxfile.txt                                                                                                                                                                                   
    echo ${dd} >> boxfile.txt                                                                                                                                                                                   
    mv boxfile.txt /home/mhaghigh/boxmodel_nccn_calipso                                                                                                                                                         
    cd /home/mhaghigh/boxmodel_nccn_calipso                                                                                                                                                                   
    ./box_model_karo                                                                                                                                                                                             
    rm /home/mhaghigh/boxmodel_nccn_calipso/boxfile.txt
    done 


exit

