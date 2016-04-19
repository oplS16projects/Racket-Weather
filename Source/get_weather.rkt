#lang racket
(require net/url json 2htdp/batch-io)

#|
URLs to the libraries I'm using:

net/url (making requests): https://docs.racket-lang.org/net/url.html
JSON (to parse JSON): http://docs.racket-lang.org/json/index.html
batch-io (for saving files): https://docs.racket-lang.org/teachpack/2htdpbatch-io.html

Using the following site for API requests for weather data: http://openweathermap.org

Basically making REST API requests in Racket.

We will grab weather data for five cities:
-> Boston, MA USA
-> Lawerence, MA USA
-> Lowell, MA USA
-> Worcester, MA USA   -> IMPORTANT, ADD US
-> Manchester, NH USA  -> IMPORTANT, ADD US

API calls:

http://api.openweathermap.org/data/2.5/weather?q={city name},{Country code}&mode={MODE}&units={UNITS}&cnt={NUMBER OF DAYS}&appid={API KEY}

    Boston: http://api.openweathermap.org/data/2.5/weather?q=Boston,US
 Lawerence: http://api.openweathermap.org/data/2.5/weather?q=Lawerence,US
    Lowell: http://api.openweathermap.org/data/2.5/weather?q=Lowell,US
Worchester: http://api.openweathermap.org/data/2.5/weather?q=Worchester,US
Manchester: http://api.openweathermap.org/data/2.5/weather?q=Manchester,US

Change {CITY} to the City name and then you will get:
JSON data
Units in Imperial (F, MPH, etc)
10 Day Forecast data
API ID from my free account on OpenWeatherMap.

Working example for London, UK:
http://api.openweathermap.org/data/2.5/forecast/daily?q=London,GB&mode=json&units=imperial&cnt=10&appid=4da17a76c93f99b0c2d1f87923d14c72
|#

;; Cities names for the API strings
(define boston "Boston,US")
(define lawerence "Lawerence,US")
(define lowell "Lowell,US")
(define worchester "Worchester,US")
(define manchester "Manchester,US")

;; List of cities names for the recursive get weather function
(define cities_list (list boston lawerence lowell worchester manchester))

;; Create the API strings
(define open_weather "http://api.openweathermap.org/data/2.5/forecast/daily?q=")
(define options "&mode=json&units=imperial&cnt=10")
(define api_key "&appid=4da17a76c93f99b0c2d1f87923d14c72")
(define get_boston (string-append open_weather boston options api_key))
(define get_lawerence (string-append open_weather lawerence options api_key))
(define get_worchester (string-append open_weather worchester options api_key))
(define get_lowell (string-append open_weather lowell options api_key))
(define get_manchester (string-append open_weather manchester options api_key))

;; List of API strings for the get weather function
(define get_list (list get_boston get_lawerence get_worchester get_lowell get_manchester))

#|
The API string could look like this for example:
> get_weather_boston
"http://api.openweathermap.org/data/2.5/forecast/daily?q=Boston&mode=json&units=imperial&cnt=10&appid=4da17a76c93f99b0c2d1f87923d14c72"
|#

;; Now we can use this URL string to get weather data!
;; Let's get each cities' weather and save them to a file with the citie's name + .json

;; Variables needed for the get_weather procedure
(define weather_data "")
(define get_data "")
(define weather_response "")
(define weather_done "Weather collection complete.\n")

;; We will use a recursive procedure called "get_weather"
(define (get_weather _cities _api-strings)
  ;; If to detect end of lists.
  (if (null? _cities)
      ;; True case, done.
      weather_done

      ;; False case, get JSON data
      (begin
        (set! weather_data (string->url (car _api-strings)))
        (set! get_data (get-pure-port weather_data))
        (set! weather_response (port->string get_data))
        (close-input-port get_data)
        
        ;; Write to file in folder "JSON", with name as "CITY_NAME_HERE.json"
        (write-file (string-append "JSON/" (car _cities)  ".json") weather_response)
        
        ;; Recursive call
        (get_weather (cdr _cities) (cdr _api-strings))
      )
  )
)

;; Call the get_weather procedure
(get_weather cities_list get_list)

;; And we're done! All the weather data is saved nicely in JSON format!
