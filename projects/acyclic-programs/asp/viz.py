import json
import sys

# extract atoms from the last model
data = json.load(sys.stdin)
atoms = data["Call"][0]["Witnesses"][-1]["Value"]
#
head_of = {}
body_of = {}
for atom in atoms:
    if atom.startswith("head("):
        inside = atom[len("head("):-1]
        r, a = inside.split(",")
        head_of[int(r)] = a
    elif atom.startswith("body("):
        inside = atom[len("body("):-1]
        r, s, a = inside.split(",")
        body_of.setdefault(int(r), []).append((int(s), a))

# print rules
HEAD_STR = "aux"
for r in sorted(head_of.keys()):
    #
    head = head_of[r]
    #
    body_parts = []
    for s, a in body_of.get(r, []):
        if a.isdigit(): a = f"{HEAD_STR}({a})"
        if s == 1:
            body_parts.append(a)
        else:
            body_parts.append(f"not {a}")
    #
    if body_parts:
        print(f"{HEAD_STR}({head}) :- {', '.join(sorted(body_parts))}.")
    else:
        print(f"{HEAD_STR}({head}).")

