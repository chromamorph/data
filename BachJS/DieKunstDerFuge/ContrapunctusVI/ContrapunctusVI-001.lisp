;from ps-dphil-intro.lisp

(defun my-bit-vector (non-neg-int requested-width)
  (do* ((min-width (if (/= 0 non-neg-int)
                       (1+ (floor (log non-neg-int 2)))
                       1))
        (actual-width (max requested-width min-width))
        (bit-vec nil)
        (j (1- min-width) (1- j))
        k)
       ((< j 0)
        (do* ((i 1 (1+ i)))
             ((= i (1+ (- actual-width min-width)))
              bit-vec)
          (setf bit-vec (append (list 0) bit-vec))))
    (setf k (floor (* non-neg-int (expt 2 (- j))))
          bit-vec (append bit-vec (list k))
          non-neg-int (- non-neg-int (* k (expt 2 j))))))

(defun pn2p (pn-as-input)
  (if pn-as-input
      (let* ((pn (string pn-as-input))
             (letter-name (elt pn 0))
             (octave-pos (do* ((op 1))
                              ((member (elt pn op)
                                       '(#\- #\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))
                               op)
                           (setf op (1+ op))))
             (inflection (subseq pn 1 octave-pos))
             (asa-octave-number (read-from-string (subseq pn octave-pos)))
             (morph (position (char-upcase letter-name) '(#\A #\B #\C #\D #\E #\F #\G)))
             (undisplaced-chroma (elt '(0 2 3 5 7 8 10) morph))
             (displacement (if (or (string= inflection "")
                                   (char= #\n (char-downcase (elt inflection 0))))
                               0
                               (if (or (char= #\f (char-downcase (elt inflection 0)))
                                       (char= #\b (char-downcase (elt inflection 0))))
                                   (- (length inflection))
                                   (length inflection))))
             (morphetic-octave (if (< morph 2)
                                   asa-octave-number
                                   (1- asa-octave-number)))
             (chromatic-pitch (+ displacement undisplaced-chroma (* 12 morphetic-octave)))
             (morphetic-pitch (+ morph (* 7 morphetic-octave))))
        (list chromatic-pitch morphetic-pitch))))

(defun p2pn (pitch)
  (let (generic-chroma undisplaced-chroma displacement inflection-char
        morph letter-name inflection asa-octave-number)
    (setf morph (mod (elt pitch 1) 7))
    (setf letter-name (elt '("A" "B" "C" "D" "E" "F" "G") morph))
    (setf generic-chroma (- (elt pitch 0) (* 12 (floor (elt pitch 1) 7))))
    (setf undisplaced-chroma (elt '(0 2 3 5 7 8 10) morph))
    (setf displacement (- generic-chroma undisplaced-chroma))
    (setf inflection "")
    (if (/= displacement 0)
        (progn 
          (if (< displacement 0)
              (setf inflection-char "f")
              (setf inflection-char "s"))
          (dotimes (i (abs displacement))
            (setf inflection (concatenate 'string inflection inflection-char))))
        (setf inflection "n"))
    (setf asa-octave-number (floor (elt pitch 1) 7))
    (if (> morph 1)
        (setf asa-octave-number (1+ asa-octave-number)))
    (concatenate 'string letter-name inflection (format nil "~d" asa-octave-number))))

(defun p2pi (p1 p2)
  (list (- (elt p2 0) (elt p1 0))
        (- (elt p2 1) (elt p1 1))))

(defun pn2pin (pn1 pn2)
  (if (and pn1 pn2)
      (pi2pin (p2pi (pn2p pn1) (pn2p pn2)))))

(defun pnc2pinc (pnc1-as-input pnc2-as-input)
  (let* ((pnc1 (string pnc1-as-input))
         (pnc2 (string pnc2-as-input))
         (pn1 (concatenate 'string pnc1 "1"))
         (pn2 (concatenate 'string pnc2 "1"))
         (p1 (pn2p pn1))
         (p2 (pn2p pn2))
         (p2 (if (< (elt p2 1) (elt p1 1))
                 (list (+ 12 (elt p2 0))
                       (+ 7 (elt p2 1)))
                 p2)))
    (pi2pin (p2pi p1 p2))))

(defun pi2pin (pitch-int)
  (let* ((morphetic-pitch-int (elt pitch-int 1))
         (dir-str (if (= 0 morphetic-pitch-int)
                      ""
                      (if (> morphetic-pitch-int 0)
                          "r"
                          "f")))
         (diat-size (+ 1 (abs morphetic-pitch-int)))
         (diat-size-str (format nil "~d" diat-size))
         (abs-morph-int (mod (abs morphetic-pitch-int) 7))
         (undisp-chroma-int (elt '(0 2 4 5 7 9 11) abs-morph-int))
         (undisp-qual (elt '("p" "ma" "ma" "p" "p" "ma" "ma") abs-morph-int))
         (int-disp (if (>= morphetic-pitch-int 0)
                       (- (pi2cgi pitch-int) undisp-chroma-int)
                       (- (pi2cgi (invert-pi pitch-int)) undisp-chroma-int)))
         (quality "")
         (qual-char ""))
    (if (string= undisp-qual "p")
        (if (= int-disp 0)
            (setf quality "p")
            (progn (if (> int-disp 0)
                       (setf qual-char "a")
                       (setf qual-char "d"))
                   (dotimes (i (abs int-disp))
                     (setf quality (concatenate 'string quality qual-char)))))
        (if (= int-disp 0)
            (setf quality "ma")
            (if (= -1 int-disp)
                (setf quality "mi")
                (if (< int-disp -1)
                    (dotimes (i (- (abs int-disp) 1))
                      (setf quality (concatenate 'string quality "d")))
                    (dotimes (i int-disp)
                      (setf quality (concatenate 'string quality "a")))))))
    (concatenate 'string dir-str quality diat-size-str)))

(defun pin2pi (pin)
  (let (i diat-size-str diat-size dir-str undisp-chroma-int
        abs-morph-int undisp-qual quality int-disp undisp-cp-int
        chromatic-pitch-int morphetic-pitch-int)
    (setf dir-str (subseq pin 0 1))
    (if (not (member dir-str '("f" "r") :test #'string=))
        (setf dir-str ""))
    (setf quality "")
    (if (string= dir-str "")
        (setf i 0)
        (setf i 1))
    (do ()
        ((not (and (< i (length pin))
                   (not (member (elt pin i) '(#\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))))))
      (setf quality (concatenate 'string quality (subseq pin i (1+ i))))
      (setf i (1+ i)))
    (setf diat-size-str (subseq pin i (length pin)))
    (setf diat-size (read-from-string diat-size-str))
    (setf morphetic-pitch-int (1- diat-size))
    (if (string= dir-str "f")
        (setf morphetic-pitch-int (- morphetic-pitch-int)))
    (setf abs-morph-int (mod (abs morphetic-pitch-int) 7))
    (setf undisp-chroma-int (elt '(0 2 4 5 7 9 11) abs-morph-int))
    (setf undisp-cp-int (+ undisp-chroma-int (* 12 (floor (abs morphetic-pitch-int) 7))))
    (setf undisp-qual (elt '("p" "ma" "ma" "p" "p" "ma" "ma") abs-morph-int))
    (if (string= undisp-qual "p")
        (if (string= quality "p")
            (setf int-disp 0)
            (if (char= #\a (elt quality 0))
                (setf int-disp (length quality))
                (setf int-disp (- (length quality)))))
        (if (string= quality "ma")
            (setf int-disp 0)
            (if (string= quality "mi")
                (setf int-disp -1)
                (if (char= (elt quality 0) #\a)
                    (setf int-disp (length quality))
                    (setf int-disp (- 0 (length quality) 1))))))
    (if (< morphetic-pitch-int 0)
        (setf chromatic-pitch-int (- (+ int-disp undisp-cp-int)))
        (setf chromatic-pitch-int (+ int-disp undisp-cp-int)))
    (list chromatic-pitch-int morphetic-pitch-int)))

(defun pi2cgi (pitch-int)
  (- (elt pitch-int 0) (* 12 (floor (elt pitch-int 1) 7))))

(defun invert-pi (pitch-int)
  (list (- (elt pitch-int 0))
        (- (elt pitch-int 1))))

#|
(dolist (pnc1 (list 'cn 'dn 'ef 'fn 'gn 'af 'bf))
(dolist (pnc2 (list 'cn 'dn 'ef 'fn 'gn 'af 'bf))
(let* ((pinc (pnc2pinc pnc1 pnc2)))
(if (or (char= #\a (elt pinc 0))
(char= #\d (elt pinc 0))
(char= #\a (elt pinc 1))
(char= #\d (elt pinc 1)))
(pprint (list pnc1 pnc2 pinc))))))

(remove-duplicates (mapcar #'third '((FN BN "ra4")
(BN FN "rd5")
(DN AF "rd5")
(EF BN "ra5")
(FN BN "ra4")
(AF DN "ra4")
(AF BN "ra2")
(BN EF "rd4")
(BN FN "rd5")
(BN AF "rd7")
(EF AN "ra4")
(EF BN "ra5")
(FN BN "ra4")
(AN EF "rd5")
(BN EF "rd4")
(BN FN "rd5")
(EF AN "ra4")
(EF BN "ra5")
(FN BN "ra4")
(AN EF "rd5")
(BN EF "rd4")
(BN FN "rd5")
(DN AF "rd5")
(AF DN "ra4"))) :test #'string=)

|#

(defun pncmidi2pn (pnc midi-note-number)
  (let (inflection displacement undisplaced-midi-note-number asa-octave-number)
    (setf inflection (subseq pnc 1))
    (if (char= (char inflection 0) #\n)
        (setf displacement 0)
        (if (char= (char inflection 0) #\s)
            (setf displacement (length inflection))
            (setf displacement (- (length inflection)))))
    (setf undisplaced-midi-note-number (- midi-note-number displacement))
    (setf asa-octave-number (- (floor undisplaced-midi-note-number 12) 1))
    (concatenate 'string pnc (format nil "~d" asa-octave-number))))

(defun pn-tran (pn pin)
  (p2pn (p-tran (pn2p pn) (pin2pi pin))))

(defun p-tran (p pint)
  (mapcar #'+ p pint))

(defun pin2pinc (pin)
  (let* ((pint (pin2pi pin))
         (cint (first pint))
         (mint (second pint))
         (moct (floor mint 7))
         (pic (list (- cint (* moct 12))
                    (- mint (* moct 7))))
         (pinc (pi2pin pic)))
    pinc))

(defun pinc2lofdisp (pinc)
  (let* ((qual-start (if (char= (char pinc 0)
                                #\r)
                         1 0))
         (qual-end (do* ((i (1+ qual-start) (1+ i)))
                        ((member (char pinc i) (list #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))
                         i)))
         (quality (subseq pinc qual-start qual-end))
         (diatonic-size (read-from-string pinc nil nil :start qual-end))
         (lof-disp-class (mod (* 2 (1- diatonic-size)) 7))
         (lof-disp-cycle (if (string= quality "p")
                             (if (= diatonic-size 4)
                                 -1
                                 0)
                             (if (string= quality "ma")
                                 0
                                 (if (string= quality "mi")
                                     -1
                                     (if (char= #\d (char quality 0))
                                         (if (member diatonic-size (list 1 5))
                                             (- (length quality))
                                             (- 0 (length quality) 1))
                                         (if (char= #\a (char quality 0))
                                             (if (= diatonic-size 4)
                                                 (- (length quality) 1)
                                                 (length quality))
                                             (progn (format t "~%ERROR: pinc2lofdisp unable to process pinc: ~s" pinc)
                                                    (abort))))))))
         (lof-disp (+ lof-disp-class
                      (* lof-disp-cycle 7))))
    lof-disp))

(defun pin2lofdisp (pin)
  (pinc2lofdisp (pin2pinc pin)))

(defun pn2lofpos (pn)
  (let* ((displacement (pn2displacement pn))
         (morph (pn2morph pn))
         (lofposclass (morph2lofposclass morph)))
    (+ lofposclass (* 7 displacement))))

#|
(mapcar #'pn2lofpos
'("Fbb-3" "Cbb-2" "Gbb-1" "Dbb0" "Abb1" "Ebb2" "Bbb3"
"Fb-3" "Cb-2" "Gb-1" "Db0" "Ab1" "Eb2" "Bb3"
"Fn-3" "Cn-2" "Gn-1" "Dn0" "An1" "En2" "Bn3"
"Fs-3" "Cs-2" "Gs-1" "Ds0" "As1" "Es2" "Bs3"
"Fss-3" "Css-2" "Gss-1" "Dss0" "Ass1" "Ess2" "Bss3"))
|#

(defun pn2displacement (pn)
  (let* ((undisplaced-chromatic-pitch (pn2undispcp pn))
         (chromatic-pitch (pn2cp pn)))
    (- chromatic-pitch undisplaced-chromatic-pitch)))

#|
(mapcar #'pn2displacement
'("Fbb-3" "Cbb-2" "Gbb-1" "Dbb0" "Abb1" "Ebb2" "Bbb3"
"Fb-3" "Cb-2" "Gb-1" "Db0" "Ab1" "Eb2" "Bb3"
"Fn-3" "Cn-2" "Gn-1" "Dn0" "An1" "En2" "Bn3"
"Fs-3" "Cs-2" "Gs-1" "Ds0" "As1" "Es2" "Bs3"
"Fss-3" "Css-2" "Gss-1" "Dss0" "Ass1" "Ess2" "Bss3"))
|#

(defun pn2morph (pn)
  (mod (pn2mp pn) 7))

#|
(mapcar #'pn2morph
'("Fbb-3" "Cbb-2" "Gbb-1" "Dbb0" "Abb1" "Ebb2" "Bbb3"
"Fb-3" "Cb-2" "Gb-1" "Db0" "Ab1" "Eb2" "Bb3"
"Fn-3" "Cn-2" "Gn-1" "Dn0" "An1" "En2" "Bn3"
"Fs-3" "Cs-2" "Gs-1" "Ds0" "As1" "Es2" "Bs3"
"Fss-3" "Css-2" "Gss-1" "Dss0" "Ass1" "Ess2" "Bss3"))
|#

(defun pn2mp (pn)
  (second (pn2p pn)))

#|
(mapcar #'pn2mp
'("Fbb-3" "Cbb-2" "Gbb-1" "Dbb0" "Abb1" "Ebb2" "Bbb3"
"Fb-3" "Cb-2" "Gb-1" "Db0" "Ab1" "Eb2" "Bb3"
"Fn-3" "Cn-2" "Gn-1" "Dn0" "An1" "En2" "Bn3"
"Fs-3" "Cs-2" "Gs-1" "Ds0" "As1" "Es2" "Bs3"
"Fss-3" "Css-2" "Gss-1" "Dss0" "Ass1" "Ess2" "Bss3"))
|#

(defun pn2cp (pn)
  (first (pn2p pn)))

#|
(mapcar #'pn2cp
'("Fbb-3" "Cbb-2" "Gbb-1" "Dbb0" "Abb1" "Ebb2" "Bbb3"
"Fb-3" "Cb-2" "Gb-1" "Db0" "Ab1" "Eb2" "Bb3"
"Fn-3" "Cn-2" "Gn-1" "Dn0" "An1" "En2" "Bn3"
"Fs-3" "Cs-2" "Gs-1" "Ds0" "As1" "Es2" "Bs3"
"Fss-3" "Css-2" "Gss-1" "Dss0" "Ass1" "Ess2" "Bss3"))
|#

(defun pn2undispcp (pn)
  (let* ((om (pn2om pn))
         (morph (pn2morph pn))
         (undispchroma (morph2undispchroma morph)))
    (+ (* om 12) undispchroma)))

#|
(mapcar #'pn2undispcp
'("Fbb-3" "Cbb-2" "Gbb-1" "Dbb0" "Abb1" "Ebb2" "Bbb3"
"Fb-3" "Cb-2" "Gb-1" "Db0" "Ab1" "Eb2" "Bb3"
"Fn-3" "Cn-2" "Gn-1" "Dn0" "An1" "En2" "Bn3"
"Fs-3" "Cs-2" "Gs-1" "Ds0" "As1" "Es2" "Bs3"
"Fss-3" "Css-2" "Gss-1" "Dss0" "Ass1" "Ess2" "Bss3"))
|#

(defun morph2undispchroma (morph)
  (elt '(0 2 3 5 7 8 10) morph))

(defun pn2om (pn)
  (floor (pn2mp pn) 7))

#|
(mapcar #'pn2om
'("Fbb-3" "Cbb-2" "Gbb-1" "Dbb0" "Abb1" "Ebb2" "Bbb3"
"Fb-3" "Cb-2" "Gb-1" "Db0" "Ab1" "Eb2" "Bb3"
"Fn-3" "Cn-2" "Gn-1" "Dn0" "An1" "En2" "Bn3"
"Fs-3" "Cs-2" "Gs-1" "Ds0" "As1" "Es2" "Bs3"
"Fss-3" "Css-2" "Gss-1" "Dss0" "Ass1" "Ess2" "Bss3"))
|#

(defun morph2lofposclass (morph)
  (mod (* 2 (+ morph 2)) 7))

#|
(mapcar #'morph2lofposclass '(0 1 2 3 4 5 6))
|#

(defvar *morphetic-contour-1*)
(defvar *inverse-morphetic-contour-1*)
(defvar *rhythm-contour-1*)
(defvar *harmonic-minor*)

(defun rpt (x n)
  (make-list n :initial-element x))

(defun inv (list-of-nums)
  (mapcar #'- list-of-nums))


(setf  *morphetic-contour-1* (append '(4) (rpt -1 5) (rpt 1 4) (rpt -1 3)))
(setf *inverse-morphetic-contour-1* (inv *morphetic-contour-1*))
(setf *rhythm-contour-1* (list 3/4 1/3 3 1/3 4 1 3/4 1/3 11/2 1/11 3 1/3))
;(setf *harmonic-minor* '(2 1 2 2 1 3))
(setf *notes* nil)
(setf *d-ha-mi* '(0 1 4 5 7 8 10))

(defun compute-morphetic-pitch-list (morphetic-contour start-pitch)
  (let* ((morphetic-pitch-list (list (second start-pitch)))
         (prev-pitch (second start-pitch)))
    (dolist (interval morphetic-contour morphetic-pitch-list)
      (setf morphetic-pitch-list (append morphetic-pitch-list (list (+ prev-pitch interval))))
      (setf prev-pitch (car (last morphetic-pitch-list))))))

(defun compute-chromatic-pitch (morphetic-pitch scale)
  (+ (elt (eval scale) (mod morphetic-pitch 7))
     (* 12 (floor morphetic-pitch 7))))

(defun compute-pitch-list (morphetic-pitch-list scale)
  (mapcar #'(lambda (mp)
              (list (compute-chromatic-pitch mp scale) mp))
          morphetic-pitch-list))

(defun p2pn (pitch)
  (let (generic-chroma undisplaced-chroma displacement inflection-char
        morph letter-name inflection asa-octave-number)
    (setf morph (mod (elt pitch 1) 7))
    (setf letter-name (elt '("A" "B" "C" "D" "E" "F" "G") morph))
    (setf generic-chroma (- (elt pitch 0) (* 12 (floor (elt pitch 1) 7))))
    (setf undisplaced-chroma (elt '(0 2 3 5 7 8 10) morph))
    (setf displacement (- generic-chroma undisplaced-chroma))
    (setf inflection "")
    (if (/= displacement 0)
        (progn 
          (if (< displacement 0)
              (setf inflection-char "f")
              (setf inflection-char "s"))
          (dotimes (i (abs displacement))
            (setf inflection (concatenate 'string inflection inflection-char))))
        (setf inflection "n"))
    (setf asa-octave-number (floor (elt pitch 1) 7))
    (if (> morph 1)
        (setf asa-octave-number (1+ asa-octave-number)))
    (concatenate 'string letter-name inflection (format nil "~d" asa-octave-number))))

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
                            (let* ((scale (if (listp (eval (second (first onset-scale-pairs))))
                                             (second (find new-onset onset-scale-pairs
                                                           :from-end t
                                                           :key #'first
                                                           :test #'>=))
                                             (first onset-scale-pairs))))
                              (p2pn (list (compute-chromatic-pitch new-mp scale)
                                          new-mp))))))))
          onset-pitch-name-pairs))

(defvar *pitch-name-list-1*)
(defvar *onset-list-1*)
(defvar *f-ma* '(0 1 3 5 7 8 10))
(defvar *g-ha-mi* '(0 1 3 5 6 9 10))
;; (defvar *entry-11-pitch-name-list*)
(setf *pitch-name-list-1*
      (mapcar #'p2pn (compute-pitch-list (compute-morphetic-pitch-list *morphetic-contour-1* '(29 17))
                                         *d-ha-mi*)))

;; (setf *entry-11-pitch-name-list*
;;       (mapcar #'p2pn (compute-pitch-list (compute-morphetic-pitch-list *morphetic-contour-1* (pn2p "Fn4"))
;;                                          *f-ma*)))

(setf *onset-list-1* (compute-onset-list *rhythm-contour-1* '(16 0)))

(defun compute-contrapunctus-vi ()
  (let* ((entry-1 (mapcar #'list *onset-list-1* *pitch-name-list-1*))
         (entry-5 (translate-onset-pitch-name-list entry-1 224 "rp12"))
         (entry-8 (translate-onset-pitch-name-list entry-1 480 "rp8"))
         (entry-11 (translate-onset-pitch-name-list entry-1 768 "rmi10" *f-ma*))
         (entry-13 (translate-onset-pitch-name-list entry-1 960 "p1" '(960 *d-ha-mi*) '(1084 *g-ha-mi*)))
                                        ; modulates to G minor at end
         (bass (append entry-1))
         (alto (append entry-5 entry-11))
         (tenor (append entry-13)))
    (list alto bass)))

;; (defun compute-scale-from-mode-and-tonic-chroma (mode tonic-chroma)
;;   (let* ((scale (list tonic-chroma))
;;          (prev tonic-chroma))
;;     (dotimes (i 6 scale)
;;       (setf scale (append scale (list (mod (+ prev (elt mode i)) 12))))
;;       (setf prev (first (last scale))))))

;; (defun compute-chromatic-pitch-list (morphetic-pitch-list mode tonic-chroma start-pitch)
;;   (let* ((scale (let* ((s (list tonic-chroma))
;;                        (prev tonic-chroma))
;;                   (dotimes (i 6 s)
;;                     (setf s (append (list (+ prev (elt mode i)))))
;;                     (setf prev (first (last s))))))
;;          (max-mp (apply #'max morphetic-pitch-list))
;;          (min-mp (apply #'min morphetic-pitch-list))
;;          (mpi-from-start-to-min (- min-mp (second start-pitch)))
;;          (min-cp ())
;;          (all-chromatic-pitches (let* ((acp nil))
;;                                   (dotimes (i (- max-mp min-mp) acp)
;;                                     (setf acp (append acp (list )))))))))

;; (defun onset-pitch-voice-triples (morphetic-contour
;;                                   rhythm-contour
;;                                   mode
;;                                   tonic-chroma
;;                                   start-pitch
;;                                   start-tatum
;;                                   start-ioi
;;                                   voice)
;;   (let* ((list-of-morphetic-pitches (compute-morphetic-pitch-list morphetic-contour start-pitch))
;;          (list-of-chromatic-pitches (compute-chromatic-pitch-list list-of-morphetic-pitches
;;                                                                   mode
;;                                                                   tonic-chroma
;;                                                                   start-pitch))
;;          (list-of-onset-times (compute-onset-time-list rhythm-contour start-tatum start-ioi))
;;          (onset-pitch-voice-triples (mapcar #'(lambda (x) (append x (list voice)))
;;                                             (mapcar #'list
;;                                                     list-of-onset-times
;;                                                     list-of-chromatic-pitches
;;                                                     list-of-morphetic-pitches))))
;;     onset-pitch-voice-triples))

;; (append *notes*
;;         (notes *morphetic-contour-1* *rhythm-contour-1* *harmonic-minor* 5 17 0 16))

;; (defun contrapunctus-vi ()
;;   (let* ((morphetic-contour-1 (append '(4) (rpt -1 5) (rpt 1 4) (rpt -1 3))))))
