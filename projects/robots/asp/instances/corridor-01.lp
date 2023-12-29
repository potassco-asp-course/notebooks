%
% Input:
%   #const n: the time steps range from 0 to n
%   edge(N1,N2): there is an (undirected) edge between nodes N1 and N2
%   robot(R,C,N): robot R is of class C and starts at node N
%   job(J,C,D): job J is of class C and its deadline is D 
%   operation(J,O,N): J's operation O takes place at node N (O >= 1)
%

#const n=11.
edge(X,X+1) :- X=1..4.
edge(3,4+2).
robot(r1,c1,1).
robot(r2,c2,5).
job(j1,c1,11).
  operation(j1,1,1).
  operation(j1,2,5).
  operation(j1,3,1).
job(j2,c2,10).
  operation(j2,1,5).
  operation(j2,2,1).
  operation(j2,3,5).
