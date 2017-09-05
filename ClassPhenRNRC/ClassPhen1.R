# Autor: Ignacio D?az H.
# Version: Rama principal
# Fecha primera version: 01-09-2010

## DETALLES DEL PRODUCTO
## Requested Processing: Reproject to universal transverse mercator with zone:19 south, 
## Output Format is netcdf

## Original Products: 
## b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, bqa (Quality Assessment Band)
## Angle Band Coefficients (_ANG.txt),Metadata text file (MTL.txt)

## Surface Reflectance product:
## sr_band1, sr_band2, sr_band3, sr_band4, sr_band5, sr_band6, sr_band7
## Radiometric Saturation Quality Assurance file (radsat_qa)
## Level-2 Pixel Quality Assurance band (pixel_qa)
## Per-pixel solar zenith, solar azimuth, sensor zenith and sensor azimuth bands
## TOA Reflectance metadata file (.xml)

## Spectral Indices
## sr_ndvi, sr_evi, sr_ndmi, sr_savi, sr_msavi, sr_nbr

## Path 232 Row 84 = 37 escenas
## Path 233 Row 83 = 31 escenas
## Path 233 Row 84 = 36 escenas
## Total 104 escenas

## Pixel Quality Attrutes (pixel_qa)
## Clear = 322-386

rasterOptions(tmpdir="Z:/temp/")

rm(list=ls()) #will remove ALL objects
Sys.time()

library(rts)
library(raster)
library(ncdf4)
library(maptools)
library(rgdal)

#######################################################
#########  DEFINIR ESPACIO DE TRABAJO #################
#######################################################

path="Z:/ProyectoClassPhen/L8_RNRC/" 
folders <- list.files(path=path,pattern='LC08',full.names=TRUE)  

## Lectura de limites vectoriales
setwd("Z:/ProyectoClassPhen/Shapefiles/")
myclip<-readOGR("Cipreses.shp")
projection(myclip) <- CRS("+proj=utm +south +zone=19 +datum=WGS84")

paquete<-stack()
dates<-NULL
ids<-NULL  

#for(i in 1:2){
for(i in 1:length(folders)){
  evi  <-raster(list.files(path=folders[i],pattern=glob2rx("*.nc"),full.names=TRUE),varname="sr_evi")
  projection(evi) <- CRS("+proj=utm +south +zone=19 +datum=WGS84")
  
  # Extrae fecha de adquisicion del metadata
  metapath<-list.files(path=folders[i],pattern=glob2rx("*01_T1_MTL.txt"),full.names=TRUE)
  meta <- readLines(metapath)
  dat<-meta[grepl("DATE_ACQUIRED = ", meta)]
  Pdate<-as.Date(substr(dat,21,50),format='%Y-%m-%d')
  datid<-meta[grepl("LANDSAT_PRODUCT_ID = ", meta)]
  Pid<-substr(datid,27,66)
  dates<-rbind(dates,Pdate)
  ids<-rbind(ids,Pid)
  names(evi)<-Pdate
  
  cr <- crop(evi, extent(myclip), snap="out")  
  #cr <- mask(x=cr2, mask=msk) 
  
  paquete<-stack(paquete,cr)
  rc_ts<-rts(paquete,dates)
}


library(npphen)

dates <- as.Date(dates.table$date, format='%d/%m/%Y')


