N { select(X) : vertex(X) } :- threshold(N).

:- edge(X,Y), select(X), select(Y).

#show select/1.
