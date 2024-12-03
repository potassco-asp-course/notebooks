import sys
import shutil
from subprocess import run, PIPE, TimeoutExpired
import os
import json
import time
import argparse

def call_clingo(clingo, input_names, timeout):
    cmd = [clingo, "--warn=no-atom-undefined", "--warn=no-file-included", "--warn=no-operation-undefined", "--warn=no-global-variable", "--outf=2"] + input_names
    start = time.time()
    output = run(cmd, stdout=PIPE, stderr=PIPE, timeout=timeout)
    end = time.time()
    if output.stderr:
        raise RuntimeError("Clingo: %s" % output.stderr)
    return output.stdout, end-start

def get_solutions(output):
    if output['Result'] == 'UNSATISFIABLE':
        return []
    return [w['Value'] for w in output['Call'][len(output['Call'])-1]['Witnesses']]

def test_instance(args,instance):
    
    # call clingo
    if args.optimize: # TODO: check this!
        expected = "OPT"
        opt = [args.encoding, args.instances+instance, args.dummy+"dummy.lp"]
    else:
        expected = "SAT"
        opt = [args.encoding, args.instances+instance, "1000"] # at most 1000 models
    try:
        stdout, time = call_clingo(args.clingo, opt, args.timeout)
        output = json.loads(stdout)
    except RuntimeError as e:
        raise e

    # get clingo solutions sorted
    solutions = get_solutions(output)
    for s in solutions:
        s.sort()
    solutions.sort()

    # get reference solutions sorted
    inst_sol = instance[:-2]+"json"
    with open(args.solutions + inst_sol, "r") as infile:
        output = json.load(infile)
    ref_solutions = get_solutions(output)
    for s in ref_solutions:
        s.sort()
    ref_solutions.sort()
    
    # check
    if args.optimize:
        return solutions[-1] in ref_solutions, time
    else:
        return solutions == ref_solutions, time

def test(args):
    #loop over all instances
    instances_dir = os.listdir(args.instances)
    instances_dir.sort()
    success = True
    for instance in instances_dir:
        result = 0
        error = False
        try:
            res, time = test_instance(args, instance)
            if not res:
                success = False
        except Exception as e:
            success = False
            if isinstance(e, TimeoutExpired):
                result = "timeout\n"
            else:
                result = "error\n"
                error = e
        message = instance + ": "
        if result:
            message += result
            if error:
                message += str(error)+"\n"
        else:
            message += "success" if res else "failure"
            message += " in "+ str(time)[:7] + "s\n"
        sys.stdout.write(message)
    return success

def parse():
    parser = argparse.ArgumentParser(
        description="Test ASP encodings"
    )
    parser.add_argument('--encoding', '-e', metavar='<file>',
                        help='ASP encoding', required=True)
    parser.add_argument('--timeout', '-t', metavar='N', type=int,
                        help='Time allocated to each instance', required=True)
    parser.add_argument('--instances', '-i', metavar='<path>',
                        help='Directory of the instances', default="asp/instances/", required=False)
    parser.add_argument('--solutions', '-s', metavar='<path>',
                        help='Directory of the solutions', default="asp/solutions/", required=False)
    parser.add_argument('--clingo', '-c', metavar='<path>',
                        help='Clingo binary', default="clingo", required=False)
    parser.add_argument('--optimize', '-opt', action='store_const', const=True,
                        help='Use this option for optimization problems', default=False, required=False)
    parser.add_argument('--dummy', '-d', metavar='<dir>',
                        help='Path to file dummy.lp. This is necessary for optimization problems',
                        default="asp/", required=False)
    args = parser.parse_args()
    if shutil.which(args.clingo) is None:
        raise IOError("File %s not found!" % args.clingo)
    if not os.path.isfile(args.encoding):
        raise IOError("File %s not found!" % args.encoding)
    if not os.path.isdir(args.instances):
        raise IOError("Directory %s not found!" % args.instances)
    if not os.path.isdir(args.solutions):
        raise IOError("Directory %s not found!" % args.solutions)
    if args.instances[-1] != "/":
        args.instances += "/"
    if args.solutions[-1] != "/":
        args.solutions += "/"
    return args

def main():
    if sys.version_info < (3, 5):
        raise SystemExit('This program needs Python 3.5 or a higher version')
    try:
        args = parse()
        success = test(args)
        if success:
            sys.stdout.write("SUCCESS\n")
        else:
            sys.stdout.write("FAILURE\n")
    except Exception as e:
        sys.stderr.write("ERROR: %s\n" % str(e))
        return 1

if __name__ == '__main__':
    sys.exit(main())
