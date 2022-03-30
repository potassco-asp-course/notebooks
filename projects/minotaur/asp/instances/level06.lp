maxsteps(40).

field(1..4,1..4).
start(1,3).
goal(3,3).
mino(4,2).

wall(2,1,2,2).
wall(1,3,2,3).
wall(3,2,4,2).
wall(3,2,3,3).

% optimal solution:
% at(1,3,0) at(1,2,1) at(1,1,2) at(1,2,3) at(2,2,4) at(2,3,5) at(3,3,6)
