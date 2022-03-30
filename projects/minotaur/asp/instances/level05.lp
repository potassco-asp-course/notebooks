maxsteps(40).

field(1..3,1..4).
start(1,2).
goal(3,1).
mino(2,1).

wall(2,1,2,2).
wall(3,1,3,2).
wall(2,2,2,3).
wall(1,3,2,3).
wall(2,3,2,4).

% optimal solution:
% at(1,2,0) at(2,2,1) at(3,2,2) at(3,3,3) at(3,4,4) at(2,4,5) at(1,4,6) at(2,4,7) at(3,4,8) at(2,4,9) at(1,4,10) at(1,3,11) at(1,2,12) at(1,1,13) at(2,1,14) at(3,1,15)
