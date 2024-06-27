dom(1..2).
{ a(X) } :- dom(X).
{ b(X) } :- dom(X).
c(X) :- b(X).
:- a(X), not c(X).
:- not a(X), c(X).
