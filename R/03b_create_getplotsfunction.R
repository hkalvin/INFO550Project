#! /usr/local/bin/Rscript

#create function for figure generation
getplots<-function(r,n,c){
  dat<-subset(ds2_fig,region==r)
  plottxt<-paste("Figure ",c,". Age adjusted breast cancer mortality rate by \nstate and race (",r,")",sep="")
  f<-ggplot(dat, aes(x=Race, y=Age_Adjusted_Rate))+geom_col(aes(fill=Race))+ggtitle(plottxt)+
    facet_wrap(~a, ncol=n)+ylab("Age adjusted breast cancer mortality rate")+
    theme(legend.position="bottom",panel.spacing = unit(0.4, "lines"))
  return(f)
}