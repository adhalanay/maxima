;;; -*-  Mode: Lisp; Package: Maxima; Syntax: Common-Lisp; Base: 10 -*- ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;     The data in this file contains enhancments.                    ;;;;;
;;;                                                                    ;;;;;
;;;  Copyright (c) 1984,1987 by William Schelter,University of Texas   ;;;;;
;;;     All rights reserved                                            ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;     (c) Copyright 1982 Massachusetts Institute of Technology         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package "MAXIMA")
(macsyma-module csimp2)

(load-macsyma-macros rzmac)

(declare-top (GENPREFIX C/#))

(declare-top (SPLITFILE PLOG)
	 (SPECIAL VAR %P%I VARLIST PLOGABS HALF%PI NN* DN*))

(DEFMFUN SIMPPLOG (X VESTIGIAL Z)
       VESTIGIAL ;Ignored.
       (PROG (VARLIST DD CHECK Y)
	     (ONEARGCHECK X)
	     (SETQ CHECK X)
	     (SETQ X (SIMPCHECK (CADR X) Z))
	     (COND ((EQUAL 0 X) (MERROR "PLOG(0) is undefined"))
		   ((AMONG VAR X) ;This is used in DEFINT. 1/19/81. -JIM
		    (RETURN (EQTEST (LIST '(%PLOG) X) CHECK))))
	     (NEWVAR X)
	     (COND
	      ((AND (EQ '$%I (CAR VARLIST)) (NOT (ORMAPC #'ATOM (CDR VARLIST))))
	       (SETQ DD (TRISPLIT X))
	       (COND ((SETQ Z (PATAN (CAR DD) (CDR DD)))
		      (RETURN (ADD2* (SIMPLN (LIST '(%LOG) 
	(SIMPEXPT (LIST '(MEXPT) ($EXPAND (LIST '(MPLUS)
		(LIST '(MEXPT) (CAR DD) 2)
		(LIST '(MEXPT) (CDR DD) 2))) '((RAT) 1 2)) 1 NIL)) 1 T)
				     (LIST '(MTIMES) Z '$%I))))))
	      ((AND (FREE X '$%I) (EQ ($SIGN X) '$PNZ))
	       (RETURN (EQTEST (LIST '(%PLOG) X) CHECK)))
	      ((AND (EQUAL ($IMAGPART X) 0) (SETQ Y ($ASKSIGN X)))
	       (COND ((EQ Y '$POS) (RETURN (SIMPLN (LIST '(%LOG) X) 1 T)))
		     ((AND PLOGABS (EQ Y '$NEG))
		      (RETURN (SIMPLN (LIST '(%LOG) (LIST '(MTIMES) -1 X)) 1 NIL)))
		      ((EQ Y '$NEG)
		       (RETURN (ADD2 %P%I
				     (SIMPLN (LIST '(%LOG) (LIST '(MTIMES) -1 X)) 1 NIL))))
		     (T (MERROR "PLOG(0) is undefined"))))
	      ((AND (EQUAL ($IMAGPART (SETQ Z (DIV* X '$%I))) 0)
		    (SETQ Y ($ASKSIGN Z)))
	       (COND
		((EQUAL Y '$ZERO) (MERROR "PLOG(0) is undefined"))
		(T (COND ((EQ Y '$POS) (SETQ Y 1))
			 ((EQ Y '$NEG) (SETQ Y -1)))
		   (RETURN (ADD2* (SIMPLN (LIST '(%LOG)
						(LIST '(MTIMES) Y Z)) 1 NIL)
				  (LIST '(MTIMES) Y '((RAT) 1 2) '$%I '$%PI)))))))
	     (RETURN (EQTEST (LIST '(%PLOG) X) CHECK))))

(DEFUN PATAN (R I)
  (LET (($NUMER $NUMER))
       (PROG (A B VAR) 
	     (SETQ I (SIMPLIFYA I NIL) R (SIMPLIFYA R NIL))
	     (COND ((ZEROP1 R)
		    (IF (FLOATP I) (SETQ $NUMER T))
		    (SETQ I ($ASKSIGN I))
		    (COND ((EQUAL I '$POS) (RETURN (SIMPLIFY HALF%PI)))
			  ((EQUAL I '$NEG)
			   (RETURN (MUL2 -1 (SIMPLIFY HALF%PI))))
			  (T (MERROR "ATAN(0//0) has been generated."))))
		   ((ZEROP1 I)
		    (COND ((FLOATP R) (SETQ $NUMER T)))
		    (SETQ R ($ASKSIGN R))
		    (COND ((EQUAL R '$POS) (RETURN 0))
			  ((EQUAL R '$NEG) (RETURN (SIMPLIFY '$%PI)))
			  (T (MERROR "ATAN(0//0) has been generated."))))
		   ((AND (AMONG '%COS R) (AMONG '%SIN I))
		    (SETQ VAR 'XZ)
		    (NUMDEN (DIV* R I))
		    (COND ((AND (EQ (CAAR NN*) '%COS) (EQ (CAAR DN*) '%SIN))
			   (RETURN (CADR NN*))))))
	     (SETQ A ($SIGN R) B ($SIGN I))
	     (COND ((EQ A '$POS) (SETQ A 1))
		   ((EQ A '$NEG) (SETQ A -1))
		   ((EQ A '$ZERO) (SETQ A 0)))
	     (COND ((EQ B '$POS) (SETQ B 1))
		   ((EQ B '$NEG) (SETQ B -1))
		   ((EQ A '$ZERO) (SETQ B 0)))
	     (COND ((EQUAL I 0)
		    (RETURN (IF (EQUAL A 1) 0 (SIMPLIFY '$%PI))))
		   ((EQUAL R 0)
		    (RETURN (COND ((EQUAL B 1) (SIMPLIFY HALF%PI))
				  (T (MUL2 '((RAT SIMP) -1 2)
					   (SIMPLIFY '$%PI)))))))
	     (SETQ R (SIMPTIMES (LIST '(MTIMES) A B (DIV* I R)) 1 NIL))
	     (RETURN (COND ((ONEP1 R)
			    (ARCHK A B (LIST '(MTIMES) '((RAT) 1 4) '$%PI)))
			   ((ALIKE1 R '((MEXPT) 3 ((RAT) 1 2)))
			    (ARCHK A B (LIST '(MTIMES) '((RAT) 1 3) '$%PI)))
			   ((ALIKE1 R '((MEXPT) 3 ((RAT) -1 2)))
			    (ARCHK A B (LIST '(MTIMES) '((RAT) 1 6) '$%PI))))))))

(declare-top (SPLITFILE BINOML))

(DEFMFUN SIMPBINOCOEF (X VESTIGIAL Z) 
 VESTIGIAL ;Ignored.
 (TWOARGCHECK X)
 (LET ((U (SIMPCHECK (CADR X) Z))
       (V (SIMPCHECK (CADDR X) Z))
       (Y))
   (COND ((INTEGERP V)
	  (COND ((MINUSP V)
		 (IF (AND (INTEGERP U) (MINUSP U) (LESSP V U)) (BINCOMP U (*DIF U V)) 0))
		((OR (ZEROP V) (EQUAL U V)) 1)
		((AND (INTEGERP U) (NOT (MINUSP U))) (BINCOMP U (MIN V (*DIF U V))))
		(T (BINCOMP U V))))
	 ((INTEGERP (SETQ Y (SUB U V))) (BINCOMP U Y))
	 ((AND (FLOATP U) (FLOATP V)) ($MAKEGAMMA (LIST '(%BINOMIAL) U V)))
	 (T (EQTEST (LIST '(%BINOMIAL) U V) X)))))

(DEFUN BINCOMP (U V) 
       (COND ((MINUSP V) 0)
	     ((ZEROP V) 1)
	     ((MNUMP U) (BINOCOMP U V))
	     (T (MULN (BINCOMP1 U V) NIL)))) 

(DEFUN BINCOMP1 (U V) 
 (IF (EQUAL V 1)
     (NCONS U)
     (LIST* U (LIST '(MEXPT) V -1) (BINCOMP1 (ADD2 -1 U) (SUB1 V)))))

(DEFMFUN BINOCOMP (U V) 
       (PROG (ANS) 
	     (SETQ ANS 1)
	LOOP (IF (ZEROP V) (RETURN ANS))
	     (SETQ ANS (TIMESK (TIMESK U ANS) (SIMPLIFY (LIST '(RAT) 1 V))))
	     (SETQ U (ADDK -1 U) V (SUB1 V))
	     (GO LOOP)))

(declare-top (SPLITFILE GAMMA) (SPECIAL $NUMER $GAMMALIM))

(DEFMVAR $BETA_ARGS_SUM_TO_INTEGER NIL)

(DEFMFUN SIMPBETA (X VESTIGIAL Z &AUX CHECK)
 VESTIGIAL ;Ignored.
 (TWOARGCHECK X)
 (SETQ CHECK X)
 (LET ((U (SIMPCHECK (CADR X) Z)) (V (SIMPCHECK (CADDR X) Z)))
      (COND ((OR (ZEROP1 U) (ZEROP1 V))
	     (IF ERRORSW (THROW 'ERRORSW T) (MERROR "Zero argument to BETA")))
	    ((OR (AND (FLOATP U) (FLOATP V))
		 (AND $NUMER (NUMBERP U) (NUMBERP V)))
	     ($MAKEGAMMA (LIST '($BETA) U V)))
	    ((OR (AND (INTEGERP U) (PLUSP U)) (AND (INTEGERP V) (PLUSP V)))
	     (SETQ X (ADD2 U V))
	     (POWER (MUL2 (SUB X 1)
			  (SIMPLIFYA (LIST '(%BINOMIAL)
					   (SUB X 2)
					   (SUB (IF (AND (INTEGERP U) (PLUSP U)) U V) 1))
				     T))
		    -1))
	    ((AND (INTEGERP U) (INTEGERP V))
	     (MUL2* (DIV* (LIST '(MFACTORIAL) (SUB1 U))
			  (LIST '(MFACTORIAL) (PLUS U V -1)))
		    (LIST '(MFACTORIAL) (SUB1 V))))
	    ((OR (AND (RATNUMP U) (RATNUMP V) (INTEGERP (SETQ X (ADDK U V))))
		 (AND $BETA_ARGS_SUM_TO_INTEGER
		      (INTEGERP (SETQ X (EXPAND1 (ADD2 U V) 1 1)))))
	     (LET ((W (IF (SYMBOLP V) V U)))
		  (DIV* (MUL2* '$%PI
			       (LIST '(%BINOMIAL)
				     (ADD2 (SUB1 X) (NEG W))
				     (SUB1 X)))
			`((%SIN) ((MTIMES) ,W $%PI)))))
	    (T (EQTEST (LIST '($BETA) U V) CHECK)))))

(DEFMFUN SIMPGAMMA (X VESTIGIAL Z)
 VESTIGIAL ;Ignored.
 (ONEARGCHECK X)
 (LET ((J (SIMPCHECK (CADR X) Z)))
   (COND ((FLOATP J) (GAMMAFLOAT J))
	 ((OR (NOT (MNUMP J))
	      (RATGREATERP (SIMPABS (LIST '(%ABS) J) 1 T) $GAMMALIM))
	  (EQTEST (LIST '(%GAMMA) J) X))
	 ((INTEGERP J)
	  (COND ((GREATERP J 0) (SIMPFACT (LIST '(MFACTORIAL) (SUB1 J)) 1 NIL))
		(ERRORSW (THROW 'ERRORSW T))
		(T (MERROR "GAMMA(~:M) is undefined" J))))
	 ($NUMER (GAMMAFLOAT (FPCOFRAT J)))
	 ((ALIKE1 J '((RAT) 1 2))
	  (LIST '(MEXPT SIMP) '$%PI J))
	 ((OR (RATGREATERP J 1) (RATGREATERP 0 J)) (GAMMARED J))
	 (T (EQTEST (LIST '(%GAMMA) J) X)))))

(declare-top (flonum sum))

(defun gamma (y) ;;; numerical evaluation for 0 < y < 1
       (prog (sum coefs)
	     (setq coefs '(0.035868343 -0.193527817
				       0.48219939
				       -0.75670407
				       0.91820685
				       -0.89705693
				       0.98820588
				       -0.57719165))
	     (or (atom y) (setq y (fpcofrat y)))
	     (setq sum (car coefs) coefs (cdr coefs))
	loop (setq sum (+$ (*$ sum y) (car coefs)))
	     (and (setq coefs (cdr coefs)) (go loop))
	     (return (+$ (//$ 1.0 y) sum))))

(declare-top (notype sum))

(defun gammared (a)					;A is assumed to
       (prog (m q n)					;be '((RAT) M N)
	     (cond ((floatp a) (return (gammafloat a))))
	     (setq m (cadr a)				;Numerator
		   n (caddr a)				;denominator
		   q (abs (*quo m n)))			;integer part
	     (cond ((minusp m)
		    (setq q (add1 q) m (plus m (times n q)))
		    (return
		     (simptimes (list '(mtimes)
				      (list '(mexpt) n q)
				      (simpgamma (list '(%gamma)
						       (list '(rat) m n))
						 1.
						 nil)
				      (list '(mexpt) (gammac m n q) -1.))
				1.
				nil))))
	     (return (m* (gammac m n q)
			 (simpgamma (list '(%gamma)
					  (list '(rat) (remainder m n) n))
				    1 nil)
			 (m^ n (minus q))))))

(defun gammac (m n q)
       (do ((ans 1))
	   ((lessp q 1) ans)
	   (setq q (sub1 q) m (*dif m n) ans (times m ans))))
 
#+nil
(declare-top (flonum a r))

#+nil
(defun gammafloat (a) 
       (cond ((= a 1.0) 1.0)
	     ((= a 0.0) (merror "GAMMA(0.0) has been generated."))	
	     ((and (> a 0.0) (> 1.0 a)) (gamma a))
	     ((or (> a 34.82) (< a -34.12))
	      (merror "GAMMA(~A) - arithmetic overflow" a))
	     (t (do-gammafloat a))))

;
;(defun gammafloat (a)
;  (cond ((= a 1.0) 1.0)
;	((= a 0.0) (merror "GAMMA(0.0) has been generated."))	
;	((and (> a 0.0) (> 1.0 a)) (gamma a))
;	(t (condition-case ()
;	       (do-gammafloat a)
;	     (dbg:floating-exponent-overflow 
;	       (merror "GAMMA(~A) - arithmetic overflow" a))))))

#+nil
(defun do-gammafloat (a)
  (do ((r 1.0 (*$ z r))
       (s (minusp a)) (z (abs a)))
      ((not (greaterp z 1.0))
       (setq r (*$ r (gamma z)))
       (cond (s (t//$ -3.141592654 (*$ a r (sin (*$ 3.141592654 a))) 'gamma))
	     (t r))) 
    (setq z (1-$ z))))

;; This implementation is based on Lanczos convergent formula for the
;; gamma function for Re(z) > 0.  We can use the reflection formula
;;
;;    -z*Gamma(z)*Gamma(-z) = pi/sin(pi*z)
;;
;; to handle the case of Re(z) <= 0.
;;
;; See http://winnie.fit.edu/~gabdo/gamma.m for some matlab code to
;; compute this and http://winnie.fit.edu/~gabdo/gamma.txt for a nice
;; discussion of Lanczos method and an improvement of Lanczos method.
;;
;;
;; The document says this should give about 15 digits of accuracy for
;; double-precision IEEE floats.  The document also indicates how to
;; compute a new set of coefficients if you need more range or
;; accuracy.

(defun gamma-lanczos (z)
  (declare (type (complex double-float) z)
	   (optimize (safety 3)))
  (let ((g 607/128)
	(c (make-array 15 :element-type 'double-float
		       :initial-contents
		       '(0.99999999999999709182d0
			 57.156235665862923517d0
			 -59.597960355475491248d0
			 14.136097974741747174d0
			 -0.49191381609762019978d0
			 .33994649984811888699d-4
			 .46523628927048575665d-4
			 -.98374475304879564677d-4
			 .15808870322491248884d-3
			 -.21026444172410488319d-3
			 .21743961811521264320d-3
			 -.16431810653676389022d-3
			 .84418223983852743293d-4
			 -.26190838401581408670d-4
			 .36899182659531622704d-5))))
    (declare (type (rational 607/128 607/128) g)
	     (type (simple-array double-float (15)) c))
    (if (minusp (realpart z))
	;; Use the reflection formula
	;; -z*Gamma(z)*Gamma(-z) = pi/sin(pi*z)
	;; or
	;; Gamma(z) = pi/z/sin(pi*z)/Gamma(-z)
	;;
	;; If z is a negative integer, Gamma(z) is infinity.  Should
	;; we test for this?  Throw an error?  What
	(/ (float pi 1d0)
	   (* (- z) (sin (* (float pi 1d0)
			    z))
	      (gamma-lanczos (- z))))
	(let* ((z (- z 1))
	       (zh (+ z 1/2))
	       (zgh (+ zh 607/128))
	       (zp (expt zgh (/ zh 2)))
	       (ss 
		 (do ((sum 0d0)
		      (pp (1- (length c)) (1- pp)))
		     ((< pp 1)
		      sum)
		   (incf sum (/ (aref c pp) (+ z pp))))
		 ))
	  (* (sqrt (float (* 2 pi) 1d0))
	     (+ ss (aref c 0))
	     (* zp (exp (- zgh)) zp))))))

(defun gammafloat (a)
  (realpart (gamma-lanczos (complex a 0d0))))

(declare-top (notype a r))

(declare-top (SPLITFILE ERF) (SPECIAL $NUMER $TRIGSIGN))

(defmfun simperf (x vestigial z &aux y)
 vestigial ;Ignored.
 (oneargcheck x)
 (setq y (simpcheck (cadr x) z))
 (cond ((zerop1 y) y)
       ((or (floatp y) (and $numer (integerp y))) (erf (float y)))
       ((eq y '$inf) 1)
       ((eq y '$minf) -1)
       ((and $trigsign (mminusp* y)) (neg (list '(%erf simp) (neg y))))
       (t (eqtest (list '(%erf) y) x))))

#+nil
(defmfun erf (y)
       (cond ((> (abs y) 4.0) (cond ((> y 0.0) 1.0) (t -1.0)))
	     (t ((lambda (t1 xf)
		   (declare (flonum t1 xf))
		   (setq t1 (//$ (1+$ (*$ xf 0.3275911))))
		   (setq 
		    t1
		    (-$
		     1.0
		     (*$
		      (exp (minus (*$ xf xf)))
		      (*$ (+$ (*$ (+$ (*$ (+$ (*$ (+$ (*$ t1
							  1.06140543)
						      -1.45315203)
						  t1)
					      1.42141373)
					  t1)
				      -0.28449674)
				  t1)
			      0.25482959)
			  t1))))
		   (cond ((> y 0.0) t1) (t (minus t1))))
		  0.0
		  (abs y)))))

(defmfun erf (y)
  (slatec:derf (float y 1d0)))
(defmfun erfc (y)
  (slatec:derfc (float y 1d0)))


(declare-top (SPLITFILE EMATRIX))

(DEFMFUN $ZEROMATRIX (M N) ($EMATRIX M N 0 1 1))

(DEFMFUN $EMATRIX (M N VAR I J)
       (PROG (ANS ROW) 
       (COND ((EQUAL M 0) (RETURN (NCONS '($MATRIX SIMP))))
	     ((AND (EQUAL N 0) (FIXNUMP M) (> M 0))
	      (RETURN (CONS '($MATRIX SIMP) (LIST-OF-MLISTS M))))
	     ((NOT (AND (FIXNUMP M) (FIXNUMP N)
			(FIXNUMP I) (FIXNUMP J)
			(> M 0) (> N 0) (> I 0) (> J 0)))
	      (MERROR "Incorrect argument to EMATRIX:~%~M"
		      (LIST '(MLIST SIMP) M N I J) )))
	LOOP (COND ((= M I) (SETQ ROW (ONEN J N VAR 0)) (GO ON))
		   ((ZEROP M) (RETURN (CONS '($MATRIX) (MXC ANS)))))
	     (SETQ ROW NIL)
	     (DO ((N N (f1- N))) ((ZEROP N)) (SETQ ROW (CONS 0 ROW)))
	ON   (SETQ ANS (CONS ROW ANS) M (f1- M))
	     (GO LOOP)))

(DEFUN LIST-OF-MLISTS (N)
 (DO ((N N (f1- N)) (L NIL (CONS (NCONS '(MLIST SIMP)) L))) ((= N 0) L)))

(declare-top (SPLITFILE COEFM) (SPECIAL $RATMX))

(DEFMFUN $COEFMATRIX (EQL VARL) (COEFMATRIX EQL VARL NIL))

(DEFMFUN $AUGCOEFMATRIX (EQL VARL) (COEFMATRIX EQL VARL T))

(DEFUN COEFMATRIX (EQL VARL IND)
       (PROG (ANS ROW A B ELEM)
	     (IF (NOT ($LISTP EQL)) (IMPROPER-ARG-ERR EQL '$COEFMATRIX))
	     (IF (NOT ($LISTP VARL)) (IMPROPER-ARG-ERR VARL '$COEFMATRIX))
	     (DOLIST (V (CDR VARL))
	       (IF (AND (NOT (ATOM V)) (MEMQ (CAAR V) '(MPLUS MTIMES)))
		   (MERROR "Improper variable to COEFMATRIX:~%~M" V)))
	     (SETQ EQL (NREVERSE (MAPCAR #'MEQHK (CDR EQL)))
		   VARL (REVERSE (CDR VARL)))
	LOOP1(IF (NULL EQL) (RETURN (CONS '($MATRIX) (MXC ANS))))
	     (SETQ A (CAR EQL) EQL (CDR EQL) ROW NIL)
	     (IF IND (SETQ ROW (CONS (CONST1 A VARL) ROW)))
	     (SETQ B VARL)
	LOOP2(SETQ ELEM (RATCOEF A (CAR B)))
	     (SETQ ROW (CONS (IF $RATMX ELEM (RATDISREP ELEM)) ROW))
	     (IF (SETQ B (CDR B)) (GO LOOP2))
	     (SETQ ANS (CONS ROW ANS))
	     (GO LOOP1)))

(DEFUN CONST1 (E VARL) (DOLIST (V VARL) (SETQ E (MAXIMA-SUBSTITUTE 0 V E))) E)


(declare-top (SPLITFILE ENTERM))

(DEFMFUN $ENTERMATRIX (ROWS COLUMNS)
       (PROG (ROW COLUMN VECTOR MATRIX SYM SYMVECTOR)
	     (COND ((OR (NOT (FIXNUMP ROWS))
			(NOT (FIXNUMP COLUMNS)))
		    (MERROR "ENTERMATRIX called with non-integer arguments")))
	     (SETQ ROW 0)
	     (COND ((NOT (= ROWS COLUMNS)) (SETQ SYM NIL) (GO OLOOP)))
	QUEST(PRINC "
Is the matrix  1. Diagonal  2. Symmetric  3. Antisymmetric  4. General
Answer 1, 2, 3 or 4 : ")	     (SETQ SYM (RETRIEVE NIL NIL))
	     (COND ((NOT (zl-MEMBER SYM '(1 2 3 4))) (GO QUEST)))
	OLOOP(COND ((> (SETQ ROW (f1+ ROW)) ROWS)
		    (format t "~%Matrix entered.~%")
		    (RETURN (CONS '($MATRIX) (MXC MATRIX)))))
	     (COND ((EQUAL SYM 1)
		    (SETQ COLUMN ROW)
		    (PRINC "Row ") (PRINC ROW) (PRINC " Column ")
		    (PRINC COLUMN) (PRINC ":  ") 
		    (SETQ MATRIX
		     (NCONC MATRIX
		      (NCONS (ONEN ROW COLUMNS (MEVAL (RETRIEVE NIL NIL)) 0))))
		    (GO OLOOP))
		   ((EQUAL SYM 2)
		    (SETQ COLUMN (f1- ROW))
		    (COND ((EQUAL ROW 1) (GO ILOOP)))
		    (SETQ SYMVECTOR 
		           (CONS (NTHCDR COLUMN VECTOR) SYMVECTOR)
		          VECTOR (NREVERSE (MAPCAR 'CAR SYMVECTOR))
			  SYMVECTOR (MAPCAR 'CDR SYMVECTOR))
		    (GO ILOOP))
		   ((EQUAL SYM 3)
		    (SETQ COLUMN ROW)
		    (COND ((EQUAL ROW 1) (SETQ VECTOR (NCONS 0)) (GO ILOOP)))
		    (SETQ SYMVECTOR
			  (CONS (MAPCAR 'NEG
					(NTHCDR (f1- COLUMN) VECTOR))
				SYMVECTOR)
			  VECTOR (NRECONC (MAPCAR 'CAR SYMVECTOR) (NCONS 0))
			  SYMVECTOR (MAPCAR 'CDR SYMVECTOR))
		    (GO ILOOP)))	 	
	     (SETQ COLUMN 0 VECTOR NIL)
	ILOOP(COND ((> (SETQ COLUMN (f1+ COLUMN)) COLUMNS)
		    (SETQ MATRIX (NCONC MATRIX (NCONS VECTOR)))
		    (GO OLOOP)))
	     (PRINC "Row ") (PRINC ROW) (PRINC " Column ")
	     (PRINC COLUMN) (PRINC ":  ") 
	     (SETQ VECTOR (NCONC VECTOR (NCONS (MEVAL (RETRIEVE NIL NIL)))))
	     (GO ILOOP)))

(declare-top (splitfile xthru) (special sn* sd* rsn*))

(DEFMFUN $xthru (e)
       (cond ((atom e) e)
	     ((mtimesp e) (muln (mapcar '$xthru (cdr e)) nil))
	     ((mplusp e) (simplify (comdenom (mapcar '$xthru (cdr e)) t)))
	     ((mexptp e) (power ($xthru (cadr e)) (caddr e)))
	     ((memq (caar e) '(mequal mlist $matrix))
	      (cons (car e) (mapcar '$xthru (cdr e))))
	     (t e))) 

(defun comdenom (l ind) 
  (prog (n d) 
	(prodnumden (car l))
	(setq n (m*l sn*) sn* nil)
	(setq d (m*l sd*) sd* nil)
   loop	(setq l (cdr l))
	(cond ((null l)
	       (return (cond (ind (div* (cond (rsn* ($ratsimp n))
					      (t n))
					d))
			     (t (list n d))))))
	(prodnumden (car l))
	(setq d (comdenom1 n d (m*l sn*) (m*l sd*)))
	(setq n (car d))
	(setq d (cadr d))
	(go loop)))

(defun prodnumden (e) 
 (cond ((atom e) (prodnd (list e)))
       ((eq (caar e) 'mtimes) (prodnd (cdr e)))
       (t (prodnd (list e)))))

(defun prodnd (l) 
	 (prog (e) 
	       (setq l (reverse l))
	       (setq sn* nil sd* nil)
	  loop (cond ((null l) (return nil)))
	       (setq e (car l))
	       (cond ((atom e) (setq sn* (cons e sn*)))
		     ((ratnump e)
		      (cond ((not (equal 1. (cadr e)))
			     (setq sn* (cons (cadr e) sn*))))
		      (setq sd* (cons (caddr e) sd*)))
		     ((and (eq (caar e) 'mexpt)
			   (mnegp (caddr e)))
		      (setq sd* (cons (power (cadr e)
					     (timesk -1 (caddr e)))
				      sd*)))
		     (t (setq sn* (cons e sn*))))
	       (setq l (cdr l))
	       (go loop)))

(defun comdenom1 (a b c d) 
       (prog (b1 c1) 
	     (prodnumden (div* b d))
	     (setq b1 (m*l sn*) sn* nil)
	     (setq c1 (m*l sd*) sd* nil)
	     (return
	      (list (add2 (m* a c1) (m* c b1))
		    (mul2 d b1)))))

(declare-top (SPLITFILE XRTOUT)
	 (SPECIAL $GLOBALSOLVE $BACKSUBST $DISPFLAG $NOLABELS
		  $LINSOLVE_PARAMS $%RNUM_LIST AX LINELABLE $LINECHAR 
		  $LINENUM SOL *MOSESFLAG) 
	 (FIXNUM TIM $LINENUM))

(DEFUN XRUTOUT (AX N M VARL IND)
 (LET (($LINSOLVE_PARAMS (AND $BACKSUBST $LINSOLVE_PARAMS)))
  (PROG (IX IMIN J ANS ZZ M-1 SOL TIM CHK ZZZ)
	(SETQ AX (GET-ARRAY-POINTER AX) TIM 0)
	(IF $LINSOLVE_PARAMS (SETQ $%RNUM_LIST (LIST '(MLIST))))
	(SETQ IMIN (MIN (SETQ M-1 (f1- M)) N))
	(SETQ IX (MAX IMIN (LENGTH VARL)))
   LOOP (IF (ZEROP IX) (IF IND (GO OUT) (RETURN (CONS '(MLIST) ZZ))))
        (WHEN (OR (> IX IMIN) (EQUAL (CAR (ARRAYCALL T AX IX IX)) 0))
	      (STORE (ARRAYCALL T AX 0 IX)
		     (RFORM (IF $LINSOLVE_PARAMS (MAKE-PARAM) (ITH VARL IX))))
	      (IF $LINSOLVE_PARAMS (GO SAVAL) (GO NEXT)))
	(SETQ ANS (ARRAYCALL T AX IX M))
	(STORE (ARRAYCALL T AX IX M) NIL)
	(DO ((J (f1+ IX) (f1+ J))) ((> J M-1))
	    (SETQ ANS (RATDIF ANS (RATTIMES (ARRAYCALL T AX IX J) 
					    (ARRAYCALL T AX 0 J)
					    T)))
	    (STORE (ARRAYCALL T AX IX J ) NIL))
	(STORE (ARRAYCALL T AX 0 IX) (RATQUOTIENT ANS (ARRAYCALL T AX IX IX)))
	(STORE (ARRAYCALL T AX IX IX ) NIL)
	(SETQ ANS NIL)
   SAVAL(PUSH (COND (*MOSESFLAG (ARRAYCALL T AX 0 IX)) 
		    (T (LIST (IF $GLOBALSOLVE '(MSETQ) '(MEQUAL))
			     (ITH VARL IX)
			     (SIMPLIFY (RDIS (ARRAYCALL T AX 0 IX))))))
	      ZZ)
        (IF (NOT $BACKSUBST)
	    (STORE (ARRAYCALL T AX 0 IX) (RFORM (ITH VARL IX))))
	(AND $GLOBALSOLVE (MEVAL (CAR ZZ)))
   NEXT (SETQ IX (f1- IX))
	(GO LOOP)
   OUT
	(COND ($DISPFLAG (MTELL "Solution~%")))
	(SETQ J 1 SOL (LIST '(MLIST)) CHK (CHECKLABEL $LINECHAR))
	(DO ((LL ZZ (CDR LL))) ((NULL LL)) (SETQ ZZZ (CAR LL))
	   (SETQ ZZZ (LIST '(MLABLE)
			   (PROGN (IF CHK (SETQ CHK NIL)
				      (SETQ $LINENUM (f1+ $LINENUM)))
				  ((LAMBDA ($NOLABELS)(MAKELABEL $LINECHAR))
				   (AND $NOLABELS $GLOBALSOLVE))
				  LINELABLE)
			   (COND ((NOT (AND $NOLABELS $GLOBALSOLVE))
				  (SET LINELABLE ZZZ)))))
	   (NCONC SOL (NCONS LINELABLE))
	   (COND ($DISPFLAG (SETQ TIM (RUNTIME))
			    (MTELL-OPEN "~%~M" ZZZ)
			    (TIMEORG TIM))
		 (T (PUTPROP LINELABLE T 'NODISP))))
	(RETURN SOL))))
