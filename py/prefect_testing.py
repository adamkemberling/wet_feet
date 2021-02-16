#### Prefect Testing for C.I. of tide meter data


# Pseudo-code outline of the functions/tasks
from prefect import task



@task
def find_nearest_tide(location_info, input_type):
  """Locate nearest tidal gauge information from some form of input, either a zip code, name of a 
  city, or possibly a link to the noaa tide gauge itself."""
  
  
  # How to proceed with city name - nearest gauge calculation
  if(input_type == "township"):
    # Do some GPS lookup for township and then do a nearest tide gauge
    input_lon = "found with lookup"
    input_lat = "found with look
  
  
  # How to proceed with zip code
  if(input_type == "zipcode"):
    # Do some GPS lookup for the zip code
    input_lon = "found with lookup"
    input_lat = "found with lookup"
  
  
  # How to  proceed with coordinates
  if(input_type == "coordinates"):
    input_lon = location_info[0]
    input_lat = location_info[1]
    
    
    
  # Once the coordinates are found we want to find the closest tidal gauge:
  
  
  return(tide_gauge_url)
  
  
@task
def check_tides(tide_gauge_url):
  """Tool to scrape NOAA tidal data for specific location.
  
  Goal would to make this as flexible as possible"""
  
  
  # TODO: write code...
  
  return(tide_data)
