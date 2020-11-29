{ select(X) : vertex(X) } N :- threshold(N).

covered(X,Y) :- edge(X,Y), select(X).
covered(X,Y) :- edge(X,Y), select(Y).
:- edge(X,Y), not covered(X,Y).

#show select/1.
