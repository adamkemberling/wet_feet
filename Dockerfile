### Dockerfile

# Docker Base Image for R-Shiny Environment
FROM rocker/geospatial:3.6.1

# Installing Spatial Library Dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libudunits2-dev 

# Installing R Package Dependencies
RUN install2.r --error \
    ggpmisc \
    here \
    lubridate \
    mgcv \
    patchwork \
    plotly \
    devtools 
    

# Installation of non-CRAN packages
RUN R -e "devtools::install_github('gulfofmaine/gmri', upgrade = 'never')"
# RUN R -e "devtools::install_github('ropensci/rnaturalearthdata', upgrade = 'never')"
# RUN R -e "devtools::install_github('ropensci/rnaturalearthhires', upgrade = 'never')"


