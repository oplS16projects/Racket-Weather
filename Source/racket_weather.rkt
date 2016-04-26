#lang racket

(require (file "get_weather.rkt"))

;; Call the get_weather procedure
(get_weather cities_list get_list)

;; Now try and run Huy's Viz program.
;; Use another require, and make another provide-all-defined
;; in Huy / JT's Viz programs so that we can do all the plotting in
;; on window!

