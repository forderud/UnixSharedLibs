@echo off

echo Building Ubuntu 18.04 image...
::docker build -f Ubuntu-18.04.Dockerfile --tag=forderud/unixsharedlibs:18.04 .

echo Building sample project...
docker run --rm -v %cd%:/host forderud/unixsharedlibs:18.04 /host/bundle-deps/build.sh || exit /b 1

:: Open an interactive bash shell inside the container
::docker run --rm -it forderud/unixsharedlibs:18.04 sh
