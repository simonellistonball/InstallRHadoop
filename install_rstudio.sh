#!/bin/sh

# Optional (only on gateway node) Install Rstudio-server
wget http://download2.rstudio.org/rstudio-server-0.98.1091-x86_64.rpm
sudo yum install -y --nogpgcheck rstudio-server-0.98.1091-x86_64.rpm
rstudio-server verify-installation && sudo chkconfig rstudio-server on
