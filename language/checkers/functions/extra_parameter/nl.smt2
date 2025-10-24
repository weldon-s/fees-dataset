(set-logic QF_LIRA)

(declare-fun fee_nl (Real Real Real) Real)
(assert (forall ((max Real) (weigh Real) (extra Real)) 
( = (fee_nl max weigh extra)
(ite (<= weigh 1)
      4.47
      (ite (and (> weigh 1) (<= weigh 2))
          5.22
          (ite (and (> weigh 2) (<= weigh 3))
              5.97
              (ite (and (> weigh 3) (<= weigh 4))
                  6.72
                  (ite (and (> weigh 4) (<= weigh 5))
                      7.47
                      max)))))
)
))
