library(tidyverse)
library(sf)

setwd('~/Documents/assoRted/FloraGunnisonRiverBasin/scripts')
getwd()


############### create

watershed <- st_read('../data/raw/geodata/WBD_14_HU2_Shape/Shape/WBDHU12.shp') %>% 
  filter(str_detect(name, 'Gunnison')) %>% 
  filter(name != 'Gunnison Valley-Green River')


ggplot() +
  geom_sf(data = watershed)
