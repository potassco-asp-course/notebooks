#script(python)
from clingo.symbol import Number
def func(a):
    return Number(a.number + 1)
#end.

{a;b;x}. copy_a :- not a.
c :- a, 1 { not b; x }.
d. e.
q ; z.
:- a, b, not x.
#external f. [true]
#heuristic a : b, x. [1@5,level]
#show (a,b) : a, b.

#minimize{ 1@3 : a; 2@3 : b; 2 : c}.
#project a/1.
{a(1..@func(1))}.
#project b/0.

