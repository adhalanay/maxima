;;; Compiled by f2cl version 2.0 beta on 2002/04/25 at 13:19:03
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':simple-array)
;;;           (:array-slicing nil) (:declare-common nil)
;;;           (:float-format double-float))

(in-package "SLATEC")


(let ((n1 14)
      (n2 23)
      (n3 19)
      (n4 15)
      (m1 12)
      (m2 21)
      (m3 17)
      (m4 13)
      (fpi12 1.30899693899575)
      (con2 5.03154716196777)
      (con3 0.380004589867293)
      (con4 0.833333333333333)
      (con5 0.8660254037844392)
      (ak1 (make-array 14 :element-type 'double-float))
      (ak2 (make-array 23 :element-type 'double-float))
      (ak3 (make-array 14 :element-type 'double-float))
      (ajp (make-array 19 :element-type 'double-float))
      (ajn (make-array 19 :element-type 'double-float))
      (a (make-array 15 :element-type 'double-float))
      (b (make-array 15 :element-type 'double-float))
      (n1d 14)
      (n2d 24)
      (n3d 19)
      (n4d 15)
      (m1d 12)
      (m2d 22)
      (m3d 17)
      (m4d 13)
      (dak1 (make-array 14 :element-type 'double-float))
      (dak2 (make-array 24 :element-type 'double-float))
      (dak3 (make-array 14 :element-type 'double-float))
      (dajp (make-array 19 :element-type 'double-float))
      (dajn (make-array 19 :element-type 'double-float))
      (da (make-array 15 :element-type 'double-float))
      (db (make-array 15 :element-type 'double-float)))
  (declare (type (simple-array double-float (24)) dak2)
           (type (simple-array double-float (15)) db da b a)
           (type (simple-array double-float (19)) dajn dajp ajn ajp)
           (type (simple-array double-float (23)) ak2)
           (type (simple-array double-float (14)) dak3 dak1 ak3 ak1)
           (type double-float con5 con4 con3 con2 fpi12)
           (type f2cl-lib:integer4 m4d m3d m2d m1d n4d n3d n2d n1d m4 m3 m2 m1
            n4 n3 n2 n1))
  (f2cl-lib:fset (f2cl-lib:fref ak1 (1) ((1 14))) 0.220423090987793)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (2) ((1 14))) -0.1252902427877)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (3) ((1 14))) 0.0103881163359194)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (4) ((1 14))) 8.228441520063431e-4)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (5) ((1 14))) -2.3461434589122598e-4)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (6) ((1 14))) 1.6382428017211603e-5)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (7) ((1 14))) 3.06902589573189e-7)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (8) ((1 14))) -1.29621999359332e-7)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (9) ((1 14))) 8.229081588236679e-9)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (10) ((1 14))) 1.5396396862329798e-11)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (11) ((1 14))) -3.3916546561568195e-11)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (12) ((1 14))) 2.0325325742362604e-12)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (13) ((1 14))) -1.10679546097884e-14)
  (f2cl-lib:fset (f2cl-lib:fref ak1 (14) ((1 14))) -5.1616949778508e-15)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (1) ((1 23))) 0.274366150869598)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (2) ((1 23))) 0.005397909697369031)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (3) ((1 23))) -0.0015733922062118998)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (4) ((1 23))) 4.274275282487501e-4)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (5) ((1 23))) -1.12124917399925e-4)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (6) ((1 23))) 2.8876317131890405e-5)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (7) ((1 23))) -7.368042253705539e-6)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (8) ((1 23))) 1.87290209741024e-6)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (9) ((1 23))) -4.75892793962291e-7)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (10) ((1 23))) 1.2113041695590901e-7)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (11) ((1 23))) -3.09245374270614e-8)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (12) ((1 23))) 7.924547052826542e-9)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (13) ((1 23))) -2.0390244716791406e-9)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (14) ((1 23))) 5.268630565957421e-10)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (15) ((1 23))) -1.36704767639569e-10)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (16) ((1 23))) 3.561410390137079e-11)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (17) ((1 23))) -9.3138829654843e-12)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (18) ((1 23))) 2.44464450473635e-12)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (19) ((1 23))) -6.43840261990955e-13)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (20) ((1 23))) 1.7010603055934903e-13)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (21) ((1 23))) -4.5076010450328097e-14)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (22) ((1 23))) 1.19774799164811e-14)
  (f2cl-lib:fset (f2cl-lib:fref ak2 (23) ((1 23))) -3.1907704086506605e-15)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (1) ((1 14))) 0.280271447340791)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (2) ((1 14))) -0.00178127042844379)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (3) ((1 14))) 4.034225796289991e-5)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (4) ((1 14))) -1.6324996526900298e-6)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (5) ((1 14))) 9.21181482476768e-8)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (6) ((1 14))) -6.522943302291551e-9)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (7) ((1 14))) 5.471384045765461e-10)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (8) ((1 14))) -5.244082518002599e-11)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (9) ((1 14))) 5.60477904117209e-12)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (10) ((1 14))) -6.56375244639313e-13)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (11) ((1 14))) 8.31285761966247e-14)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (12) ((1 14))) -1.12705134691063e-14)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (13) ((1 14))) 1.6226797659812903e-15)
  (f2cl-lib:fset (f2cl-lib:fref ak3 (14) ((1 14))) -2.4648032431242603e-16)
  (f2cl-lib:fset (f2cl-lib:fref ajp (1) ((1 19))) 0.0778952966437581)
  (f2cl-lib:fset (f2cl-lib:fref ajp (2) ((1 19))) -0.184356363456801)
  (f2cl-lib:fset (f2cl-lib:fref ajp (3) ((1 19))) 0.030141260521617398)
  (f2cl-lib:fset (f2cl-lib:fref ajp (4) ((1 19))) 0.0305342724277608)
  (f2cl-lib:fset (f2cl-lib:fref ajp (5) ((1 19))) -0.004954247025130791)
  (f2cl-lib:fset (f2cl-lib:fref ajp (6) ((1 19))) -0.0017274955256395199)
  (f2cl-lib:fset (f2cl-lib:fref ajp (7) ((1 19))) 2.4313763783918999e-4)
  (f2cl-lib:fset (f2cl-lib:fref ajp (8) ((1 19))) 5.045647775170821e-5)
  (f2cl-lib:fset (f2cl-lib:fref ajp (9) ((1 19))) -6.163165826952081e-6)
  (f2cl-lib:fset (f2cl-lib:fref ajp (10) ((1 19))) -9.03986745510768e-7)
  (f2cl-lib:fset (f2cl-lib:fref ajp (11) ((1 19))) 9.70243778355884e-8)
  (f2cl-lib:fset (f2cl-lib:fref ajp (12) ((1 19))) 1.09639453305205e-8)
  (f2cl-lib:fset (f2cl-lib:fref ajp (13) ((1 19))) -1.0471633058876599e-9)
  (f2cl-lib:fset (f2cl-lib:fref ajp (14) ((1 19))) -9.603594413446459e-11)
  (f2cl-lib:fset (f2cl-lib:fref ajp (15) ((1 19))) 8.253587894541341e-12)
  (f2cl-lib:fset (f2cl-lib:fref ajp (16) ((1 19))) 6.36123439018768e-13)
  (f2cl-lib:fset (f2cl-lib:fref ajp (17) ((1 19))) -4.9662961411601503e-14)
  (f2cl-lib:fset (f2cl-lib:fref ajp (18) ((1 19))) -3.29810288929615e-15)
  (f2cl-lib:fset (f2cl-lib:fref ajp (19) ((1 19))) 2.3579825203110397e-16)
  (f2cl-lib:fset (f2cl-lib:fref ajn (1) ((1 19))) 0.038049788761724206)
  (f2cl-lib:fset (f2cl-lib:fref ajn (2) ((1 19))) -0.24531954184554602)
  (f2cl-lib:fset (f2cl-lib:fref ajn (3) ((1 19))) 0.165820623702696)
  (f2cl-lib:fset (f2cl-lib:fref ajn (4) ((1 19))) 0.0749330045818789)
  (f2cl-lib:fset (f2cl-lib:fref ajn (5) ((1 19))) -0.0263476288106641)
  (f2cl-lib:fset (f2cl-lib:fref ajn (6) ((1 19))) -0.00592535597304981)
  (f2cl-lib:fset (f2cl-lib:fref ajn (7) ((1 19))) 0.00144744409589804)
  (f2cl-lib:fset (f2cl-lib:fref ajn (8) ((1 19))) 2.18311831322215e-4)
  (f2cl-lib:fset (f2cl-lib:fref ajn (9) ((1 19))) -4.1066207768030405e-5)
  (f2cl-lib:fset (f2cl-lib:fref ajn (10) ((1 19))) -4.6687499417176603e-6)
  (f2cl-lib:fset (f2cl-lib:fref ajn (11) ((1 19))) 7.152188072771599e-7)
  (f2cl-lib:fset (f2cl-lib:fref ajn (12) ((1 19))) 6.52964770854633e-8)
  (f2cl-lib:fset (f2cl-lib:fref ajn (13) ((1 19))) -8.442840275659461e-9)
  (f2cl-lib:fset (f2cl-lib:fref ajn (14) ((1 19))) -6.441861589769781e-10)
  (f2cl-lib:fset (f2cl-lib:fref ajn (15) ((1 19))) 7.208022865052851e-11)
  (f2cl-lib:fset (f2cl-lib:fref ajn (16) ((1 19))) 4.72465431717846e-12)
  (f2cl-lib:fset (f2cl-lib:fref ajn (17) ((1 19))) -4.6602263254704496e-13)
  (f2cl-lib:fset (f2cl-lib:fref ajn (18) ((1 19))) -2.6776271038918903e-14)
  (f2cl-lib:fset (f2cl-lib:fref ajn (19) ((1 19))) 2.3616131657001907e-15)
  (f2cl-lib:fset (f2cl-lib:fref a (1) ((1 15))) 0.490275424742791)
  (f2cl-lib:fset (f2cl-lib:fref a (2) ((1 15))) 0.00157647277946204)
  (f2cl-lib:fset (f2cl-lib:fref a (3) ((1 15))) -9.66195963140306e-5)
  (f2cl-lib:fset (f2cl-lib:fref a (4) ((1 15))) 1.35916080268815e-7)
  (f2cl-lib:fset (f2cl-lib:fref a (5) ((1 15))) 2.98157342654859e-7)
  (f2cl-lib:fset (f2cl-lib:fref a (6) ((1 15))) -1.8682476755997898e-8)
  (f2cl-lib:fset (f2cl-lib:fref a (7) ((1 15))) -1.0368573766714102e-9)
  (f2cl-lib:fset (f2cl-lib:fref a (8) ((1 15))) 3.28660818434328e-10)
  (f2cl-lib:fset (f2cl-lib:fref a (9) ((1 15))) -2.5709141063278e-11)
  (f2cl-lib:fset (f2cl-lib:fref a (10) ((1 15))) -2.3235765530067695e-12)
  (f2cl-lib:fset (f2cl-lib:fref a (11) ((1 15))) 9.575232790482551e-13)
  (f2cl-lib:fset (f2cl-lib:fref a (12) ((1 15))) -1.2034082804971902e-13)
  (f2cl-lib:fset (f2cl-lib:fref a (13) ((1 15))) -2.9090771677071503e-15)
  (f2cl-lib:fset (f2cl-lib:fref a (14) ((1 15))) 4.5565645458014903e-15)
  (f2cl-lib:fset (f2cl-lib:fref a (15) ((1 15))) -9.99003874810259e-16)
  (f2cl-lib:fset (f2cl-lib:fref b (1) ((1 15))) 0.278593552803079)
  (f2cl-lib:fset (f2cl-lib:fref b (2) ((1 15))) -0.00352915691882584)
  (f2cl-lib:fset (f2cl-lib:fref b (3) ((1 15))) -2.31149677384994e-5)
  (f2cl-lib:fset (f2cl-lib:fref b (4) ((1 15))) 4.7131784226356e-6)
  (f2cl-lib:fset (f2cl-lib:fref b (5) ((1 15))) -1.12415907931333e-7)
  (f2cl-lib:fset (f2cl-lib:fref b (6) ((1 15))) -2.0010030118433902e-8)
  (f2cl-lib:fset (f2cl-lib:fref b (7) ((1 15))) 2.6094807530219305e-9)
  (f2cl-lib:fset (f2cl-lib:fref b (8) ((1 15))) -3.55098136101216e-11)
  (f2cl-lib:fset (f2cl-lib:fref b (9) ((1 15))) -3.50849978423875e-11)
  (f2cl-lib:fset (f2cl-lib:fref b (10) ((1 15))) 5.830071879542019e-12)
  (f2cl-lib:fset (f2cl-lib:fref b (11) ((1 15))) -2.04644828753326e-13)
  (f2cl-lib:fset (f2cl-lib:fref b (12) ((1 15))) -1.1052917947674198e-13)
  (f2cl-lib:fset (f2cl-lib:fref b (13) ((1 15))) 2.87724778038775e-14)
  (f2cl-lib:fset (f2cl-lib:fref b (14) ((1 15))) -2.8820511100993906e-15)
  (f2cl-lib:fset (f2cl-lib:fref b (15) ((1 15))) -3.32656311696166e-16)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (1) ((1 14))) 0.204567842307887)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (2) ((1 14))) -0.0661322739905664)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (3) ((1 14))) -0.00849845800989287)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (4) ((1 14))) 0.0031218349155628902)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (5) ((1 14))) -2.70016489829432e-4)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (6) ((1 14))) -6.356362986793869e-6)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (7) ((1 14))) 3.0239771240950897e-6)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (8) ((1 14))) -2.1831119533008797e-7)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (9) ((1 14))) -5.361942893328261e-10)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (10) ((1 14))) 1.1309803562231e-9)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (11) ((1 14))) -7.43023834629073e-11)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (12) ((1 14))) 4.2880417082689104e-13)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (13) ((1 14))) 2.23810925754539e-13)
  (f2cl-lib:fset (f2cl-lib:fref dak1 (14) ((1 14))) -1.39140135641182e-14)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (1) ((1 24))) 0.29333234388323)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (2) ((1 24))) -0.00806196784743112)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (3) ((1 24))) 0.0024254017233314)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (4) ((1 24))) -6.82297548850235e-4)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (5) ((1 24))) 1.85786427751181e-4)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (6) ((1 24))) -4.974574476840591e-5)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (7) ((1 24))) 1.3209068123949702e-5)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (8) ((1 24))) -3.4952824044494296e-6)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (9) ((1 24))) 9.24362451078835e-7)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (10) ((1 24))) -2.4473267152186698e-7)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (11) ((1 24))) 6.4930783764891e-8)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (12) ((1 24))) -1.72717621501538e-8)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (13) ((1 24))) 4.6072576360465606e-9)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (14) ((1 24))) -1.2324905529154999e-9)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (15) ((1 24))) 3.30620409488102e-10)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (16) ((1 24))) -8.892520997724009e-11)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (17) ((1 24))) 2.3977331987829795e-11)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (18) ((1 24))) -6.480139211534499e-12)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (19) ((1 24))) 1.75510132023731e-12)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (20) ((1 24))) -4.7630382983363695e-13)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (21) ((1 24))) 1.2949824110081e-13)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (22) ((1 24))) -3.5267962221043e-14)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (23) ((1 24))) 9.62005151585923e-15)
  (f2cl-lib:fset (f2cl-lib:fref dak2 (24) ((1 24))) -2.62786914342292e-15)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (1) ((1 14))) 0.284675828811349)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (2) ((1 14))) 0.0025307307261908003)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (3) ((1 14))) -4.83481130337976e-5)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (4) ((1 14))) 1.8490728394634298e-6)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (5) ((1 14))) -1.01418491178576e-7)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (6) ((1 14))) 7.059256344571531e-9)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (7) ((1 14))) -5.85325291400382e-10)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (8) ((1 14))) 5.563576888313391e-11)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (9) ((1 14))) -5.908890947794999e-12)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (10) ((1 14))) 6.88574353784436e-13)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (11) ((1 14))) -8.68588256452194e-14)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (12) ((1 14))) 1.17374762617213e-14)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (13) ((1 14))) -1.68523146510923e-15)
  (f2cl-lib:fset (f2cl-lib:fref dak3 (14) ((1 14))) 2.5537477309705603e-16)
  (f2cl-lib:fset (f2cl-lib:fref dajp (1) ((1 19))) 0.0653219131311457)
  (f2cl-lib:fset (f2cl-lib:fref dajp (2) ((1 19))) -0.120262933688823)
  (f2cl-lib:fset (f2cl-lib:fref dajp (3) ((1 19))) 0.00978010236263823)
  (f2cl-lib:fset (f2cl-lib:fref dajp (4) ((1 19))) 0.016794842923050498)
  (f2cl-lib:fset (f2cl-lib:fref dajp (5) ((1 19))) -0.00197146140182132)
  (f2cl-lib:fset (f2cl-lib:fref dajp (6) ((1 19))) -8.45560295098867e-4)
  (f2cl-lib:fset (f2cl-lib:fref dajp (7) ((1 19))) 9.428896207019759e-5)
  (f2cl-lib:fset (f2cl-lib:fref dajp (8) ((1 19))) 2.25827860945475e-5)
  (f2cl-lib:fset (f2cl-lib:fref dajp (9) ((1 19))) -2.29067870915987e-6)
  (f2cl-lib:fset (f2cl-lib:fref dajp (10) ((1 19))) -3.7634399113691896e-7)
  (f2cl-lib:fset (f2cl-lib:fref dajp (11) ((1 19))) 3.4566393355956504e-8)
  (f2cl-lib:fset (f2cl-lib:fref dajp (12) ((1 19))) 4.2961133200300705e-9)
  (f2cl-lib:fset (f2cl-lib:fref dajp (13) ((1 19))) -3.58673691214989e-10)
  (f2cl-lib:fset (f2cl-lib:fref dajp (14) ((1 19))) -3.5724588136189495e-11)
  (f2cl-lib:fset (f2cl-lib:fref dajp (15) ((1 19))) 2.7269609106633597e-12)
  (f2cl-lib:fset (f2cl-lib:fref dajp (16) ((1 19))) 2.2612065309577098e-13)
  (f2cl-lib:fset (f2cl-lib:fref dajp (17) ((1 19))) -1.5876320523830303e-14)
  (f2cl-lib:fset (f2cl-lib:fref dajp (18) ((1 19))) -1.1260437448512499e-15)
  (f2cl-lib:fset (f2cl-lib:fref dajp (19) ((1 19))) 7.313275295153671e-17)
  (f2cl-lib:fset (f2cl-lib:fref dajn (1) ((1 19))) 0.0108594539632967)
  (f2cl-lib:fset (f2cl-lib:fref dajn (2) ((1 19))) 0.0853313194857091)
  (f2cl-lib:fset (f2cl-lib:fref dajn (3) ((1 19))) -0.315277068113058)
  (f2cl-lib:fset (f2cl-lib:fref dajn (4) ((1 19))) -0.0878420725294257)
  (f2cl-lib:fset (f2cl-lib:fref dajn (5) ((1 19))) 0.0553251906976048)
  (f2cl-lib:fset (f2cl-lib:fref dajn (6) ((1 19))) 0.009416740605032411)
  (f2cl-lib:fset (f2cl-lib:fref dajn (7) ((1 19))) -0.00332187026018996)
  (f2cl-lib:fset (f2cl-lib:fref dajn (8) ((1 19))) -4.1115734315682606e-4)
  (f2cl-lib:fset (f2cl-lib:fref dajn (9) ((1 19))) 1.0129732689134603e-4)
  (f2cl-lib:fset (f2cl-lib:fref dajn (10) ((1 19))) 9.876336822083961e-6)
  (f2cl-lib:fset (f2cl-lib:fref dajn (11) ((1 19))) -1.8731296981239298e-6)
  (f2cl-lib:fset (f2cl-lib:fref dajn (12) ((1 19))) -1.5079850013146798e-7)
  (f2cl-lib:fset (f2cl-lib:fref dajn (13) ((1 19))) 2.3268766952539402e-8)
  (f2cl-lib:fset (f2cl-lib:fref dajn (14) ((1 19))) 1.5959991741922502e-9)
  (f2cl-lib:fset (f2cl-lib:fref dajn (15) ((1 19))) -2.0766592266838502e-10)
  (f2cl-lib:fset (f2cl-lib:fref dajn (16) ((1 19))) -1.24103350500302e-11)
  (f2cl-lib:fset (f2cl-lib:fref dajn (17) ((1 19))) 1.39631765331043e-12)
  (f2cl-lib:fset (f2cl-lib:fref dajn (18) ((1 19))) 7.3940097115574e-14)
  (f2cl-lib:fset (f2cl-lib:fref dajn (19) ((1 19))) -7.328874756275e-15)
  (f2cl-lib:fset (f2cl-lib:fref da (1) ((1 15))) 0.49162732110460106)
  (f2cl-lib:fset (f2cl-lib:fref da (2) ((1 15))) 0.00311164930427489)
  (f2cl-lib:fset (f2cl-lib:fref da (3) ((1 15))) 8.23140762854081e-5)
  (f2cl-lib:fset (f2cl-lib:fref da (4) ((1 15))) -4.6176977617214193e-6)
  (f2cl-lib:fset (f2cl-lib:fref da (5) ((1 15))) -6.13158880534626e-8)
  (f2cl-lib:fset (f2cl-lib:fref da (6) ((1 15))) 2.8729580465652e-8)
  (f2cl-lib:fset (f2cl-lib:fref da (7) ((1 15))) -1.8195971537211703e-9)
  (f2cl-lib:fset (f2cl-lib:fref da (8) ((1 15))) -1.44752826642035e-10)
  (f2cl-lib:fset (f2cl-lib:fref da (9) ((1 15))) 4.5372404342042194e-11)
  (f2cl-lib:fset (f2cl-lib:fref da (10) ((1 15))) -3.99655065847223e-12)
  (f2cl-lib:fset (f2cl-lib:fref da (11) ((1 15))) -3.24089119830323e-13)
  (f2cl-lib:fset (f2cl-lib:fref da (12) ((1 15))) 1.6209895256874102e-13)
  (f2cl-lib:fset (f2cl-lib:fref da (13) ((1 15))) -2.4076524797405702e-14)
  (f2cl-lib:fset (f2cl-lib:fref da (14) ((1 15))) 1.6938481128449098e-16)
  (f2cl-lib:fset (f2cl-lib:fref da (15) ((1 15))) 8.17900786477396e-16)
  (f2cl-lib:fset (f2cl-lib:fref db (1) ((1 15))) -0.277571356944231)
  (f2cl-lib:fset (f2cl-lib:fref db (2) ((1 15))) 0.0044421283341992005)
  (f2cl-lib:fset (f2cl-lib:fref db (3) ((1 15))) -8.42328522190089e-5)
  (f2cl-lib:fset (f2cl-lib:fref db (4) ((1 15))) -2.5804031841870995e-6)
  (f2cl-lib:fset (f2cl-lib:fref db (5) ((1 15))) 3.4238972021762104e-7)
  (f2cl-lib:fset (f2cl-lib:fref db (6) ((1 15))) -6.24286894709776e-9)
  (f2cl-lib:fset (f2cl-lib:fref db (7) ((1 15))) -2.3637783684457703e-9)
  (f2cl-lib:fset (f2cl-lib:fref db (8) ((1 15))) 3.16991042656673e-10)
  (f2cl-lib:fset (f2cl-lib:fref db (9) ((1 15))) -4.4099569165819097e-12)
  (f2cl-lib:fset (f2cl-lib:fref db (10) ((1 15))) -5.186742210935751e-12)
  (f2cl-lib:fset (f2cl-lib:fref db (11) ((1 15))) 9.64874015137022e-13)
  (f2cl-lib:fset (f2cl-lib:fref db (12) ((1 15))) -4.9019057660870996e-14)
  (f2cl-lib:fset (f2cl-lib:fref db (13) ((1 15))) -1.77253430678112e-14)
  (f2cl-lib:fset (f2cl-lib:fref db (14) ((1 15))) 5.55950610442662e-15)
  (f2cl-lib:fset (f2cl-lib:fref db (15) ((1 15))) -7.117933375795299e-16)
  (defun djairy (x rx c ai dai)
    (declare (type double-float dai ai c rx x))
    (prog ((ccv 0.0) (cv 0.0) (ec 0.0) (e1 0.0) (e2 0.0) (f1 0.0) (f2 0.0)
           (rtrx 0.0) (scv 0.0) (t_ 0.0) (temp1 0.0) (temp2 0.0) (tt 0.0) (i 0)
           (j 0))
      (declare (type f2cl-lib:integer4 j i)
               (type double-float tt temp2 temp1 t_ scv rtrx f2 f1 e2 e1 ec cv
                ccv))
      (if (< x 0.0) (go label90))
      (if (> c 5.0) (go label60))
      (if (> x 1.2) (go label30))
      (setf t_ (* (- (+ x x) 1.2) con4))
      (setf tt (+ t_ t_))
      (setf j n1)
      (setf f1 (f2cl-lib:fref ak1 (j) ((1 14))))
      (setf f2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m1) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref ak1 (j) ((1 14)))))
          (setf f2 temp1)
         label10))
      (setf ai (+ (- (* t_ f1) f2) (f2cl-lib:fref ak1 (1) ((1 14)))))
      (setf j n1d)
      (setf f1 (f2cl-lib:fref dak1 (j) ((1 14))))
      (setf f2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m1d) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref dak1 (j) ((1 14)))))
          (setf f2 temp1)
         label20))
      (setf dai (- (+ (- (* t_ f1) f2) (f2cl-lib:fref dak1 (1) ((1 14))))))
      (go end_label)
     label30
      (setf t_ (* (- (+ x x) con2) con3))
      (setf tt (+ t_ t_))
      (setf j n2)
      (setf f1 (f2cl-lib:fref ak2 (j) ((1 23))))
      (setf f2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m2) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref ak2 (j) ((1 23)))))
          (setf f2 temp1)
         label40))
      (setf rtrx (f2cl-lib:fsqrt rx))
      (setf ec (exp (- c)))
      (setf ai
              (/ (* ec (+ (- (* t_ f1) f2) (f2cl-lib:fref ak2 (1) ((1 23)))))
                 rtrx))
      (setf j n2d)
      (setf f1 (f2cl-lib:fref dak2 (j) ((1 24))))
      (setf f2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m2d) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref dak2 (j) ((1 24)))))
          (setf f2 temp1)
         label50))
      (setf dai
              (* (- ec)
                 (+ (- (* t_ f1) f2) (f2cl-lib:fref dak2 (1) ((1 24))))
                 rtrx))
      (go end_label)
     label60
      (setf t_ (- (/ 10.0 c) 1.0))
      (setf tt (+ t_ t_))
      (setf j n1)
      (setf f1 (f2cl-lib:fref ak3 (j) ((1 14))))
      (setf f2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m1) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref ak3 (j) ((1 14)))))
          (setf f2 temp1)
         label70))
      (setf rtrx (f2cl-lib:fsqrt rx))
      (setf ec (exp (- c)))
      (setf ai
              (/ (* ec (+ (- (* t_ f1) f2) (f2cl-lib:fref ak3 (1) ((1 14)))))
                 rtrx))
      (setf j n1d)
      (setf f1 (f2cl-lib:fref dak3 (j) ((1 14))))
      (setf f2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m1d) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref dak3 (j) ((1 14)))))
          (setf f2 temp1)
         label80))
      (setf dai
              (* (- rtrx)
                 ec
                 (+ (- (* t_ f1) f2) (f2cl-lib:fref dak3 (1) ((1 14))))))
      (go end_label)
     label90
      (if (> c 5.0) (go label120))
      (setf t_ (- (* 0.4 c) 1.0))
      (setf tt (+ t_ t_))
      (setf j n3)
      (setf f1 (f2cl-lib:fref ajp (j) ((1 19))))
      (setf e1 (f2cl-lib:fref ajn (j) ((1 19))))
      (setf f2 0.0)
      (setf e2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m3) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf temp2 e1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref ajp (j) ((1 19)))))
          (setf e1 (+ (- (* tt e1) e2) (f2cl-lib:fref ajn (j) ((1 19)))))
          (setf f2 temp1)
          (setf e2 temp2)
         label100))
      (setf ai
              (- (+ (- (* t_ e1) e2) (f2cl-lib:fref ajn (1) ((1 19))))
                 (* x (+ (- (* t_ f1) f2) (f2cl-lib:fref ajp (1) ((1 19)))))))
      (setf j n3d)
      (setf f1 (f2cl-lib:fref dajp (j) ((1 19))))
      (setf e1 (f2cl-lib:fref dajn (j) ((1 19))))
      (setf f2 0.0)
      (setf e2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m3d) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf temp2 e1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref dajp (j) ((1 19)))))
          (setf e1 (+ (- (* tt e1) e2) (f2cl-lib:fref dajn (j) ((1 19)))))
          (setf f2 temp1)
          (setf e2 temp2)
         label110))
      (setf dai
              (+ (* x x (+ (- (* t_ f1) f2) (f2cl-lib:fref dajp (1) ((1 19)))))
                 (+ (- (* t_ e1) e2) (f2cl-lib:fref dajn (1) ((1 19))))))
      (go end_label)
     label120
      (setf t_ (- (/ 10.0 c) 1.0))
      (setf tt (+ t_ t_))
      (setf j n4)
      (setf f1 (f2cl-lib:fref a (j) ((1 15))))
      (setf e1 (f2cl-lib:fref b (j) ((1 15))))
      (setf f2 0.0)
      (setf e2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m4) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf temp2 e1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref a (j) ((1 15)))))
          (setf e1 (+ (- (* tt e1) e2) (f2cl-lib:fref b (j) ((1 15)))))
          (setf f2 temp1)
          (setf e2 temp2)
         label130))
      (setf temp1 (+ (- (* t_ f1) f2) (f2cl-lib:fref a (1) ((1 15)))))
      (setf temp2 (+ (- (* t_ e1) e2) (f2cl-lib:fref b (1) ((1 15)))))
      (setf rtrx (f2cl-lib:fsqrt rx))
      (setf cv (- c fpi12))
      (setf ccv (cos cv))
      (setf scv (sin cv))
      (setf ai (/ (- (* temp1 ccv) (* temp2 scv)) rtrx))
      (setf j n4d)
      (setf f1 (f2cl-lib:fref da (j) ((1 15))))
      (setf e1 (f2cl-lib:fref db (j) ((1 15))))
      (setf f2 0.0)
      (setf e2 0.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i m4d) nil)
        (tagbody
          (setf j (f2cl-lib:int-sub j 1))
          (setf temp1 f1)
          (setf temp2 e1)
          (setf f1 (+ (- (* tt f1) f2) (f2cl-lib:fref da (j) ((1 15)))))
          (setf e1 (+ (- (* tt e1) e2) (f2cl-lib:fref db (j) ((1 15)))))
          (setf f2 temp1)
          (setf e2 temp2)
         label140))
      (setf temp1 (+ (- (* t_ f1) f2) (f2cl-lib:fref da (1) ((1 15)))))
      (setf temp2 (+ (- (* t_ e1) e2) (f2cl-lib:fref db (1) ((1 15)))))
      (setf e1 (+ (* ccv con5) (* 0.5 scv)))
      (setf e2 (- (* scv con5) (* 0.5 ccv)))
      (setf dai (* (- (* temp1 e1) (* temp2 e2)) rtrx))
      (go end_label)
     end_label
      (return (values nil nil nil ai dai)))))

