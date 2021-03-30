# wgrib2-Cygwin-Build

[What are grib files?](https://weather.gc.ca/grib/what_is_GRIB_e.html)

To quote the referenced site above:
*A GRIB file contains one or more data records, arranged as a sequential bit stream. Each record begins with a header, followed by packed binary data. The header is composed of unsigned 8-bit numbers (octets). It contains information about :*  ... weather!

The National weather service creates a utility called wgrib2 that reads and converts grib files to different formats.  The utility is designed to run in a unix/linux environment.  It can however be 
compiled to work in windows using cygwin.

# This Repository

This repository creates and hosts a cygwin compiled version of the 
wgrib2 utility using github actions.  This reduces the number of cygwin components that
need to be installed on a destination system that will be using the 
wgrib2 utility.  In theory all it should require is a cygwin base
system.

# Downloading

See the [release](https://github.com/franTarkenton/wgrib2-Cygwin-Build/releases) section of the repo to download the cygwin compiled binaries for the cygwin environment.
