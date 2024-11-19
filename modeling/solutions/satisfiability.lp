% define the atoms
atom(A) :- literal(C,V,A).

% generate possible truth assignments
{ holds(pos,A) } :- atom(A).
{ holds(neg,A) } :- atom(A).
%
:- atom(A), { holds(pos,A); holds(neg,A) } != 1.

% define when a clause C is satisfied
satisfied(C) :- literal(C,V,A), holds(V,A).

% test that it is not the case that a clause C is not satisfied
:- clause(C), not satisfied(C).

% show
#show holds/2.
