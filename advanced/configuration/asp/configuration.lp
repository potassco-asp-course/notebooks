% choose one option V for every feature F of (enumeration) type T
{ value(F,V) : option(T,V) } = 1 :- feature(_,F,T,_,_).

% it cannot be that the constraint (S,C) requires a binary formula B and B does not hold
:- behavior((S,C)), require((S,C),B), not holds_binary(B).

% binary formula B of the form Left = Right holds if...
holds_binary(B) :- binary(_,B,Left,"=",Right), value(Left,LV), value(Right,RV), LV = RV.

% display value
#show value/2.
