final(8).
task(T,L,D) :- T=1..2, L=3, D=8.
task(3,2,7).
task(4,1,8). 
%
before(1,2).
before(4,2).
%
uses(1..3,1).
at_most(1,1).
%
requires(1..3,2).
requires(   4,1).
requires(1..2,1,1..2).
requires(   3,1,3..4).
requires(   4,1,   4).
%
worker(W,W) :- W=1..3.
worker(3,4).
holiday(3,2..3).
holiday(2,5).
