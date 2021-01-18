maxsteps(40).

field(1..4,1..3).
start(1,2).
goal(1,1).
mino(2,1).

wall(2,2,2,3).
wall(2,2,3,2).
wall(3,2,3,3).
wall(3,2,4,2).
wall(3,1,4,1).

% optimal solution:
% at(1,2,0) at(1,3,1) at(2,3,2) at(3,3,3) at(4,3,4) at(4,2,5) at(4,1,6) at(4,2,7) at(4,3,8) at(3,3,9) at(2,3,10) at(1,3,11) at(1,2,12) at(1,1,13)
