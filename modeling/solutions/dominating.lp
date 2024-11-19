{ select(X) } :- vertex(X).

dominated(X) :- select(X).
dominated(Y) :- select(X), edge(X,Y).
dominated(Y) :- select(X), edge(Y,X).
:- vertex(X), not dominated(X).

:- threshold(N), N+1 { select(X) }.

#show select/1.
