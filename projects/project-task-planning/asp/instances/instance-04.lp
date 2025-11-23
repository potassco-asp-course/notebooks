final(6).
task(T,L,D) :- T=1..2, L=2, D=3.
task(T,L,D) :- T=3,    L=3, D=3.
task(T,L,D) :- T=4..6, L=3, D=6.
before(T,U) :- task(T,_,_), T <= 3, task(U,_,_), U >= 4.
