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

;; Now do hash-ref temp 'max, 'min, etc.
;; You can also iterate through the list to get other days
;; Ex: (car (cdr list)) gets day 2, instead of (car list) which gets day 1.
#|
 Example
> temp
'#hasheq((max . 53.42) (min . 49.75) (day . 51.78) (night . 49.75) (eve . 53.42) (morn . 51.78))
> (hash-ref temp 'max)
53.42
> (hash-ref temp 'min)
49.75
> 
|#
