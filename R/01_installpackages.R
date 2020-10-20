#! /usr/local/bin/Rscript

#install packages for report generation
installed_pkgs <- row.names(installed.packages())
pkgs <- c("readr", "ggplot2","tidyverse","magrittr","kableExtra")
for(p in pkgs){
  if(!(p %in% installed_pkgs)){
    install.packages(p)
  }
}


