# R Library Extractor
Uses an amazon linux docker container to build R, install libraries, and dump a compressed 
file of the libraries into the working directory.

This library can then be uploaded to s3 and used by the r-lambda-layer.

## R Profile
An R Profile (.Rprofile) can be configured in this directory (r-library-extractor/), along with a .netrc file if necessary
to pull from private CRAN servers.

## Configure Libraries
Libraries can be added/removed from the install-libs.sh script

## Publish
Once the library.tar.gz file exists it can be copied to s3 and referenced by the 
lambda function consuming the R lambda layer using the `R_LIBRARY_PATH` environment variable.

Command to copy to s3: 

`aws s3 cp library.tar.gz s3://bucket/path/to/lib.tar.gz`

Reference in lambda function:

`R_LIBRARY_PATH=s3://bucket/path/to/lib.tar.gz`