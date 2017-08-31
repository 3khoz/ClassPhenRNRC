library(rts)
library(raster)
library(ncdf4)
library(maptools)


path="C:/Users/idiaz/Downloads/L8phen/" 
folders <- list.files(path=path,pattern='LC08',full.names=TRUE)  
i=1

#for(i in 1:length(folders)){
  evi  <-stack(list.files(path=folders[i],pattern=glob2rx("*.nc"),full.names=TRUE),varname="sr_evi")
  pixq <-stack(list.files(path=folders[i],pattern=glob2rx("*.nc"),full.names=TRUE),varname="pixel_qa")
  ndvi <-stack(list.files(path=folders[i],pattern=glob2rx("*.nc"),full.names=TRUE),varname="pixel_qa")
  
    
  projection(myclip) <- CRS("+proj=utm +north +zone=18 +datum=WGS84")



