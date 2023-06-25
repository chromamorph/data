(mapcar #'(lambda (filename)
            (load (merge-pathnames filename *load-truename*)))
        (list "pitch.lisp" "model-002.lisp"))

(defun compute-contrapunctus-vi ()
  (let* ((d-ha-mi (compute-scale "Dn" 'ha 'mi))
         (f-me-ma (compute-scale "Fn" 'me 'ma))
         (g-ha-mi (compute-scale "Gn" 'ha 'mi))
         (morphetic-contour-1 (append '(4) (rpt -1 5) (rpt 1 4) (rpt -1 3)))
         (rhythm-contour-1 (list 3/4 1/3 3 1/3 4 1 3/4 1/3 11/2 1/11 3 1/3))
         (morphetic-pitch-list-1 (compute-morphetic-pitch-list morphetic-contour-1 '(29 17)))
         (pitch-name-list-1 (mapcar #'p2pn (compute-pitch-list morphetic-pitch-list-1 d-ha-mi)))
         (onset-list-1 (compute-onset-list rhythm-contour-1 '(16 0)))
         (entry-1 (mapcar #'list onset-list-1 pitch-name-list-1))
         (entry-2 (transform entry-1
                             :time-interval 32
                             :pitch-name-interval "rp19"
                             :invert t
                             :time-scale-factor 1/2
                             :scale d-ha-mi))
         (entry-5 (transform entry-1
                             :time-interval 224
                             :pitch-name-interval "rp12"))
         (entry-8 (transform entry-1
                             :time-interval 480
                             :pitch-name-interval "rp8"))
         (entry-11 (transform entry-1
                              :time-interval 768
                              :pitch-name-interval "rmi10"
                              :scale f-me-ma))
         (entry-13 (transform entry-1
                              :time-interval 960
                              :pitch-name-interval "p1"
                              :onset-scale-pairs (list (list 960 d-ha-mi) (list 1084 g-ha-mi))))
         (bass (list entry-1))
         (alto (list entry-5 entry-11))
         (tenor (list entry-8 entry-13))
         (soprano (list entry-2)))
    (list soprano alto tenor bass)))

(setf contrapunctus (compute-contrapunctus-vi))
