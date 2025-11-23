final(4).
task(T,L,D) :- T=1..4, L=2, D=6.
  requires(T,N) :- T=1..4, N=2.
    worker(W,C) :- W=1..4, C=W.
requires(T,N,C) :- T=1..4, N=1, C=T.
requires(1,1,2).
