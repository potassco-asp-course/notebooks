final(6).
task(T,L,D) :- T=1..3, L=3, D=6.
before(1,2).
uses(T,R) :- T=1..3, R=1.
uses(T,R) :- T=1..3, R=2.
at_most(1,2).
at_most(2,2).

%start(1,1). start(2,1). start(3,3).
