number(1..3).

latin(1,1,1).

1 { latin(X,Y,N) : number(N) } 1 :- number(X), number(Y).
:- latin(X,Y1,N), latin(X,Y2,N), Y1 < Y2, number(X), number(N).
:- latin(X1,Y,N), latin(X2,Y,N), X1 < X2, number(Y), number(N).

#show latin/3.
