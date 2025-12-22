import sys
import shutil
from subprocess import run, PIPE, TimeoutExpired
import os
import json
import time
import argparse
from tempfile import NamedTemporaryFile


def call_clingo(clingo, input_names, timeout):

    cmd = [ clingo, "--warn=none", "--outf=2" ] + input_names
    
    # run
    start = time.time()
    output = run(cmd, stdout=PIPE, stderr=PIPE, timeout=timeout)
    end = time.time()
    
    # check errors and return
    if output.stderr:
        raise RuntimeError("Clingo: %s" % output.stderr)
    return output.stdout, end-start


def get_solutions(output):
    
    # if UNSAT:
    if output['Result'] == 'UNSATISFIABLE':
        return []
    
    # else get solutions, sort them and return them
    solutions = [w['Value'] for w in output['Call'][len(output['Call'])-1]['Witnesses']]
    for s in solutions:
        s.sort()
    solutions.sort()
    return solutions


def test_instance(args,instance):
    
    # call clingo
    options = [ args.encoding, args.instances + instance, str(args.models) ] 
    try:
        if args.optimize: # add dummy file and extra options
            dummy = NamedTemporaryFile(mode='w+', delete=False)  # Keep file after closing
            try:
                dummy.write(":~. [0]")
                dummy.flush()
                dummy.close()
                options += ["--opt-mode=optN", "--quiet=1,2", dummy.name]
                stdout, time = call_clingo(args.clingo, options, args.timeout)
            finally:
                os.unlink(dummy.name)    
        else: # just call clingo
            stdout, time = call_clingo(args.clingo, options, args.timeout)
        output = json.loads(stdout)
    except RuntimeError as e:
        raise e

    # get clingo solutions sorted
    solutions = get_solutions(output)

    # get reference solutions sorted
    inst_sol = instance[:-2]+"json"
    with open(args.solutions + inst_sol, "r") as infile:
        output = json.load(infile)
    ref_solutions = get_solutions(output)
    
    # check
    if args.correct:
        if len(solutions) == 0 and len(ref_solutions) != 0: # UNSAT case
            return False, time
        check = True
        for s in solutions:
            if s not in ref_solutions:
                check = False
                break
        return check, time
    return solutions == ref_solutions, time


def test(args):
    
    # loop over all instances
    instances_dir = os.listdir(args.instances)
    instances_dir.sort()
    success = True

    for instance in instances_dir:
        
        result = 0
        error = False
        
        # test instance
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
        
        # write message
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

    # create parser
    parser = argparse.ArgumentParser(
        description="Test ASP encodings", add_help=False
    )

    # add arguments
    parser.add_argument('--help', action='help', default=argparse.SUPPRESS,
                        help='Show this help message and exit')
    parser.add_argument('--encoding', '-e', metavar='<file>',
                        help='Path to the ASP encoding', required=True)
    parser.add_argument('--instances', '-i', metavar='<path>',
                        help='Path to the instances', default="asp/instances/", required=False)
    parser.add_argument('--solutions', '-s', metavar='<path>',
                        help='Path to the solutions', default="asp/solutions/", required=False)
    parser.add_argument('--clingo', '-c', metavar='<path>',
                        help='Path to clingo binary', default="clingo", required=False)
    parser.add_argument('--optimize', '-opt', action='store_const', const=True,
                        help='Compute optimal models', default=False, required=False)
    parser.add_argument('--timeout', '-t', metavar='N', type=int,
                        help='Timeout per instance', required=True)
    parser.add_argument('--models', '-m', metavar='M', type=int,
                        help='Maximum number of computed models', default=1000, required=False)
    parser.add_argument('--correct', '-cor', dest = 'correct', action='store_const', const=True,
                        help='Check only if every computed model is a correct solution, do not check if all solutions are computed', default=False, required=False)
    
    # parse
    args = parser.parse_args()
    
    # raise errors
    if shutil.which(args.clingo) is None:
        raise IOError("File %s not found!" % args.clingo)
    if not os.path.isfile(args.encoding):
        raise IOError("File %s not found!" % args.encoding)
    if not os.path.isdir(args.instances):
        raise IOError("Directory %s not found!" % args.instances)
    if not os.path.isdir(args.solutions):
        raise IOError("Directory %s not found!" % args.solutions)
    
    # add "/" at the end of directories if needed
    if args.instances[-1] != "/":
        args.instances += "/"
    if args.solutions[-1] != "/":
        args.solutions += "/"
    
    return args


def main():
    
    # check Python version
    if sys.version_info < (3, 5):
        raise SystemExit('This program needs Python 3.5 or a higher version')
    
    # run
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
