#lang racket

(define input-file "input.txt")
(define test-input-file "test_input.txt")
(define desired-sum 2020)

(define (read-file-data f)
  (map string->number (file->lines f)))

(define (part-1 f)
  (let ([l (read-file-data f)])
    (foldl * 1 (for*/first ([a (in-list l)]
                #:when (member (- 2020 a) l))
      (list a (- 2020 a))))))


(define (part-2 f)
  (let ([l (read-file-data)])
    ))

