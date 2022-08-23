#!/bin/bash

MODEL_LEVELS=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/model_nc/2014
SURFACE=/poorgafile1/climate/mhaghigh/input_NCCN_CALIPSO/surface_nc/2014
OUTPUT=/poorgafile1/climate/mhaghigh/
#exaple date day= 2006-12-31, last_day=2007-12-30

day="2014-02-09"
last_day="2014-02-10"
while [[ $(date +%s -d "$day") -le $(date +%s -d "${last_day}") ]];do
    day=$(date -d "$day next day" +%Y-%m-%d);
    year=${day:0:4}
    mon=${day:5:2}
    dd=${day:8:2}
    echo ${SURFACE}/${day}.nc>> boxfile.txt                                                                                                                                                                     
    echo ${MODEL_LEVELS}/${day}.nc>> boxfile.txt                                                                                                                                                                
    echo ${OUTPUT}/${day}.nc>> boxfile.txt                                                                                                                                                     
    echo ${year} >> boxfile.txt                                                                                                                                                                                  
    echo ${mon} >> boxfile.txt                                                                                                                                                                                   
    echo ${dd} >> boxfile.txt                                                                                                                                                                                   
    mv boxfile.txt /home/mhaghigh/nccn                                                                                                                                                         
    cd /home/mhaghigh//nccn                                                                                                                                                                    
    echo $day                                                                                                                                                                                                 
    ./box_model_karo                                                                                                                                                                                             
    rm /home/mhaghigh/nccn/boxfile.txt
    done 


exit

