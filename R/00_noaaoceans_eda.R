# 11/10/2020
# NOAAOCEANS EDA


####  Packages  ####
library(here)
library(sf)
library(noaaoceans)
library(tidyverse)
library(gmRi)


#### Exploratory Queries  ####
?query_coops_data()

# If we know the gauge ID we can proceed this way:
portland_id <- "8418150"
port <- query_coops_data(portland_id,
                 start_date = "01/01/2019",
                 end_date ="01/15/2019" ,
                 data_product = "water_level" ,
                 units = "english",
                 time_zone = "gmt",
                 datum = "MLLW")


# Format 
port <- port %>% mutate(
  t = as.POSIXct(t),
  v = as.numeric(v))

# Plot oscillations
ggplot(port, aes(t, v)) +
  geom_line(group = 1)



####  What if we don't have the ID  ####

# Gonna want to grab the closest station from here
noaa_station_key <- read_csv(here("data/noaa_tide_stations.csv"))


####  Coordinates Only  ####

# demo lat/lon
coordinate_1 <- data.frame(lat = 43.6514, lon = -70.2565) # Portland
coordinate_2 <- data.frame(lat = 41.5256, lon = -70.6725) # Woods Hole

# Function to identify nearest station
find_station <- function(input_latlon){
  
  # make sf from lat lon
  input_sf <- st_as_sf(input_latlon, coords = c("lon", "lat"))
  
  # Do the same for noaa key
  noaa_station_key <- read_csv(here("data/noaa_tide_stations.csv"), col_types = cols())
  noaa_station_sf <- st_as_sf(noaa_station_key, coords = c("lon", "lat"))
  
  # Find distance matrix
  dist_mat <- st_distance(x = input_sf, y = noaa_station_sf)
  #return(dist_mat)
  
  # Get index for nearest
  nn_index <- apply(dist_mat, 1, function(x) { order(x, decreasing=F)[2] })
  #return(nn_index)
  
  # Return that one
  nearest_n <- noaa_station_key[nn_index, ]
  return(nearest_n)
}


# Return nearest station
find_station(coordinate_1)
find_station(coordinate_2)





####  City Only  ####

# 1. geocode city/address/zip

# 2. Nearest neighbor from that point

