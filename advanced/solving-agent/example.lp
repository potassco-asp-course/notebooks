dom(1..2).
{ a(X,Y) } :- dom(X), dom(Y).
:- a(X,1), not a(X,2).
:- not a(X,1), a(X,2).
