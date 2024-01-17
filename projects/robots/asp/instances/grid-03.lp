%
% Input:
%   #const n: the time steps range from 0 to n
%   edge(N1,N2): there is an (undirected) edge between nodes N1 and N2
%   robot(R,C,N): robot R is of class C and starts at node N
%   job(J,C,D): job J is of class C and its deadline is D 
%   operation(J,O,N): J's operation O takes place at node N (O >= 1)
%

#const n=13.
%
edge((X,Y),(X,Y+1)) :- X = 1..5, Y = 1..4. 
edge((X,Y),(X+1,Y)) :- X = 1..4, Y = 1..5. 
%
robot(r1,c1,(1,1)). robot(r2,c2,(1,5)). robot(r3,c3,(5,5)). robot(r4,c4,(5,1)).
%
job(j1,c1,12).
  operation(j1,1,(1,5)).
  operation(j1,2,(5,5)).
  operation(j1,3,(5,1)).
job(j2,c2,12).
  operation(j2,1,(5,5)).
  operation(j2,2,(5,1)).
  operation(j2,3,(1,1)).
job(j3,c3,12).
  operation(j3,1,(5,1)).
  operation(j3,2,(1,1)).
  operation(j3,3,(1,5)).
job(j4,c4,13).
  operation(j4,1,(1,1)).
  operation(j4,2,(1,5)).
  operation(j4,3,(5,5)).
