{ select(X) } :- vertex(X).

:- edge(X,Y), select(X), select(Y).

:- threshold(N), { select(X) } N-1.

#show select/1.
