#! /usr/local/bin/Rscript

library(tidyverse)
library(magrittr)
library(kableExtra)
library(ggplot2)
library (readr)
#create figures for report document
#load data
ds2_fig<-read_csv("./clean_data/forfigure/ds2_fig.csv",col_names=TRUE)

#load figure function made in program 03b
source("./R/03b_create_getplotsfunction.R")

#create plots for each region
png("./figures/south.png")
getplots(r="South",n=4,c="1")
dev.off()

png("./figures/northeast.png")
getplots(r="Northeast",n=4,c="2")
dev.off()

png("./figures/northcentral.png")
getplots(r="North Central",n=4,c="3")
dev.off()

png("./figures/west.png")
getplots(r="West",n=4,c="4")
dev.off()