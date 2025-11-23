final(16).
task(T,L,D) :- T=1..2, L=6, D=16.
task(T,L,D) :- T=5..6, L=6, D=16.
task(3,4,14).
task(4,2,16). 
task(7,4,14).
task(8,2,16). 
%
before(1,2).
before(4,2).
before(5,6).
before(8,6).
%
uses(1..3,1).
at_most(1,1).
uses(5..7,2).
at_most(2,1).
%
requires(1..3,2).
requires(   4,1).
requires(1..2,1,1..2).
requires(   3,1,3..4).
requires(   4,1,   4).
%
worker(W,W) :- W=1..3.
worker(3,4).
holiday(3,3..5).
holiday(2,10).
%

requires(5..7,2).
requires(   8,1).
requires(5..6,1,11..12).
requires(   7,1,13..14).
requires(   8,1,    14).
%
worker(W,W+7) :- W=4..6.
worker(6,14).
holiday(6,3..5).
holiday(5,10).

