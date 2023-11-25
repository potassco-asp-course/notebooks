import sys
from clingo import Control
from clingo.script import enable_python
from clingo.backend import HeuristicType
from clingo.core import TruthValue
enable_python()

class AspifSymbolicPrinter:

    def __init__(self):
        self._externals = []
        self._heuristics = []
        self._minimizes = []
        self._output_facts = []
        self._output_atoms = dict()
        self._output_terms = []
        self._projects = []
        self._rules = []
        self._weight_rules = []

    def _update(self, lit):
        if lit > 0:
            return lit if  lit not in self._output_atoms else          str(self._output_atoms[ lit])
        else:
            return lit if -lit not in self._output_atoms else "not " + str(self._output_atoms[-lit])

    def _update_set(self, lits):
        return [self._update(i) for i in lits]

    def _update_weighted(self, lits):
        return [(self._update(i),w) for (i,w) in lits]

    def print(self):
        printer = AspifPrinter()
        for x in self._rules:
            printer.rule(x[0], self._update_set(x[1]), self._update_set(x[2]))
        for x in self._weight_rules:
            printer.weight_rule(x[0], self._update_set(x[1]), x[2], self._update_weighted(x[3]))
        for x in self._externals:
            printer.external(self._update(x[0]), x[1])
        for x in self._heuristics:
            printer.heuristic(self._update(x[0]), x[1], x[2], x[3], self._update_set(x[4]))
        for x in self._minimizes:
            printer.minimize(x[0], self._update_weighted(x[1]))
        for x in self._output_facts:
            print(f"{x}.")
        for x in self._output_terms:
            printer.output_term(x[0], self._update_set(x[1]))
        for x in self._projects:
            printer.project(self._update_set(x))

    def external(self, atom, value):
        self._externals.append((atom, value))

    def heuristic(self, atom, type_, bias, priority, condition):
        self._heuristics.append((atom, type_, bias, priority, condition))

    def minimize(self, priority, literals):
        self._minimizes.append((priority, literals))

    def output_atom(self, symbol, atom):
        if atom == 0:
            self._output_facts.append(symbol)
        else:
            self._output_atoms[atom] = symbol

    def output_term(self, symbol, condition):
        self._output_terms.append((symbol, condition))

    def project(self, atoms):
        self._projects.append(atoms)

    def rule(self, choice, head, body):
        self._rules.append((choice, head, body))

    def weight_rule(self, choice, head, lower_bound, body):
        self._weight_rules.append((choice, head, lower_bound, body))


class AspifPrinter:

    _external_values = {
        TruthValue.Free : "free",
        TruthValue.True_ : "true",
        TruthValue.False_ : "false",
        TruthValue.Release : "release"
    }

    _heuristic_values = {
        HeuristicType.Factor : "factor",
        HeuristicType.False_ : "false",
        HeuristicType.Init : "init",
        HeuristicType.Level : "level",
        HeuristicType.Sign : "sign",
        HeuristicType.True_ : "true",
    }

    def print(self):
        pass

    def external(self, atom, value):
        print(f"#external {atom}. [{Observer._external_values[value]}]")

    def heuristic(self, atom, type_, bias, priority, condition):
        heur = f"#heuristic {atom}"
        if len(condition):
            heur += " : " + ", ".join(map(str,condition))
        mode = Observer._heuristic_values[type_]
        heur += f". [{bias}@{priority},{mode}]"
        print(heur)

    def minimize(self, priority, literals):
        mini = "#minimize{ "
        cond = [str(x[1])+"@"+str(priority)+":"+str(x[0]) for x in literals]
        mini += ", ".join(cond) + " }."
        print(mini)

    def output_atom(self, symbol, atom):
        if atom == 0:
            print(f"#show {symbol}.")
        else:
            print(f"#show {symbol} : {atom}.")

    def output_term(self, symbol, condition):
        cond = ", ".join(map(str, condition))
        print(f"#show {symbol} : {cond}.")

    def project(self, atoms):
        for i in atoms:
            print(f"#project {i}.")

    def rule(self, choice, head, body):
        rule = ""
        if len(head) and not choice:
            rule += ";".join(map(str, head))
        if len(head) and     choice:
            rule += "{ " + "; ".join(map(str, head)) + " }"
        if len(head) and len(body):
            rule += " "
        if len(body):
            rule += ":- " + ", ".join(map(str, body))
        rule += "."
        print(rule)

    def weight_rule(self, choice, head, lower_bound, body):
        rule = ""
        if len(head) and not choice:
            rule += ";".join(map(str, head))
        if len(head) and     choice:
            rule += "{" + ";".join(map(str, head)) + "}"
        if len(head) and len(body):
            rule += " "
        if len(body):
            cons = [str(x[1])+":"+str(x[0]) for x in body]
            rule += ":- " + str(lower_bound) + " { " + "; ".join(cons) + " }"
        rule += "."
        print(rule)


#
# run
#

if __name__ == "__main__":

    if sys.argv[1] == "--help":
        print("""
    Run:\n  python observer.py [--text] <files>
    """)
        sys.exit()

    path = sys.argv[1:]
    printer = AspifPrinter()
    if len(path)>0 and path[0] == "--text":
        path = sys.argv[2:]
        printer = AspifSymbolicPrinter()

    ctl = Control()
    for file_ in path:
        ctl.load(file_)
    if not path:
        ctl.load("-")
    ctl.register_observer(printer)
    ctl.ground([("base", [])])
    printer.print()

