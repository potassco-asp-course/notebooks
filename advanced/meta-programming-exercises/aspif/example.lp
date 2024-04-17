  dom(1..2).
% 1. and #show dom(1).
% 2. and #show dom(2).

  a(X) :- dom(X). 
% 20. and #show a(1).
% 21. and #show a(2).


b(X) :- not a(X), dom(X).
% 

  { c(X) } :- dom(X).
% { c(1) }.
% { c(2) }.

  d(X) :- not c(X), dom(X).
% d(1) :- not c(1).
% d(2) :- not c(2).

  e(X); f(X); g(X) :- c(X), d(X), dom(X).
% e(1); f(1); g(1) :- d(1), c(1).
% e(2); f(2); g(2) :- d(2), c(2).

  { e(X); f(X); g(X) } :- c(X), d(X), dom(X).
% { e(1); f(1); g(1) } :- d(1), c(1).
% { e(2); f(2); g(2) } :- d(2), c(2).

h :- 1 { e(X); f(X) }.
% 18 :- 1 { 1:e(1); 1:e(2); 1:f(1); 1:f(2) }.
% h :- 18.

i :- 1 { e(X); f(X) } 1.
% 14 :- 1 { 1:e(1); 1:e(2); 1:f(1); 1:f(2) }.
% 15 :- 2 { 1:e(1); 1:e(2); 1:f(1); 1:f(2) }.
% 16 :- 14, -15.
% i :- 16.

:- h, i.
% :- i, h.

#show (e(X),f(X),g(X)) : e(X), f(X), g(X).
% 22 :- e(1), f(1), g(1).
% 23 :- e(2), f(2), g(2).
% #show (e(1),f(1),g(1)) : 22.
% #show (e(2),f(2),g(2)) : 23.

  #minimize{ 1@3,X : e(X); 2@3,X : f(X); 3,X : g(X)}.
% #minimize{ 3@0:g(1), 3@0:g(2) }.
% #minimize{ 2@3:f(1), 2@3:f(2), 1@3:e(1), 1@3:e(2) }.

  #external j. [true]
% #external j. [true]

  #heuristic e(X) : c(X). [1,level]
% #heuristic e(1) : c(1). [1@0,level]
% #heuristic e(2) : c(2). [1@0,level]

  #project e/1.
% #project e(1).
% #project e(2).