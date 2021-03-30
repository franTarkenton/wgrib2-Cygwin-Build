Set-Variable -Name curDir -Value (Get-Location).Path
$cygdir = Join-Path -Path $curDir -ChildPath cygdir
$cygdirbin = Join-Path -Path $cygdir -ChildPath bin
$cygpackages = Join-Path -Path $curDir -ChildPath cygpackages
$cygSetup = Join-Path -Path $cygpackages -ChildPath setup_cygwin.exe
$wgrib2Dir = Join-Path -Path $curDir -ChildPath wgrib-cyg
$aptCyg = Join-Path -Path $cygdirbin -ChildPath apt-cyg

# delete for debugging
Remove-Item $cygdir -Recurse -Force -Confirm:$false
Remove-Item $cygpackages -Recurse -Force -Confirm:$false
Remove-Item ./setup.log.full -Recurse -Force -Confirm:$false


New-Item -ItemType Directory -Force -Path $cygdir
New-Item -ItemType Directory -Force -Path $cygpackages
New-Item -ItemType Directory -Force -Path $wgrib2Dir


wget http://cygwin.com/setup-x86_64.exe -o $cygSetup
# not finished here... may need to install other cygwin deps, need tof igure out how to do that
#http://mirror.csclub.uwaterloo.ca
#http://muug.ca/mirror/cygwin/
#http://cygwin.mirrors.pair.com/ 

#--quiet-mode `
# --local-install `
# --local-package-dir $cygpackages `

# cannot split package list onto multiple lines, or they don't get installed.
& $cygSetup `
--quiet-mode `
--no-desktop `
--download `
--local-install `
--site http://muug.ca/mirror/cygwin/ `
--local-package-dir $cygpackages `
--root $cygdir `
--no-admin `
--no-startmenu `
--disable-buggy-antivirus `
--packages awk,unzip,lynx,wget,curl,nano,gzip,bzip,cygport,libgomp1,zlib,libgfortran5
-C base `



echo cygwin install complete packages installed

# get apt-cyg
#curl https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg -o $aptCyg

#$env:path = "$cygdirbin;$env:path"
#& $cygdirbin\bash.exe -c "./build-wgrib2.sh"


# test wgrib
& $cygdirbin\bash.exe -c "./wgrib-cyg/grib2/wgrib2/wgrib2.exe"

# cd $wgrib2Dir
# $env:CC = "gcc"
# $env:FC = "gfortran"

# curl https://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz -o wgrib2.tgz 
# & $cygdirbin\bash.exe -c "gunzip < wgrib2.tgz | tar -xvf -"
# cd grib2
# & $cygdirbin\bash.exe -c "export CC=gcc; export FC=gfortran; make"
