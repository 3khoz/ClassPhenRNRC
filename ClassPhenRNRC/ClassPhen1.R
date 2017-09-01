library(rts)
library(raster)
library(ncdf4)
library(maptools)

#########  DEFINIR ESPACIO DE TRABAJO
mypath="Z:/ProyectoClassPhen/L8_RNRC/" # selecciona el directorio de los rasters
folders <- list.files(path=mypath, pattern=glob2rx("LC0823*"), full.names=T)

i=1

#for(i in 1:length(folders)){
  mydata<-folders[i]
  b5<-raster(list.files(path=myimg,pattern=glob2rx("*.nc"),full.names=TRUE))
  b7<-raster(list.files(path=myimg,pattern=glob2rx("*."),full.names=TRUE))
  NBR<-((b5-b7)/(b5+b7))


h<-substr(lst,26,114)  # extraer solo seccion de fecha

x<-untar(lst[1],list.files(path=lst[1],pattern='.nc$',full.names=TRUE))

untar(lst[1],files=paste(h[1],"/",x)
        "wp2011-survey/anon-data.csv")

evi <- stack(x,varname="sr_evi")
pixq <- stack(lst,varname="pixel_qa")


mypath <- "C:/Users/idiaz/Desktop/Landsat8_Maule/"
folders <- list.files(path=mypath, pattern=glob2rx("LC08_L1TP_*"), full.names=T)

## Calcular NBR para todas las imagenes

for(i in 1:length(folders)){
  myimg<-folders[i]
  date<-substr(myimg,56,63)
  b5<-raster(list.files(path=myimg,pattern=glob2rx("*_01_T1_B5.TIF"),full.names=TRUE))
  b7<-raster(list.files(path=myimg,pattern=glob2rx("*_01_T1_B7.TIF"),full.names=TRUE))
  NBR<-((b5-b7)/(b5+b7))