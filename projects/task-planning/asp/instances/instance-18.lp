final(20).
task(T,L,D) :- T=1..10, L=2*(1+(T/2)), D=T*2.
before(1..5,10). before(7,10).
before(1,3..6).
before(2,6).

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
holiday(1,2).
holiday(10,10).
holiday(10,6).
holiday(8,6).
holiday(7,2).
holiday(4,3).

task(T+10,L,D) :- T=1..10, L=2*(1+(T/2)), D=T*2.
before(11..15,20). before(17,20).
before(11,13..16).
before(12,19).
before(15,19).

uses(12,11). uses(18,11).
at_most(11,1).
uses(11..13,12). uses(18,12).
at_most(12,2).
uses(11,13). uses(13,13). uses(18,13).
at_most(13,1).

requires(T,1) :- T=6..20.
worker(11..12,20).  
holiday(1,7).
holiday(1,8).holiday(1,9).
holiday(5,13).holiday(5,14).
holiday(11,14..20).
holiday(12,20).
holiday(8,1..4).
holiday(4,1..4).
holiday(6,19).
holiday(9,1..2).
holiday(3,1..2).
