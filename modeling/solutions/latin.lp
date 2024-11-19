number(1..S) :- size(S).

{ latin(X,Y,N) } :- number(X), number(Y), number(N).

:- number(X), number(Y), { latin(X,Y,N) : number(N) } != 1.
:- number(X), number(N), { latin(X,Y,N) : number(Y) } != 1.
:- number(Y), number(N), { latin(X,Y,N) : number(X) } != 1.

#show latin/3.
