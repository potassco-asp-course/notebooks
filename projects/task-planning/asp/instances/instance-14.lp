final(32).
task(T,L,D) :- T=1..2, L=12, D=32.
task(T,L,D) :- T=5..6, L=12, D=32.
task(3,8,28).
task(4,4,32). 
task(7,8,28).
task(8,4,32). 
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
holiday(3,6..8).
holiday(2,20).
%

requires(5..7,2).
requires(   8,1).
requires(5..6,1,11..12).
requires(   7,1,13..14).
requires(   8,1,    14).
%
worker(W,W+7) :- W=4..6.
worker(6,14).
holiday(6,6..8).
holiday(5,20).
%
task(T,L,D) :- T=9..16, L=2, D=T-1.
before(9,2). before(10,4). before(11,6). before(12,8). 
before(13,7). before(14,4). before(15,4). before(16,9).
%
requires(9..16,1).
worker(7,20). worker(8,21).
requires(9..14,1,20). requires(15..16,1,21).
%
uses(9..12,3).
at_most(3,2).
%
before(9,10). before(10,11). before(12,15). before(14,16). 

holiday(8,5..6).
