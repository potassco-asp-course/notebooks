import sys
from clingo import Control
from clingo.script import enable_python
from clingo.backend import HeuristicType
from clingo.core import TruthValue
enable_python()

class AspifSymbolicPrinter:

    _externals = 0
    _heuristics = 1
    _minimizes = 2
    _output_facts = 3
    _output_atoms = 4
    _output_terms = 5
    _projects = 6
    _rules = 7
    _weight_rules = 8

    def __init__(self):
        self._elements = []
        self._output_atoms = dict()

    def _update(self, lit):
        if lit > 0:
            return lit if  lit not in self._output_atoms else          str(self._output_atoms[ lit])
        else:
            return lit if -lit not in self._output_atoms else "not " + str(self._output_atoms[-lit])

    def _update_set(self, lits):
        return [self._update(i) for i in lits]

    def _update_weighted(self, lits):
        return [(self._update(i),w) for (i,w) in lits]

    def display(self):
        printer = AspifPrinter()
        for e in self._elements:
            _type, x = e[0], e[1]
            if _type == self._externals:
                printer.external(self._update(x[0]), x[1])
            if _type == self._heuristics:
                printer.heuristic(self._update(x[0]), x[1], x[2], x[3], self._update_set(x[4]))
            if _type == self._minimizes:
                printer.minimize(x[0], self._update_weighted(x[1]))
            if _type == self._output_facts:
                print(f"#show {x}.")
            if _type == self._output_terms:
                printer.output_term(x[0], self._update_set(x[1]))
            if _type == self._projects:
                printer.project(self._update_set(x))
            if _type == self._rules:
                printer.rule(x[0], self._update_set(x[1]), self._update_set(x[2]))
            if _type == self._weight_rules:
                printer.weight_rule(x[0], self._update_set(x[1]), x[2], self._update_weighted(x[3]))

    def external(self, atom, value):
        self._elements.append((self._externals, (atom, value)))

    def heuristic(self, atom, type_, bias, priority, condition):
        self._elements.append((self._heuristics, (atom, type_, bias, priority, condition)))

    def minimize(self, priority, literals):
        self._elements.append((self._minimizes, (priority, literals)))

    def output_atom(self, symbol, atom):
        if atom == 0:
            self._elements.append((self._output_facts, symbol))
        else:
            self._output_atoms[atom] = symbol

    def output_term(self, symbol, condition):
        self._elements.append((self._output_terms, (symbol, condition)))

    def project(self, atoms):
        self._elements.append((self._projects, atoms))

    def rule(self, choice, head, body):
        self._elements.append((self._rules, (choice, head, body)))

    def weight_rule(self, choice, head, lower_bound, body):
        self._elements.append((self._weight_rules, (choice, head, lower_bound, body)))


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

    def display(self):
        pass

    def external(self, atom, value):
        print(f"#external {atom}. [{AspifPrinter._external_values[value]}]")

    def heuristic(self, atom, type_, bias, priority, condition):
        heur = f"#heuristic {atom}"
        if len(condition):
            heur += " : " + ", ".join(map(str,condition))
        mode = AspifPrinter._heuristic_values[type_]
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

    if len(sys.argv)>1 and sys.argv[1] == "--help":
        print("""
    Run:\n  python aspif-pretty-print.py [--text] <files>
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
    printer.display()

