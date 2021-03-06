Set-Variable -Name curDir -Value (Get-Location).Path
$cygdir = Join-Path -Path $curDir -ChildPath cygdir
$cygdirbin = Join-Path -Path $cygdir -ChildPath bin
$cygpackages = Join-Path -Path $curDir -ChildPath cygpackages
$cygSetup = Join-Path -Path $cygpackages -ChildPath setup_cygwin.exe
$wgrib2Dir = Join-Path -Path $curDir -ChildPath wgrib-cyg
$aptCyg = Join-Path -Path $cygdirbin -ChildPath apt-cyg

New-Item -ItemType Directory -Force -Path $cygdir
New-Item -ItemType Directory -Force -Path $cygpackages
New-Item -ItemType Directory -Force -Path $wgrib2Dir


wget http://cygwin.com/setup-x86_64.exe -o $cygSetup
# not finished here... may need to install other cygwin deps, need tof igure out how to do that
#http://mirror.csclub.uwaterloo.ca
#http://muug.ca/mirror/cygwin/

#--quiet-mode `
# --local-install `

& $cygSetup `
--no-admin `
--local-package-dir $cygpackages `
--site http://muug.ca/mirror/cygwin `
--root $cygdir `
--verbose `
--quiet-mode `
--no-startmenu `
--packages `
awk, `
make, `
gcc-core, `
gcc-fortran, `
gcc-g++, `
make, `
unzip, `
wget, `
curl, `
nano, `
cygport, \
zlib


echo cygwin install complete packages installed

# get apt-cyg
#curl https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg -o $aptCyg

#$env:path = "$cygdirbin;$env:path"
#& $cygdirbin\bash.exe -c "./build-wgrib2.sh"

# cd $wgrib2Dir
# $env:CC = "gcc"
# $env:FC = "gfortran"

# curl https://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz -o wgrib2.tgz 
# & $cygdirbin\bash.exe -c "gunzip < wgrib2.tgz | tar -xvf -"
# cd grib2
# & $cygdirbin\bash.exe -c "export CC=gcc; export FC=gfortran; make"
