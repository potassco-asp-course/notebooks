dom(1..2).
{ a(X) } :- dom(X).
{ b(X) } :- dom(X).
:- a(X), not b(X).
:- not a(X), b(X).
