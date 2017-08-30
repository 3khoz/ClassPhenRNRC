library(rts)
library(raster)
library(ncdf4)
library(maptools)

i=1
path="D:/Pro1/LC082320842016102201T1-SC20170825201854/" # selecciona el directorio de los rasters
lst <- list.files(path=path,pattern='.nc$',full.names=TRUE)  #genera una lista de nombre de todos los archivos

h<-substr(lst,49,114)  # extraer solo seccion de fecha

evi <- stack(lst,varname="sr_evi")
pixq <- stack(lst,varname="pixel_qa")
