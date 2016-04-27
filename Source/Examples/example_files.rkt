#lang racket
(require net/url json 2htdp/batch-io)

;; Read in file
(define json_file (read-file "JSON/Boston,US.json"))

;; Parse to string object
(define json_string (string->jsexpr json_file))

;; Output JSON string
;(display json_string)

;; Get min/max
(define list (hash-ref json_string 'list))
(define temp (hash-ref (car list) 'temp))

;; Get min temps
(define (make_min list_temps list_min)
  (if (null? list_temps)
      ;; Return the list of mins
      list_min
      (make_min (cdr list_temps) (cons (hash-ref (hash-ref (car list_temps) 'temp) 'min) list_min))
  )
)

;; Get max temps
(define (make_max list_temps list_max)
  (if (null? list_temps)
      ;; Return the list of mins
      list_max
      (make_max (cdr list_temps) (cons (hash-ref (hash-ref (car list_temps) 'temp) 'max) list_max))
  )
)

(define list_min (make_min list '()))
(define list_max (make_max list '()))
 
#|
Example output:

> list_min
'(50.4 46.99 45.48 45.27 46.49 46.96 52.84 38.91 41.16 49.75)
> list_max
'(55.62 55.06 55.18 54.03 53.24 54.97 69.82 65.39 50.41 53.42)
> (car list_min)
50.4
> (car list_max)
55.62

|#
