final(10).
task(T,L,D) :- T=1..10, L=1+(T/2), D=T.
before(1..5,10). before(7,10).
before(1,3..6).

uses(2,1). uses(8,1).
at_most(1,1).
uses(1..3,2). uses(8,2).
at_most(2,2).
uses(1,3). uses(3,3). uses(8,3).
at_most(3,1).

worker(W,W) :- W=1..5.
worker(W+5,W) :- W=1..5.
requires(T,1) :- T=1..5.
requires(T,1,T) :- T=1..5.
holiday(1,1).
holiday(10,5).
holiday(10,3).
holiday(8,3).
holiday(7,1).
