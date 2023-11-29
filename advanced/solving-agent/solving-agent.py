import sys
from clingo.application import clingo_main, Application
from clingo.propagator import Propagator
from aspif.aspif import AspifPrinter, AspifSymbolicPrinter

class SolvingAgent(Propagator):

    def __init__(self):
        # initialize data structures
        pass

    def init(self, init):
        # fill in data structures
        # add watches
        # print info for each symbolic atom
        # print initial assignment object

    def _print_current_level(self, assignment):
        # print current level
        return ""
    
    def decide(self, thread_id, assignment, fallback):
        # print free atoms
        # use input() to gather user's decision symbolic atom
        # return the solver literal of the symbolic atom 
        # (instead of the fallback)
        return fallback 

    def propagate(self, control, changes):
        print(f"{self._print_current_level(control.assignment)}(P)")

    def undo(self, thread_id, assignment, changes):
        print(f"{self._print_current_level(assignment)}(U)")
    
    def check(self, control):
        print(f"{self._print_current_level(control.assignment)}(C)")


class App(Application):
    def main(self, ctl, files):
        ctl.enable_enumeration_assumption = False
        printer1 = AspifPrinter()
        printer2 = AspifSymbolicPrinter()
        ctl.register_observer(printer1)
        ctl.register_observer(printer2)
        ctl.register_propagator(SolvingAgent())
        for path in files:
            ctl.load(path)
        if not files:
            ctl.load("-")
        ctl.ground([("base", [])])
        print()
        printer2.print()
        print()
        ctl.solve()
        

if __name__ == "__main__":
    sys.exit(int(clingo_main(App(), sys.argv[1:])))

