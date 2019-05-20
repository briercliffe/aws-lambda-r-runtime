#!/usr/bin/env bash
R_DIR=/opt/R/
cd ${R_DIR}

mv /.Rprofile ~/
mv /.netrc ~/

libs=(stringr data.table lubridate dplyr readr wlggmap base64enc openssl jsonlite purrr tidyr validatejsonr randomForest)

for package in "${libs[@]}"
do
    ./bin/Rscript -e "chooseCRANmirror(graphics=FALSE, ind=34); install.packages('$package')"
done

tar czf library.tar.gz -C library/ .
mv library.tar.gz /