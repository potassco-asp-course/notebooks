#program preference(m1,m2).
%new(m1,m2).
new(m1,m2) :- minimize(P,B), P = 0.
better(m1,m2) :- minimize(P,B), P = 0,
  #sum {  W,L :     hold(L,m1), weighted_literal_tuple(B, L,W), L > 0 ;
          W,L : not hold(L,m1), weighted_literal_tuple(B,-L,W), L > 0 ;
         -W,L :     hold(L,m2), weighted_literal_tuple(B, L,W), L > 0 ;
         -W,L : not hold(L,m2), weighted_literal_tuple(B,-L,W), L > 0 } < 0.
