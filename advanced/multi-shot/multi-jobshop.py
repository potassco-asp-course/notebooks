import sys
import clingo

class MultiJobShopApp(clingo.Application):
    program_name = "multi-job-shop"
    version = "1.0"

    def __init__(self):
        self._model = None

    def _on_model(self, model):
        if model.optimality_proven:
            self._model = model.symbols(shown=True)

    def main(self, ctl, files):
        for path in files: ctl.load(path)
        if not files:
            ctl.load("-")
        ctl.ground([("base", [])], context=self)
        # for every time window
        for window in range(1, ctl.get_const("w").number+1):
            # do something else...
            ctl.solve(on_model=self._on_model)
        if self._model:
            print("Answer:\n{}".format(" ".join([str(atom) for atom in self._model])))

if __name__ == "__main__":
    clingo.clingo_main(MultiJobShopApp(), sys.argv[1:])
