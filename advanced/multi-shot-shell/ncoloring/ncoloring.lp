#const n = 3.
#const m = 10.
color(1..n).

% Extract nodes from edges
node(X) :- edge(X,_).
node(X) :- edge(_,X).

% Generate n-coloring
1 { mark(X,C) : color(C) } 1 :- node(X).
:- edge(X,Y), mark(X,C), mark(Y,C).

% Allow aspic user to add and remove edges via externals
#external edge(X,Y) : X = 1..m-1, Y = X+1..m.

% Display n-coloring
#show mark/2.
