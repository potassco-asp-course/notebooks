import sys
from clingo.application import clingo_main, Application
from clingraph.clingo_utils import ClingraphContext
from clingraph import Factbase, compute_graphs, render
from clingo import Control
from clingo.propagator import Propagator

# visualization encoding
viz_encoding = "viz.lp"

class SudokuAgent(Propagator):

    # implement this method
    def __init__(self):
        pass 

    # define self.l2s
    def init(self, init):
        pass

    def propagate(self, control, changes):
        self._sudoku_graph(self.l2s, control.assignment, changes)
        input("Propagate")
        
    def decide(self, thread_id, assignment, fallback):
        self._sudoku_graph(self.l2s, assignment)
        return fallback
        # atom = input("Decision? ")
        # return solver literal of atom (instead of fallback)

    def undo(self, thread_id, assignment, changes):
        self._sudoku_graph(self.l2s, assignment, changes)
        input("Undo")
    
    def check(self, control):
        self._sudoku_graph(self.l2s, control.assignment)
        input("Check")
    
    def _sudoku_graph(self, l2s, assignment, changes=[], encoding=viz_encoding):
        
        facts = []
        for l, symbols in l2s.items():
            v = assignment.value(l)
            t = '_undefined' if v is None else '_true' if v else '_false'
            for s in symbols:
                facts.append(f"{t}({s}).")
        for l in changes:
            symbols = l2s[l]
            for s in symbols:
                facts.append(f"_change({s}).")
        
        fb = Factbase()
        ctl = Control([])
        ctl.load(encoding)
        ctl.add("base",[],"".join(facts))
        ctl.ground([("base",[])],ClingraphContext())
        ctl.solve(on_model=fb.add_model)
        graph = compute_graphs(fb)
        render(graph, directory='.', format='pdf', name_format='sudoku', engine='neato')


class App(Application):
    def main(self, ctl, files):
        ctl.register_propagator(SudokuAgent())
        for path in files:
            ctl.load(path)
        if not files:
            ctl.load("-")
        ctl.ground([("base", [])])
        ctl.solve()

if __name__ == "__main__":
    sys.exit(int(clingo_main(App(), sys.argv[1:])))

