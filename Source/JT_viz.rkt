#lang racket
(require json 2htdp/batch-io 2htdp/image)

;; This will make it possible to import this file into the Racket Weather driver program.
(provide (all-defined-out))

;; City names
(define boston-forecast "JSON/Boston,US.json")
(define lawrence-forecast "JSON/Lawrence,US.json")
(define lowell-forecast "JSON/Lowell,US.json")
(define worchester-forecast "JSON/Worcester,US.json")
(define manchester-forecast "JSON/Manchester,US.json")

;; List of city names
(define forecast-of-json-files
  (list boston-forecast lawrence-forecast lowell-forecast worchester-forecast manchester-forecast))

;; Variables defined here
(define json_file_forecast '())
(define json_string_forecast '())

(define forecast-n '())

;; list of min / max temps
(define forecast_min '())
(define forecast_max '())

;; List of conditions
(define forecast_cond '())

;; List of dates
(define forecast_dates '())

;; functions definitions.

;; Get min temps
(define (make_min_forecast forecast_temps forecast_min)
  (if (null? forecast_temps)
      ;; Return the list of mins
      forecast_min
      (make_min_forecast (cdr forecast_temps) (cons (hash-ref (hash-ref (car forecast_temps) 'temp) 'min) forecast_min))
  )
)

;; Get max temps
(define (make_max_forecast forecast_temps forecast_max)
  (if (null? forecast_temps)
      ;; Return the list of mins
      forecast_max
      (make_max_forecast (cdr forecast_temps) (cons (hash-ref (hash-ref (car forecast_temps) 'temp) 'max) forecast_max))
  )
)

;; Get weather conditions
(define (make_cond forecast_temps forecast_cond)
  (if (null? forecast_temps)
      ;; Return the list of cond
      forecast_cond
      (make_cond (cdr forecast_temps) (cons (hash-ref (car (hash-ref (car forecast_temps) 'weather)) 'main) forecast_cond))
  )
)

;; Get dates
(define (make_date forecast_temps forecast_date)
  (if (null? forecast_temps)
      ;; Return list of dates
      forecast_date
      (make_date (cdr forecast_temps) (cons (hash-ref (car forecast_temps) 'dt) forecast_date))
  )
)

;; Print the current citie's weather
(define (print_weather0 forecast_date)
  (define curr_date '())
  (printf "     ")  ;; Move dates over a few spaces.
  
  (if (null? forecast_date)
      ;; End of list
      (printf "\n")

      ;; Display date in MONTH/DAY format
      (begin
        ;; Get the current date timestamp
        (set! curr_date (seconds->date (car forecast_date)))

        ;; Print month/day
        (printf "~a/~a\t" (date-month curr_date) (date-day curr_date))
        (print_weather0 (cdr forecast_date))
      )
   )
)

;; Print the current citie's weather
(define (print_weather1 min_list max_list)
  (if (null? min_list)
      ;; End of list
      (printf "\n")

      ;; Display the min then the max, and then loop through the lists.
      (begin
         (printf "~a | ~a\t" (car min_list) (car max_list))
         (print_weather1 (cdr min_list) (cdr max_list))
      )
  )
)

;; Print the current city's weather
(define (print_weather2 cond_list)
  (printf "  ")

  (if (null? cond_list)
      ;; End of list
      (printf "\n")
      
      ;; Display the cond
      (begin
        (cond
          ;; Clear (Sunny)
          ((equal? "Clear" (car cond_list))
                   (print (bitmap/file "WeatherImages/Sunny.png"))
                   (printf "\t"))
          ;; Clouds
          ((equal? "Clouds" (car cond_list))
                   (print (bitmap/file "WeatherImages/Clouds.png"))
                   (printf "\t"))
          ;; Rain
          ((equal? "Rain" (car cond_list))
                   (print (bitmap/file "WeatherImages/Rain.png"))
                   (printf "\t"))
          ;; Snow
          ((equal? "Snow" (car cond_list))
                   (print (bitmap/file "WeatherImages/Snow.png"))
                   (printf "\t"))
          (else (printf "Condition not found.\n"))
        )
        
        (print_weather2 (cdr cond_list))
      )
  )
)

;; Print out min, max and weather condition image.
(define (gen-weather lsts-of-cities name-of-city)
  (if (empty? lsts-of-cities)
      '()
      (begin
        ;; Read file in
        (set! json_file_forecast (read-file (car lsts-of-cities)))

        ;; Parse to string object
        (set! json_string_forecast (string->jsexpr json_file_forecast))

        ;; Get min/max
        (set! forecast-n (hash-ref json_string_forecast 'list))

        ;; list of min / max temps
        (set! forecast_min (make_min_forecast forecast-n '()))
        (set! forecast_max (make_max_forecast forecast-n '()))

        ;; list of conds
        (set! forecast_cond (make_cond forecast-n '()))

        ;; list of dates
        (set! forecast_dates (make_date forecast-n '()))

        ;; Reverse all the lists so the days are in the right order
        ;; (today -> tomorrow -> etc)
        (set! forecast_min (reverse forecast_min))
        (set! forecast_max (reverse forecast_max))
        (set! forecast_cond (reverse forecast_cond))
        (set! forecast_dates (reverse forecast_dates))

        ;; Display City name
        (printf "~a Weather\n" name-of-city)

        ;; Now display everything
        (print_weather0 forecast_dates) ;; Print dates in MONTH/DAY format
        (print_weather1 forecast_min forecast_max) ;print min and then max on same row
        (print_weather2 forecast_cond) ;print image
)))

