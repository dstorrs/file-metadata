#lang racket/base

(hash 'name               'gzip
      'file-signature     #"\37\213"  ; 1F 8B
      'signature-offset   0
      'extensions         '(.gz .tar.gz)
      )
