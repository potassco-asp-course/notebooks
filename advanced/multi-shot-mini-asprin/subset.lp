#program preference(m1,m2).
better(m1,m2) :- minimize(P,B), P = 0,
  1 { not hold(L,m1) :     hold(L,m2), weighted_literal_tuple(B, L,W), L > 0 ;
          hold(L,m1) : not hold(L,m2), weighted_literal_tuple(B,-L,W), L > 0 },
      not hold(L,m1) : not hold(L,m2), weighted_literal_tuple(B, L,W), L > 0 ;
          hold(L,m1) :     hold(L,m2), weighted_literal_tuple(B,-L,W), L > 0 .
