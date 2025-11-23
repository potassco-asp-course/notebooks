final(6).
task(T,L,D) :- T=1..4, L=3, D=6.
before(1,2..3).
  requires(T,N) :- T=1..4, N=1.
    worker(W,C) :- W=1..2, C=1.
