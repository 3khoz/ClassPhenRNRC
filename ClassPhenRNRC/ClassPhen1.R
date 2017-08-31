library(rts)
library(raster)
library(ncdf4)
library(maptools)

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

path="C:/Users/idiaz/Downloads/L8phen/" 
folders <- list.files(path=path,pattern='LC08',full.names=TRUE)  
i=1

#for(i in 1:length(folders)){
  evi  <-raster(list.files(path=folders[i],pattern=glob2rx("*.nc"),full.names=TRUE),varname="sr_evi")
  ndvi <-raster(list.files(path=folders[i],pattern=glob2rx("*.nc"),full.names=TRUE),varname="sr_ndvi")  
  pixq <-raster(list.files(path=folders[i],pattern=glob2rx("*.nc"),full.names=TRUE),varname="pixel_qa")
  bqa <-raster(list.files(path=folders[i],pattern=glob2rx("*.nc"),full.names=TRUE),varname="bqa")

  
    
  projection(myclip) <- CRS("+proj=utm +south +zone=19 +datum=WGS84")


  evi  <-stack(list.files(path=folders[i],pattern=glob2rx("*.nc"),full.names=TRUE))
