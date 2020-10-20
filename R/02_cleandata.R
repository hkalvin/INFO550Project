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

#Look at white age-adjusted breast cancer mortality by state
ds2_w<-filter(ds2,Race=="White")

#Look at Black age-adjusted breast cancer mortality by state
ds2_b<-filter(ds2,Race=="Black")

#put two datasets together for table creation
all<-inner_join(ds2_w,ds2_b,by="State",suffix = c(".w", ".b"))

all1<-subset(all,select=c("State","Age_Adjusted_Rate.w","Age_Adjusted_Rate.b"))
all1<- all1 %>% rename(White=Age_Adjusted_Rate.w) %>% rename(Black=Age_Adjusted_Rate.b)

#get state abbreviations and regions to format output
a<-state.abb
State<-state.name
region<-as.vector(state.region)
getabbrev<-cbind(a,State,region)

#final datasets for table and figure creation
ds2_fig<-inner_join(ds2,getabbrev,by="State",copy=TRUE)
all2<-inner_join(all1,getabbrev,by="State",copy=TRUE)

#save to folder
figpath<-paste(ds_out,"ds2_fig.csv",sep="")
write_csv(ds2_fig,figpath)

tblpath<-paste(ds_out,"all2.csv",sep="")
write_csv(all2,tblpath)

