(set-logic QF_LIRA)

; Define a function fee_nl that computes the total tax owed based on taxable income
(declare-fun fee_nl (Real) Real)

(assert
  (forall ((income Real))
    (= (fee_nl income)
       (+
         ; 14.5% on the first $57,375
         (ite (> income 0)
              (* 0.145 (ite (< income 57375) income 57375))
              0)

         ; 20.5% on the portion over $57,375 up to $114,750
         (ite (> income 57375)
              (* 0.205 (-
                 (ite (< income 114750) income 114750)
                 57375))
              0)

         ; 26% on the portion over $114,750 up to $177,882
         (ite (> income 114750)
              (* 0.26 (-
                 (ite (< income 177882) income 177882)
                 114750))
              0)

         ; 29% on the portion over $177,882 up to $253,414
         (ite (> income 177882)
              (* 0.29 (-
                 (ite (< income 253414) income 253414)
                 177882))
              0)

         ; 33% on the portion over $253,414
         (ite (> income 253414)
              (* 0.33 (- income 253414))
              0)
       )
    )
  )
)
