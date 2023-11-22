node(X) :- edge(X,Y).
node(Y) :- edge(X,Y).
%
edge((X,Y)) :- edge(X,Y).
