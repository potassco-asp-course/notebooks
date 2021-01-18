maxsteps(40).

field(1..7,1..4).
start(3,3).
goal(2,1).
mino(1,3).

wall(1,3,2,3).
wall(2,3,3,3).
wall(2,2,2,3).
wall(5,2,6,2).
wall(6,2,7,2).
wall(6,1,6,2).

% optimal solution:
% at(3,3,0) at(4,3,1) at(5,3,2) at(6,3,3) at(7,3,4) at(7,4,5) at(7,3,6) at(7,2,7) at(7,1,8) at(6,1,9) at(5,1,10) at(4,1,11) at(3,1,12) at(2,1,13)
