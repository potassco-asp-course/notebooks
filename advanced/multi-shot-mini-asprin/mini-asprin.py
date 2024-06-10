import sys
from clingo.application import clingo_main, Application
from clingo.script import enable_python
from clingo.symbol import Number, Function

enable_python()

META = """
conjunction(B) :- literal_tuple(B),
        hold(L,0) : literal_tuple(B, L), L > 0;
    not hold(L,0) : literal_tuple(B,-L), L > 0.

body(normal(B)) :- rule(_,normal(B)), conjunction(B).
body(sum(B,G))  :- rule(_,sum(B,G)),
    #sum { W,L :     hold(L,0), weighted_literal_tuple(B, L,W), L > 0 ;
           W,L : not hold(L,0), weighted_literal_tuple(B,-L,W), L > 0 } >= G.

  hold(A,0) : atom_tuple(H,A)   :- rule(disjunction(H),B), body(B).
{ hold(A,0) : atom_tuple(H,A) } :- rule(     choice(H),B), body(B).

#show.
#show T : output(T,B), conjunction(B).
"""

HOLD = """
hold(A,m) :- A = @get_hold().
"""

DELETE = """
:- hold(A,0) : hold(A,m);
   hold(A,m) : hold(A,0).
"""

class MiniAsprinApp(Application):

    program_name = "mini-asprin"
    version = "1.0"
    
    def main(self, ctl, files):
        for path in files:
            ctl.load(path)
        if not files:
            ctl.load("-")
        ctl.add("meta",[],META)
        ctl.ground([("base", []), ("meta", [])])
        ctl.solve()

if __name__ == "__main__":
    clingo_main(MiniAsprinApp(), sys.argv[1:])
