#lang racket

(require net/url json 2htdp/batch-io)

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

    Boston: http://api.openweathermap.org/data/2.5/weather?q=Boston&appid=4da17a76c93f99b0c2d1f87923d14c72
 Lawerence: http://api.openweathermap.org/data/2.5/weather?q=Lawerence
    Lowell: http://api.openweathermap.org/data/2.5/weather?q=Lowell
Worchester: http://api.openweathermap.org/data/2.5/weather?q=Worchester
Manchester: http://api.openweathermap.org/data/2.5/weather?q=Manchester

Testing

Change {CITY} to the City name and then you will get:
JSON data
Units in Imperial (F, MPH, etc)
10 Day Forecast data
API ID from my free account on OpenWeatherMap.
http://api.openweathermap.org/data/2.5/forecast/daily?q={CITY}&mode=json&units=imperial&cnt=10&appid=4da17a76c93f99b0c2d1f87923d14c72

Working example for London:
http://api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=json&units=imperial&cnt=10&appid=4da17a76c93f99b0c2d1f87923d14c72

|#

;; Create the API string
(define boston "Boston")
(define lawerence "Lawerence")
(define lowell "Lowell")
(define worchester "Worchester")
(define manchester "Manchester")

(define open_weather "http://api.openweathermap.org/data/2.5/forecast/daily?q=")
(define options "&mode=json&units=imperial&cnt=10")
(define api_key "&appid=4da17a76c93f99b0c2d1f87923d14c72")
(define get_weather_boston (string-append open_weather boston options api_key))
(define get_weather_lawerence (string-append open_weather lawerence options api_key))
(define get_weather_worchester (string-append open_weather worchester options api_key))
(define get_weather_lowell (string-append open_weather lowell options api_key))
(define get_weather_manchester (string-append open_weather manchester options api_key))

;; The API string could look like this for example:
#|
> get_weather_boston
"http://api.openweathermap.org/data/2.5/forecast/daily?q=Boston&mode=json&units=imperial&cnt=10&appid=4da17a76c93f99b0c2d1f87923d14c72"
|#

;; Now we can use this URL string to get weather data!

;; Let's get each cities' weather and save them to a file with the citie's name + .json

;; 1) Boston - get JSON data
(define weather_data (string->url get_weather_boston))
(define get_data (get-pure-port weather_data))
(define weather_response (port->string get_data))
(close-input-port get_data)

;; This will write the weather response JSON to a file named "boston.json",
;; a JSON file that Huy and JT will be able to use in their visualation programs.
;; Uses this library: https://docs.racket-lang.org/teachpack/2htdpbatch-io.html
(write-file "JSON/boston.json" weather_response)

;; 2) Lawerence - get JSON data
(set! weather_data (string->url get_weather_lawerence))
(set! get_data (get-pure-port weather_data))
(set! weather_response (port->string get_data))
(close-input-port get_data)

;; Lawerence - output JSON to file.
(write-file "JSON/lawerence.json" weather_response)

;; 3) Lowell - get JSON data
(set! weather_data (string->url get_weather_lowell))
(set! get_data (get-pure-port weather_data))
(set! weather_response (port->string get_data))
(close-input-port get_data)

;; Lowell - output JSON to file.
(write-file "JSON/lowell.json" weather_response)

;; 4) Worchester - get JSON data
(set! weather_data (string->url get_weather_worchester))
(set! get_data (get-pure-port weather_data))
(set! weather_response (port->string get_data))
(close-input-port get_data)

;; Worchester - output JSON to file.
(write-file "JSON/worchester.json" weather_response)


;; 5) Manchester - get JSON data
(set! weather_data (string->url get_weather_manchester))
(set! get_data (get-pure-port weather_data))
(set! weather_response (port->string get_data))
(close-input-port get_data)

;; Manchester - output JSON to file.
(write-file "JSON/manchester.json" weather_response)

;; And we're done! All the weather data is saved nicely in JSON format!
