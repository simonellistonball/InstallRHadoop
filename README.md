# InstallRHadoop
Scripts to install and smoketest R and RHadoop on Hortonworks Data Platform (HDP)

[install.sh](install.sh) installs R and relevant packages. This should be run on each data node in the cluster.
[install_rstudio.sh](install_rstudio.sh) installs rstudio-server and needs to be run on a gateway node.

The [smoketest.R](smoketest.R) file contains an R script which exercises some of the basic rmr2 and plyrmr commands to demonstrate the install is working.

Once you have installed R on all the nodes, you can use any node to run the smoketest.R script with
```
R < smoketest.R
```

Note that you may want to choose a different CRAN mirror to in the install.sh scripts (see the [list of URLs for CRAN mirrors](http://cran.r-project.org/mirrors.html))
