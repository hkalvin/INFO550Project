#! /usr/local/bin/Rscript

#create function to use for table generation
gettbl<-function(r,c){
  dat2<-subset(all2,region==r)
  dat3<-subset(dat2,select=c("State","White","Black"))
  tbltxt<-paste("Table ",c,". Age adjusted breast cancer mortality rate by state and race (",r,")",sep="")
  t<- dat3 %>% kbl(caption=tbltxt,format="html",row.names = F,valign='t') %>% kable_classic(full_width=F) %>% footnote(general = "NA = Data not available")%>%kable_styling(position="float_left")
  return(t)
}