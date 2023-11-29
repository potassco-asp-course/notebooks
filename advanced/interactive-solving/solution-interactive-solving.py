import sys
from clingo.application import clingo_main, Application
from clingo.propagator import Propagator
from aspif.aspif_pretty_printer import AspifPrinter, AspifSymbolicPrinter

class SolvingAgent(Propagator):

    def __init__(self):
        self._mapping = {}
        self.s2l = {}

    def init(self, init):
        for atom in init.symbolic_atoms:
            solver_literal = init.solver_literal(atom.literal)
            self.s2l[str(atom.symbol)] = solver_literal
            atom_string = str(atom.symbol)
            atom_sign = 1 if solver_literal < 0 else 0
            self._mapping.setdefault(abs(solver_literal), []).append((atom_string, atom_sign))
        #
        print(f"symbol\t\tis_fact\t\tis_external\tprogram_literal\tsolver_literal")
        print("------------------------------------------------------------------------------")
        for atom in init.symbolic_atoms:
            print(f"{atom.symbol}\t\t{atom.is_fact}\t\t{atom.is_external}\t\t{atom.literal}\t\t{init.solver_literal(atom.literal)}")
        #
        print()
        assignment = init.assignment
        print("Assignment: ")
        print(f"  decision_level: {assignment.decision_level}")
        print(f"  has_conflict: {assignment.has_conflict}")
        print(f"  is_total: {assignment.is_total}")
        print(f"  literals in the assignment: {' '.join(map(str,assignment))}")
        print(f"  trail: {' '.join([str(i) for i in assignment.trail])}\n")
        #
        for atom in init.assignment:
            init.add_watch(atom)
            init.add_watch(-atom)

    def _symbolic_literals(self, solver_literal):
        return str(solver_literal)
        if abs(solver_literal) in self._mapping:
            symbols = self._mapping[abs(solver_literal)]
            lit = ""
            for symbol in symbols:
                if (solver_literal < 0 and symbol[1] == 0) or (solver_literal >= 0 and symbol[1] == 1):
                    lit += "-"
                lit += symbol[0]
                lit += "_"
            return lit[:-1] if len(lit) else "" ###
        return str(solver_literal)
    
    def _print_current_level(self, assignment):
        dl = assignment.decision_level
        begin = assignment.trail.begin(dl)
        end = assignment.trail.end(dl)
        out = f"{dl}:" + "  "*dl
        #out = "" + "  "*dl
        for i in assignment.trail[begin:end]:
            out += self._symbolic_literals(i) + " "
        return out

    def decide(self, thread_id, assignment, fallback):
        free_solver_literals = [i for i in assignment if assignment.is_free(i)]
        free = " ".join([f"{self._symbolic_literals(i)}" for i in free_solver_literals])
        decision = input(free + " ? ")
        return int(decision)
        if decision[0] == '-':
            return -self.s2l[decision[1:]]
        return self.s2l[decision]

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

