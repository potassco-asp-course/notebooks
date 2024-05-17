#const s=4.
#const limit=16.

number(1..s).

1 { latin(X,Y,N) : number(N) } 1 :- number(X), number(Y).
1 { latin(X,Y,N) : number(Y) } 1 :- number(X), number(N).
1 { latin(X,Y,N) : number(X) } 1 :- number(Y), number(N).

#show latin/3.

:- not limit #sum{((-1**N)*(X*Y)),X,Y,N : latin(X,Y,N) }.


% Answer: 1
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 2
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 3
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 4
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 5
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 6
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 7
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 8
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 9
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 10
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 11
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 12
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 13
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 14
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 15
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 16
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
