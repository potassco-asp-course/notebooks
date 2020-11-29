{ select(X) : vertex(X) } N :- threshold(N).

dominated(X) :- select(X).
dominated(Y) :- select(X), edge(X,Y).
dominated(Y) :- select(X), edge(Y,X).
:- vertex(X), not dominated(X).

#show select/1.
