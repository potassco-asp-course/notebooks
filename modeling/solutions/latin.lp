number(1..S) :- size(S).

1 { latin(X,Y,N) : number(N) } 1 :- number(X), number(Y).
1 { latin(X,Y,N) : number(Y) } 1 :- number(X), number(N).
1 { latin(X,Y,N) : number(X) } 1 :- number(Y), number(N).

#show latin/3.
