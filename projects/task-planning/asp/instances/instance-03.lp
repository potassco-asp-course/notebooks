final(6).
task(T,L,D) :- T=1..4, L=1, D=T.
before(T,T+1) :- task(T,_,_), task(T+1,_,_).
