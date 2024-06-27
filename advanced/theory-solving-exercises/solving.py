import sys
from clingo.application import clingo_main, Application
from clingo.propagator import Propagator
from aspif.pretty_printer import AspifPrinter, AspifSymbolicPrinter


BASIC = 0
CHECK = 1
PROPAGATE_ON_CONFLICT = 2
PROPAGATE_ALWAYS = 3
PROPAGATE_ALWAYS_STATEFUL = 4


class Solving(Propagator):

    def __init__(self, _type):
        # initialize data structures
        self._type = _type
        pass

    def init(self, init):
        # fill in data structures
        # add watches
        # print info for each symbolic atom
        # print initial assignment object
        pass

    def _print_latin(self, items): 
        grid = [[None]*3 for _ in range(3)]
        for item in items:
            X, Y, N = map(int, item[6:-1].split(','))
            grid[X-1][Y-1] = N
        for row in grid:
            print(' '.join(str(cell) if cell else '.' for cell in row))

    def _print_current_level(self, assignment):
        # print current level
        # use _print_latin?
        return ""

    def decide(self, thread_id, assignment, fallback):
        # print free atoms
        # either use input() to gather user's decision symbolic atom
        #        return the solver literal of the symbolic atom 
        # or return abs(fallback) in latin?
        return fallback 

    def propagate(self, control, changes):
        print(f"{self._print_current_level(control.assignment)}(P)")
        if self._type == PROPAGATE_ON_CONFLICT: pass
        if self._type == PROPAGATE_ALWAYS: pass
        if self._type == PROPAGATE_ALWAYS_STATEFUL: pass

    def undo(self, thread_id, assignment, changes):
        print(f"{self._print_current_level(assignment)}(U)")
        if self._type == PROPAGATE_ALWAYS_STATEFUL: pass

    def check(self, control):
        print(f"{self._print_current_level(control.assignment)}(C)")
        if self._type == CHECK: pass


class App(Application):
    
    program_name = "solving"
    version = "1.0"

    def __init__(self):
        self._type = BASIC

    def _parse_type(self, option):
        self._type = int(option)
        return True if int(option) in range(5) else False

    def register_options(self, options):
        group = 'Solving Exercises Options'
        options.add(group, 'type', 'Type of propagator [0..4]', self._parse_type, argument="<var>")

    def main(self, ctl, files):
        ctl.enable_enumeration_assumption = False
        # uncomment to see the aspif output
        # ctl.register_observer(AspifPrinter())
        # uncomment to see the symbolic aspif output (also below before solve())
        # symbolic_printer = AspifSymbolicPrinter()
        # ctl.register_observer(symbolic_printer)
        ctl.register_propagator(Solving(self._type))
        for path in files:
            ctl.load(path)
        if not files:
            ctl.load("-")
        ctl.ground([("base", [])])
        # uncomment to the see symbolic aspif output
        # symbolic_printer.display()
        ctl.solve()
        

if __name__ == "__main__":
    sys.exit(int(clingo_main(App(), sys.argv[1:])))
