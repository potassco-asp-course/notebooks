maxsteps(40).

field(1..3,1..3).
start(2,1).
goal(3,2).
mino(2,3).

wall(2,1,2,2).
wall(2,2,3,2).
wall(2,2,2,3).

% optimal solution:
% at(2,1,0) at(1,1,1) at(2,1,2) at(3,1,3) at(3,2,4)
