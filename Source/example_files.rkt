#lang racket
(require net/url json 2htdp/batch-io)

;; Read in file
(define json_file (read-file "JSON/Boston,US.json"))

;; Parse to string object
(define json_string (string->jsexpr json_file))

;; Output
(display json_string)
