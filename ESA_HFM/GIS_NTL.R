#test bathymetry
library(sf)
capa <- read_sf("GIS/nhld_bathymetry.shp")
ggplot(capa)+
  geom_sf()+
  coord_sf(xlim = c(-89.62, -89.605), ylim = c(45.998, 46.005), crs = 4269)
  geom_sf_text(aes(label = ID))
capa$geometry
capa_trans <- st_transform(capa, crs = 4269) #Transformo las coordenadas

crystal_shape <- st_crop(capa_trans, caja) #recorto la capa para quedarmo solo con crystall lake
caja <- st_bbox(c(xmin = -89.62, ymin = 45.998, xmax =-89.605, ymax = 46.005), crs = 4269)
ggplot(crystal_shape)+
  geom_sf()
