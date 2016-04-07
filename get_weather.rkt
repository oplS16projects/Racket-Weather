#lang racket

(require net/url json)

#|
URLs to the libraries I'm using:

net/url (making requests): https://docs.racket-lang.org/net/url.html
JSON (to parse JSON): http://docs.racket-lang.org/json/index.html

Using the following site for API requests for weather data:
http://openweathermap.org

API call is here:
api.openweathermap.org/data/2.5/weather?lat=LAT_HERE&lon=LONG_HERE

Basically, I'm messing around with REST API requests in Racket.

We will grab weather data for five cities:
-> Boston, MA
-> Lawerence, MA
-> Lowell, MA
-> Worcester, MA
-> Manchester, NH

Finally, ping openweathermap.org for weather data and display that data.

|#

#|

API calls:

http://api.openweathermap.org/data/2.5/weather?q={city name}

Boston:
Lawerence:
Lowell:
Worchester:
Manchester:

|#

;; Create the API string
(define open_weather "http://api.openweathermap.org/data/2.5/weather?lat=")
(define lat_str (number->string user_lat))
(define long_str (number->string user_long))
(define api_key "&appid=44db6a862fba0b067b1930da0d769e98")
(define get_weather (string-append open_weather lat_str "&lon=" long_str api_key))

;; The API string could look like this for example:
#|
> get_weather
"http://api.openweathermap.org/data/2.5/weather?lat=42.6523&lon=-71.3506&appid=44db6a862fba0b067b1930da0d769e98"
|#

;; Now we can use this URL string to get weather data!
(define weather_data (string->url get_weather))
(define get_data (get-pure-port weather_data))
(define weather_response (port->string get_data))
(close-input-port get_data)

;; Convert geo_response to a JSON object, just like before.
(define weather_obj (string->jsexpr weather_response))

#|
Finally, we should have a JSON object with a bunch of weather data
for our current location!

The object might look something like this:
> weather_obj
'#hasheq((id . 4942618)
         (coord . #hasheq((lon . -71.32) (lat . 42.63)))
         (weather . '(#hasheq((id . 500) (description . "light rain") (icon . "10d") (main . "Rain"))))
         (wind . #hasheq((speed . 1.43) (deg . 226.503)))
         (rain . #hasheq((3h . 0.595)))
         (clouds . #hasheq((all . 92)))
         (main . #hasheq((temp . 290.174) (pressure . 1016.88) (humidity . 88) (temp_min . 290.174) (temp_max . 290.174) (sea_level . 1026.91) (grnd_level . 1016.88)))
         (sys . #hasheq((country . "US") (sunrise . 1457607817) (sunset . 1457650042) (message . 0.0132)))
         (cod . 200)
         (name . "Lowell")
         (dt . 1457638592)
         (base . "cmc stations"))
|#

#|
   So for the final output of this program, let's display some misc weather data for the current location!
   Let's make the example output look like the following:

***********************************************************************************************************
   CURRENT CITY: city_here
   Lat/lon: longitude_here / latitude_here
   Description: description_here
   Wind Speed: wind_speed_here
   etc, maybe a few other things that we can get.

***********************************************************************************************************

|#

;; Strings here.
(define city_name (hash-ref weather_obj 'name))               ;; Example - "Lowell"
(define coord_obj (hash-ref weather_obj 'coord))              ;; Should get the coord hashtable inside the weather hashtable.
(define coord_lat (hash-ref coord_obj 'lat))                  ;; Example - "42.63"
(define coord_long (hash-ref coord_obj 'lon))                 ;; Example - "-71.32"
(define cond_obj (hash-ref weather_obj 'weather))             ;; Should get the conditions obj inside the weather obj.
(define conditions (hash-ref (car cond_obj) 'description))    ;; Example - "light rain"
(define wind_obj (hash-ref weather_obj 'wind))                ;; Should get the wind obj inside the weather obj.
(define wind_speed (hash-ref wind_obj 'speed))                ;; Example - "1.43"

;; Print out the strings.
(printf "CURRENT CITY: ~a\n" city_name)
(printf "Lat/Long: ~a / ~a\n" coord_lat coord_long)
(printf "Weather conditions: ~a\n" conditions)
(printf "Wind speed: ~a MPH\n" wind_speed)

;; Debug info for future reference.
;(printf "API URL for IP address lookup: https://api.ipify.org?format=json\n")
;(printf "API URL for Lat/Long lookup via IP: ~a\n" get_loc)
;(printf "API URL for weather lookup: ~a\n" get_weather)

;; AND we're done!
