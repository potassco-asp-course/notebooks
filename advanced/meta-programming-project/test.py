import sys
from subprocess import run, PIPE, TimeoutExpired
import os
import tempfile
import json
import time

CLINGO = "clingo"
REF_ENC = "checker.lp"
DUMMY = "dummy.lp"
SOLUS = "925"
TRANSLATION_INSTANCES = "translation-instances/"
DIVERSE_INSTANCES = "diverse-instances/"
SOLUTIONS = "solutions/"
SOLUTIONS_NORMAL = SOLUTIONS+"normal/"
SOLUTIONS_CONSTRAINTS = SOLUTIONS+"constraints/"
SOLUTIONS_MANY = SOLUTIONS+"many/"
OPTIONS = ["--warn=no-atom-undefined", "--warn=no-file-included", "--warn=no-operation-undefined", "--warn=no-global-variable"]

def call_clingo_normal(input_names, timeout):
    cmd = [CLINGO, "--output=reify"] + OPTIONS + input_names
    reified = run(cmd, capture_output=True)
    cmd = [CLINGO, "--outf=2", "-", "meta-normal.lp", "0"] + OPTIONS
    start = time.time()
    output = run(cmd, capture_output=True, input=reified.stdout, timeout=timeout)
    end = time.time()
    if output.stderr:
        raise RuntimeError("Clingo: %s" % output.stderr)
    return output.stdout, end-start

def call_clingo_constraints(input_names, timeout):
    cmd = [CLINGO, "--output=reify"] + OPTIONS + input_names
    reified = run(cmd, capture_output=True)
    cmd = [CLINGO, "-", "meta-normal.lp", "--output=reify"] + OPTIONS
    start = time.time()
    reified2 = run(cmd, capture_output=True, input=reified.stdout, timeout=timeout)
    cmd = [CLINGO, "-", "--outf=2", "meta-constraints.lp", "0"] + OPTIONS
    output = run(cmd, capture_output=True, input=reified2.stdout, timeout=timeout)
    end = time.time()
    if output.stderr:
        raise RuntimeError("Clingo: %s" % output.stderr)
    return output.stdout, end-start

def call_clingo_many(input_names, timeout):
    cmd = [CLINGO, "--output=reify"] + OPTIONS + input_names
    reified = run(cmd, capture_output=True)
    cmd = [CLINGO, "--outf=2", "-", "weighted-many.lp", "0", "--opt-mode=optN", "--quiet=1", "-c m=3", "-c option=2"] + OPTIONS
    start = time.time()
    output = run(cmd, capture_output=True, input=reified.stdout, timeout=timeout)
    end = time.time()
    if output.stderr:
        raise RuntimeError("Clingo: %s" % output.stderr)
    return output.stdout, end-start

def check_result(output):
    result = output['Result']
    solutions = []
    if not result.startswith('UNSAT'):
        solutions = [w['Value'] for w in output['Call'][len(output['Call'])-1]['Witnesses']]
    return solutions

def test(inst, timeout, part):
    # check if encoding result is as expected
    try:
        if part == 'normal':
            stdout, time = call_clingo_normal([TRANSLATION_INSTANCES+inst], timeout)
        elif part == 'constraints':
            stdout, time = call_clingo_constraints([TRANSLATION_INSTANCES+inst], timeout)
        else:
            stdout, time = call_clingo_many([DIVERSE_INSTANCES+inst], timeout)
        output = json.loads(stdout)
    except RuntimeError as e:
        raise e
    solutions = check_result(output)

    for s in solutions:
        s.sort()

    # check solutions if expected SAT
    inst_sol = inst[:-2]+"json"
    if part == 'normal':
        SOLU = SOLUTIONS_NORMAL
    elif part == 'constraints':
        SOLU = SOLUTIONS_CONSTRAINTS
    elif part == "many":
        SOLU = SOLUTIONS_MANY
    with open(SOLU+inst_sol,"r") as infile:
        output = json.load(infile)
    ref_solutions = check_result(output)
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
    if len(sys.argv) < 3:
        raise RuntimeError("not enough arguments (%d instead of 2)" % (len(sys.argv) - 1))
    timeout, part = sys.argv[1:3]
    timeout = int(timeout)

    if part == "normal" or  part == "constraints":
        INSTANCES = TRANSLATION_INSTANCES
    else:
        INSTANCES = DIVERSE_INSTANCES

    dir = os.listdir(INSTANCES)
    dir.sort()
    success = True

    message = ""
    #loop over all instances
    for inst in dir:
        result = 0
        error = False
        try:
            res, time = test(inst, timeout, part)
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
