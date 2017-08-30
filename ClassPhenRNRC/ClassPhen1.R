library(rts)
library(raster)
library(ncdf4)
library(maptools)

i=1
path="C:/Users/idiaz/Downloads/" # selecciona el directorio de los rasters
lst <- list.files(path=path,pattern='.tar.gz$',full.names=TRUE)  #genera una lista de nombre de todos los archivos

h<-substr(lst,26,114)  # extraer solo seccion de fecha

x<-untar(lst[1],list.files(path=lst[1],pattern='.nc$',full.names=TRUE))

untar(lst[1],files=paste(h[1],"/",x)
        "wp2011-survey/anon-data.csv")

evi <- stack(x,varname="sr_evi")
pixq <- stack(lst,varname="pixel_qa")
