%
% Input:
%   #const n: the time steps range from 0 to n
%   edge(N1,N2): there is an (undirected) edge between nodes N1 and N2
%   robot(R,C,N): robot R is of class C and starts at node N
%   job(J,C,D): job J is of class C and its deadline is D 
%   operation(J,O,N): J's operation O takes place at node N (O >= 1)
%

#const n=13.
edge(X,X+1) :- X=1..7.
edge(9..12, 1).
edge(8,13..16).
edge(4,17).
robot(r1,c1, 9).
robot(r2,c2,10).
robot(r3,c3,11).
robot(r4,c4,12).
robot(r5,c1,13).
robot(r6,c2,14).
robot(r7,c3,15).
robot(r8,c4,16).
job(j1,c1,13). operation(j1,1,2). operation(j1,2,8).
job(j2,c1,5). operation(j2,1,8). operation(j2,2,4).
job(j3,c2,8). operation(j3,1,4). operation(j3,2,1).
job(j4,c2,8). operation(j4,1,8). operation(j4,2,3).
job(j5,c3,10). operation(j5,1,4). operation(j5,2,6).
job(j6,c3,12). operation(j6,1,2). operation(j6,2,5).
job(j7,c4,10). operation(j7,1,2). operation(j7,2,3).
job(j8,c4,12). operation(j8,1,1). operation(j8,2,4).
