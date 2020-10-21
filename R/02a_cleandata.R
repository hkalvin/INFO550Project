#! /usr/local/bin/Rscript

library(tidyverse)
library(magrittr)
library(kableExtra)
library(ggplot2)
library (readr)

#create file paths for input and output
ds_in<-"./raw_data/"
ds_out<-"./clean_data/"

#load raw data to clean
dspath<-paste(ds_in,"fulldata2.csv",sep="")
ds<-read_csv(dspath,col_names=TRUE)

###CLEAN DATA###
#filter dataset
ds1<-filter(ds, Race!="Other unspecified (1978-1991)" & Race!="American Indian/Alaska Native" & Race!="Asian or Pacific Islander" & State!="Washington DC" & State!="Hurricane Katrina/Rita Evacuees - Populations Only - 2005")

#select variables to analyze
ds2<-subset(ds1,select=c("State","Race","Age_Adjusted_Rate"))

#get state abbreviations and regions to format output
a<-state.abb
State<-state.name
region<-as.vector(state.region)
getabbrev<-cbind(a,State,region)

#final datasets for table and figure creation
ds2_fig<-inner_join(ds2,getabbrev,by="State",copy=TRUE)

#save to folder
figpath<-paste(ds_out,"ds2_fig.csv",sep="")
write_csv(ds2_fig,figpath)



