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
job(j4,c4,12).
  operation(j4,1,(1,1)).
  operation(j4,2,(1,5)).
  operation(j4,3,(5,5)).
%
robot(r5,c1,(2,5)). robot(r6,c2,(3,5)). robot(r7,c3,(4,5)).
%
job(j5,c1,13).
  operation(j5,1,(2,5)).
  operation(j5,2,(2,1)).
  operation(j5,3,(2,5)).
  operation(j5,4,(2,1)).
job(j6,c2,13).
  operation(j6,1,(3,5)).
  operation(j6,2,(3,1)).
  operation(j6,3,(3,5)).
  operation(j6,4,(3,1)).
job(j7,c3,13).
  operation(j7,1,(4,5)).
  operation(j7,2,(4,1)).
  operation(j7,3,(4,5)).
  operation(j7,4,(4,1)).
