#lang racket
(require plot)
(require (file "get_weather.rkt"))
(require (file "huy_viz.rkt"))


;; Call the get_weather procedure
(get_weather cities_list get_list)

;; Generate the plots for all five cities
(print (gen-graph list-of-json-files "Boston"))                ;; Boston
(print (gen-graph (cdr list-of-json-files) "Lawrence"))        ;; Lawrence
(print (gen-graph (cddr list-of-json-files) "Lowell"))         ;; Lowell
(print (gen-graph (cdddr list-of-json-files) "Worcester"))     ;; Worcester
(print (gen-graph (cddddr list-of-json-files) "Manchester"))   ;; Manchester

;; Now try and run Huy's Viz program.
;; Use another require, and make another provide-all-defined
;; in Huy / JT's Viz programs so that we can do all the plotting in
;; on window!

