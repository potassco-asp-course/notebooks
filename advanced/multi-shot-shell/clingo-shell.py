import sys
from clingo.control import Control
from clingo.symbol import parse_term


class ShellApp:


    def __init__(self):
        self._ctl = Control()


    def _load(self, cmd):
        for file in cmd.split()[1:]:
            self._ctl.load(file)


    def _on_model(self, model):
        print(f"Model: [{', '.join([str(x) for x in model.symbols(shown = True)])}]")


    def _solve(self, cmd):
        self._ctl.ground([("base", [])])
        ret = self._ctl.solve(on_model=self._on_model)
        if ret.satisfiable: print("SAT")
        if ret.unsatisfiable: print("UNSAT")


    def run(self, commands):
        while True:
            
            # obtain cmd
            if commands:
                cmd = commands[0][:-1]
                commands = commands[1:]
                print(f"?- {cmd}")
            else:
                cmd = input("?- ")
            
            # try cmd    
            try:
                if cmd == "exit":
                    break
                elif cmd.startswith("load"):
                    self._load(cmd)
                elif cmd.startswith("solve"):
                    self._solve(cmd)
                else:
                    print("Unknown command")
                print()
            except Exception as e:
                print(e)


if __name__ == "__main__":
    commands = []
    if len(sys.argv) > 1:
        with open(sys.argv[1]) as _file:
            commands = _file.readlines()
    ShellApp().run(commands)

