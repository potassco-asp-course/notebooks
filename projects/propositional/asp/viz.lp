node(F) :- for(F,_,_).
%
edge((F,G  )) :- for(F,and,G).
edge((F,G+1)) :- for(F,and,G).
edge((F,G  )) :- for(F, or,G).
edge((F,G+1)) :- for(F, or,G).
edge((F,G  )) :- for(F,neg,G).

atom(F) :- for(F,atom,A).
%
attr(node,F,shape,rectangle) :- node(F), not atom(F).
attr(node,F,shape,   circle) :- atom(F).

#const id=1. % change to avoid printing the ids of the formulas
attr(node,F,label,@concat(F," : ",T)) :- for(F,T,G), not atom(F), id  = 1. 
attr(node,F,label,@concat(F," : ",A)) :- for(F,T,A),     atom(F), id  = 1.
attr(node,F,label,                 T) :- for(F,T,G), not atom(F), id != 1. 
attr(node,F,label,                 A) :- for(F,T,A),     atom(F), id != 1.

attr(node,F,    color,     "blue") :- node(F).
attr(node,F,fontcolor,     "blue") :- node(F).

attr(node,F,  size,  "100") :- node(F).
attr(node,F,margin, "0.03") :- node(F).

attr(edge,((X,Y)),color,"blue") :- edge((X,Y)).

