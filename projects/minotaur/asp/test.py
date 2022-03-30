import sys
from subprocess import run, PIPE, TimeoutExpired
import os
import tempfile
import json
import time


CLINGO = "/usr/share/miniconda/bin/clingo"
INSTANCES = "asp/instances/"
REF_ENC = "checker.lp"
DUMMY = "asp/dummy.lp"
SOLUS = "925"
SOLUTIONS = "asp/solutions/"


def call_clingo(input_names, timeout):
    cmd = [CLINGO, "--warn=no-atom-undefined", "--warn=no-file-included", "--warn=no-operation-undefined", "--warn=no-variable-unbounded", "--warn=no-global-variable", "--outf=2"] + input_names
    start = time.time()
    output = run(cmd, stdout=PIPE, stderr=PIPE, timeout=timeout)
    end = time.time()
    if output.stderr:
        raise RuntimeError("Clingo: %s" % output.stderr)
    return output.stdout, end-start

def check_result(output, expected):
    result = output['Result']
    solutions = []
    if not result.startswith('UNSAT'):
        solutions = [w['Value'] for w in output['Call'][len(output['Call'])-1]['Witnesses']]
    return result.startswith(expected), solutions

def test(enc, inst, timeout, expected):
    # check if encoding result is as expected
    try:
        if expected == 'SAT':
            stdout, time = call_clingo([enc, INSTANCES+inst, SOLUS], timeout)
        else:
            stdout, time = call_clingo([enc, INSTANCES+inst, DUMMY], timeout)
        output = json.loads(stdout)
    except RuntimeError as e:
        raise e
    ok, solutions = check_result(output, expected)
    if not ok:
        return False, time

    for s in solutions:
        s.sort()

    # check solutions if expected SAT
    if expected == 'SAT':
        inst_sol = inst[:-2]+"json"
        with open(SOLUTIONS+inst_sol,"r") as infile:
            output = json.load(infile)
        ok, ref_solutions = check_result(output, expected)
        for s in ref_solutions:
            s.sort()
        ref_solutions.sort()
        solutions.sort()
        return solutions == ref_solutions, time

    # check optimal solution
    if expected == 'OPT':
        inst_sol = inst[:-2]+"json"
        with open(SOLUTIONS+inst_sol,"r") as infile:
            output = json.load(infile)
        ok, ref_solutions = check_result(output, expected)
        for s in ref_solutions:
            s.sort()
        ref_solutions.sort()
        return solutions[-1] in ref_solutions, time

def main():
    # check input
    if len(sys.argv) < 4:
        raise RuntimeError("not enough arguments (%d instead of 3)" % (len(sys.argv) - 1))
    enc, timeout, expected = sys.argv[1:4]
    timeout = int(timeout)
    for f in [enc]:
        if not os.path.isfile(f):
            raise IOError("file %s not found!" % f)

    dir = os.listdir(INSTANCES)
    dir.sort()
    success = True

    message = ""
    #loop over all instances
    for inst in dir:
        result = 0
        error = False
        try:
            res, time = test(enc, inst, timeout, expected)
            if not res:
                success = False
        except Exception as e:
            success = False
            if isinstance(e, TimeoutExpired):
                result = "timeout\n"
            else:
                result = "error\n"
                error = e
        message += "$"+inst+ ": "
        if result:
            message += result
            if error:
                message += str(error)+"\n"
        else:
            message += "success" if res else "failure"
            message += " in "+str(1000*time)[:7]+" ms\n"
    return success, message

if __name__ == '__main__':
    try:
        success, message = main()
        if success:
            message += "SUCCESS\n"
        else:
            message += "FAILURE\n"
        sys.stdout.write(message)
    except Exception as e:
        sys.stderr.write("ERROR: %s\n" % str(e))
        exit(1)
