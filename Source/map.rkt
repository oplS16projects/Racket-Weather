#lang racket
(require 2htdp/image)

(define Map (bitmap/file "Map1.png"))
(define Pin (bitmap/file "Pin.png"))

(define scene1 (empty-scene 900 600))

;Map of MA and NH
(define scene2 (place-image Map 450 290 scene1))

;Pin for Lawrence
(define scene3 (place-image Pin 550 160 scene2))

;Pin for Boston
(define scene4 (place-image Pin 560 230 scene3))

;Pin for Lowell
(place-image Pin 520 180 scene4)


