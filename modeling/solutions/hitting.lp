{ select(X) } :- element(S,X).

:- set(S), { select(X) : element(S,X) } != 1.

#show select/1.

