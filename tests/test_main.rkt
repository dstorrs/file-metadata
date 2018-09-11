#!/usr/bin/env racket

#lang racket

(require ; test-more
         racket/runtime-path
         "../main.rkt"
         )

(define-runtime-path datadir "./data")

;;
;;    A coworker wants to pull this off the package server but
;;    test-more isn't published yet.  For now I'm simply removing all
;;    references to it, and I'll come back and fix it later
;;
;;

;; (void (ok 1 "test harness works"))

;; (when #t
;;   (test-suite
;;    "file-is-type?"

;;    (for ([fpath (map (curry build-path datadir)
;;                      '("gzipped_tar_file.tgz" "gzip_file.gz"))])
;;      (ok (file-is-type? 'gzip fpath) (~a "file '" fpath "' is a gzip")))

;;    (for ([fpath (map (curry build-path datadir)
;;                      '("bzipped_tar_file.tbz2" "tar_file.tar" "text_file" "text_file.txt"))])
;;      (is-false (file-is-type? 'gzip fpath) (~a "file '" fpath "' is NOT a gzip")))
;;    ))

;; (done-testing)
