####  Working with geopy to handle location data####

import numpy as np
from geopy.geocoders import Nominatim # API for geocoding
from geopy.extra.rate_limiter import RateLimiter # Rate limiter to manage API requests
from geopy.distance import geodesic # Distances

# Testing geopy API connection
geocoder = Nominatim(user_agent = 'your_app_name')


# Rate limiter to prevent overloading server-side with requests
# adding 1 second padding between calls s
geocode = RateLimiter(geocoder.geocode, min_delay_seconds = 1,   return_value_on_exception = None) 



# Getting Address Information

# lat/lon data
use_lat = 43.6514
use_lon = -70.2565

# look it up with geocode
location = geocoder.reverse((use_lat, use_lon))

# Harvest info we care about
location.raw['address']['postcode'] # Zip code
location.raw['address']['city']     # City
location.raw['address']['state']    # State



####  Getting Distance Between Points ####
coordinate_1 = [43.6514, -70.2565]
coordinate_2 = [41.5256, -70.6725]


distance_in_miles = geodesic(coordinate_1, coordinate_2).miles
distance_in_km = geodesic(coordinate_1, coordinate_2).km
