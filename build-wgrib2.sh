#!/usr/bin/env bash
# ------------------------------------------
# used by cygwin to compile wgrib 
# if it doesn't exist already
# ------------------------------------------
rootDir=$(pwd)
wgribDir=$rootDir/wgrib-cyg
wgribTarBall=$wgribDir/wgrib2.tgz
grib2Dir=$wgribDir/grib2
wgribexe=$grib2Dir/wgrib2/wgrib2
if [ ! -d "$wgribDir" ] 
then
    mkdir $wgribDir
fi
if [ ! -f $wgribexe ]
then
    cd $wgribDir
    if [ ! -f "$wgribTarBall" ]
    then
        curl https://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz -o wgrib2.tgz
    fi
    if [ -d "$grib2Dir" ]
    then
        rm -rf $grib2Dir
    fi
    #apt-cyg install gcc-core gcc-fortran gcc-g++ make
    gunzip < $wgribTarBall | tar -xvf -
    cd grib2
    sed 's/\\#/#/' <makefile >makefile.cygwin
    export CC=gcc
    export FC=gfortran
    make
    cd $rootDir
fi
