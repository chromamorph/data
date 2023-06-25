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

(defun invert (onset-pitch-name-pairs)
  (let* ((first-pn (second (first onset-pitch-name-pairs))))
    (mapcar #'(lambda (onset-pitch-name-pair)
                (let* ((this-pn (second onset-pitch-name-pair))
                       (this-onset (first onset-pitch-name-pair))
                       (i (pn2pin this-pn first-pn)))
                  (list this-onset (pn-tran (pn-tran this-pn i) i))))
            onset-pitch-name-pairs)))

#|
(invert '((0 "An4") (1 "Bn4") (2 "Cn5") (3 "Dn5")))
|#

(defun compute-rhythm-contour (onset-pitch-name-pairs)
  (let* ((duration-list (let ((dl nil))
                          (dotimes (i (- (list-length onset-pitch-name-pairs) 2) (reverse dl))
                            (setf dl (cons (- (first (elt onset-pitch-name-pairs (1+ i)))
                                              (first (elt onset-pitch-name-pairs i)))
                                           dl)))))
         (rhythm-contour (mapcar #'(lambda (this-duration next-duration)
                                     (/ next-duration this-duration))
                                 (butlast duration-list)
                                 (cdr duration-list))))
    rhythm-contour))

(defun time-scale (onset-pitch-name-pairs scale-factor)
  (let* ((rhythm-contour (compute-rhythm-contour onset-pitch-name-pairs))
         (new-onset-list (compute-onset-list rhythm-contour (list (* scale-factor
                                                                     (- (first (second onset-pitch-name-pairs))
                                                                        (first (first onset-pitch-name-pairs))))
                                                                  (first (first onset-pitch-name-pairs))))))
    (mapcar #'(lambda (onset-pitch-name-pair new-onset)
                (list new-onset
                      (second onset-pitch-name-pair)))
            onset-pitch-name-pairs
            new-onset-list)))

(defun transform (onset-pitch-name-pairs &key (time-interval nil)
                                              (pitch-name-interval nil)
                                              (scale nil)
                                              (onset-scale-pairs nil)
                                              (invert nil)
                                              (time-scale-factor nil))
  (let* ((onset-pitch-name-pairs-after-inversion
           (if invert
               (invert onset-pitch-name-pairs)
               onset-pitch-name-pairs))
         (onset-pitch-name-pairs-after-inversion-and-scaling
           (if time-scale-factor
               (time-scale onset-pitch-name-pairs-after-inversion time-scale-factor)
               onset-pitch-name-pairs-after-inversion))
         (output (mapcar #'(lambda (onset-pitch-name-pair)
                             (let* ((new-onset (+ time-interval (first onset-pitch-name-pair))))
                               (list new-onset 
                                     (let* ((new-pn (pn-tran (second onset-pitch-name-pair) pitch-name-interval))
                                            (new-mp (pn2mp new-pn)))
                                       (if (null onset-scale-pairs) new-pn
                                           (let* ((sca (if onset-scale-pairs
                                                           (second (find new-onset onset-scale-pairs
                                                                         :from-end t
                                                                         :key #'first
                                                                         :test #'>=))
                                                           scale)))
                                             (p2pn (list (compute-chromatic-pitch new-mp sca)
                                                         new-mp))))))))
                         onset-pitch-name-pairs-after-inversion-and-scaling)))
    output))
