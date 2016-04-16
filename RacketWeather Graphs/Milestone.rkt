#lang racket
(require plot)

(define boston-high-xs '( 1 2 3 4 5 6 7 8 9 10))
(define boston-high-ys '( 52.54 46.47 50.09 52.02 50.18 49.6 58.01 48.47 44.29 53.69))
(define boston-low-xs '( 1 2 3 4 5 6 7 8 9 10))
(define boston-low-ys '( 46.47 42.13 38.01 43.77 37.72 38.79 46.45 45.57 37.96 39.22))
(define boston-day-xs '(1 2 3 4 5 6 7 8 9 10))
(define boston-day-ys '(49.505 44.3 44.05 47.895 43.95 44.195 42.23 47.02 41.125 46.455))

(define lawrence-high-xs '( 1 2 3 4 5 6 7 8 9 10))
(define lawrence-high-ys '(81.77 78.24 79.74 69.51 75.09 72.1 66.54 71.53 74.48 75.76))
(define lawrence-low-xs '( 1 2 3 4 5 6 7 8 9 10))
(define lawrence-low-ys '(67.68 64.06 60.98 62.6 59 58.41 60.1 54.27 50.54 51.49))
(define lawrence-average-xs '( 1 2 3 4 5 6 7 8 9 10))
(define lawrence-average-ys '(74.725 71.15 70.36 66.055 67.045 65.255 63.32 62.9 62.51 63.625 ))

=
      


(list (plot (list (lines (map vector  boston-high-xs  boston-high-ys)
                   #:color 'red
                   #:label "High"
                   )
            (points (map vector  boston-high-xs  boston-high-ys)
                   #:color 'red
                   
                   )
            (lines (map vector boston-low-xs boston-low-ys)
                   #:color 'blue
                   #:label "Low"
                   )
             (points (map vector boston-low-xs boston-low-ys)
                   #:color 'blue
                  
                   )
             (lines (map vector boston-day-xs boston-day-ys)
                   #:color 'black
                   #:label "Average Temp"
                   )
             (points (map vector boston-day-xs boston-day-ys)
                   #:color 'black
                   ))
   
      #:x-label "Days"
      #:y-label "Temperature in Fahrenheit"
      #:title "Boston 10-Day Forecast Graph")
      (plot (list (lines (map vector  lawrence-high-xs  lawrence-high-ys)
                   #:color 'red
                   #:label "High"
                   )
            (points (map vector  lawrence-high-xs  lawrence-high-ys)
                   #:color 'red
                   
                   )
            (lines (map vector lawrence-low-xs lawrence-low-ys)
                   #:color 'blue
                   #:label "Low"
                   )
             (points (map vector lawrence-low-xs lawrence-low-ys)
                   #:color 'blue
                  
                   )
             (lines (map vector lawrence-average-xs lawrence-average-ys)
                   #:color 'black
                   #:label "Average Temp"
                   )
             (points (map vector lawrence-average-xs lawrence-average-ys)
                   #:color 'black
                   ))
   
      #:x-label "Days"
      #:y-label "Temperature in Fahrenheit"
      #:title "Lawrence 10-Day Forecast Graph")

      )

