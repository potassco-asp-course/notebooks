number(1..3).

latin(1,1,1). % :- X=1..1.

   1 { latin(X,Y,N) : number(N) } 1 :- number(X), number(Y).
:- 2 { latin(X,Y,N) : number(Y) },     number(X), number(N).
%:- 2 { latin(X,Y,N) : number(X) },     number(Y), number(N).

#show latin/3.
