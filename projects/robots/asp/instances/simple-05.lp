%
% Input:
%   #const n: the time steps range from 0 to n
%   edge(N1,N2): there is an (undirected) edge between nodes N1 and N2
%   robot(R,C,N): robot R is of class C and starts at node N
%   job(J,C,D): job J is of class C and its deadline is D 
%   operation(J,O,N): J's operation O takes place at node N (O >= 1)
%

#const n=18.
edge(X,X+1) :- X=1..8.
robot(r1,c1,1). robot(r2,c1,5). robot(r3,c2,9).
job(j1,c1,18).
  operation(j1,1,3).
  operation(j1,2,4).
job(j2,c1,10).
  operation(j2,1,4).
  operation(j2,2,1).
  operation(j2,3,4).
job(j3,c1,3).
  operation(j3,1,7).
  operation(j3,2,8).
job(j4,c1,10).
  operation(j4,1,8).
  operation(j4,2,5).
  operation(j4,3,8).
job(j5,c2,16).
  operation(j5,1,3).
