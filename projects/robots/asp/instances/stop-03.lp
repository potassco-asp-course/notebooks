%
% Input:
%   #const n: the time steps range from 0 to n
%   edge(N1,N2): there is an (undirected) edge between nodes N1 and N2
%   robot(R,C,N): robot R is of class C and starts at node N
%   job(J,C,D): job J is of class C and its deadline is D 
%   operation(J,O,N): J's operation O takes place at node N (O >= 1)
%

#const n=12.
edge(X,X+1) :- X=1..20.
robot(r1,c1,11). edge(11,1). edge(11,21).
robot(r2,c2,12). edge(12,1). edge(12,21).
robot(r3,c1,13). edge(13,1). edge(13,21).
robot(r4,c2,14). edge(14,1). edge(14,21).
job(j11,c1, 8). operation(j11,1,1). operation(j11,2,1).
job(j12,c1, 8). operation(j12,1,1). operation(j12,2,2). operation(j12,3,2).
job(j13,c1,11). operation(j13,1,1). operation(j13,2,1).
job(j14,c1,11). operation(j14,1,1). operation(j14,2,2). operation(j14,3,2).
job(j21,c2,7). operation(j21,1,1). operation(j21,2,1).
job(j22,c2,8). operation(j22,1,1). operation(j22,2,2). operation(j22,3,2).
job(j23,c2,12). operation(j23,1,1). operation(j23,2,1).
job(j24,c2,11). operation(j24,1,1). operation(j24,2,2). operation(j24,3,2).

