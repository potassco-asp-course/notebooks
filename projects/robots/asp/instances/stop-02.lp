%
% Input:
%   #const n: the time steps range from 0 to n
%   edge(N1,N2): there is an (undirected) edge between nodes N1 and N2
%   robot(R,C,N): robot R is of class C and starts at node N
%   job(J,C,D): job J is of class C and its deadline is D 
%   operation(J,O,N): J's operation O takes place at node N (O >= 1)
%

#const n=9.
edge(X,X+1) :- X=1..2.
robot(r1,c1,11). edge(11,1).
robot(r2,c2,12). edge(12,1).
job(j11,c1,5). operation(j11,1,1). operation(j11,2,1).
job(j12,c1,8). operation(j12,1,1). operation(j12,2,2). operation(j12,3,2).
job(j21,c2,6). operation(j21,1,1). operation(j21,2,1).
job(j22,c2,9). operation(j22,1,1). operation(j22,2,2). operation(j22,3,2).
