#lang racket/base

(require racket/runtime-path
         racket/function
         racket/contract/base
         racket/contract/region
         )

(provide current-file-path
         file-is-type?)

;   All functions will accept a path or an input port.  If nothing is
;   provided it will use (current-input-port)

;   (gzip-file? path-or-port
(define-runtime-path definitions-path "./definitions")
(define definitions (make-parameter #f))
(define definitions/c (hash/c symbol? (hash/c symbol? any/c)))
(define current-file-path (make-parameter #f
                                          (lambda (v)
                                            (when (not (path-string? v))
                                              (raise-argument-error 'current-file-path
                                                                    "path-string"
                                                                    v))
                                            v)))


(define/contract (file-is-type? type [which (current-file-path)])
  (->* (symbol?) (path-string?) boolean?)
  
  (with-input-from-file
    which
    (thunk
     ; (match type ...) would be less cluttered but would need an
     ; additional include (i.e. racket/match)
     (cond [(equal? type 'gzip)  
            (bytes=? #"\x1F\x8B" (read-bytes 2))])))
  )
