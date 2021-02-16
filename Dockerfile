### Dockerfile

# Docker Base Image for R-Shiny Environment
FROM rocker/geospatial:3.6.1


# Installing R Package Dependencies
RUN install2.r --error \
    ggpmisc \
    here \
    lubridate \
    mgcv \
    patchwork \
    plotly \
    noaaoceans \
    devtools 
    

# Installation of non-CRAN packages
RUN R -e "devtools::install_github('gulfofmaine/gmri', upgrade = 'never')"
RUN R -e "devtools::install_github('troyhill/VulnToolkit', upgrade = 'never')"


