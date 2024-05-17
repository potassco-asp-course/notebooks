#const s=4.
#const limit=8.

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
% latin(2,1,4) latin(3,1,2) latin(1,2,4) latin(2,2,2) latin(1,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(1,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(2,3,3) latin(3,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 6
% latin(1,1,4) latin(2,1,2) latin(2,2,4) latin(3,2,2) latin(1,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(1,2,1) latin(4,2,3) latin(2,3,3) latin(3,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 7
% latin(2,1,2) latin(3,1,4) latin(1,2,2) latin(2,2,4) latin(1,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(1,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(2,3,3) latin(3,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 8
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(2,2,4) latin(2,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(2,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 9
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 10
% latin(1,1,4) latin(2,1,2) latin(2,2,4) latin(4,2,2) latin(1,3,2) latin(3,3,4) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(1,2,1) latin(3,2,3) latin(2,3,3) latin(4,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 11
% latin(1,1,4) latin(2,1,2) latin(3,2,4) latin(4,2,2) latin(1,3,2) latin(2,3,4) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(1,2,1) latin(2,2,3) latin(3,3,3) latin(4,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 12
% latin(1,1,4) latin(2,1,2) latin(3,2,2) latin(4,2,4) latin(1,3,2) latin(2,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(1,2,1) latin(2,2,3) latin(3,3,3) latin(4,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 13
% latin(1,1,4) latin(4,1,2) latin(1,2,2) latin(2,2,4) latin(2,3,2) latin(3,3,4) latin(3,4,2) latin(4,4,4) latin(2,1,3) latin(3,1,1) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(4,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 14
% latin(1,1,4) latin(2,1,2) latin(3,2,4) latin(4,2,2) latin(1,3,2) latin(2,3,4) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(1,2,1) latin(2,2,3) latin(3,3,1) latin(4,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 15
% latin(1,1,4) latin(2,1,2) latin(3,2,2) latin(4,2,4) latin(1,3,2) latin(2,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(1,2,1) latin(2,2,3) latin(3,3,1) latin(4,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 16
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(4,2,4) latin(2,3,4) latin(3,3,2) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(2,2,3) latin(3,2,1) latin(1,3,1) latin(4,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 17
% latin(2,1,4) latin(3,1,2) latin(1,2,4) latin(2,2,2) latin(1,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(1,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(2,3,1) latin(3,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 18
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 19
% latin(1,1,4) latin(2,1,2) latin(2,2,4) latin(3,2,2) latin(1,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(1,2,3) latin(4,2,1) latin(2,3,1) latin(3,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 20
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 21
% latin(1,1,4) latin(2,1,2) latin(3,2,2) latin(4,2,4) latin(1,3,2) latin(2,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(1,2,3) latin(2,2,1) latin(3,3,3) latin(4,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 22
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(4,2,4) latin(2,3,4) latin(3,3,2) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(2,2,1) latin(3,2,3) latin(1,3,3) latin(4,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 23
% latin(2,1,2) latin(3,1,4) latin(1,2,2) latin(2,2,4) latin(1,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(1,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(2,3,1) latin(3,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 24
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 25
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 26
% latin(1,1,4) latin(2,1,2) latin(3,2,4) latin(4,2,2) latin(1,3,2) latin(2,3,4) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(1,2,3) latin(2,2,1) latin(3,3,3) latin(4,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 27
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 28
% latin(1,1,4) latin(2,1,2) latin(3,2,2) latin(4,2,4) latin(1,3,2) latin(2,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(1,2,3) latin(2,2,1) latin(3,3,1) latin(4,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 29
% latin(1,1,4) latin(2,1,2) latin(2,2,4) latin(4,2,2) latin(1,3,2) latin(3,3,4) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(1,2,3) latin(3,2,1) latin(2,3,1) latin(4,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 30
% latin(1,1,4) latin(2,1,2) latin(3,2,4) latin(4,2,2) latin(1,3,2) latin(2,3,4) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(1,2,3) latin(2,2,1) latin(3,3,1) latin(4,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 31
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(2,2,4) latin(2,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(2,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 32
% latin(1,1,4) latin(4,1,2) latin(1,2,2) latin(2,2,4) latin(2,3,2) latin(3,3,4) latin(3,4,2) latin(4,4,4) latin(2,1,1) latin(3,1,3) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(4,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 33
% latin(1,1,4) latin(2,1,2) latin(2,2,4) latin(3,2,2) latin(3,3,4) latin(4,3,2) latin(1,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(1,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(2,4,3) latin(3,4,1)
% Answer: 34
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 35
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 36
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 37
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 38
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(3,2,4) latin(3,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 39
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 40
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 41
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(3,2,4) latin(3,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 42
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 43
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 44
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(2,2,4) latin(3,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 45
% latin(1,1,4) latin(3,1,2) latin(1,2,2) latin(3,2,4) latin(2,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 46
% latin(1,1,4) latin(2,1,2) latin(2,2,4) latin(3,2,2) latin(3,3,4) latin(4,3,2) latin(1,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(1,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(2,4,1) latin(3,4,3)
% Answer: 47
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(4,2,4) latin(3,3,4) latin(4,3,2) latin(2,4,4) latin(3,4,2) latin(3,1,1) latin(4,1,3) latin(2,2,1) latin(3,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(4,4,1)
% Answer: 48
% latin(1,1,4) latin(2,1,2) latin(1,2,2) latin(4,2,4) latin(3,3,4) latin(4,3,2) latin(2,4,4) latin(3,4,2) latin(3,1,3) latin(4,1,1) latin(2,2,3) latin(3,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(4,4,3)
% Answer: 49
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(4,2,2) latin(3,3,2) latin(4,3,4) latin(2,4,2) latin(3,4,4) latin(3,1,3) latin(4,1,1) latin(2,2,3) latin(3,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(4,4,3)
% Answer: 50
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(3,2,2) latin(3,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 51
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(3,2,2) latin(3,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 52
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(4,2,2) latin(2,3,2) latin(3,3,4) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(2,2,3) latin(3,2,1) latin(1,3,1) latin(4,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 53
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(4,2,2) latin(2,3,2) latin(3,3,4) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(2,2,1) latin(3,2,3) latin(1,3,3) latin(4,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 54
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 55
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 56
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 57
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 58
% latin(1,1,2) latin(4,1,4) latin(1,2,4) latin(2,2,2) latin(2,3,4) latin(3,3,2) latin(3,4,4) latin(4,4,2) latin(2,1,1) latin(3,1,3) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(4,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 59
% latin(1,1,2) latin(4,1,4) latin(1,2,4) latin(2,2,2) latin(2,3,4) latin(3,3,2) latin(3,4,4) latin(4,4,2) latin(2,1,3) latin(3,1,1) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(4,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 60
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(2,2,2) latin(2,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(2,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 61
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(2,2,2) latin(2,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(2,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 62
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 63
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 64
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 65
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,4) latin(4,3,2) latin(2,4,2) latin(4,4,4) latin(2,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 66
% latin(1,1,2) latin(2,1,4) latin(3,2,4) latin(4,2,2) latin(1,3,4) latin(2,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(1,2,1) latin(2,2,3) latin(3,3,1) latin(4,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 67
% latin(1,1,2) latin(2,1,4) latin(3,2,4) latin(4,2,2) latin(1,3,4) latin(2,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(1,2,3) latin(2,2,1) latin(3,3,1) latin(4,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 68
% latin(1,1,2) latin(2,1,4) latin(2,2,2) latin(3,2,4) latin(1,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,3) latin(4,1,1) latin(1,2,1) latin(4,2,3) latin(2,3,3) latin(3,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 69
% latin(1,1,2) latin(2,1,4) latin(3,2,4) latin(4,2,2) latin(1,3,4) latin(2,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(1,2,1) latin(2,2,3) latin(3,3,3) latin(4,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 70
% latin(1,1,2) latin(2,1,4) latin(2,2,2) latin(3,2,4) latin(1,3,4) latin(4,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(1,2,3) latin(4,2,1) latin(2,3,1) latin(3,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 71
% latin(1,1,2) latin(2,1,4) latin(3,2,4) latin(4,2,2) latin(1,3,4) latin(2,3,2) latin(3,4,2) latin(4,4,4) latin(3,1,1) latin(4,1,3) latin(1,2,3) latin(2,2,1) latin(3,3,3) latin(4,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 72
% latin(1,1,2) latin(2,1,4) latin(3,2,2) latin(4,2,4) latin(1,3,4) latin(2,3,2) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(1,2,1) latin(2,2,3) latin(3,3,1) latin(4,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 73
% latin(1,1,2) latin(2,1,4) latin(3,2,2) latin(4,2,4) latin(1,3,4) latin(2,3,2) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(1,2,3) latin(2,2,1) latin(3,3,1) latin(4,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 74
% latin(1,1,2) latin(2,1,4) latin(3,2,2) latin(4,2,4) latin(1,3,4) latin(2,3,2) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(1,2,1) latin(2,2,3) latin(3,3,3) latin(4,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 75
% latin(1,1,2) latin(2,1,4) latin(3,2,2) latin(4,2,4) latin(1,3,4) latin(2,3,2) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(1,2,3) latin(2,2,1) latin(3,3,3) latin(4,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 76
% latin(1,1,2) latin(2,1,4) latin(2,2,2) latin(4,2,4) latin(1,3,4) latin(3,3,2) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(1,2,1) latin(3,2,3) latin(2,3,3) latin(4,3,1) latin(1,4,3) latin(2,4,1)
% Answer: 77
% latin(1,1,2) latin(2,1,4) latin(2,2,2) latin(4,2,4) latin(1,3,4) latin(3,3,2) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(1,2,3) latin(3,2,1) latin(2,3,1) latin(4,3,3) latin(1,4,1) latin(2,4,3)
% Answer: 78
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(4,2,2) latin(3,3,2) latin(4,3,4) latin(2,4,2) latin(3,4,4) latin(3,1,1) latin(4,1,3) latin(2,2,1) latin(3,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(4,4,1)
% Answer: 79
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 80
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 81
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(2,4,1)
% Answer: 82
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 83
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 84
% latin(1,1,2) latin(2,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(3,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(2,4,3)
% Answer: 85
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 86
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,1) latin(3,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 87
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,1) latin(4,1,3) latin(3,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(1,4,3) latin(3,4,1)
% Answer: 88
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,3) latin(4,1,1) latin(2,2,1) latin(4,2,3) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 89
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(3,2,2) latin(2,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,1) latin(4,1,3) latin(2,2,3) latin(4,2,1) latin(1,3,3) latin(3,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 90
% latin(1,1,2) latin(3,1,4) latin(1,2,4) latin(2,2,2) latin(3,3,2) latin(4,3,4) latin(2,4,4) latin(4,4,2) latin(2,1,3) latin(4,1,1) latin(3,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(1,4,1) latin(3,4,3)
% Answer: 91
% latin(1,1,2) latin(2,1,4) latin(2,2,2) latin(3,2,4) latin(3,3,2) latin(4,3,4) latin(1,4,4) latin(4,4,2) latin(3,1,3) latin(4,1,1) latin(1,2,1) latin(4,2,3) latin(1,3,3) latin(2,3,1) latin(2,4,3) latin(3,4,1)
% Answer: 92
% latin(1,1,2) latin(2,1,4) latin(2,2,2) latin(3,2,4) latin(3,3,2) latin(4,3,4) latin(1,4,4) latin(4,4,2) latin(3,1,1) latin(4,1,3) latin(1,2,3) latin(4,2,1) latin(1,3,1) latin(2,3,3) latin(2,4,1) latin(3,4,3)
