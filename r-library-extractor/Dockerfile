FROM amazonlinux:1

RUN yum update -y

RUN yum install -y wget sudo tar

RUN sudo yum install -y readline-devel \
    xorg-x11-server-devel libX11-devel libXt-devel \
    curl-devel \
    gcc-c++ gcc-gfortran \
    zlib-devel bzip2 bzip2-libs

RUN sudo yum install -y openssl-devel libxml2-devel

ADD https://cran.uni-muenster.de/src/base/R-3/R-3.5.1.tar.gz /

COPY install-r.sh .
RUN ./install-r.sh 3.5.1

COPY .Rprofile .
COPY .netrc .

COPY install-libs.sh .
RUN ./install-libs.sh

RUN echo "/library.tar.gz is ready"

