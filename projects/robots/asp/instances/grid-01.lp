%
% Input:
%   #const n: the time steps range from 0 to n
%   edge(N1,N2): there is an (undirected) edge between nodes N1 and N2
%   robot(R,C,N): robot R is of class C and starts at node N
%   job(J,C,D): job J is of class C and its deadline is D 
%   operation(J,O,N): J's operation O takes place at node N (O >= 1)
%

#const n=8.
edge((X,Y),(X,Y+1)) :- X = 1..3, Y = 1..2. 
edge((X,Y),(X+1,Y)) :- X = 1..2, Y = 1..3. 
robot(r1,c1,(1,1)).
robot(r2,c2,(3,3)).
job(j1,c1,4).
  operation(j1,1,(1,3)).
  operation(j1,2,(3,3)).
job(j2,c1,8).
  operation(j2,1,(3,1)).
  operation(j2,2,(1,1)).
job(j3,c2,4).
  operation(j3,1,(3,1)).
  operation(j3,2,(1,1)).
job(j4,c2,8).
  operation(j4,1,(1,3)).
  operation(j4,2,(3,3)).
