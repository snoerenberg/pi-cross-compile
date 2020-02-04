FROM ubuntu:18.04

MAINTAINER Stephan Noerenberg "snoerenberg@gk-software.com"

# USAGE: docker run -it -v ~/raspberry/hello:/build snoerenberg/pi-cross-compile

LABEL com.snoerenberg.pi-cross-compile="{\"Description\":\"Cross Compile for Raspberry Pi\",\"Usage\":\"docker run -it -v ~/myprojects/mybuild:/build snoerenberg/pi-cross-compile\",\"Version\":\"0.1.0\"}"

RUN apt-get update && apt-get install -y git && apt-get install -y build-essential && apt-get install -y cmake && apt-get install -y gcc-arm-linux-gnueabihf

RUN git clone --progress --verbose https://github.com/raspberrypi/tools.git --depth=1 pitools

ENV BUILD_FOLDER /build

WORKDIR ${BUILD_FOLDER}

CMD ["/bin/bash", "-c", "make", "-f", "${BUILD_FOLDER}/Makefile"]
