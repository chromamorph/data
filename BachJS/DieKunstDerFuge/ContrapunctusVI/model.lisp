(defun rpt (x n)
  (make-list n :initial-element x))

(defun inv (list-of-nums)
  (mapcar #'- list-of-nums))

(defun compute-morphetic-pitch-list (morphetic-contour start-pitch)
  (let* ((morphetic-pitch-list (list (second start-pitch)))
         (prev-pitch (second start-pitch)))
    (dolist (interval morphetic-contour morphetic-pitch-list)
      (setf morphetic-pitch-list (append morphetic-pitch-list (list (+ prev-pitch interval))))
      (setf prev-pitch (car (last morphetic-pitch-list))))))

(defun compute-pitch-list (morphetic-pitch-list scale)
  (mapcar #'(lambda (mp)
              (list (compute-chromatic-pitch mp scale) mp))
          morphetic-pitch-list))

(defun compute-onset-list (rhythm-contour onset-list)
  (if (null rhythm-contour) (reverse onset-list)
      (let* ((new-onset-list (cons (+ (first onset-list)
                                      (* (first rhythm-contour)
                                         (- (first onset-list) (second onset-list))))
                                   onset-list)))
        (compute-onset-list (cdr rhythm-contour)
                            new-onset-list))))

(defun translate-onset-pitch-name-list (onset-pitch-name-pairs time-interval pitch-name-interval
                                        &rest onset-scale-pairs)
  (mapcar #'(lambda (onset-pitch-name-pair)
              (let* ((new-onset (+ time-interval (first onset-pitch-name-pair))))
                (list new-onset 
                      (let* ((new-pn (pn-tran (second onset-pitch-name-pair) pitch-name-interval))
                             (new-mp (pn2mp new-pn)))
                        (if (null onset-scale-pairs) new-pn
                            (let* ((scale (if (listp (second (first onset-scale-pairs)))
                                              (second (find new-onset onset-scale-pairs
                                                            :from-end t
                                                            :key #'first
                                                            :test #'>=))
                                              (first onset-scale-pairs))))
                              (p2pn (list (compute-chromatic-pitch new-mp scale)
                                          new-mp))))))))
          onset-pitch-name-pairs))
