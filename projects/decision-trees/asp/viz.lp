node(X) :- edge(X,Y).
node(Y) :- edge(X,Y).
%
edge((X,Y)) :- edge(X,Y).
%
decision(N) :- decision(N,A).
    leaf(N) :- node(N), not decision(N,_).

attr(node,N,shape,rectangle) :- decision(N).
attr(node,N,shape,   circle) :-     leaf(N).
%
attr(node,N,label,    A) :- decision(N,A).
attr(node,N,label,"yes") :- leaf(N), positive(N).
attr(node,N,label," no") :- leaf(N), not positive(N).
%
attr(node,N,    color,     "blue") :- decision(N).
attr(node,N,fontcolor,     "blue") :- decision(N).
attr(node,N,    color,    "green") :- leaf(N),     positive(N).
attr(node,N,fontcolor,    "green") :- leaf(N),     positive(N).
attr(node,N,    color,"orangered") :- leaf(N), not positive(N).
attr(node,N,fontcolor,"orangered") :- leaf(N), not positive(N).
%
attr(node,N,  size,  "100") :- node(N).
attr(node,N,margin, "0.03") :- node(N).

attr(edge,(X,Z),    color,    "green") :- edge(X,Y), edge(X,Z), Z > Y.
attr(edge,(X,Z),fontcolor,    "green") :- edge(X,Y), edge(X,Z), Z > Y.
attr(edge,(X,Y),    color,"orangered") :- edge(X,Y), edge(X,Z), Z > Y.
attr(edge,(X,Y),fontcolor,"orangered") :- edge(X,Y), edge(X,Z), Z > Y.

