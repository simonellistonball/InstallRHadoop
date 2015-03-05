#!/bin/bash

# Install R and build tools
sudo yum groupinstall -y 'Development Tools'
sudo yum install -y R curl-devel openssl098e git

# Setup Renviron to find hadoop client configs
sudo echo "HADOOP_CMD='/usr/bin/hadoop'" >> /usr/lib64/R/etc/Renviron
sudo echo "HADOOP_CONF=/etc/hadoop/conf" >> /usr/lib64/R/etc/Renviron
sudo echo "HADOOP_STREAMING=/usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar" >> /usr/lib64/R/etc/Renviron


# Setup a CRAN mirror
sudo echo "options(repos=structure(c(CRAN='http://www.stats.bris.ac.uk/R/')))" >> /usr/lib64/R/library/base/R/Rprofile

# Install basic dependencies
sudo Rscript -e 'install.packages(c("RJSONIO", "rJava", "plyr", "dplyr", "itertools", "digest", "Rcpp"))'

# Install some generally useful R packages
sudo Rscript -e 'install.packages(c("functional","bitops","reshape2"))'

# Install devtools (for the install_github function)
sudo Rscript -e 'install.packages(c("devtools"))'

# Install all the RHadoop packages
sudo Rscript -e 'devtools::install_github(c("RevolutionAnalytics/rhdfs","RevolutionAnalytics/rmr2","RevolutionAnalytics/plyrmr"), subdir="pkg")'
