dom(1..2).

a(X) :- dom(X). 
b(X) :- not a(X), dom(X).

{ c(X) } :- dom(X).
d(X) :- not c(X), dom(X).

  e(X); f(X); g(X)   :- c(X), d(X), dom(X).
{ e(X); f(X); g(X) } :- c(X), d(X), dom(X).

h :- 1 { e(X); f(X) }.
i :- 1 { e(X); f(X) } 1.

:- h, i.

#show (e(X),f(X),g(X)) : e(X), f(X), g(X).

% #show h/0. #show i/0.
% #minimize{ 1@3,X : e(X); 2@3,X : f(X); 3,X : g(X)}.
% #external j. [true]
% #heuristic e(X) : c(X). [1,level]
% #project e/1.

