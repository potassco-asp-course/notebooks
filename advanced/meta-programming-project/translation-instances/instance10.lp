#const s=4.
#const limit=17.

number(1..s).

1 { latin(X,Y,N) : number(N) } 1 :- number(X), number(Y).
1 { latin(X,Y,N) : number(Y) } 1 :- number(X), number(N).
1 { latin(X,Y,N) : number(X) } 1 :- number(Y), number(N).

#show latin/3.

:- not limit #sum{((-1**N)*(X*Y)),X,Y,N : latin(X,Y,N) }.


