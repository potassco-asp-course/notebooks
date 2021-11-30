maxsteps(40).

field(1..3,1..3).
start(3,1).
goal(3,3).
mino(1,3).

wall(1,1,1,2).
wall(1,2,2,2).
wall(2,2,2,3).
wall(2,1,3,1).

% optimal solution:
% at(3,1,0) at(3,2,1) at(2,2,2) at(2,1,3) at(1,1,4) at(2,1,5) at(2,2,6) at(3,2,7) at(3,3,8)
