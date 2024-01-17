%
% Input:
%   #const n: the time steps range from 0 to n
%   edge(N1,N2): there is an (undirected) edge between nodes N1 and N2
%   robot(R,C,N): robot R is of class C and starts at node N
%   job(J,C,D): job J is of class C and its deadline is D 
%   operation(J,O,N): J's operation O takes place at node N (O >= 1)
%

#const n=18.
edge(X,X+1) :- X=1..19.
edge(10,21). edge(21,22). edge(22,23). edge(23,24).
robot(r1,c1, 9).
robot(r2,c2,10).
robot(r3,c3,11).
robot(r5,c1,13).
robot(r6,c2,14).
robot(r7,c3,15).
job(j1,c1,18). operation(j1,1,2). operation(j1,2,8).
job(j3,c2,16). operation(j3,1,4). operation(j3,2,1).
job(j5,c3,12). operation(j5,1,4). operation(j5,2,6).
