{ select(X) } :- vertex(X).

covered(X,Y) :- edge(X,Y), select(X).
covered(X,Y) :- edge(X,Y), select(Y).
:- edge(X,Y), not covered(X,Y).

:- threshold(N), N+1 { select(X) }.

#show select/1.
